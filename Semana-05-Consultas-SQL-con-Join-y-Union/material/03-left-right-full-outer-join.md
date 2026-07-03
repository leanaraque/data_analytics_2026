# 3. Conceptos y diferencias entre `LEFT`, `RIGHT` y `FULL OUTER`

> El `INNER JOIN` solo devuelve coincidencias. Los JOIN **externos** incluyen también los registros sin par — crítico para detectar clientes sin compras, productos sin ventas o sucursales sin actividad.

¿Cómo listar **todos** los clientes, incluidos los que aún no compraron? ¿O identificar pedidos que no están asignados a ningún cliente? Los JOIN `LEFT`, `RIGHT` y `FULL OUTER` resuelven estos escenarios, manejando filas no coincidentes y valores `NULL`.

## Fundamentos: estructura de una consulta
```sql
SELECT columnas
FROM   tabla1
[JOIN  tabla2 ON condición]
WHERE  condiciones
ORDER BY columnas;
```
En el modelo relacional, las tablas representan entidades y se relacionan mediante **PK** y **FK**. Ej.: `Clientes` tiene la PK `cliente_id`, y `Pedidos` tiene la FK `cliente_id` que referencia a `Clientes`.

## `LEFT JOIN`
Devuelve **todas** las filas de la tabla **izquierda** (`tabla1`) y las coincidentes de la derecha (`tabla2`). Si no hay coincidencia, las columnas de la derecha aparecen como `NULL`.

```sql
SELECT tabla1.columna, tabla2.columna
FROM   tabla1
LEFT JOIN tabla2 ON tabla1.campo_comun = tabla2.campo_comun;
```

**Ejemplo** — listar todos los clientes y sus pedidos, incluyendo clientes sin pedidos:
```sql
SELECT c.cliente_id, c.nombre, p.pedido_id
FROM   Clientes c
LEFT JOIN Pedidos p ON c.cliente_id = p.cliente_id;
```
Los clientes sin pedidos tendrán `NULL` en las columnas de `Pedidos`.

**¿Cuándo usarlo?** Cuando necesitás el conjunto **completo** de una tabla principal y complementarlo con otra, **sin perder** los registros de la principal aunque no haya coincidencias: informes, análisis de clientes sin actividad, auditorías de productos sin ventas, y proyectos de machine learning donde es fundamental mantener los registros base.

**Consideraciones:** cuidá el **desempeño** (indexar las columnas del `ON`) y el **manejo de `NULL`** en los cálculos posteriores.

## `RIGHT JOIN` (RIGHT OUTER JOIN)
Devuelve **todas** las filas de la tabla **derecha** (`tabla2`) y las coincidentes de la izquierda. Sin coincidencia → columnas de la izquierda en `NULL`.

**Ejemplo** — listar todos los pedidos y sus clientes, incluyendo pedidos sin cliente asignado (posible en migraciones o datos incompletos):
```sql
SELECT p.pedido_id, p.fecha, c.cliente_id, c.nombre
FROM   Clientes c
RIGHT JOIN Pedidos p ON c.cliente_id = p.cliente_id;
```
Los pedidos sin cliente tendrán `NULL` en las columnas de `Clientes`.

**Ventajas:** garantiza que todas las filas de la derecha aparezcan. **Desventajas:** puede producir muchos `NULL`, es menos intuitivo que el `LEFT`, y en algunos motores modernos tiene menor optimización. En la práctica, muchos equipos **prefieren `LEFT JOIN`** por ser más intuitivo (reordenando las tablas se logra lo mismo).

## `FULL OUTER JOIN`
Combina los resultados de `LEFT` y `RIGHT`: devuelve **todas** las filas de **ambas** tablas, con coincidencias cuando existan y `NULL` cuando no. Es valioso para **análisis de integridad, auditorías o validación de datos**.

```sql
SELECT c.cliente_id, c.nombre, p.pedido_id, p.fecha
FROM   Clientes c
FULL OUTER JOIN Pedidos p ON c.cliente_id = p.cliente_id;
```

> ⚠️ **No todos los sistemas lo soportan directamente:** **MySQL no** tiene `FULL OUTER JOIN` nativo; se simula con un `UNION` de `LEFT JOIN` y `RIGHT JOIN`. **PostgreSQL y SQL Server** sí lo soportan nativamente.

## Impacto de los valores `NULL`
Los `NULL` indican **ausencia de datos** o no coincidencia en la tabla relacionada. Interpretarlos correctamente es crucial: un cliente con `NULL` en `pedido_id` significa que **no tiene pedidos registrados**, algo relevante para campañas de marketing o análisis de retención.
> Recordá: en SQL, `NULL` **no** es igual a cero ni a cadena vacía; representa un valor desconocido o inexistente.

## Resumen de conceptos clave

| Tipo de JOIN | Filas de tabla izquierda | Filas de tabla derecha | Soporte en DBMS |
|--------------|--------------------------|------------------------|-----------------|
| **INNER JOIN** | Solo con coincidencia | Solo con coincidencia | Todos |
| **LEFT (OUTER) JOIN** | Todas + coincidencias | Solo coincidencias | Todos |
| **RIGHT (OUTER) JOIN** | Solo coincidencias | Todas + coincidencias | Todos |
| **FULL OUTER JOIN** | Todas + coincidencias | Todas + coincidencias | PostgreSQL, SQL Server (no MySQL) |

Conocer las diferencias de **soporte y sintaxis** entre MySQL, PostgreSQL y SQL Server es fundamental para escribir consultas eficientes y **portables**, adaptadas al entorno de cada organización.

---
<p align="center">
<a href="./02-inner-join-ejemplos-de-negocio.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 5</a> · <a href="./04-orden-de-ejecucion-en-sql.md">Siguiente ➡️</a>
</p>
