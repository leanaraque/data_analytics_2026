/* =====================================================================
   Ventas_Tech_DB  ·  Semana 3 - Introduccion a SQL y Sublenguajes
   Back-end del proyecto: DDL + restricciones de integridad + DML
   Cadena de tiendas de tecnologia "TechStore"

   MOTOR: Microsoft SQL Server (2016 o superior). Se ejecuta desde SSMS.
          Al final del archivo hay una nota sobre otros motores.

   Script REPETIBLE: se puede ejecutar todas las veces que haga falta.
   Modelo:  categorias (1)-(N) productos (1)-(N) ventas (N)-(1) clientes

   COMO EJECUTARLO
     1. Abrir el archivo en SSMS.
     2. Ejecutar todo con F5.
     3. Al final tienen que aparecer cuatro grillas de resultados.

   El script usa separadores GO. GO no es T-SQL: lo interpreta el cliente.
   Ejecutalo desde SSMS o Azure Data Studio.
   ===================================================================== */

-- ---------------------------------------------------------------------
-- 0) LA BASE DE DATOS
--    Se crea solo si no existe, asi el script no pisa nada al repetirlo.
-- ---------------------------------------------------------------------
IF DB_ID('Ventas_Tech_DB') IS NULL
    CREATE DATABASE Ventas_Tech_DB;
GO

-- Sin este USE, las tablas se crearian en master. Es el error mas comun.
USE Ventas_Tech_DB;
GO

-- ---------------------------------------------------------------------
-- 1) DROP TABLES  (orden inverso a las dependencias / foreign keys)
--    Primero las que tienen FK, al final las que no dependen de nadie.
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO

-- ---------------------------------------------------------------------
-- 2) CREATE TABLES  (primero las dimensiones, al final los hechos)
--    Las restricciones llevan nombre propio: cuando una falla, el mensaje
--    de error dice cual fue, en vez de un codigo generado al azar.
-- ---------------------------------------------------------------------
CREATE TABLE categorias (
    id_categoria     INT            NOT NULL,
    nombre_categoria NVARCHAR(50)   NOT NULL,
    descripcion      NVARCHAR(200)      NULL,
    CONSTRAINT PK_categorias PRIMARY KEY (id_categoria)
);
GO

CREATE TABLE clientes (
    id_cliente       INT            NOT NULL,
    nombre           NVARCHAR(100)  NOT NULL,
    email            NVARCHAR(100)      NULL,
    ciudad           NVARCHAR(50)       NULL,
    fecha_registro   DATE           NOT NULL,
    CONSTRAINT PK_clientes       PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_clientes_email UNIQUE      (email)
);
GO

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
GO

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

-- ---------------------------------------------------------------------
-- 3) INSERT DATA  (respetando el orden de dependencias)
--    Se nombran las columnas: si manana la tabla suma una columna, estos
--    INSERT siguen funcionando igual.
--    El prefijo N delante de cada texto lo marca como Unicode, y es lo que
--    hace que las tildes y las enies se guarden bien.
-- ---------------------------------------------------------------------

-- categorias (4 registros)
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
    (1, N'Computación',    N'Laptops, PCs y monitores'),
    (2, N'Accesorios',     N'Periféricos y complementos'),
    (3, N'Audio',          N'Auriculares y parlantes'),
    (4, N'Almacenamiento', N'Discos y memorias');
GO

-- clientes (5 registros)
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
    (1, N'María López',  N'maria@mail.com',  N'Buenos Aires', '2024-01-05'),
    (2, N'Carlos Ruiz',  N'carlos@mail.com', N'Córdoba',      '2024-01-10'),
    (3, N'Ana Gómez',    N'ana@mail.com',    N'Rosario',      '2024-02-01'),
    (4, N'Pedro Sanz',   N'pedro@mail.com',  N'Mendoza',      '2024-02-15'),
    (5, N'Laura Torres', N'laura@mail.com',  N'Tucumán',      '2024-03-01');
GO

-- productos (6 registros)
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
    (1, N'Laptop Pro 15',      1, 1200.00, 15, 1),
    (2, N'Mouse Inalámbrico',  2,   28.00, 80, 1),
    (3, N'Monitor 4K 27"',     1,  450.00, 12, 1),
    (4, N'Auriculares BT Pro', 3,  120.00, 35, 1),
    (5, N'SSD Externo 1TB',    4,  130.00, 18, 1),
    (6, N'Teclado Mecánico',   2,   95.00, 40, 1);
GO

-- ventas (10 registros)
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

-- ---------------------------------------------------------------------
-- 4) VALIDACION  (confirmar que cada tabla se cargo correctamente)
--    Tienen que salir 4 categorias, 5 clientes, 6 productos y 10 ventas.
--    SELECT es el tema de la Semana 4; por ahora alcanza con mirar.
-- ---------------------------------------------------------------------
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
GO

/* ---------------------------------------------------------------------
   NOTA SOBRE OTROS MOTORES

   Este script esta escrito para SQL Server, que es el motor del curso.
   Para llevarlo a otro motor hay que tocar cuatro cosas:

     activo BIT         ->  MySQL: TINYINT(1)     PostgreSQL: BOOLEAN
     NVARCHAR(n)        ->  MySQL: VARCHAR(n)     PostgreSQL: VARCHAR(n)
     el prefijo N'...'  ->  no existe: va '...' a secas
     GO                 ->  no existe: se borra

   En MySQL y en PostgreSQL, ademas, CREATE DATABASE y USE se manejan
   distinto. Por eso el script no intenta servir a los tres a la vez:
   uno que corre bien en un motor ensena mas que uno que no corre en ninguno.
   --------------------------------------------------------------------- */
