# 5. Inteligencia de tiempo en DAX: comparativas YoY y acumulados YTD

> Con `CALCULATE` dominado, ahora lo aplicás a la comparativa más solicitada en cualquier reporte de negocio: el análisis temporal **año contra año** y **acumulados**.

Cuando un gerente pregunta *"¿cómo vamos este año comparado con el anterior?"* o *"¿cuánto acumulamos desde enero?"*, estás ante preguntas de **Inteligencia de Tiempo**. El tiempo no es una columna más: es la dimensión sobre la cual medimos el éxito, el crecimiento y las tendencias.

## 1. El requisito indispensable: la tabla de calendario
No basta con tener una columna "Fecha" en la tabla de ventas. Para que las funciones de tiempo funcionen bien, necesitás una **Tabla de Fechas** dedicada que cumpla:
- **Continuidad:** todos los días del año, sin saltos (del 1 de enero al 31 de diciembre).
- **Unicidad:** cada fecha aparece una sola vez (es la Primary Key).
- **Tipo de dato:** la columna debe ser de tipo **`Date`**.

> Si tu empresa no vendió nada el domingo 15 de marzo, ese día no existe en la tabla de ventas. Cuando DAX busque "el mismo día del año pasado", se confundirá. La tabla calendario **llena esos huecos**.

## 2. Acumulados: el YTD (Year-To-Date)
El **YTD** suma todos los valores desde el **primer día del año** hasta la fecha seleccionada. Si mirás solo mayo, ves una foto aislada; con `Ventas YTD` en mayo ves enero + febrero + marzo + abril + mayo. Es vital para saber si vas por buen camino hacia la meta anual.

```dax
Ventas YTD = TOTALYTD([Total Ventas], 'Calendario'[Fecha])
```
- `[Total Ventas]`: la medida base (ej. `SUM(Ventas[Monto])`).
- `'Calendario'[Fecha]`: la columna de fechas de tu tabla calendario.

> ⚠️ **Error común:** intentar crearlo como **columna calculada**. ¡No lo hagas! Como **medida**, se adapta al contexto: al filtrar por "Categoría", el acumulado se recalcula para esa categoría. Una columna quedaría estática y daría resultados falsos.

## 3. Comparativas: el YoY (Year-over-Year)
El **YoY** compara una métrica del periodo actual con el **mismo periodo del año anterior**. Es la métrica reina para detectar crecimiento.

**Paso 1 — Ventas del año pasado** con `SAMEPERIODLASTYEAR` (desplaza el contexto un año atrás):
```dax
Ventas Año Anterior =
CALCULATE(
    [Total Ventas],
    SAMEPERIODLASTYEAR('Calendario'[Fecha])
)
```
> *"Tomá la suma de ventas, pero antes de calcularla, viajá exactamente un año atrás en el calendario."*

**Paso 2 — Variación YoY %** con `DIVIDE` (evita el error de división por cero):
```dax
Crecimiento YoY % =
VAR VentasActuales = [Total Ventas]
VAR VentasPasadas  = [Ventas Año Anterior]
RETURN
DIVIDE(VentasActuales - VentasPasadas, VentasPasadas, 0)
```
> **Dato clave:** las variables (`VAR`) hacen tu código más limpio y legible (lo profundizamos en la próxima unidad).

## 4. Escenario real: "Manzanas con Manzanas"
Hoy es 20 de mayo. Querés comparar contra el año anterior:
- Ventas Mayo 2026 (hasta el día 20): **$50.000**
- Ventas Mayo 2025 (mes completo): **$80.000**

Comparar directo daría una caída del 37%… ¡pero es injusto! Estás comparando **20 días contra 31 días**. La inteligencia de tiempo es inteligente: si filtrás hasta el 20 de mayo de 2026, `SAMEPERIODLASTYEAR` filtra automáticamente el 2025 **del 1 al 20 de mayo**. Eso permite una comparación *"Like-for-Like"* (manzanas con manzanas): una visión real de si estás rindiendo mejor o peor al mismo ritmo.

## 5. Errores comunes y mejores prácticas
1. **No marcar la tabla como "Tabla de fechas":** hacé clic derecho → *"Marcar como tabla de fechas"*. Esto desactiva las jerarquías automáticas de fecha y le dice a DAX que use tu tabla profesional.
2. **Comparar periodos incompletos sin contexto:** avisá hasta qué fecha llegan los datos. Un YoY negativo en el mes en curso puede deberse solo a que el mes no terminó.
3. **Confundir YTD con Total Anual:** el YTD es un **acumulado parcial**. En marzo solo suma enero+febrero+marzo; no es la proyección del año.

## 6. Resumen de funciones clave

| Función | Propósito | Ejemplo |
|---------|-----------|---------|
| `TOTALYTD` | Acumulado desde el 1 de enero | Ventas acumuladas |
| `SAMEPERIODLASTYEAR` | Devuelve las fechas del año anterior | Comparar hoy vs. año pasado |
| `DATEADD` | Mueve fechas (días, meses, años) | Ventas hace 6 meses |
| `TOTALMTD` | Acumulado del mes hasta la fecha | Ventas del mes actual |

> Con estas herramientas pasás de "sumar columnas" a **explicar la trayectoria de un negocio**.

---
<p align="center">
<a href="./04-tabla-de-medidas-y-calendario.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="./06-optimizacion-variables-y-dax-studio.md">Siguiente ➡️</a>
</p>
