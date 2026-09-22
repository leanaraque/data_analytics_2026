/* =====================================================================
   CLASE 3 - Introduccion a SQL y Sublenguajes
   Todo el SQL que ejecutamos en clase, paso a paso y en el mismo orden.

   MOTOR: Microsoft SQL Server. Se ejecuta desde SSMS.

   COMO USARLO
     No ejecutes el archivo entero de una. Cada paso se selecciona con el
     mouse y se corre con F5, igual que en la clase.
     Cada bloque dice a que slide de la presentacion corresponde, con el
     formato [slide NN], para que puedas ubicarte en la grabacion.

     Algunos pasos FALLAN A PROPOSITO: estan ahi para que veas el mensaje
     de error real. Cuando es el caso, el comentario lo avisa.

   AL TERMINAR
     La base queda con 4 categorias, 5 clientes, 6 productos y 10 ventas.
     La version consolidada de todo esto, que es el modelo del Checkpoint M3,
     esta en el mismo directorio: ventas_tech_db.sql

   ARCHIVO GENERADO: no lo edites a mano.
   ===================================================================== */

/* =====================================================================
   BLOQUE A  ·  [slide 13]  ·  Preparar el terreno
   ---------------------------------------------------------------------
   Primero la herramienta, despues el SQL. Todavia no creamos tablas.
   ===================================================================== */

-- A.1  Crear la base de datos del proyecto.
--      Se crea solo si no existe, asi podemos repetirlo sin romper nada.
IF DB_ID('Ventas_Tech_DB') IS NULL
    CREATE DATABASE Ventas_Tech_DB;
GO

-- A.2  Pararse dentro de la base.
--      Sin este USE, todo lo que sigue se crearia en master.
USE Ventas_Tech_DB;
GO

-- A.3  El reflejo que conviene instalar hoy: saber siempre donde estoy parado.
SELECT DB_NAME() AS base_actual;
GO

/* =====================================================================
   BLOQUE B  ·  [slide 21]  ·  La primera tabla
   ---------------------------------------------------------------------
   Un borrador: solo columnas y tipos. Las claves llegan en el bloque D.
   ===================================================================== */

-- B.1  La tabla de categorias, en su version mas simple.
CREATE TABLE categorias (
    id_categoria     INT,
    nombre_categoria NVARCHAR(50),
    descripcion      NVARCHAR(200)
);
GO

-- B.2  EL ERROR MAS COMUN: falta la coma despues de INT.
--      Ejecutarlo para ver el mensaje real.
--      Incorrect syntax near 'nombre_categoria'.
CREATE TABLE categorias_mal (
    id_categoria     INT
    nombre_categoria NVARCHAR(50)
);
GO

/* =====================================================================
   BLOQUE C  ·  [slide 23]  ·  Practica: elegir los tipos
   ---------------------------------------------------------------------
   Mismas tablas del proyecto, todavia sin claves. Lo que se practica aca
   es una sola cosa: que tipo de dato le corresponde a cada columna.
   ===================================================================== */

-- C.1  Clientes: quien compra.
CREATE TABLE clientes (
    id_cliente     INT,            -- identificador: no se hacen cuentas con el
    nombre         NVARCHAR(100),  -- texto de longitud variable
    email          NVARCHAR(100),  -- texto; el limite lo da el formato, no el dato
    ciudad         NVARCHAR(50),
    fecha_registro DATE            -- fecha de verdad, para poder analizar por periodo
);
GO

-- C.2  Productos: que se vende.
CREATE TABLE productos (
    id_producto     INT,
    nombre_producto NVARCHAR(100),
    id_categoria    INT,           -- por ahora es un numero suelto; en el bloque D pasa a ser FK
    precio          DECIMAL(10,2), -- DECIMAL para dinero, nunca FLOAT
    stock           INT,
    activo          BIT            -- verdadero / falso
);
GO

/* =====================================================================
   BLOQUE D  ·  [slide 27]  ·  El modelo, ahora con claves
   ---------------------------------------------------------------------
   Rehacemos las mismas tablas agregandoles PK y FK, y sumamos ventas.
   Este es el modelo definitivo del proyecto.
   ===================================================================== */

-- D.1  Borrar los borradores. El orden importa: primero las que dependen
--      de otras. Todavia no hay FK, pero conviene acostumbrarse al orden.
DROP TABLE IF EXISTS categorias_mal;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO

-- D.2  categorias: la PK identifica cada fila de forma unica.
CREATE TABLE categorias (
    id_categoria     INT            NOT NULL,
    nombre_categoria NVARCHAR(50)   NOT NULL,
    descripcion      NVARCHAR(200)      NULL,
    CONSTRAINT PK_categorias PRIMARY KEY (id_categoria)
);
GO

-- D.3  clientes: PK, y ademas UNIQUE en el email.
--      Son dos restricciones distintas: la PK no admite repetidos ni vacios,
--      UNIQUE no admite repetidos pero si admite vacio.
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

-- D.4  productos: PK propia, y FK que la ata a categorias.
--      A partir de aca es imposible cargar un producto de una categoria
--      que no existe.
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

-- D.5  ventas: la tabla de hechos. Dos FK, porque cada venta necesita
--      un cliente que exista y un producto que exista.
--      Va ultima: necesita que las otras tres ya esten creadas.
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

-- D.6  Confirmar que las cuatro tablas estan y con sus restricciones.
SELECT t.name AS tabla, c.name AS restriccion, c.type_desc AS tipo
FROM sys.tables t
JOIN sys.objects c ON c.parent_object_id = t.object_id
WHERE c.type IN ('PK','UQ','F')
ORDER BY t.name, c.type_desc;
GO

/* =====================================================================
   BLOQUE E  ·  [slide 29]  ·  Romper las reglas a proposito
   ---------------------------------------------------------------------
   La demo que mas se recuerda. Usamos filas descartables con id 9xx, que
   no forman parte de los datos definitivos.
   ===================================================================== */

-- E.1  Un cliente nuevo. Funciona.
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES (901, N'Cliente de prueba', N'prueba@mail.com', N'La Plata', '2024-03-20');
GO

-- E.2  Otro cliente con el MISMO id. Falla.
--      Violation of PRIMARY KEY constraint 'PK_clientes'.
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES (901, N'Otro cliente', N'otro@mail.com', N'Salta', '2024-03-21');
GO

-- E.3  Otro id, pero el MISMO email. Falla por una restriccion distinta.
--      Violation of UNIQUE KEY constraint 'UQ_clientes_email'.
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES (902, N'Tercer cliente', N'prueba@mail.com', N'Jujuy', '2024-03-22');
GO

-- E.4  LA DEMO CENTRAL: una venta del cliente 555, que no existe. Falla.
--      conflicted with the FOREIGN KEY constraint "FK_ventas_clientes".
--      Esta es la respuesta a la pregunta del Excalidraw.
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES (901, 555, 1, 1, 100.00, '2024-03-20');
GO

-- E.5  Para la ultima demo necesitamos una venta que SI exista.
--      Cargamos lo minimo, respetando el orden de dependencias.
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion)
VALUES (901, N'Categoria de prueba', N'Se borra al final del bloque');

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES (901, N'Producto de prueba', 901, 100.00, 5, 1);

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES (901, 901, 901, 1, 100.00, '2024-03-20');
GO

-- E.6  Ahora si: borrar el cliente 901, que tiene una venta. Falla.
--      conflicted with the REFERENCE constraint "FK_ventas_clientes".
--      Es el mismo guardia, pero mirando para el otro lado.
DELETE FROM clientes WHERE id_cliente = 901;
GO

-- E.7  Limpieza. Para borrar hay que ir en el orden inverso: primero la
--      venta, que es la que depende de las demas.
DELETE FROM ventas     WHERE id_venta     = 901;
DELETE FROM productos  WHERE id_producto  = 901;
DELETE FROM categorias WHERE id_categoria = 901;
DELETE FROM clientes   WHERE id_cliente   = 901;
GO

-- E.8  Las cuatro tablas quedaron vacias otra vez.
SELECT 'categorias' AS tabla, COUNT(*) AS filas FROM categorias
UNION ALL SELECT 'clientes',  COUNT(*) FROM clientes
UNION ALL SELECT 'productos', COUNT(*) FROM productos
UNION ALL SELECT 'ventas',    COUNT(*) FROM ventas;
GO

/* =====================================================================
   BLOQUE F  ·  [slide 33]  ·  ALTER: cambiar sin perder nada
   ===================================================================== */

-- F.1  Agregar una columna a una tabla que ya existe.
ALTER TABLE clientes ADD telefono NVARCHAR(20);
GO

-- F.2  La tabla sigue siendo la misma; la columna nueva llega vacia.
SELECT * FROM clientes;
GO

-- F.3  Cambiar el tipo de una columna existente: ciudad pasa de 50 a 80.
ALTER TABLE clientes ALTER COLUMN ciudad NVARCHAR(80);
GO

-- F.4  Dejar la tabla como estaba: devolver ciudad a 50 y sacar telefono.
--      Un ALTER de demostracion se revierte, igual que en un entorno real
--      no se dejan columnas de prueba dando vueltas.
ALTER TABLE clientes ALTER COLUMN ciudad NVARCHAR(50);
ALTER TABLE clientes DROP COLUMN telefono;
GO

/* =====================================================================
   BLOQUE G  ·  [slide 34]  ·  DROP y el orden de las dependencias
   ===================================================================== */

-- G.1  Intentar borrar una tabla de la que dependen otras. Falla.
--      Could not drop object 'clientes' because it is referenced by a
--      FOREIGN KEY constraint.
DROP TABLE clientes;
GO

-- G.2  El orden correcto es el inverso al de creacion.
--      NO EJECUTAR EN CLASE: esto borra las cuatro tablas y habria que
--      rehacer el bloque D. Se muestra y se explica.
--      DROP TABLE ventas;
--      DROP TABLE productos;
--      DROP TABLE clientes;
--      DROP TABLE categorias;

/* =====================================================================
   BLOQUE H  ·  [slide 42]  ·  Cargar los datos
   ---------------------------------------------------------------------
   Mismo orden de siempre: primero lo que no depende de nadie.
   ===================================================================== */

-- H.1  categorias (4 filas)
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
    (1, N'Computación',    N'Laptops, PCs y monitores'),
    (2, N'Accesorios',     N'Periféricos y complementos'),
    (3, N'Audio',          N'Auriculares y parlantes'),
    (4, N'Almacenamiento', N'Discos y memorias');
GO

-- H.2  clientes (5 filas)
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
    (1, N'María López',  N'maria@mail.com',  N'Buenos Aires', '2024-01-05'),
    (2, N'Carlos Ruiz',  N'carlos@mail.com', N'Córdoba',      '2024-01-10'),
    (3, N'Ana Gómez',    N'ana@mail.com',    N'Rosario',      '2024-02-01'),
    (4, N'Pedro Sanz',   N'pedro@mail.com',  N'Mendoza',      '2024-02-15'),
    (5, N'Laura Torres', N'laura@mail.com',  N'Tucumán',      '2024-03-01');
GO

-- H.3  Un producto de la categoria 9, que no existe. Falla.
--      Es el mismo guardia del bloque E, ahora entre productos y categorias.
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES (7, N'Router WiFi 6', 9, 85.00, 25, 1);
GO

-- H.4  productos (6 filas), todas con categorias que si existen.
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
    (1, N'Laptop Pro 15',      1, 1200.00, 15, 1),
    (2, N'Mouse Inalámbrico',  2,   28.00, 80, 1),
    (3, N'Monitor 4K 27"',     1,  450.00, 12, 1),
    (4, N'Auriculares BT Pro', 3,  120.00, 35, 1),
    (5, N'SSD Externo 1TB',    4,  130.00, 18, 1),
    (6, N'Teclado Mecánico',   2,   95.00, 40, 1);
GO

-- H.5  ventas (10 filas). Va ultima, como siempre.
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

-- H.6  La base terminada: 4 categorias, 5 clientes, 6 productos, 10 ventas.
SELECT 'categorias' AS tabla, COUNT(*) AS filas FROM categorias
UNION ALL SELECT 'clientes',  COUNT(*) FROM clientes
UNION ALL SELECT 'productos', COUNT(*) FROM productos
UNION ALL SELECT 'ventas',    COUNT(*) FROM ventas;
GO

-- H.7  Mirar los datos.
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
GO

/* =====================================================================
   BLOQUE I  ·  [slide 42]  ·  UPDATE y DELETE
   ---------------------------------------------------------------------
   Se trabaja sobre una COPIA, para que el error sin WHERE se vea sin
   romper la base que acabamos de armar.
   ===================================================================== */

-- I.1  Una copia de productos para experimentar.
DROP TABLE IF EXISTS productos_copia;
SELECT * INTO productos_copia FROM productos;
GO

-- I.2  EL HABITO QUE SALVA CARRERAS: antes de tocar nada, un SELECT con el
--      mismo WHERE, para ver a cuantas filas le va a pegar. Tiene que dar 1.
SELECT * FROM productos_copia WHERE id_producto = 5;
GO

-- I.3  Recien ahora el UPDATE. Mirar el mensaje: (1 row affected).
UPDATE productos_copia SET precio = 149.99 WHERE id_producto = 5;
GO

-- I.4  EL ERROR CARO: el mismo UPDATE sin WHERE. (6 rows affected).
--      No pregunta, no avisa y no se deshace.
UPDATE productos_copia SET precio = 149.99;
GO

-- I.5  El desastre, a la vista.
SELECT id_producto, nombre_producto, precio FROM productos_copia;
GO

-- I.6  DELETE con WHERE: se va una fila, la tabla queda.
DELETE FROM productos_copia WHERE id_producto = 6;
SELECT COUNT(*) AS filas_que_quedan FROM productos_copia;
GO

-- I.7  DELETE sin WHERE: se van todas las filas, la tabla SIGUE EXISTIENDO.
DELETE FROM productos_copia;
SELECT COUNT(*) AS filas_que_quedan FROM productos_copia;
GO

-- I.8  Y como la tabla existe, se puede volver a llenar.
INSERT INTO productos_copia (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES (1, N'Volvi a existir', 1, 10.00, 1, 1);
SELECT * FROM productos_copia;
GO

-- I.9  DROP: ahora si desaparece la tabla entera, estructura y datos.
DROP TABLE productos_copia;
GO

-- I.10  Y si la consulto, ya no existe: Invalid object name 'productos_copia'.
SELECT * FROM productos_copia;
GO

/* =====================================================================
   BLOQUE J  ·  [slide 46]  ·  DCL: quien puede hacer que
   ---------------------------------------------------------------------
   NO SE EJECUTA. En una instalacion local son administradores de todo, asi
   que no verian ninguna diferencia. Lo que importa es reconocer los
   comandos cuando aparezcan.
   ===================================================================== */

--      -- Dar y quitar un permiso suelto
--      GRANT  SELECT ON ventas TO usuario_analista;
--      REVOKE SELECT ON ventas FROM usuario_analista;
--
--      -- El flujo profesional: crear el rol, cargarlo y asignarlo
--      CREATE ROLE rol_analista;
--      GRANT SELECT ON ventas    TO rol_analista;
--      GRANT SELECT ON productos TO rol_analista;
--      GRANT SELECT ON clientes  TO rol_analista;
--      ALTER ROLE rol_analista ADD MEMBER maria_lopez;

/* =====================================================================
   CIERRE  ·  [slide 52]  ·  De la clase al entregable
   ---------------------------------------------------------------------
   Todo lo que hicimos hoy, junto y ordenado, es exactamente el script del
   Checkpoint M3: DROP en orden inverso, CREATE de las cuatro tablas con
   sus claves, e INSERT de los datos.

   La version consolidada esta en el repositorio publico:
       Semana-03/ejercicios/ventas_tech_db.sql

   Y este mismo guion paso a paso, sin las notas del docente, en:
       Semana-03/ejercicios/clase-03-paso-a-paso.sql
   ===================================================================== */

-- Verificacion final: 4 categorias, 5 clientes, 6 productos, 10 ventas.
SELECT 'categorias' AS tabla, COUNT(*) AS filas FROM categorias
UNION ALL SELECT 'clientes',  COUNT(*) FROM clientes
UNION ALL SELECT 'productos', COUNT(*) FROM productos
UNION ALL SELECT 'ventas',    COUNT(*) FROM ventas;
GO
