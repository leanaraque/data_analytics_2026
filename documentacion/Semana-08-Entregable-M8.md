# M8 — Checkpoint 2: Modelo de datos + tabla de medidas core

> **Curso:** Data Analytics — Coderhouse (V2) · **Semana 8** · Checkpoint evaluable
> **Formato de entrega:** enlace a repositorio GitHub público con `Apellido_Nombre_Checkpoint2.pbix`.
> **Alcance:** relaciones 1:N, tabla calendario, tabla de medidas y las 5 medidas DAX core, sobre los datos reales de `RetailPro_DB`.

---

## 0. Punto de partida

Todo lo de este documento se construye sobre la base **`RetailPro_DB`** en SQL Server. Si todavía no la tenés:

1. Ejecutá [`recursos/base-de-datos/retailpro_db_sqlserver.sql`](../recursos/base-de-datos/retailpro_db_sqlserver.sql) completo en SSMS.
2. Conectá Power BI Desktop siguiendo el [README de la base](../recursos/base-de-datos/README.md#-conectar-power-bi-desktop).

Con qué contás una vez conectado:

| | |
|---|---|
| **Ventas** | 1.444 transacciones |
| **Período** | 2023-01-01 a 2024-12-31 — **dos años calendario completos** |
| **Facturación** | 258.566,05 en 2023 · 304.006,15 en 2024 |
| **Dimensiones** | 40 clientes · 22 productos · 5 categorías · 4 territorios |

> 📅 Que el período cubra **años calendario completos** no es un detalle: es lo que hace que `TOTALYTD` y `SAMEPERIODLASTYEAR` devuelvan números interpretables. Con datos que arrancan en marzo, el YTD del primer año arrastra un sesgo que hay que explicar en cada gráfico.

### Nomenclatura del modelo (viene de M6)

| Tabla en SQL Server | Nombre en el modelo |
|---------------------|---------------------|
| `clientes` | `Dim_Clientes` |
| `productos` | `Dim_Productos` |
| `categorias` | `Dim_Categorias` |
| `territorios` | `Dim_Territorios` |
| `ventas` | `Fact_Ventas` |

---

## 1. Tabla calendario `Dim_Fechas`

Va **primero**, antes de las relaciones: no se puede relacionar una tabla que todavía no existe.

*Inicio > Nueva tabla*:

```dax
Dim_Fechas =
VAR PrimerAnio = YEAR ( MIN ( Fact_Ventas[fecha_venta] ) )
VAR UltimoAnio = YEAR ( MAX ( Fact_Ventas[fecha_venta] ) )
RETURN
    CALENDAR ( DATE ( PrimerAnio, 1, 1 ), DATE ( UltimoAnio, 12, 31 ) )
```

> ⚠️ **Por qué no el `CALENDAR(MIN(...), MAX(...))` directo.** Esa versión arranca la tabla en la fecha de la primera venta y la termina en la de la última. Si tu primera venta fuera el 14 de marzo, el calendario no tendría enero ni febrero — y la inteligencia de tiempo **exige un calendario continuo y con los años completos**. La versión de arriba expande siempre al 1 de enero y al 31 de diciembre. Con estos datos ambas dan lo mismo (la primera venta cae justo el 2023-01-01), pero la de arriba no se rompe cuando cambies el dataset.

### Columnas calculadas

Una por una, con *Nueva columna* sobre `Dim_Fechas`:

```dax
Año        = YEAR ( Dim_Fechas[Date] )
Mes Número = MONTH ( Dim_Fechas[Date] )
Mes Nombre = FORMAT ( Dim_Fechas[Date], "MMMM" )
Trimestre  = "T" & QUARTER ( Dim_Fechas[Date] )
Semana     = WEEKNUM ( Dim_Fechas[Date] )
Año Mes    = FORMAT ( Dim_Fechas[Date], "YYYY-MM" )
```

### Dos pasos que casi todos se olvidan

**a) Ordenar `Mes Nombre` por `Mes Número`.** Sin esto los gráficos ordenan los meses **alfabéticamente**: abril, agosto, diciembre, enero… Seleccioná la columna `Mes Nombre` → pestaña *Herramientas de columna* → *Ordenar por columna* → `Mes Número`.

**b) Marcar la tabla como tabla de fechas.** Clic derecho sobre `Dim_Fechas` en el panel de datos → *Marcar como tabla de fechas* → columna `Date`.

> Sin el paso (b), `TOTALYTD` y `SAMEPERIODLASTYEAR` **no funcionan aunque la fórmula esté perfecta**. Es el error número uno de este checkpoint.

---

## 2. Relaciones del modelo

*Vista de Modelo*, arrastrando de la columna de la dimensión a la del hecho:

| # | Desde (lado 1) | Columna | Hacia (lado N) | Columna | Cardinalidad | Dirección |
|---|----------------|---------|----------------|---------|--------------|-----------|
| 1 | `Dim_Clientes` | `id_cliente` | `Fact_Ventas` | `id_cliente` | 1:N | Única |
| 2 | `Dim_Productos` | `id_producto` | `Fact_Ventas` | `id_producto` | 1:N | Única |
| 3 | `Dim_Territorios` | `id_territorio` | `Fact_Ventas` | `id_territorio` | 1:N | Única |
| 4 | `Dim_Fechas` | `Date` | `Fact_Ventas` | `fecha_venta` | 1:N | Única |
| 5 | `Dim_Categorias` | `id_categoria` | `Dim_Productos` | `id_categoria` | 1:N | Única |

Las cinco tienen que quedar **activas** (línea continua), con **cardinalidad 1:N** y **dirección de filtro única**.

### Sobre la relación 5: estrella vs. copo de nieve

Las relaciones 1 a 4 forman una **estrella** perfecta. La relación 5 no llega a los hechos: cuelga de otra dimensión, y eso convierte el modelo en un **copo de nieve**.

Es correcto y funciona, pero conviene saber que hay una alternativa: en Power Query hacer *Merge* de `Dim_Categorias` sobre `Dim_Productos` para traer `nombre_categoria` como una columna más, y eliminar `Dim_Categorias` del modelo. Quedan 4 relaciones y una estrella pura.

| | Copo de nieve (5 relaciones) | Estrella pura (4 relaciones + Merge) |
|---|---|---|
| **A favor** | Refleja el modelo relacional tal cual; una sola fuente para el nombre de categoría | Menos saltos entre tablas: DAX más rápido y predecible |
| **En contra** | El filtro por categoría atraviesa dos relaciones antes de llegar a los hechos | Duplica el texto de la categoría en cada producto |
| **Cuándo** | Dimensiones con muchos atributos propios o jerarquías profundas | El caso habitual en Power BI, y lo que recomienda la unidad 1 de esta semana |

Con 5 categorías y 22 productos la diferencia de rendimiento es nula. **Este documento sigue la consigna y mantiene las 5 relaciones**, pero si preferís la estrella pura, hacé el Merge en M6 y el resto de las medidas no cambia.

---

## 3. Tabla de medidas `_Medidas`

*Inicio > Especificar datos* → sin escribir nada, nombrarla **`_Medidas`** → *Cargar*.

Queda con una columna `Columna1` vacía. Después de mover ahí la primera medida, hacé clic derecho sobre `Columna1` → *Eliminar*. La tabla toma el **ícono de calculadora** y sube al tope de la lista de campos gracias al guion bajo inicial.

> Hay otro camino equivalente: *Nueva tabla* con `_Medidas = {""}` y luego ocultar la columna. Cualquiera de los dos sirve; lo que importa es que las medidas no queden desparramadas dentro de `Fact_Ventas`.

---

## 4. Las 5 medidas core

Todas se crean **dentro de `_Medidas`** (clic derecho sobre la tabla → *Nueva medida*).

### 1 · Medida base

```dax
Total Ventas = SUM ( Fact_Ventas[total_venta] )
```

`total_venta` ya viene calculada desde SQL Server como `cantidad × precio_unitario × (1 − descuento)`, así que acá alcanza con sumarla.

> 💡 Si en tu modelo esa columna no existiera, **no** se resuelve con `SUM(Fact_Ventas[cantidad] * Fact_Ventas[precio_unitario])` — `SUM` acepta una sola columna, no una expresión. Para eso está el iterador: `SUMX ( Fact_Ventas, Fact_Ventas[cantidad] * Fact_Ventas[precio_unitario] )`.

### 2 · Filtrada con `CALCULATE`

```dax
Ventas Online = CALCULATE ( [Total Ventas], Fact_Ventas[canal] = "Online" )
```

`CALCULATE` **reescribe** el contexto de filtro: aunque el usuario tenga seleccionado "Presencial" en un segmentador, esta medida sigue devolviendo el Online.

### 3 · Acumulado con `TOTALYTD`

```dax
Ventas YTD = TOTALYTD ( [Total Ventas], Dim_Fechas[Date] )
```

### 4 · Comparativa interanual

```dax
Ventas LY = CALCULATE ( [Total Ventas], SAMEPERIODLASTYEAR ( Dim_Fechas[Date] ) )
```

> ⚠️ **Acá hay una trampa que conviene entender ahora y no en el examen.** Esto funciona porque `[Total Ventas]` es una **medida**, y una medida se **vuelve a evaluar** dentro del nuevo contexto que arma `CALCULATE`.
>
> Con una **variable** el comportamiento es el opuesto. Esto **no** funciona:
> ```dax
> VAR VentasActual = SUM ( Fact_Ventas[total_venta] )
> VAR VentasAnterior = CALCULATE ( VentasActual, SAMEPERIODLASTYEAR ( Dim_Fechas[Date] ) )  -- ❌
> ```
> Una variable se evalúa **una sola vez**, en el momento en que se define, y queda congelada con ese valor. Envolverla en `CALCULATE` no la recalcula: `VentasAnterior` termina siendo idéntica a `VentasActual` y el crecimiento da **siempre 0**, sin ningún mensaje de error.
>
> **La regla:** dentro de `CALCULATE` va una **medida** o una **expresión**, nunca una variable que ya fue evaluada.

### 5 · Cálculo optimizado con `VAR`

```dax
% Crecimiento Anual =
VAR VentasActual   = [Total Ventas]
VAR VentasAnterior = [Ventas LY]
RETURN
    DIVIDE ( VentasActual - VentasAnterior, VentasAnterior )
```

Acá las variables sí son el uso correcto: guardan el resultado de dos medidas ya evaluadas en el contexto actual para no calcularlas dos veces. `DIVIDE` evita el error de división por cero — devuelve `BLANK` en vez de romperse.

Formateala como porcentaje: *Herramientas de medida > Formato > %* con 2 decimales.

---

## 5. Validación

Creá una página `Validación` con una **Matriz**:

- **Filas:** `Dim_Fechas[Mes Nombre]`
- **Columnas:** `Dim_Fechas[Año]`
- **Valores:** `Total Ventas`, `Ventas YTD`, `Ventas LY`, `% Crecimiento Anual`

### Valores que tienen que dar

Estos números salen de los datos del script. Si te dan distinto, algo falló:

| Medida | 2023 | 2024 |
|--------|-----:|-----:|
| **Total Ventas** (año completo) | 258.566,05 | 304.006,15 |
| **Ventas YTD** (en diciembre) | 258.566,05 | 304.006,15 |
| **Ventas LY** (año completo) | *(en blanco)* | 258.566,05 |
| **% Crecimiento Anual** | *(en blanco)* | **17,57 %** |
| **Ventas Online** | 98.300,69 | 155.276,00 |

**Total general de `Total Ventas` sin filtros: 562.572,20.**

Control mes a mes del acumulado de 2023, para verificar que el YTD suma bien:

| Mes | Total Ventas | Ventas YTD |
|-----|-------------:|-----------:|
| Enero | 15.674,16 | 15.674,16 |
| Febrero | 16.072,53 | 31.746,69 |
| Marzo | 20.042,56 | 51.789,25 |
| … | … | … |
| Noviembre | 28.445,47 | 229.647,62 |
| Diciembre | 28.918,43 | **258.566,05** |

### Checklist de verificación

- [ ] `Ventas YTD` en enero es igual a `Total Ventas` de enero.
- [ ] `Ventas YTD` en febrero es la suma de enero + febrero.
- [ ] `Ventas YTD` en diciembre es igual al total del año.
- [ ] `Ventas YTD` **se reinicia** en enero de 2024 (no arrastra 2023).
- [ ] `Ventas LY` en 2023 está **en blanco** — no hay 2022 en el modelo.
- [ ] `Ventas LY` en 2024 devuelve exactamente los valores de 2023.
- [ ] `% Crecimiento Anual` en 2024 da **17,57 %**.
- [ ] Los meses salen en orden cronológico, no alfabético.

> Si `Ventas YTD` repite el mismo número en todos los meses, o si `Ventas LY` sale en blanco también en 2024: no marcaste `Dim_Fechas` como tabla de fechas.

---

## 6. Lo que el modelo ya permite responder

Con las relaciones y las medidas listas, el modelo contesta la **pregunta diagnóstica del brief de M1**. Probalo antes de cerrar el `.pbix`:

**Un gráfico de barras** con `Dim_Territorios[region]` en el eje y `% Crecimiento Anual` en los valores:

| Región | % Crecimiento Anual |
|--------|--------------------:|
| **Norte** | **−13,92 %** |
| Sur | +13,21 % |
| Litoral | +28,79 % |
| Centro | +32,89 % |

La empresa crece 17,57 % y el Norte cae casi 14 %. Esa es la mitad de la respuesta.

**La otra mitad:** filtrá por `region = "Norte"` y poné `Dim_Categorias[nombre_categoria]` en el eje:

| Categoría (solo Norte) | % Crecimiento Anual |
|------------------------|--------------------:|
| **Computación** | **−30,05 %** |
| Audio | −7,73 % |
| Redes | −7,48 % |
| Almacenamiento | +0,16 % |
| Periféricos | +110,10 % |

El Norte no vendió menos: **vendió otra cosa**. Se le cayó Computación (notebooks y monitores, el ticket alto) y creció en periféricos. Ese es el hallazgo accionable que el dashboard de M11 tiene que hacer evidente en tres segundos.

---

## ✔️ Checklist de entrega

- [x] Las **5 relaciones** con cardinalidad 1:N, dirección única y activas.
- [x] `Dim_Fechas` creada, con años calendario completos y **marcada como tabla de fechas**.
- [x] `Mes Nombre` ordenada por `Mes Número`.
- [x] Tabla `_Medidas` con ícono de calculadora y sin la columna vacía.
- [x] Las **5 medidas** creadas dentro de `_Medidas`.
- [x] `% Crecimiento Anual` usa `VAR` y `DIVIDE`, sin división directa con `/`.
- [x] Página `Validación` con la matriz y los valores verificados.
- [ ] Archivo guardado como `Apellido_Nombre_Checkpoint2.pbix`.
- [ ] Subido a un repositorio de GitHub **público**.

---

## 📎 Diferencias con el material de la Semana 8

Tres puntos donde este documento se aparta de la consigna, y por qué:

| Tema | Material | Acá | Motivo |
|------|----------|-----|--------|
| Orden de los pasos | Relaciones (paso 1) y después crear `Dim_Fechas` (paso 2) | Calendario primero, relaciones después | No se puede relacionar una tabla que todavía no existe |
| Rango del calendario | `CALENDAR(MIN(...), MAX(...))` | Expandido al 1-ene / 31-dic | La inteligencia de tiempo necesita años completos |
| Cantidad de relaciones | 4 | 5 | El modelo incluye `Dim_Territorios`, que el brief de M1 y M2 exigen para analizar por región |

Además, el material nombra la columna de fecha como `Fecha` en las unidades 5 y 6 y como `Date` en la unidad 4. Acá se usa **`Date`** en todas las fórmulas, que es el nombre que devuelve `CALENDAR()`. Elegí uno y respetalo: mezclarlos es un error de columna inexistente garantizado.

---
<p align="center">
🏠 <a href="./README.md">Documentación</a> · <a href="../Semana-08-Modelado-Analitico-y-Calculos-Avanzados-con-DAX/">Semana 8</a> · <a href="../README.md">Índice del curso</a>
</p>
