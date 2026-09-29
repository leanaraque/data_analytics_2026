/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   ENTREGABLE M4  ·  el punto de partida
   ---------------------------------------------------------------------
   El esqueleto de la Consulta 2, la unica que queda por armar.
   Las otras tres estan resueltas en 04-agrupar.sql:
     Consulta 1 -> paso G.2      Consulta 3 -> paso H.1
     Consulta 4 -> paso H.3

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

-- I.1  La unica que queda por armar: Consulta 2, el Top 5 de productos.
--      Mostrar el esqueleto, NO resolverlo entero.
SELECT TOP 5 id_producto,
       SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
GROUP BY id_producto
ORDER BY facturacion DESC;
GO
