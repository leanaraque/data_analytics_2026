/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   Todo el SQL que ejecutamos en clase, paso a paso y en el mismo orden.

   MOTOR: Microsoft SQL Server. Se ejecuta desde SSMS.
   REQUISITO: la base Ventas_Tech_DB creada en la Semana 3.

   COMO USARLO
     No ejecutes el archivo entero de una. Cada paso se selecciona con el
     mouse y se corre con F5, igual que en la clase.
     Los bloques estan numerados por momento de la clase:
       A  preparacion            E  ORDER BY y TOP
       B  SELECT y alias         F  funciones de agregacion
       C  DISTINCT               G1 ampliar el dataset a seis meses
       D  WHERE y operadores     G  GROUP BY
                                 H  HAVING y CASE WHEN
                                 I  el entregable M4

     Algunos pasos FALLAN A PROPOSITO, y otros devuelven un resultado
     enganoso sin fallar. En los dos casos el comentario lo avisa: estan
     para que veas el problema real.

   OJO CON DOS COSAS QUE EL MATERIAL ESCRIBE DE OTRO MOTOR
     EXTRACT(MONTH FROM fecha)  no existe en SQL Server -> MONTH(fecha)
     LIMIT n                    no existe en SQL Server -> SELECT TOP n

   ARCHIVO GENERADO: no lo edites a mano.
   ===================================================================== */

USE Ventas_Tech_DB;
GO

-- A.1  Pararse en la base y confirmar que los datos estan

SELECT COUNT(*) AS ventas_cargadas FROM ventas;
GO

-- B.1  Ver que hay en la tabla. Para explorar, el asterisco sirve.
SELECT * FROM ventas;
GO

-- B.2  Pedir solo las columnas que interesan
SELECT id_venta, fecha_venta, cantidad, precio_unitario
FROM   ventas;
GO

-- B.3  Una columna que NO existe en la tabla: el motor la calcula al vuelo
SELECT id_venta,
       cantidad,
       precio_unitario,
       cantidad * precio_unitario
FROM   ventas;
GO

-- B.4  Alias: ponerle nombre a todo, sobre todo a la columna calculada
SELECT id_venta                   AS venta,
       fecha_venta                AS fecha,
       cantidad                   AS unidades,
       precio_unitario            AS precio,
       cantidad * precio_unitario AS total_linea
FROM   ventas;
GO

-- B.5  El alias tambien se puede escribir sin la palabra AS, pero se lee peor
SELECT id_venta venta, cantidad unidades
FROM   ventas;
GO

-- B.6  EL ERROR SILENCIOSO: falta la coma entre las dos columnas.
--      No da error. Devuelve UNA columna, no dos.
SELECT id_venta cantidad
FROM   ventas;
GO

-- C.1  Quienes compraron? Asi NO se responde: hay repetidos.
SELECT id_cliente FROM ventas;
GO

-- C.2  Ahora si: DISTINCT saca los repetidos
SELECT DISTINCT id_cliente FROM ventas;
GO

-- C.3  Con dos columnas, mira la COMBINACION completa
SELECT DISTINCT id_cliente, id_producto FROM ventas;
GO

-- C.4  Lo mismo, con GROUP BY. Devuelve la misma lista.
SELECT id_cliente
FROM   ventas
GROUP BY id_cliente;
GO

-- D.1  Una comparacion simple
SELECT id_venta, cantidad, precio_unitario
FROM   ventas
WHERE  precio_unitario > 100;
GO

-- D.2  AND: se tienen que cumplir las dos condiciones
SELECT id_venta, id_cliente, cantidad, precio_unitario
FROM   ventas
WHERE  precio_unitario > 100 AND cantidad >= 2;
GO

-- D.3  OR: alcanza con que se cumpla una
SELECT id_venta, id_cliente
FROM   ventas
WHERE  id_cliente = 1 OR id_cliente = 5;
GO

-- D.4  IN: el mismo pedido, mucho mas legible
SELECT id_venta, id_cliente
FROM   ventas
WHERE  id_cliente IN (1, 3, 5);
GO

-- D.5  EL ERROR LOGICO: una venta no puede ser de dos clientes a la vez.
--      No falla. Devuelve CERO filas, que es peor.
SELECT id_venta
FROM   ventas
WHERE  id_cliente = 1 AND id_cliente = 5;
GO

-- D.6  EL ERROR DE SINTAXIS: usar en el WHERE un alias creado en el SELECT.
--      Invalid column name 'total_linea'.
SELECT id_venta, cantidad * precio_unitario AS total_linea
FROM   ventas
WHERE  total_linea > 500;
GO

-- D.7  La forma correcta: repetir la expresion completa
SELECT id_venta, cantidad * precio_unitario AS total_linea
FROM   ventas
WHERE  cantidad * precio_unitario > 500;
GO

-- E.1  Ordenar de mayor a menor
SELECT id_venta, precio_unitario
FROM   ventas
ORDER BY precio_unitario DESC;
GO

-- E.2  Por dos columnas: la segunda desempata a la primera
SELECT id_cliente, fecha_venta, cantidad
FROM   ventas
ORDER BY id_cliente ASC, fecha_venta DESC;
GO

-- E.3  El alias SI se puede usar en el ORDER BY
SELECT id_venta, cantidad * precio_unitario AS total_linea
FROM   ventas
ORDER BY total_linea DESC;
GO

-- E.4  TOP sin ORDER BY: devuelve 3 filas, pero cuales? Las que el motor quiera.
SELECT TOP 3 id_venta, precio_unitario
FROM   ventas;
GO

-- E.5  Ahora si: las 3 ventas de mayor precio unitario
SELECT TOP 3 id_venta, id_producto, precio_unitario
FROM   ventas
ORDER BY precio_unitario DESC;
GO

-- F.1  Cuantas ventas hay
SELECT COUNT(*) AS cantidad_de_ventas
FROM   ventas;
GO

-- F.2  COUNT(*) frente a COUNT(columna): la diferencia esta en los NULL
SELECT COUNT(*)          AS todas_las_filas,
       COUNT(id_cliente) AS filas_con_cliente
FROM   ventas;
GO

-- F.3  SUM y AVG
SELECT SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion_total,
       AVG(cantidad * precio_unitario) AS ticket_promedio
FROM   ventas;
GO

-- F.4  MIN, MAX, y la brecha entre los extremos
SELECT MIN(cantidad * precio_unitario) AS venta_mas_chica,
       MAX(cantidad * precio_unitario) AS venta_mas_grande,
       MAX(cantidad * precio_unitario) - MIN(cantidad * precio_unitario) AS brecha
FROM   ventas;
GO

-- F.5  Todas juntas: el resumen del negocio en una fila
SELECT COUNT(*)                        AS cantidad_de_ventas,
       SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion_total,
       AVG(cantidad * precio_unitario) AS ticket_promedio,
       MIN(cantidad * precio_unitario) AS venta_mas_chica,
       MAX(cantidad * precio_unitario) AS venta_mas_grande
FROM   ventas;
GO

-- F.6  EL ERROR QUE ABRE EL PROXIMO TEMA:
--      mezclar una columna suelta con una agregacion.
--      Column 'ventas.id_cliente' is invalid in the select list because it is
--      not contained in either an aggregate function or the GROUP BY clause.
SELECT id_cliente,
       SUM(cantidad * precio_unitario) AS total
FROM   ventas;
GO

-- G1.1  Ampliar el dataset a seis meses.
--       Repetible: primero borra lo que haya agregado antes.
DELETE FROM ventas WHERE id_venta > 10;
GO

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
    (11, 2, 2,  3,   28.00, '2024-01-12'),
    (12, 3, 6,  1,   95.00, '2024-01-18'),
    (13, 1, 4,  2,  120.00, '2024-01-25'),
    (14, 5, 2,  4,   28.00, '2024-01-30'),
    (15, 4, 3,  1,  450.00, '2024-02-05'),
    (16, 2, 5,  2,  130.00, '2024-02-09'),
    (17, 1, 6,  3,   95.00, '2024-02-14'),
    (18, 3, 4,  1,  120.00, '2024-02-20'),
    (19, 5, 2,  5,   28.00, '2024-02-27'),
    (20, 1, 1,  1, 1200.00, '2024-04-03'),
    (21, 3, 3,  2,  450.00, '2024-04-08'),
    (22, 2, 4,  3,  120.00, '2024-04-15'),
    (23, 5, 5,  2,  130.00, '2024-04-19'),
    (24, 4, 6,  2,   95.00, '2024-04-24'),
    (25, 1, 2,  6,   28.00, '2024-04-29'),
    (26, 2, 1,  2, 1200.00, '2024-05-06'),
    (27, 4, 3,  1,  450.00, '2024-05-11'),
    (28, 3, 5,  3,  130.00, '2024-05-17'),
    (29, 5, 4,  1,  120.00, '2024-05-23'),
    (30, 1, 6,  2,   95.00, '2024-05-28'),
    (31, 3, 1,  1, 1200.00, '2024-06-04'),
    (32, 2, 2, 10,   28.00, '2024-06-11'),
    (33, 4, 4,  2,  120.00, '2024-06-18'),
    (34, 5, 3,  1,  450.00, '2024-06-25');
GO

-- G1.2  Confirmar: 34 ventas repartidas en 6 meses
SELECT COUNT(*)                        AS ventas,
       COUNT(DISTINCT MONTH(fecha_venta)) AS meses,
       MIN(fecha_venta)                AS desde,
       MAX(fecha_venta)                AS hasta
FROM   ventas;
GO

-- G.1  La consulta del bloque F, mas UNA linea: GROUP BY
SELECT id_cliente,
       COUNT(*)                        AS pedidos,
       SUM(cantidad * precio_unitario) AS total_gastado
FROM   ventas
GROUP BY id_cliente
ORDER BY total_gastado DESC;
GO

-- G.2  Por producto: que se vende mas
SELECT id_producto,
       SUM(cantidad)                   AS unidades,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
GROUP BY id_producto
ORDER BY facturacion DESC;
GO

-- G.3  Por mes. Esta ES la Consulta 1 del entregable.
SELECT YEAR(fecha_venta)               AS anio,
       MONTH(fecha_venta)              AS mes,
       COUNT(*)                        AS pedidos,
       SUM(cantidad * precio_unitario) AS facturacion,
       AVG(cantidad * precio_unitario) AS ticket_promedio
FROM   ventas
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY anio, mes;
GO

-- G.4  Y el error de F.6, ahora resuelto
SELECT id_cliente,
       SUM(cantidad * precio_unitario) AS total
FROM   ventas
GROUP BY id_cliente;
GO

-- H.1  WHERE filtra filas: solo las ventas de mas de 200 pesos
SELECT id_cliente,
       COUNT(*)                        AS pedidos,
       SUM(cantidad * precio_unitario) AS total
FROM   ventas
WHERE  cantidad * precio_unitario > 200
GROUP BY id_cliente;
GO

-- H.2  HAVING filtra grupos: solo los clientes con mas de un pedido.
--      ES la Consulta 3 del entregable.
SELECT id_cliente,
       COUNT(*)                        AS pedidos,
       SUM(cantidad * precio_unitario) AS total_gastado
FROM   ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY pedidos DESC;
GO

-- H.3  Antes del CASE WHEN: ejecutar SOLO la subconsulta del medio,
--      para ver que devuelve un unico numero.
SELECT AVG(total_mes) AS promedio_mensual
FROM  (SELECT SUM(cantidad * precio_unitario) AS total_mes
       FROM   ventas
       GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)) t;
GO

-- H.4  CASE WHEN: etiquetar cada mes. ES la Consulta 4 del entregable.
SELECT YEAR(fecha_venta)               AS anio,
       MONTH(fecha_venta)              AS mes,
       SUM(cantidad * precio_unitario) AS facturacion,
       CASE WHEN SUM(cantidad * precio_unitario) >
                 (SELECT AVG(total_mes)
                  FROM  (SELECT SUM(cantidad * precio_unitario) AS total_mes
                         FROM   ventas
                         GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)) t)
            THEN 'Por encima'
            ELSE 'Por debajo'
       END                             AS comparativa
FROM   ventas
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY anio, mes;
GO

-- H.5  La consulta completa de la clase: SELECT, FROM, WHERE, GROUP BY,
--      HAVING y ORDER BY, todas juntas. Y TOP, para el ranking.
SELECT TOP 5 id_producto,
       SUM(cantidad)                   AS unidades,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
WHERE  fecha_venta >= '2024-01-01'
GROUP BY id_producto
HAVING SUM(cantidad) > 3
ORDER BY facturacion DESC;
GO

-- I.1  La unica que queda por armar: Consulta 2, el Top 5 de productos.
--      Es G.2 con TOP. Mostrar el esqueleto, NO resolverlo entero.
SELECT TOP 5 id_producto,
       SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
GROUP BY id_producto
ORDER BY facturacion DESC;
GO

-- RESTAURAR  ·  NO se ejecuta durante la clase: deja solo las 10 ventas
--              originales de la Semana 3 y borra las de G1.1.
--              Descomentar solo si hace falta volver al estado inicial.
-- DELETE FROM ventas WHERE id_venta > 10;
