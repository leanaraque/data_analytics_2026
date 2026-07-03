# 5. Checklist rápida: ¿cuándo usar `LEFT` vs `RIGHT` vs `FULL`?

> Conocés todos los tipos de JOIN. Esta unidad te da el **criterio** para elegir el correcto según la pregunta de negocio.

Elegir bien entre `LEFT`, `RIGHT` y `FULL OUTER JOIN` puede marcar la diferencia entre obtener resultados **completos** o **perder información valiosa**. Acá tenés una checklist y reglas mnemotécnicas para decidir con confianza.

## Resumen práctico
- **`LEFT JOIN`:** todas las filas de la tabla **izquierda** + las coincidentes de la derecha. Sin coincidencia → columnas de la derecha en `NULL`.
- **`RIGHT JOIN`:** todas las filas de la tabla **derecha** + las coincidentes de la izquierda. Sin coincidencia → columnas de la izquierda en `NULL`.
- **`FULL OUTER JOIN`:** **todas** las filas de ambas tablas, con `NULL` donde no haya correspondencia.

> **Nota:** MySQL no soporta `FULL OUTER JOIN` directamente; se simula con `UNION` de `LEFT` y `RIGHT JOIN`.

## Reglas mnemotécnicas
- **`LEFT JOIN`:** *"izquierda primero"* — siempre conserva toda la tabla de la izquierda.
- **`RIGHT JOIN`:** *"derecha primero"* — conserva toda la tabla de la derecha.
- **`FULL JOIN`:** *"todo"* — conserva todas las filas de ambas tablas.

## Ejemplos breves
```sql
-- LEFT JOIN: todos los clientes y sus órdenes si existen
SELECT c.id, o.order_id
FROM clientes c
LEFT JOIN ordenes o ON c.id = o.cliente_id;

-- RIGHT JOIN: todas las órdenes y sus clientes si existen
SELECT c.id, o.order_id
FROM clientes c
RIGHT JOIN ordenes o ON c.id = o.cliente_id;

-- FULL OUTER JOIN (PostgreSQL)
SELECT c.id, o.order_id
FROM clientes c
FULL OUTER JOIN ordenes o ON c.id = o.cliente_id;
```

## Consideraciones sobre `NULL`
Con `LEFT` o `RIGHT JOIN`, las filas sin coincidencia muestran `NULL` en las columnas de la tabla que no tiene datos relacionados. Esto es **clave** para identificar datos faltantes o incompletos en análisis y reportes.

## ¿Cómo elegir según el negocio?
- **¿Todos los clientes, incluso los que no compraron?** → `LEFT JOIN` desde `clientes` hacia `ventas`.
- **¿Todas las ventas, incluso las sin cliente asignado (anónimas)?** → `RIGHT JOIN`.
- **¿Visión completa cuando ambas tablas pueden tener datos únicos sin correspondencia?** (ej. clientes y sus interacciones en campañas donde algunos no participaron) → `FULL OUTER JOIN`.

Conocer estas diferencias te permite diseñar consultas que reflejen fielmente la realidad del negocio y evitar errores comunes como **perder datos importantes** o **generar resultados sesgados**.

---
<p align="center">
<a href="./04-orden-de-ejecucion-en-sql.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="./06-union-vs-union-all.md">Siguiente ➡️</a>
</p>
