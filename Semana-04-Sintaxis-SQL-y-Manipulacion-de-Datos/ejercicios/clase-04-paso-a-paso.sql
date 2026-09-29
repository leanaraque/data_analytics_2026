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

-- A.0  PONER LA BASE EN CONDICIONES
--      Borra todo y deja la base tal como termino la Semana 3.

IF DB_ID('Ventas_Tech_DB') IS NULL
    CREATE DATABASE Ventas_Tech_DB;
GO

USE Ventas_Tech_DB;
GO

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO

CREATE TABLE categorias (
    id_categoria     INT            NOT NULL,
    nombre_categoria NVARCHAR(50)   NOT NULL,
    descripcion      NVARCHAR(200)      NULL,
    CONSTRAINT PK_categorias PRIMARY KEY (id_categoria)
);

CREATE TABLE clientes (
    id_cliente       INT            NOT NULL,
    nombre           NVARCHAR(100)  NOT NULL,
    email            NVARCHAR(100)      NULL,
    ciudad           NVARCHAR(50)       NULL,
    fecha_registro   DATE           NOT NULL,
    CONSTRAINT PK_clientes       PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_clientes_email UNIQUE      (email)
);

CREATE TABLE productos (
    id_producto      INT            NOT NULL,
    nombre_producto  NVARCHAR(100)  NOT NULL,
    id_categoria     INT            NOT NULL,
    precio           DECIMAL(10,2)  NOT NULL,
    stock            INT            NOT NULL DEFAULT 0,
    activo           BIT            NOT NULL DEFAULT 1,
    CONSTRAINT PK_productos            PRIMARY KEY (id_producto),
    CONSTRAINT FK_productos_categorias FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria)
);

CREATE TABLE ventas (
    id_venta         INT            NOT NULL,
    id_cliente       INT            NOT NULL,
    id_producto      INT            NOT NULL,
    cantidad         INT            NOT NULL,
    precio_unitario  DECIMAL(10,2)  NOT NULL,
    fecha_venta      DATE           NOT NULL,
    CONSTRAINT PK_ventas           PRIMARY KEY (id_venta),
    CONSTRAINT FK_ventas_clientes  FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente),
    CONSTRAINT FK_ventas_productos FOREIGN KEY (id_producto)
        REFERENCES productos (id_producto)
);
GO

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
    (1, N'Computación',    N'Laptops, PCs y monitores'),
    (2, N'Accesorios',     N'Periféricos y complementos'),
    (3, N'Audio',          N'Auriculares y parlantes'),
    (4, N'Almacenamiento', N'Discos y memorias');

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
    (1, N'María López',  N'maria@mail.com',  N'Buenos Aires', '2024-01-05'),
    (2, N'Carlos Ruiz',  N'carlos@mail.com', N'Córdoba',      '2024-01-10'),
    (3, N'Ana Gómez',    N'ana@mail.com',    N'Rosario',      '2024-02-01'),
    (4, N'Pedro Sanz',   N'pedro@mail.com',  N'Mendoza',      '2024-02-15'),
    (5, N'Laura Torres', N'laura@mail.com',  N'Tucumán',      '2024-03-01');

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
    (1, N'Laptop Pro 15',      1, 1200.00, 15, 1),
    (2, N'Mouse Inalámbrico',  2,   28.00, 80, 1),
    (3, N'Monitor 4K 27"',     1,  450.00, 12, 1),
    (4, N'Auriculares BT Pro', 3,  120.00, 35, 1),
    (5, N'SSD Externo 1TB',    4,  130.00, 18, 1),
    (6, N'Teclado Mecánico',   2,   95.00, 40, 1);

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
    ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
    ( 2, 2, 2, 5,   28.00, '2024-03-06'),
    ( 3, 3, 3, 1,  450.00, '2024-03-07'),
    ( 4, 1, 4, 2,  120.00, '2024-03-08'),
    ( 5, 4, 5, 3,  130.00, '2024-03-10'),
    ( 6, 2, 6, 4,   95.00, '2024-03-11'),
    ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
    ( 8, 3, 2, 8,   28.00, '2024-03-13'),
    ( 9, 4, 4, 1,  120.00, '2024-03-14'),
    (10, 5, 3, 2,  450.00, '2024-03-15');
GO

-- A.1  Confirmar el punto de partida: 10 ventas, todas en marzo
SELECT COUNT(*)                            AS ventas,
       COUNT(DISTINCT MONTH(fecha_venta))  AS meses,
       MIN(fecha_venta)                    AS desde,
       MAX(fecha_venta)                    AS hasta
FROM   ventas;
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

-- I.1  La unica que queda por armar: Consulta 2, el Top 5 de productos.
--      Mostrar el esqueleto, NO resolverlo entero.
SELECT TOP 5 id_producto,
       SUM(cantidad)                   AS unidades_vendidas,
       SUM(cantidad * precio_unitario) AS facturacion
FROM   ventas
GROUP BY id_producto
ORDER BY facturacion DESC;
GO

-- RESTAURAR  ·  NO se ejecuta durante la clase.
--              Deja solo las 10 ventas de la Semana 3, sin tocar las tablas.
-- DELETE FROM ventas WHERE id_venta > 10;
