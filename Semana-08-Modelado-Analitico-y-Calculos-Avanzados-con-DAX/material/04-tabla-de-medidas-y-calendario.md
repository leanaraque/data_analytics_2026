# 4. Organizar el modelo: tabla de medidas y tabla calendario

> Con las medidas funcionando, dos hábitos profesionales de orden que distinguen a un analista SSR: **centralizar las medidas** y **crear una tabla calendario** que habilite el análisis temporal.

## Parte A — La tabla de medidas
### ¿Qué es?
Una tabla **vacía** creada exclusivamente para alojar las medidas DAX del modelo. **No contiene datos propios**: su único propósito es **agrupar y centralizar** las medidas, separándolas de las tablas de hechos y dimensiones.

### ¿Por qué usarla?
Sin ella, Power BI guarda cada medida dentro de la tabla donde fue creada. En modelos con muchas tablas y medidas, esto genera **desorden** y dificulta el mantenimiento. Centralizarlas mejora la legibilidad y acelera el desarrollo.

### Cómo crearla, paso a paso
1. Pestaña **Modelado > Nueva tabla**.
2. Escribí la fórmula: `_Medidas = {""}` (genera una tabla con una fila vacía que se puede ocultar).
3. Seleccioná cada medida existente, andá a sus propiedades y cambiá la **tabla de inicio** a `_Medidas`.
4. Ocultá la columna vacía (clic derecho → **Ocultar**). La tabla queda limpia y solo muestra las medidas.

> **Nomenclatura sugerida:** el prefijo `_` hace que aparezca **al inicio** de la lista. Agrupá por **carpetas de presentación** dentro de la tabla. No afecta el rendimiento.

## Parte B — La tabla calendario (dimensión de tiempo)
### ¿Para qué sirve?
Habilita la **inteligencia de tiempo** en DAX (`TOTALYTD`, `SAMEPERIODLASTYEAR`, etc.). Debe cubrir el **rango completo** de fechas del modelo y estar **marcada como tabla de fechas**.

> **Punto clave de la plantilla:** el único parámetro que se modifica al reutilizarla es el argumento de `CALENDAR()`. Se reemplazan `MIN(Ventas[Fecha de Venta])` y `MAX(Ventas[Fecha de Envío])` por las columnas de fecha de la tabla que corresponda en cada proyecto.

### Columnas que genera la plantilla

| Columna | Tipo / Ejemplo | Uso |
|---------|----------------|-----|
| `FechaSK` | Texto · 20250115 | Clave sustituta (surrogate key) para relacionar con tablas que traen la fecha como texto `YYYYMMDD` |
| `Año` | Entero · 2025 | Año del calendario (ejes y filtros) |
| `Trimestre` | Entero · 1–4 | Número de trimestre (para ordenar) |
| `Mes` | Entero · 1–12 | Número de mes (columna de ordenamiento) |
| `Día` | Entero · 1–31 | Día del mes |
| `Trimestre/T` | Texto · T1, T2… | Etiqueta amigable de trimestre |
| `Mes Corto` | Texto · Enero | Nombre completo del mes (se ordena por `Mes`) |
| `MesCorto` | Texto · Ene | Abreviatura (ejes con poco espacio) |
| `DíaSemana` | Entero · 1=Lun | Día de la semana (lunes=1) |
| `SemanaAño` | Entero · 1–53 | Número de semana ISO |
| `PERIODO` | Texto · 202501 | Año-mes concatenado (relacionar con SAP/BW) |
| `CierreSemana` | Fecha · domingo | Último día de la semana |
| `Día Nombre` | Texto · Lunes | Nombre completo del día |
| `DíaCorto` | Texto · Lun | Abreviatura del día |
| `AñoTrimestre` | Texto · 2025/T1 | Etiqueta para evolución trimestral |
| `AñoMes` | Texto · 2025/01 | Etiqueta año-mes (ordenación cronológica) |
| `AñoMesCorto` | Texto · 2025/ene | Año-mes con abreviatura |
| `InicioMes` | Fecha | Primer día del mes (MTD, agrupaciones) |
| `FinMes` | Fecha | Último día del mes (rangos de fecha) |
| `Estación` | Texto · Verano… | Estación del **hemisferio sur** (Dic-Feb = Verano) |

### Pasos para insertar y activar
1. **Creá la tabla:** *Modelado → Nueva tabla* y pegá la plantilla de abajo. Ajustá solo el argumento de `CALENDAR()`.
2. **Marcala como tabla de fechas:** *Modelado → Marcar como tabla de fechas* → seleccioná la columna `[Date]`.
3. **Creá la relación:** conectá `Calendario[Date]` con la columna de fecha de tu tabla de hechos (muchos a uno, dirección única).
4. **Configurá el ordenamiento** de las columnas de texto: `Mes Corto` ordenado por `Mes`, y `DíaCorto` por `DíaSemana`.

### Plantilla DAX completa
```dax
Tabla Calendario Plantilla =
ADDCOLUMNS (
    CALENDAR(MIN(Ventas[Fecha de Venta]), MAX(Ventas[Fecha de Envío])),
    "FechaSK", FORMAT ( [Date], "YYYYMMDD" ),
    "Año", YEAR ( [Date] ),
    "Trimestre", QUARTER ( [Date] ),
    "Mes", MONTH ( [Date] ),
    "Día", DAY ( [Date] ),
    "Trimestre/T", "T" & FORMAT ( [Date], "Q" ),
    "Mes Corto", FORMAT ( [Date], "MMMM" ),
    "MesCorto", FORMAT ( [Date], "MMM" ),
    "DíaSemana", WEEKDAY ( [Date], 2 ),
    "SemanaAño", WEEKNUM ( [Date], 2 ),
    "PERIODO", FORMAT([Date], "YYYYMM"),
    "CierreSemana", ( [Date] + 7 - WEEKDAY( [Date], 2 ) ),
    "Día Nombre", FORMAT ( [Date], "DDDD" ),
    "DíaCorto", FORMAT ( [Date], "DDD" ),
    "AñoTrimestre", FORMAT ( [Date], "YYYY" ) & "/T" & FORMAT ( [Date], "Q" ),
    "AñoMes", FORMAT ( [Date], "YYYY/MM" ),
    "AñoMesCorto", FORMAT ( [Date], "YYYY/mmm" ),
    "InicioMes", EOMONTH( [Date], -1) + 1,
    "FinMes", EOMONTH( [Date], 0),
    "Estación", IF([Date] >= DATE(YEAR([Date]), 3, 21) && [Date] <= DATE(YEAR([Date]), 6, 20), "Otoño",
                IF([Date] >= DATE(YEAR([Date]), 6, 21) && [Date] <= DATE(YEAR([Date]), 9, 20), "Invierno",
                IF([Date] >= DATE(YEAR([Date]), 9, 21) && [Date] <= DATE(YEAR([Date]), 12, 20), "Primavera",
                "Verano")))
)
```

---
<p align="center">
<a href="./03-dax-fundamental-calculate-iteradores.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="./05-inteligencia-de-tiempo-yoy-ytd.md">Siguiente ➡️</a>
</p>
