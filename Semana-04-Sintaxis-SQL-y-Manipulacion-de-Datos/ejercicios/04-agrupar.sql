/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   AGRUPAR  ·  GROUP BY, HAVING y CASE WHEN
   ---------------------------------------------------------------------
   La misma metrica, calculada por grupo. De aca salen tres de las
   cuatro consultas del entregable.
   EMPEZA POR G1.1: amplia el dataset a 34 ventas en seis meses. Sin
   eso el analisis mensual devuelve una sola fila.

   MOTOR: Microsoft SQL Server. Se ejecuta desde SSMS.
   ANTES: ejecuta 00-preparar-base.sql al menos una vez.

   COMO USARLO
     No ejecutes el archivo entero de una. Cada paso se selecciona con
     el mouse y se corre con F5, igual que en la clase.

   EL ORDEN DE LOS ARCHIVOS
     00 > 01 > 02 > 03 > 04 > 05

   ARCHIVO GENERADO: no lo edites a mano.
   ===================================================================== */

USE Ventas_Tech_DB;
GO

-- G1.1  Ampliar el dataset a seis meses. De paso, repaso del INSERT.
--       Repetible: primero borra lo que haya agregado antes.
DELETE FROM ventas WHERE id_venta > 10;

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

-- Confirmar: 34 ventas en 6 meses
SELECT COUNT(*) AS ventas, COUNT(DISTINCT MONTH(fecha_venta)) AS meses
FROM   ventas;
GO

-- G.1  La consulta del bloque F, mas UNA linea
SELECT id_cliente,
       COUNT(*)      AS pedidos,
       SUM(cantidad * precio_unitario) AS total_gastado
FROM   ventas
GROUP BY id_cliente
ORDER BY total_gastado DESC;
GO

-- G.2  Por mes. ES la Consulta 1 del entregable.
SELECT YEAR(fecha_venta)   AS anio,
       MONTH(fecha_venta)  AS mes,
       COUNT(*)            AS pedidos,
       SUM(cantidad * precio_unitario) AS facturacion,
       AVG(cantidad * precio_unitario) AS ticket_promedio
FROM   ventas
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY anio, mes;
GO

-- H.1  HAVING filtra grupos. ES la Consulta 3 del entregable.
SELECT id_cliente,
       COUNT(*)      AS pedidos,
       SUM(cantidad * precio_unitario) AS total_gastado
FROM   ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY pedidos DESC;
GO

-- H.2  Antes del CASE WHEN: ejecutar SOLO la subconsulta,
--      para ver que devuelve un unico numero.
SELECT AVG(total_mes) AS promedio_mensual
FROM  (SELECT SUM(cantidad * precio_unitario) AS total_mes
       FROM   ventas
       GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)) t;
GO

-- H.3  CASE WHEN. ES la Consulta 4 del entregable.
SELECT YEAR(fecha_venta)   AS anio,
       MONTH(fecha_venta)  AS mes,
       SUM(cantidad * precio_unitario) AS facturacion,
       CASE WHEN SUM(cantidad * precio_unitario) >
                 (SELECT AVG(total_mes)
                  FROM  (SELECT SUM(cantidad * precio_unitario) AS total_mes
                         FROM   ventas
                         GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)) t)
            THEN 'Por encima'
            ELSE 'Por debajo'
       END                 AS comparativa
FROM   ventas
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY anio, mes;
GO

-- H.4  CIERRE: las seis clausulas de la clase, en una sola consulta.
SELECT TOP 5 id_producto,
       SUM(cantidad)                   AS unidades,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
WHERE  fecha_venta >= '2024-01-01'
GROUP BY id_producto
HAVING SUM(cantidad) > 3
ORDER BY facturacion DESC;
GO
