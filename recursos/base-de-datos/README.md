# 🗄️ Base de datos del proyecto — RetailPro_DB (SQL Server)

Base de datos **única y canónica** del proyecto integrador. Se crea entera con un solo script y es la fuente de datos de los módulos **M6 (ETL), M8 (DAX) y M10 (estadística)**.

> 🎓 **El Proyecto Final (M11) no usa esta base.** La consigna del examen pide un dataset propio de Kaggle o el que provee el curso — ese material vive en [`recursos/ejemplo-examen-final/`](../ejemplo-examen-final/).

| | |
|---|---|
| 🛠️ **Motor** | Microsoft SQL Server 2016 o superior |
| 📄 **Script** | [`retailpro_db_sqlserver.sql`](./retailpro_db_sqlserver.sql) |
| 🗃️ **Base** | `RetailPro_DB` |
| 📊 **Volumen** | 5 categorías · 4 territorios · 40 clientes · 22 productos · **1.444 ventas** |
| 📅 **Período** | 2023-01-01 a 2024-12-31 (24 meses completos) |
| ♻️ **Repetible** | Sí — se puede ejecutar tantas veces como haga falta |

---

## 🚀 Cómo ejecutarlo

1. Abrí **SQL Server Management Studio (SSMS)** o **Azure Data Studio** y conectate a tu instancia.
2. `Archivo > Abrir > Archivo...` y elegí `retailpro_db_sqlserver.sql`.
3. Ejecutá el script **completo** con **F5**.
4. Al final vas a ver en la pestaña *Mensajes* un resumen de la carga y varias grillas de validación.

> ⚠️ **El script usa separadores `GO`.** `GO` no es T-SQL: lo interpreta el cliente. Ejecutalo desde SSMS o Azure Data Studio, no lo pegues en una herramienta que no los soporte.

> 🔤 **Si ves caracteres raros** (`Ã³`, `Ã±`) al abrir el archivo, volvé a abrirlo con `Archivo > Abrir > Archivo...`, desplegá la flechita del botón **Abrir** y elegí **Abrir con... > Codificación > UTF-8**. Todos los literales llevan el prefijo `N'...'` (Unicode) justamente por esto.

---

## 🧱 El modelo

Esquema en estrella: `ventas` es la tabla de **hechos**, las otras cuatro son **dimensiones**.

```
categorias (1) ──< productos (1) ──┐
                                   │
                     clientes (1) ──┼──< ventas
                                   │
                  territorios (1) ──┘
```

| Tabla | Filas | Rol | PK | FK |
|-------|------:|-----|----|----|
| `categorias` | 5 | Dimensión | `id_categoria` | — |
| `territorios` | 4 | Dimensión | `id_territorio` | — |
| `clientes` | 40 | Dimensión | `id_cliente` | — |
| `productos` | 22 | Dimensión | `id_producto` | → `categorias` |
| `ventas` | 1.444 | **Hechos** | `id_venta` | → `clientes`, `productos`, `territorios` |

### Dos decisiones de diseño que conviene entender

**`total_venta` es una columna calculada persistida.** No se inserta a mano: el motor la calcula como `cantidad × precio_unitario × (1 − descuento)` y la guarda físicamente. Así nunca puede quedar desincronizada. Power BI la lee como una columna normal.

**`precio_unitario` convive con `productos.precio` y no es redundancia.** `productos.precio` es el precio **actual de catálogo**; `ventas.precio_unitario` es el precio **real al momento de esa venta**. En estos datos las ventas de 2023 se cargaron un 8 % por debajo de la lista actual, así que los dos valores difieren de verdad. Es la justificación que ya está escrita en [el entregable M2](../../documentacion/Semana-02-Entregable-M2.md).

---

## 🧪 La historia que cuentan los datos

Los datos no son ruido aleatorio: reproducen el caso de negocio del **brief de M1**. Los números salen del propio script (bloque 8 de validación):

| Región | 2023 | 2024 | Variación |
|--------|-----:|-----:|----------:|
| **Norte** | 63.071 | 54.289 | **−13,9 %** |
| Centro | 103.706 | 137.820 | +32,9 % |
| Litoral | 51.254 | 66.011 | +28,8 % |
| Sur | 40.535 | 45.887 | +13,2 % |
| **Total** | **258.566** | **304.006** | **+17,6 %** |

La empresa **crece un 17,6 %** y sin embargo **el Norte cae casi un 14 %**. Esa es exactamente la pregunta diagnóstica del brief. Y la respuesta también está en los datos — dentro del Norte:

| Categoría (solo Norte) | Variación 2024 vs 2023 |
|------------------------|----------------------:|
| **Computación** | **−30,1 %** |
| Audio | −7,7 % |
| Redes | −7,5 % |
| Almacenamiento | +0,2 % |
| Periféricos | +110,1 % |

El Norte no vendió menos unidades: **cambió el mix**. Dejó de vender notebooks y monitores (ticket alto) y pasó a vender periféricos (ticket bajo). Ese es el hallazgo que el dashboard tiene que hacer visible.

Otros patrones útiles ya cargados:

- **Estacionalidad real:** enero y febrero flojos, noviembre y diciembre pico. Se ve en cualquier gráfico de líneas.
- **Canal Online en crecimiento:** 35,8 % de las operaciones en 2023 → 48,0 % en 2024. Alimenta directamente la medida `Ventas Online` de M8.
- **Ticket promedio:** 389,59 — con outliers de notebooks que lo inflan. Es el insumo del ejercicio de media vs. mediana e IQR de **M10**.

---

## 🧹 Suciedad intencional (para M6)

La base tiene problemas reales que hay que resolver en **Power Query** y **justificar**. Todos están dentro de las restricciones de integridad, así que la base es válida: la suciedad está en las columnas que admiten nulos y en el texto libre.

| Dónde | Qué pasa | Decisión que tenés que tomar y justificar |
|-------|----------|-------------------------------------------|
| `clientes` id 7, 23 | `email` NULL | ¿Se elimina la fila o se marca `"Sin dato"`? El email no participa de ningún cálculo. |
| `clientes` id 15 | `ciudad` NULL | Reemplazar por `"Sin datos"` mantiene al cliente en el análisis. |
| `clientes` id 31 | `segmento` NULL | Es una dimensión de análisis: `"Sin clasificar"` evita que desaparezca del gráfico por segmento. |
| `clientes` id 4 | `ciudad` con espacios: `'  Rosario '` | *Transformar > Formato > Recortar*. |
| `clientes` id 12, 28 | `ciudad` con mayúsculas inconsistentes: `'buenos aires'`, `'CÓRDOBA'` | *Transformar > Formato > Mayúscula inicial en cada palabra*, o quedan como categorías distintas. |
| `productos` id 20 | `costo` NULL | **Nulo crítico:** sin costo no hay margen. ¿Se usa el costo promedio de la categoría, se marca el producto o se excluye del cálculo de margen? |
| `productos` id 21 | `subcategoria` NULL | `"Sin subcategoría"`. |

> 💡 El script imprime estas filas al final para que las veas antes de empezar. No hay duplicados de clave: en una base relacional bien construida no puede haberlos, porque las **PK** los impiden. Ese es justamente el punto — la deduplicación de M6 se practica sobre las variantes de texto, no sobre las claves.

Además hay **4 clientes sin ninguna venta** (ids 37–40) y **2 productos sin ninguna venta** (ids 21–22), para que las consultas `LEFT JOIN ... IS NULL` de **M5** devuelvan filas de verdad.

---

## 🔌 Conectar Power BI Desktop

1. **Inicio > Obtener datos > SQL Server**.
2. **Servidor:** el nombre de tu instancia. Los valores más habituales:
   - `localhost` o `.` — instancia por defecto local
   - `localhost\SQLEXPRESS` — si instalaste SQL Server Express
   - `(localdb)\MSSQLLocalDB` — si usás LocalDB
   > ¿No sabés cuál es? Ejecutá `SELECT @@SERVERNAME;` en SSMS.
3. **Base de datos:** `RetailPro_DB`
4. **Modo de conectividad:** **Importar** (no DirectQuery — para este proyecto necesitás el modelo en memoria).
5. Autenticación: **Windows** si tu SSMS entra sin contraseña; **Básica** si usás un usuario SQL.
6. En el Navegador, marcá **las 5 tablas**: `categorias`, `clientes`, `productos`, `territorios`, `ventas`.
7. Pulsá **Transformar datos** — **no** "Cargar". Ahí empieza el trabajo de M6.

> ⚠️ **No importes la vista `vw_ventas_detalle`.** Existe para explorar y validar desde SQL, pero es una **tabla plana**: si la cargás, no hay modelo que armar y el ejercicio de esquema en estrella de M8 pierde sentido. Importá las 5 tablas por separado.

### Renombrado que pide M6

| Tabla en SQL Server | Nombre en el modelo |
|---------------------|---------------------|
| `clientes` | `Dim_Clientes` |
| `productos` | `Dim_Productos` |
| `categorias` | `Dim_Categorias` |
| `territorios` | `Dim_Territorios` |
| `ventas` | `Fact_Ventas` |

La tabla `Dim_Fechas` **no** viene de SQL: se crea en Power BI con DAX. El paso a paso está en la [documentación de la Semana 8](../../documentacion/Semana-08-Entregable-M8.md).

---

## 🧯 Problemas frecuentes

| Síntoma | Causa y solución |
|---------|------------------|
| `No se puede abrir la base de datos RetailPro_DB` | El script no llegó a ejecutarse entero. Volvé a correrlo completo con F5. |
| `Sintaxis incorrecta cerca de 'IF'` en `DROP TABLE IF EXISTS` | Tu SQL Server es anterior a 2016. Reemplazá cada `DROP TABLE IF EXISTS dbo.X;` por `IF OBJECT_ID(N'dbo.X', N'U') IS NOT NULL DROP TABLE dbo.X;`. |
| Power BI: *No se puede conectar al servidor* | Revisá el nombre del servidor (`SELECT @@SERVERNAME;`), que el servicio **SQL Server (MSSQLSERVER)** esté iniciado en *Servicios*, y que el puerto **1433** no esté bloqueado por el firewall. |
| Los acentos se ven mal en Power BI | Las columnas son `NVARCHAR`, así que el problema está en la lectura del `.sql`. Volvé a ejecutarlo abriéndolo con codificación UTF-8. |
| Quiero empezar de cero | Ejecutá el script otra vez: borra y recrea todo. |

---

## ✅ Cómo saber que quedó bien

Al final de la ejecución, el bloque de validación tiene que mostrar:

- `categorias` **5** · `territorios` **4** · `clientes` **40** · `productos` **22** · `ventas` **1.444**
- Primera venta **2023-01-…**, última venta **2024-12-…**
- 24 meses distintos cubiertos
- Norte con variación negativa y las otras tres regiones en positivo
- 4 clientes sin ventas y 2 productos sin ventas

Si algún conteo da 0, el script se cortó a mitad de camino: ejecutalo entero de nuevo.

---
<p align="center">
🏠 <a href="../README.md">Recursos</a> · <a href="../../README.md">Índice del curso</a> · <a href="../../documentacion/Semana-08-Entregable-M8.md">Documentación M8 ➡️</a>
</p>
