# 4. Orden de ejecución en SQL

> Ya escribís consultas complejas con varios JOINs. Esta unidad explica por qué a veces no funcionan como esperás, conociendo el **orden real** en que el motor las ejecuta.

El orden en que **escribís** SQL no es el orden en que se **ejecuta**. Entender esto elimina de raíz los errores más comunes de los analistas y te permite escribir consultas más eficientes y predecibles.

> ¿Alguna vez recibiste un error al usar un alias del `SELECT` en el `WHERE`? ¿O no entendiste por qué existe `HAVING` si ya tenemos `WHERE`? Estos comportamientos tienen una explicación directa en el orden de ejecución.

## El orden real de ejecución (8 pasos)
Aunque SQL se escribe como `SELECT … FROM … WHERE …`, el motor lo procesa así:

| Paso | Cláusula |
|:----:|----------|
| 1 | `FROM` / `JOIN` |
| 2 | `WHERE` |
| 3 | `GROUP BY` |
| 4 | `HAVING` |
| 5 | `SELECT` |
| 6 | `DISTINCT` |
| 7 | `ORDER BY` |
| 8 | `LIMIT` / `TOP` |

## Caso práctico: ventas por país
Dos tablas:
- `orders` (`id_order`, `id_customer`, `order_date`, `total`, `status`)
- `customers` (`id_customer`, `name`, `country`, `segment`)

Queremos el total de ventas y cantidad de pedidos **por país**, solo para países con más de $5.000 en ventas desde enero de 2024, ordenados de mayor a menor:

```sql
SELECT   c.country,
         SUM(o.total)  AS revenue,
         COUNT(*)      AS orders
FROM     customers c
INNER JOIN orders o ON c.id_customer = o.id_customer   -- paso 1
WHERE    o.order_date >= '2024-01-01'                   -- paso 2
  AND    o.status = 'completed'
GROUP BY c.country                                       -- paso 3
HAVING   SUM(o.total) > 5000                             -- paso 4
ORDER BY revenue DESC                                    -- paso 7
LIMIT    10;                                             -- paso 8
```

**Lo que hace cada cláusula:**
1. **`FROM` / `JOIN` (1):** construye la tabla combinada de clientes y pedidos.
2. **`WHERE` (2):** descarta pedidos anteriores a 2024 y no completados.
3. **`GROUP BY` (3):** agrupa todas las filas por país.
4. **`HAVING` (4):** elimina países con ventas totales ≤ $5.000.
5. **`SELECT` (5):** calcula `SUM` y `COUNT`, y define los alias `revenue` y `orders`.
6. **`ORDER BY` (7):** puede usar el alias `revenue` **porque ya fue calculado** en el paso 5.
7. **`LIMIT` (8):** entrega solo los primeros 10 resultados del ranking.

## Errores frecuentes explicados por el orden de ejecución

| ❌ Error común | ✅ Corrección |
|----------------|---------------|
| Usar un alias del `SELECT` en el `WHERE` (el alias **no existe** todavía en el paso 2) | Usar la expresión completa, o mover la condición a `HAVING` si involucra agregación |
| Usar `SUM()` en el `WHERE` (`WHERE` no puede filtrar agregaciones) | Mover la condición a `HAVING`, que se ejecuta **después** del `GROUP BY` |
| Esperar que `ORDER BY` afecte el `GROUP BY` (`ORDER BY` corre en el paso 7) | Ordenar por columnas o alias del resultado final |
| Usar `LIMIT` sin `ORDER BY` (resultado impredecible) | Acompañar siempre `LIMIT` / `TOP` con un `ORDER BY` explícito |

## ⚠️ Caso especial: `WHERE` vs. `HAVING`
Ambas filtran filas, pero en momentos distintos: **`WHERE` filtra antes de agrupar** (sobre filas individuales) y **`HAVING` filtra después de agrupar** (sobre resultados agregados).
> **Regla práctica:** si la condición usa `SUM`, `COUNT`, `AVG`, `MAX` o `MIN`, va en `HAVING`.

## Buenas prácticas y rendimiento
- **Filtrá temprano con `WHERE`:** cuanto antes reduzcas el conjunto (paso 2), menos trabajo tienen los pasos siguientes. Mover condiciones de `HAVING` a `WHERE` cuando es posible mejora el rendimiento.
- **Indexá las columnas de `JOIN` y `WHERE`:** son las más consultadas; asegurate de que tengan índices.
- **Usá `EXPLAIN`** para analizar el plan de ejecución: muestra si el motor usa índices y dónde están los cuellos de botella.
- **Evitá subconsultas innecesarias:** preferí JOINs directos sobre subconsultas anidadas en el `WHERE`.
- **Usá alias descriptivos:** están disponibles en el `ORDER BY` (paso 7); nombres como `revenue` mejoran la legibilidad.

```sql
-- SQL Server: ver el plan de ejecución estimado
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT   c.country, SUM(o.total) AS revenue
FROM     customers c
INNER JOIN orders o ON c.id_customer = o.id_customer
WHERE    o.order_date >= '2024-01-01'
GROUP BY c.country
HAVING   SUM(o.total) > 5000
ORDER BY revenue DESC;

-- En MySQL / PostgreSQL usar: EXPLAIN ANALYZE SELECT ...
```

## Contexto real · Business Intelligence
En BI y análisis comercial, las consultas corren sobre **millones de registros**. Un analista que entiende el orden de ejecución sabe **dónde filtrar** para reducir el costo, **por qué** un dashboard tarda en cargar, y **cómo** reescribir una consulta para que el motor use los índices. Al revisar código de compañeros o heredar *stored procedures*, este conocimiento permite detectar ineficiencias en segundos. Es una de las habilidades que más diferencia a un analista **junior** de uno **senior**.

---
<p align="center">
<a href="./03-left-right-full-outer-join.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="./05-checklist-left-right-full.md">Siguiente ➡️</a>
</p>
