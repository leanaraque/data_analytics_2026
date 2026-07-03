# 2. `INNER JOIN` con ejemplos de negocio

> Conocés la sintaxis del JOIN. Ahora lo aplicás a preguntas reales de negocio: combinar tablas de clientes, ventas y productos para responder lo que después vas a visualizar en Power BI.

En esta unidad aplicamos el `INNER JOIN` para resolver un caso común: **relacionar clientes con sus pedidos**. También reforzamos cómo los `NULL` afectan las consultas y vemos buenas prácticas para optimizar el rendimiento.

## Caso práctico: Clientes y Pedidos con `INNER JOIN`
Supongamos dos tablas:
- `clientes` (`id_cliente`, `nombre`, `email`)
- `pedidos` (`id_pedido`, `id_cliente`, `fecha`, `total`)

Queremos una lista de clientes que **hayan realizado pedidos**, junto con el total de cada pedido:

```sql
-- Consulta básica con INNER JOIN
SELECT c.nombre, p.id_pedido, p.total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
```

Esta consulta devuelve **solo** los clientes que tienen pedidos, porque `INNER JOIN` combina filas que **coinciden en ambas tablas**.

## `NULL` y su comportamiento en JOINs y comparaciones
Cuando un cliente **no** tiene pedidos, no aparecerá en el resultado anterior. Al hacer comparaciones con campos que pueden ser `NULL`, recordá:
- `NULL` representa un valor **desconocido o inexistente**.
- Las comparaciones directas con `NULL` (`= NULL`) **no funcionan**; se debe usar **`IS NULL`** o **`IS NOT NULL`**.
- En **agregaciones**, los valores `NULL` se ignoran.

> Para incluir clientes **sin** pedidos, necesitaremos otro tipo de JOIN (que vemos en la siguiente unidad), pero es clave entender cómo el `NULL` afecta los resultados.

## Buenas prácticas y rendimiento
Para consultas eficientes:
- **Índices:** asegurate de que las columnas usadas en el `JOIN` (`id_cliente`) estén **indexadas** para acelerar la búsqueda.
- **Evitar subconsultas innecesarias:** preferí `JOIN`s directos cuando sea posible.
- **`EXPLAIN`:** usá esta herramienta para analizar cómo el motor ejecuta tu consulta y detectar cuellos de botella.

```sql
EXPLAIN
SELECT c.nombre, p.id_pedido, p.total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
```
Esto te muestra el **plan de ejecución** y te ayuda a identificar si se están usando índices correctamente.

## ¿Por qué importa en el trabajo real?
Un equipo de **marketing** puede querer identificar clientes activos para campañas; un analista **financiero** necesita conocer los totales de ventas por cliente. Entender los JOINs y manejar los `NULL` es fundamental para evitar errores en los reportes y asegurar información completa y precisa. La **optimización** es crucial en entornos con grandes bases de datos, donde una consulta lenta afecta la productividad.

> 🎥 **Simplificar el INNER JOIN:** ¿la palabra `INNER` es obligatoria? (No: `JOIN` por defecto es `INNER JOIN`.) Y el uso de **alias** de tabla (`c`, `p`) hace las consultas más limpias y legibles.

---
<p align="center">
<a href="./01-clausula-join.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="./03-left-right-full-outer-join.md">Siguiente ➡️</a>
</p>
