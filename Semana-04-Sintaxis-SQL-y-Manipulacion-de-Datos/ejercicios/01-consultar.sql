/* =====================================================================
   CLASE 4 - Sintaxis SQL y manipulacion de datos
   CONSULTAR  ·  SELECT, alias y DISTINCT
   ---------------------------------------------------------------------
   Elegir columnas, calcular una columna que no existe en la tabla,
   ponerle nombre con AS y sacar los valores repetidos.
   El paso B.4 NO da error a proposito: devuelve una columna de menos.

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

-- B.1  Ver que hay en la tabla. Para explorar, el asterisco sirve.
SELECT * FROM ventas;
GO

-- B.2  Solo las columnas que interesan, y una que NO existe en la tabla:
--      el motor la calcula al vuelo.
SELECT id_venta,
       fecha_venta,
       cantidad,
       precio_unitario,
       cantidad * precio_unitario
FROM   ventas;
GO

-- B.3  Alias: ponerle nombre a todo, sobre todo a la columna calculada
SELECT id_venta                   AS venta,
       fecha_venta                AS fecha,
       cantidad                   AS unidades,
       cantidad * precio_unitario AS total_linea
FROM   ventas;
GO

-- B.4  EL ERROR SILENCIOSO: falta la coma entre las dos columnas.
--      No da error. Devuelve UNA columna, no dos.
SELECT id_venta cantidad
FROM   ventas;
GO

-- C.1  Quienes compraron? Asi NO se responde: hay repetidos.
SELECT id_cliente FROM ventas;
GO

-- C.2  Asi si
SELECT DISTINCT id_cliente FROM ventas;
GO
