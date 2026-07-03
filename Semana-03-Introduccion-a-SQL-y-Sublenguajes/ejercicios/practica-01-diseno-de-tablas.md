# 🛠️ Práctica 1 — Diseño de tablas con `CREATE TABLE`

> Práctica guiada **(no evaluable)** de la unidad *Diseño de esquemas con DDL*.

## Propósito
Pasar de la teoría a la práctica técnica **diseñando las estructuras** donde se almacenarán los datos de un negocio de ventas. Es el primer paso para construir una base de datos robusta.

## Contexto
Tu tarea es crear la **estructura** (las tablas) de un nuevo sistema de gestión de ventas. No necesitás saber consultar datos todavía: las consultas (`SELECT`) las vas a ver en el próximo módulo. Acá solo vas a **definir las tablas** con `CREATE TABLE`.

## Instrucciones paso a paso
1. **Analizá los datos:** revisá mentalmente qué información necesita un "Cliente" (nombre, email, fecha de registro) y un "Producto" (nombre, precio, stock).
2. **Creá el archivo:** en tu repositorio de prácticas, creá un archivo llamado `modulo2_unidad1_diseno.sql`.
3. **Definí la tabla de clientes** con `CREATE TABLE clientes`:
   - `id_cliente` → número entero.
   - `nombre` → texto de hasta 100 caracteres.
   - `perfil_bio` → texto largo para una breve biografía o notas.
   - `fecha_registro` → solo fecha.
4. **Definí la tabla de productos** con `CREATE TABLE productos`:
   - `id_producto` → número entero.
   - `descripcion` → texto de hasta 255 caracteres.
   - `precio` → decimal que soporte hasta 10 dígitos y 2 decimales.
   - `esta_activo` → ¿podrías usar un número pequeño o texto para representar si el producto está a la venta?
5. **Documentá:** agregá comentarios en tu script (usando `--`) explicando por qué elegiste cada tipo de dato.

## Solución de referencia
```sql
-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente     INT,             -- entero: es un identificador, no se hacen cálculos con él
    nombre         VARCHAR(100),    -- texto de longitud variable, suficiente para un nombre
    perfil_bio     TEXT,            -- texto largo para notas o biografía
    fecha_registro DATE             -- solo fecha, para poder analizar por periodo más adelante
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT,                -- entero: identificador del producto
    descripcion VARCHAR(255),       -- texto de hasta 255 caracteres
    precio      DECIMAL(10, 2),     -- DECIMAL para dinero (nunca FLOAT): 10 dígitos, 2 decimales
    esta_activo BOOLEAN             -- verdadero/falso para indicar si está a la venta
);
```

## Criterios de aceptación
- El script se ejecuta **sin errores de sintaxis** en PostgreSQL o SQL Server.
- Se usa `DECIMAL` / `NUMERIC` para el precio (**no `FLOAT`** para dinero).
- Los nombres de columnas **no** contienen espacios ni caracteres especiales.
- El repositorio queda organizado con el nuevo archivo `.sql`.

## ⚠️ Error común a evitar
No olvides las **comas** (`,`) al final de cada definición de columna, **excepto en la última** antes de cerrar el paréntesis. Si olvidás una coma, SQL no entenderá dónde termina un campo y empieza el otro.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 3</a> · <a href="./practica-02-ventas-tech-db.md">Práctica 2: Ventas_Tech_DB ➡️</a>
</p>
