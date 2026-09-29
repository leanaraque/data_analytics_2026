/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   FILTRAR Y ORDENAR  ·  WHERE, ORDER BY y TOP
   ---------------------------------------------------------------------
   Elegir que filas se quedan, y en que orden salen.
   Tres pasos muestran problemas reales: D.4 devuelve cero filas sin
   fallar, D.5 si falla, y E.2 devuelve filas al azar.

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

-- D.1  Una comparacion simple
SELECT id_venta, cantidad, precio_unitario
FROM   ventas
WHERE  precio_unitario > 100;
GO

-- D.2  AND achica el resultado; OR lo agranda
SELECT id_venta, id_cliente, cantidad, precio_unitario
FROM   ventas
WHERE  precio_unitario > 100 AND cantidad >= 2;
GO

-- D.3  IN: el mismo pedido que una cadena de OR, mucho mas legible
SELECT id_venta, id_cliente
FROM   ventas
WHERE  id_cliente IN (1, 3, 5);
GO

-- D.4  EL ERROR LOGICO: una venta no puede ser de dos clientes a la vez.
--      No falla. Devuelve CERO filas, que es peor.
SELECT id_venta
FROM   ventas
WHERE  id_cliente = 1 AND id_cliente = 5;
GO

-- D.5  EL ERROR DE SINTAXIS: un alias del SELECT usado en el WHERE.
--      Invalid column name 'total_linea'.
--      La forma correcta es repetir la expresion completa:
--      WHERE cantidad * precio_unitario > 500
SELECT id_venta, cantidad * precio_unitario AS total_linea
FROM   ventas
WHERE  total_linea > 500;
GO

-- E.1  Ordenar de mayor a menor. El alias SI se puede usar aca.
SELECT id_venta, cantidad * precio_unitario AS total_linea
FROM   ventas
ORDER BY total_linea DESC;
GO

-- E.2  TOP sin ORDER BY: devuelve 3 filas, pero cuales? Las que el motor quiera.
SELECT TOP 3 id_venta, precio_unitario
FROM   ventas;
GO

-- E.3  Ahora si: las 3 ventas de mayor precio unitario
SELECT TOP 3 id_venta, id_producto, precio_unitario
FROM   ventas
ORDER BY precio_unitario DESC;
GO
