# 📦 M8 — Checkpoint 2: Modelo de datos + tabla de medidas core en DAX

> **Título:** Del dato limpio al motor analítico funcionando.

## 🎯 En una frase
En el entregable anterior (M6) limpiaste y estructuraste los datos. Ahora vas a **darles inteligencia**: conectar las tablas con relaciones correctas, crear una **tabla calendario** que habilite el análisis temporal y escribir las **5 medidas DAX** fundamentales que van a alimentar todos tus reportes.

> 🔗 **Posición en la cadena:** M3 (base `Ventas_Tech_DB`) → M6 (Power Query, `.pbix` limpio) → **M8 (relaciones + calendario + medidas)** → **M11 (proyecto integrador)**. Abrí el `.pbix` que entregaste en M6 y continuá desde ahí. *(Si tuviste un error técnico, existe `Checkpoint2_Dataset.xlsx` como recurso de emergencia — pero trabajar sobre tu propio dataset es lo recomendado.)*

## ✅ ¿Qué entregás?
El **enlace a tu repositorio GitHub público** con `Apellido_Nombre_Checkpoint2.pbix`.

---

## 📝 Instrucciones

### Paso 1 — Configurar el modelo de relaciones
En la **Vista de Modelo**, creá estas relaciones arrastrando columnas:

| Tabla dimensión | Columna | → | Tabla de hechos | Columna |
|-----------------|---------|---|-----------------|---------|
| `Dim_Clientes` | `id_cliente` | → | `Fact_Ventas` | `id_cliente` |
| `Dim_Productos` | `id_producto` | → | `Fact_Ventas` | `id_producto` |
| `Dim_Categorias` | `id_categoria` | → | `Dim_Productos` | `id_categoria` |
| `Dim_Fechas` | `Date` | → | `Fact_Ventas` | `fecha_venta` |

Para cada relación verificá: **cardinalidad 1:N** · **dirección del filtro única** (de dimensión hacia hechos) · **relación activa** (línea continua).

### Paso 2 — Crear la tabla calendario
Si no tenés `Dim_Fechas`, creala desde *Inicio > Nueva tabla*:
```dax
Dim_Fechas = CALENDAR( MIN(Fact_Ventas[fecha_venta]), MAX(Fact_Ventas[fecha_venta]) )
```
Agregá estas columnas calculadas:
```dax
Año        = YEAR(Dim_Fechas[Date])
Mes Número = MONTH(Dim_Fechas[Date])
Mes Nombre = FORMAT(Dim_Fechas[Date], "MMMM")
Trimestre  = "T" & QUARTER(Dim_Fechas[Date])
Semana     = WEEKNUM(Dim_Fechas[Date])
```
**Marcala como tabla de fechas:** clic derecho sobre `Dim_Fechas` → *Marcar como tabla de fechas* → columna `Date`. **(Obligatorio** para que `TOTALYTD` y `SAMEPERIODLASTYEAR` funcionen.)

### Paso 3 — Crear la tabla de medidas
*Inicio > Especificar datos* → nombrala `_Medidas` → **Cargar**. Eliminá la `Columna 1` que se crea por defecto (clic derecho → Eliminar). Debe quedar con el **ícono de calculadora**.

### Paso 4 — Crear las 5 medidas DAX
Todas dentro de `_Medidas` (clic derecho → Nueva medida):
```dax
-- 1) Base
Total Ventas = SUM(Fact_Ventas[total_venta])

-- 2) Filtrada con CALCULATE
Ventas Online = CALCULATE( [Total Ventas], Fact_Ventas[canal] = "Online" )

-- 3) Acumulado temporal con TOTALYTD
Ventas YTD = TOTALYTD( [Total Ventas], Dim_Fechas[Date] )

-- 4) Comparativa anual con SAMEPERIODLASTYEAR
Ventas LY = CALCULATE( [Total Ventas], SAMEPERIODLASTYEAR(Dim_Fechas[Date]) )

-- 5) Cálculo optimizado con VAR
% Crecimiento Anual =
VAR VentasActual   = [Total Ventas]
VAR VentasAnterior = [Ventas LY]
RETURN
    DIVIDE( VentasActual - VentasAnterior, VentasAnterior )
```
> 💡 Formateá `% Crecimiento Anual` como **porcentaje** desde *Herramientas de medida → Formato → %*.

### Paso 5 — Validación con Matriz
Creá una página `Validación` con una **Matriz**: **Filas** = `Mes Nombre` · **Columnas** = `Año` · **Valores** = `Total Ventas`, `Ventas YTD`, `Ventas LY`, `% Crecimiento Anual`.

| Qué verificar | Resultado esperado |
|---------------|--------------------|
| Ventas YTD en enero | Igual a Total Ventas de enero |
| Ventas YTD en febrero | Acumulado de enero + febrero |
| Ventas LY en 2024 | Muestra los valores de 2023 |
| Ventas LY en 2023 | `BLANK` (no hay año anterior) |
| % Crecimiento en 2024 | Positivo o negativo según los datos |

### Paso 6 — Entrega
Guardá como `Apellido_Nombre_Checkpoint2.pbix` y subilo a tu repositorio GitHub **público**.

---

## ✔️ Criterios de aceptación
- [ ] Las **4 relaciones** con cardinalidad 1:N y dirección única.
- [ ] `Dim_Fechas` **marcada como tabla de fechas** y relacionada con `Fact_Ventas`.
- [ ] La tabla `_Medidas` con ícono de calculadora y las **5 medidas**.
- [ ] `Ventas YTD` acumula correctamente mes a mes dentro de cada año.
- [ ] `Ventas LY` muestra los valores del año anterior y `BLANK` donde no hay comparable.
- [ ] `% Crecimiento Anual` usa `VAR` y `DIVIDE` (sin división directa `/`).

## ⚠️ Errores comunes a evitar
- **No marcar `Dim_Fechas` como tabla de fechas:** sin esto, `TOTALYTD` y `SAMEPERIODLASTYEAR` **no funcionan** aunque la fórmula esté bien.
- **Relación bidireccional:** activar "Ambas" genera ambigüedad. Usá siempre **dirección única**.
- **Dejar la `Columna 1` en `_Medidas`:** sin eliminarla, la tabla no toma el ícono de calculadora.
- **Usar `DIVIDE` directo sin `VAR` en la Medida 5:** el objetivo es practicar `VAR` para no calcular `Ventas LY` dos veces.
- **Formato sin porcentaje:** el crecimiento aparecería como `0.15` en lugar de `15%`.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 8</a> · <a href="../../README.md">Índice del curso</a>
</p>
