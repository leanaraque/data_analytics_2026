# 3. Filtrado preciso: `WHERE` y operadores lógicos

> Con `SELECT` y `DISTINCT` dominados, ahora controlás **qué filas** devuelve tu consulta.

En el mundo real, las tablas pueden tener millones de filas. Rara vez necesitás todos los registros; lo común es responder preguntas específicas: *"¿Qué ventas ocurrieron en Madrid?"*, *"¿Qué productos tienen poco stock?"*, *"¿Qué clientes no compraron este mes?"*. Para eso usamos la cláusula **`WHERE`**.

## La cláusula `WHERE`
`WHERE` actúa como un **tamiz o filtro** que se aplica a cada fila: si la fila cumple la condición, se incluye en el resultado; si no, se descarta.

### Operadores de comparación
| Operador | Significado |
|----------|-------------|
| `=` | Igual a |
| `<>` o `!=` | Diferente de |
| `>` | Mayor que |
| `<` | Menor que |
| `>=` | Mayor o igual que |
| `<=` | Menor o igual que |

**Ejemplo** — productos cuyo valor de venta supere los 1000:
```sql
SELECT producto, importe
FROM ventas
WHERE importe > 1000;
```

## Combinando condiciones: operadores lógicos
A veces una sola condición no alcanza. Ahí entran los operadores lógicos:
- **`AND`:** todas las condiciones deben cumplirse simultáneamente. → *Ventas de la región 'Norte' **y** de la categoría 'Libros'.*
- **`OR`:** al menos una condición debe cumplirse. → *Ventas del vendedor 'Ana' **o** del vendedor 'Pedro'.*
- **`NOT`:** invierte el resultado de una condición. → *Ventas que **no** sean de 'Electrónica'.*

## El operador `IN` (el atajo elegante)
Cuando querés filtrar por varios valores posibles en una misma columna, en lugar de encadenar muchos `OR`, usamos `IN`:

```sql
-- En lugar de:
WHERE ciudad = 'Madrid' OR ciudad = 'Barcelona' OR ciudad = 'Valencia'

-- Escribimos:
WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia')
```

## Errores comunes a evitar
- **Olvidar las comillas en texto:** los números se escriben tal cual (`WHERE edad > 18`), pero el texto siempre va entre comillas simples (`WHERE pais = 'México'`).
- **Confundir `AND` y `OR`:** si pedís `WHERE region = 'Norte' AND region = 'Sur'`, el resultado será **siempre vacío** (¡una venta no puede ocurrir en dos lugares a la vez!). Ahí deberías usar `OR` o `IN`.
- **El orden de ejecución:** SQL primero mira el `FROM` (de dónde vienen los datos), luego el `WHERE` (qué filas sirven) y finalmente el `SELECT` (qué columnas mostrar). Por eso **no podés usar un alias creado en el `SELECT` dentro de tu `WHERE`**.

## Resumen
Ya sabés cómo "recortar" tus tablas **verticalmente** (eligiendo columnas con `SELECT`) y **horizontalmente** (eligiendo filas con `WHERE`). Esta es la base fundamental de cualquier reporte analítico.

> ⚠️ Recordá de la Semana 3: `WHERE` no es exclusiva del `SELECT` — es igual de crítica en `UPDATE` y `DELETE` para evitar modificaciones masivas accidentales.

---
<p align="center">
<a href="./02-sentencia-distinct.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 4</a> · <a href="./04-order-by-y-limit.md">Siguiente ➡️</a>
</p>
