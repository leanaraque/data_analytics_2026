# 4. Ordenar y limitar resultados: `ORDER BY` y `LIMIT`

> Ya filtrás las filas que necesitás. `ORDER BY` y `LIMIT` te permiten controlar también el **orden** y la **cantidad** del resultado.

En el análisis de datos rara vez necesitamos todos los registros en cualquier orden. Imaginá que trabajás en e-commerce y tu jefe pide:
- *"Mostrame los 10 productos más caros."*
- *"Dame una lista de los clientes más recientes."*
- *"Necesito ver solo los 5 pedidos con menor monto para investigar un error."*

Para responder, SQL nos ofrece dos herramientas: **`ORDER BY`** y **`LIMIT`**.

## 1. Ordenar datos con `ORDER BY`
Por defecto, las bases de datos **no garantizan** un orden específico. Para organizar la información usamos `ORDER BY` al final de la consulta. Hay dos direcciones:
- **`ASC` (ascendente):** de menor a mayor, de la A a la Z. Es el comportamiento **por defecto**.
- **`DESC` (descendente):** de mayor a menor, de la Z a la A. Útil para ver los valores más altos primero (como los precios más caros).

**Ejemplo** — empleados ordenados por salario descendente (los que más ganan arriba):
```sql
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;
```

> **Tip de experto:** podés ordenar por **múltiples columnas**. `ORDER BY last_name ASC, first_name ASC` ordena primero por apellido y, si dos personas tienen el mismo apellido, las ordena por nombre.

## 2. Restringir resultados con `LIMIT`
Si solo querés "echar un vistazo" o necesitás el "Top X" de algo, usás `LIMIT`. Le dice a la base: *"Detente después de entregarme N filas"*.

**Ejemplo** — los 3 productos con menos stock para reponerlos:
```sql
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity ASC
LIMIT 3;
```

## ¿Por qué usarlos juntos?
`ORDER BY` y `LIMIT` son una **pareja inseparable** en el análisis. `LIMIT` sin `ORDER BY` es **peligroso**, porque la base te dará filas al azar. Siempre que pidas "los primeros 10", debés especificar "los primeros 10 **basado en qué orden**".

## Errores comunes a evitar
- **Olvidar el orden de las cláusulas.** SQL es muy estricto; el orden correcto siempre es:
  1. `SELECT`
  2. `FROM`
  3. `WHERE` (si hay filtros)
  4. `ORDER BY`
  5. `LIMIT`
- **Confundir `ASC` y `DESC`.** `DESC` es para el "Top" (más caro, más reciente, mayor puntaje). `ASC` es para el "Bottom" (más barato, más antiguo, menor puntaje).

> 📎 **Nota de motor:** `LIMIT` es la sintaxis de **PostgreSQL / MySQL**. En **SQL Server** el equivalente es `SELECT TOP N ...`.

---
<p align="center">
<a href="./03-where-y-operadores-logicos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 4</a> · <a href="./05-funciones-de-agregacion.md">Siguiente ➡️</a>
</p>
