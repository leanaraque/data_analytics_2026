# 2. Diseño de esquemas con DDL y tipos de datos

> Ya entendés qué es SQL y para qué sirve. Ahora aprendés a crear las estructuras que después vas a consultar.

Imaginá que construís la casa de tus sueños. No empezarías comprando ladrillos al azar: primero contratás a un arquitecto para que diseñe un **plano**. En el mundo de los datos, ese plano se llama **Esquema de Base de Datos**, y los "materiales de construcción" que definen cada columna son los **Tipos de Datos**.

Vas a dar el salto de "consumidor" a "arquitecto" usando el lenguaje **DDL (Data Definition Language)** para crear las estructuras donde vive la información.

## 1. ¿Qué es un esquema y por qué importa?
Un **esquema** es la estructura lógica que define cómo se organizan los datos. **No contiene los datos reales** (como "Juan" o "10.50"): define que *"debe haber una columna llamada Nombre que acepte texto"* y *"una columna Precio que acepte números"*.

### Los tres niveles del diseño
1. **Conceptual:** definimos *qué* necesitamos → *"Necesito guardar Clientes y sus Compras"*.
2. **Lógico:** definimos las tablas y cómo se relacionan → *"Clientes se conecta con Ventas por un ID"*.
3. **Físico:** entra el SQL. Decidimos el tipo de dato técnico de cada columna y ejecutamos los comandos para crear las tablas.

## 2. Tipos de datos: las reglas del contenido
Elegir el tipo correcto es vital por dos razones:
- **Integridad:** evita que alguien guarde un nombre en una columna de "Fecha de Nacimiento".
- **Eficiencia:** ahorra espacio y hace que tus consultas sean mucho más rápidas.

> Pensalo como **cajas de mudanza**: no pondrías una vajilla de cristal en una caja gigante sin protección, ni un refrigerador en una caja de zapatos. Cada dato necesita su "caja" adecuada.

### Los tipos esenciales para Data Analytics

**A. Numéricos**
- `INT` / `INTEGER`: números enteros sin decimales → edad, ID de producto, unidades vendidas.
- `DECIMAL` / `NUMERIC`: números con decimales exactos. **Estándar para dinero** → precios, impuestos, salarios.
- `FLOAT` / `REAL`: decimales para medidas científicas donde la precisión absoluta no es tan crítica como el rango.

**B. Texto (cadenas)**
- `VARCHAR(n)`: el más usado. "VAR" = variable, "CHAR" = caracteres; `(n)` = máximo de letras → `VARCHAR(100)` para un nombre. Si el nombre tiene 10 letras, solo usa 10, no 100.
- `TEXT`: para bloques de texto muy largos (descripciones, reseñas).

**C. Fecha y tiempo**
- `DATE`: solo la fecha (Año-Mes-Día) → `2026-05-15`. Ideal para fechas de nacimiento o de pedido.
- `TIMESTAMP` / `DATETIME`: fecha y hora exacta → `2026-05-15 14:30:05`. Crucial para registrar cuándo se procesó un pago.

## 3. Introducción a DDL: el comando `CREATE TABLE`
El **DDL** se encarga de definir, modificar y eliminar las estructuras. El comando rey es `CREATE TABLE`.

### Anatomía de una sentencia `CREATE TABLE`
```sql
CREATE TABLE nombre_de_la_tabla (
    nombre_columna_1 tipo_de_dato,
    nombre_columna_2 tipo_de_dato,
    ...
);
```

### Ejemplo del mundo real: tabla de productos
```sql
CREATE TABLE productos (
    id_producto INT,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10, 2),
    fecha_ingreso DATE
);
```

**Desglose:**
- `id_producto INT` → identificador numérico entero.
- `nombre_producto VARCHAR(100)` → texto de hasta 100 caracteres.
- `precio DECIMAL(10, 2)` → hasta 10 dígitos en total, 2 después del punto decimal (ideal para `1450.99`).
- `fecha_ingreso DATE` → cuándo llegó el producto al inventario.

## 4. Errores comunes y mejores prácticas

**Error 1 — "Poner todo como `VARCHAR(MAX)` o `TEXT`".** Por miedo a quedarse cortos, algunos asignan el máximo a todo.
- *Problema:* consume memoria innecesaria y ralentiza las búsquedas.
- *Mejor práctica:* analizá tus datos. ¿Un código de país necesita 500 caracteres? No, `VARCHAR(3)` alcanza.

**Error 2 — "Confundir tipos numéricos y de texto para IDs".** A veces teléfonos o códigos postales se guardan como `INT`.
- *Problema:* no vas a sumar teléfonos ni promediar códigos postales. Y si un código postal empieza con cero (`08001`), guardado como `INT` pierde el cero (`8001`).
- *Mejor práctica:* si no vas a hacer operaciones matemáticas con el número, guardalo como `VARCHAR`.

**Error 3 — No planificar para el análisis futuro.** Si guardás una fecha como texto (`VARCHAR`), al llevarla a Power BI para un reporte de "Ventas por Mes", la herramienta no entenderá que es una fecha.
- *Mejor práctica:* usá siempre `DATE` o `TIMESTAMP` para datos cronológicos.

## 5. Aplicaciones en la industria
En empresas como Amazon o Mercado Libre, el diseño de esquemas es la base de todo. Un analista de Retail usa estos esquemas para asegurar que la "Tabla de Ventas" sea compatible con la "Tabla de Inventario". Si una usa `id_producto` como texto y la otra como número, los reportes fallarán al cruzarlos (error de *"Type Mismatch"*).

## Resumen
- El **esquema** es el plano arquitectónico de tus datos.
- **DDL** es el lenguaje para construir (`CREATE`) o modificar ese plano.
- Los **tipos de datos** definen qué entra en cada columna: `INT` para conteos, `DECIMAL` para dinero, `VARCHAR` para nombres/descripciones, `DATE` para momentos en el tiempo.
- Un diseño correcto desde el inicio te ahorra **horas** de limpieza en Power BI o Python.

> **¿Qué sigue?** En la próxima unidad ponés "candados" a estas tablas (**Primary Keys** y **Foreign Keys**) para asegurar que la información sea siempre coherente.

> 🛠️ **Practicá:** [Práctica 1 — Diseño de tablas con `CREATE TABLE`](../ejercicios/practica-01-diseno-de-tablas.md)

---
<p align="center">
<a href="./01-introduccion-a-sql.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="./03-restricciones-de-integridad-pk-fk.md">Siguiente ➡️</a>
</p>
