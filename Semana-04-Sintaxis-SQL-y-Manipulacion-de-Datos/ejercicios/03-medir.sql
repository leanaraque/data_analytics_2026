/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   MEDIR  ·  COUNT, SUM, AVG, MIN y MAX
   ---------------------------------------------------------------------
   De muchas filas a un solo numero: las metricas del negocio.
   El paso F.4 falla a proposito, y el mensaje del motor nombra la
   solucion, que es el GROUP BY del archivo siguiente.

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

-- F.1  Cuantas ventas hay
SELECT COUNT(*) AS cantidad_de_ventas
FROM   ventas;
GO

-- F.2  SUM y AVG sobre la columna calculada
SELECT SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion_total,
       AVG(cantidad * precio_unitario) AS ticket_promedio
FROM   ventas;
GO

-- F.3  Las cinco juntas: el resumen del negocio en una sola fila
SELECT COUNT(*)                        AS cantidad_de_ventas,
       SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion_total,
       AVG(cantidad * precio_unitario) AS ticket_promedio,
       MIN(cantidad * precio_unitario) AS venta_mas_chica,
       MAX(cantidad * precio_unitario) AS venta_mas_grande
FROM   ventas;
GO

-- F.4  EL ERROR QUE ABRE EL PROXIMO TEMA:
--      mezclar una columna suelta con una agregacion.
--      Column 'ventas.id_cliente' is invalid in the select list because it is
--      not contained in either an aggregate function or the GROUP BY clause.
SELECT id_cliente,
       SUM(cantidad * precio_unitario) AS total
FROM   ventas;
GO
