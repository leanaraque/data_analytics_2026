# 7. Ejemplos guiados: compatibilidad de columnas y tipos

> Aplicamos `UNION` y `UNION ALL` en escenarios prácticos, con foco en la **compatibilidad de columnas y tipos de datos** entre consultas, y el manejo de `NULL` en combinaciones.

Al integrar datos de distintas fuentes (campañas de diferentes años o regiones, en tablas separadas), es común encontrar columnas con tipos que no coinciden exactamente o valores `NULL` que afectan la calidad del análisis. Dominar estos detalles es clave para preparar **datasets limpios y completos**.

## `INNER JOIN` (repaso rápido)
Devuelve solo las filas donde existe coincidencia en ambas tablas según la condición del `ON`:
```sql
SELECT ventas.id, productos.nombre
FROM ventas
INNER JOIN productos ON ventas.producto_id = productos.id;
```
> Si no hay coincidencia, la fila **no** aparece en el resultado.

## `UNION` y `UNION ALL` (aplicación)
Combinan resultados de varios `SELECT` que deben tener el **mismo número de columnas** y **tipos compatibles**.
```sql
-- Usando UNION (sin duplicados)
SELECT nombre FROM productos_2022
UNION
SELECT nombre FROM productos_2023;

-- Usando UNION ALL (con duplicados)
SELECT nombre FROM productos_2022
UNION ALL
SELECT nombre FROM productos_2023;
```
> **Importante:** las columnas deben ser compatibles en **tipo** y **orden**.

## `NULL` en JOINs y comparaciones
Los `NULL` representan datos desconocidos o ausentes y afectan cómo se comparan filas y se combinan tablas:
- En un `JOIN`, si una columna clave es `NULL`, la fila puede **no coincidir**.
- Al usar `UNION`, `NULL` se considera un valor y puede afectar la eliminación de duplicados.

```sql
SELECT id, nombre FROM clientes
WHERE nombre IS NULL;
```
> **Tip:** siempre verificá cómo los `NULL` pueden influir en tus resultados para evitar sorpresas.

## Alineación de columnas y tipos de datos
Para usar `UNION` o `UNION ALL`, las consultas deben tener:
- El **mismo número de columnas**.
- **Tipos de datos compatibles** en cada posición.

Si es necesario, podés usar **funciones de conversión** (`CAST`) o **alias** para alinear columnas:
```sql
SELECT CAST(id AS VARCHAR) AS id_str, nombre FROM tabla1
UNION
SELECT id_str, nombre FROM tabla2;
```
> Este paso es **crucial** para evitar errores y asegurar resultados coherentes.

## Cierre
Dominar `UNION` y `UNION ALL` junto con un buen manejo de JOINs y `NULL` es fundamental para preparar datasets limpios y completos, facilitando análisis precisos y decisiones informadas — muy relevante en contextos reales de ventas y productos para profesionales de data analytics y consultoría.

---
<p align="center">
<a href="./06-union-vs-union-all.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="../entregable/README.md">Ir al entregable (M5) ➡️</a>
</p>
