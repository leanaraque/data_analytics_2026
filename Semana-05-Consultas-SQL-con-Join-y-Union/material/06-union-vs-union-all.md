# 6. `UNION` vs `UNION ALL`: conceptos y ejemplos

> Los JOINs combinan tablas **horizontalmente** (columnas). `UNION` las combina **verticalmente** (filas): una operación distinta pero igualmente frecuente al consolidar múltiples períodos o sucursales.

¿Alguna vez necesitaste combinar resultados de varias consultas para un reporte consolidado? Por ejemplo, sumar ventas de diferentes regiones o unir listas de clientes de distintas bases. `UNION` y `UNION ALL` son las herramientas para eso.

## ¿Qué permite `UNION`?
El operador `UNION` combina los resultados de varias sentencias `SELECT` en **un único conjunto de resultados**. Funciona como cuando en Excel copiás una tabla y la pegás **debajo** de otra, generando una lista más larga — pero siguiendo reglas específicas.

A diferencia del `JOIN`, `UNION` **no** relaciona filas por una columna común ni establece lógica relacional: solo **apila** los resultados, siempre que se cumpla que:
- Cada consulta devuelve el **mismo número de columnas**.
- Los **tipos de datos** de las columnas correspondientes son **compatibles** (no se puede unir texto con números).

> **`UNION` no es una sentencia por sí sola**, sino un **operador de conjuntos**: siempre requiere al menos **dos** `SELECT` completos. Escrito solo, el motor devuelve un error.

## Consulta con `UNION` (elimina duplicados)
```sql
SELECT id_producto, nombre_producto, precio
FROM Productos_Tienda1
UNION
SELECT id_producto, nombre_producto, precio
FROM Productos_Tienda2;
```
> La lista final incluye cada producto **una sola vez**, incluso si está en ambas tablas.

## Consulta con `UNION ALL` (conserva duplicados)
```sql
SELECT id_producto, nombre_producto, precio
FROM Productos_Tienda1
UNION ALL
SELECT id_producto, nombre_producto, precio
FROM Productos_Tienda2;
```
> Devuelve **todos** los productos de ambas tablas, incluyendo duplicados.

## Reglas importantes
- **Cantidad de columnas:** la misma en todas las consultas.
- **Tipos de datos:** las columnas correspondientes deben ser compatibles.
- **`UNION` elimina duplicados**; para incluirlos, usar **`UNION ALL`**.

## Comparativa

| Característica | `UNION` | `UNION ALL` |
|---------------|:-------:|:-----------:|
| Elimina duplicados | Sí | No |
| Rendimiento | Menor (más costoso) | Mayor (más rápido) |
| Uso típico | Resultados únicos | Combinar todo sin filtro |

## En el mundo real
Los analistas suelen consolidar datos de diferentes fuentes: bases regionales, sistemas de CRM o reportes de campañas. `UNION` garantiza que un reporte **no tenga registros repetidos** (evita inflar métricas). Pero si se requiere analizar **todas** las interacciones, incluyendo repeticiones, `UNION ALL` es la opción adecuada.

> 💡 En bases de datos grandes, elegir correctamente entre `UNION` y `UNION ALL` impacta directamente en el **tiempo de respuesta** y la carga del servidor. Como `UNION` debe comparar filas para descartar duplicados, si sabés que no hay duplicados (o no te molestan), `UNION ALL` es más rápido.

---
<p align="center">
<a href="./05-checklist-left-right-full.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="./07-ejemplos-guiados-union.md">Siguiente ➡️</a>
</p>
