# 5. Introducción a las Bases de Datos Relacionales y PostgreSQL

> Cerrás el bloque de Fundamentos con la herramienta que vas a usar en los próximos tres módulos de SQL.

Imaginá que trabajás para una gran tienda online: millones de ventas, miles de clientes y un inventario que cambia cada segundo. Gestionar esto en archivos de texto o carpetas desordenadas sería un caos. Necesitás una estructura robusta, segura y rápida: las **Bases de Datos Relacionales**. En esta unidad usamos **PostgreSQL**, uno de los sistemas más potentes y respetados de la industria.

## 1. ¿Qué es una base de datos relacional?
Una **base de datos** es un contenedor lógico donde almacenamos información de manera estructurada. En el análisis de datos profesional, las **Relacionales (RDBMS)** son las reinas. Su nombre viene del **Modelo Relacional**, que organiza la información en **tablas que se conectan entre sí** mediante identificadores comunes.

### La analogía del Excel (con esteroides)
Una tabla en SQL es muy similar a una hoja de cálculo:
- Tiene **columnas** (que definen qué tipo de dato guardamos, como "Nombre" o "Precio").
- Tiene **filas** (los registros individuales, como "Juan Pérez" o "Laptop Dell").

**¿Por qué usar SQL y no quedarnos en Excel?** Excel es fantástico para análisis rápidos, pero se vuelve lento con millones de filas, es difícil de compartir entre muchos usuarios y no garantiza la integridad de los datos. SQL —y en particular PostgreSQL— resuelve todo esto, permitiendo gestionar volúmenes masivos con precisión quirúrgica.

## 2. Componentes fundamentales de una tabla

**A. Columnas (campos):** las características o atributos de lo que guardamos. En una tabla `Clientes`: `id_cliente`, `nombre`, `apellido`, `email`, `fecha_registro`. Cada columna tiene un **tipo de dato** fijo.

**B. Filas (registros):** una instancia específica de los datos (ej. la información completa de "María García"). Una tabla puede tener desde cero hasta billones de filas.

**C. Clave Primaria (Primary Key):** el concepto más importante para mantener el orden. Una **PK** es una columna (o conjunto) cuyo valor **identifica de forma única** a cada fila.
> **Ejemplo:** en un país, el DNI o Cédula es tu clave primaria: no puede haber dos personas con el mismo número, y todos deben tener uno. En SQL solemos usar un ID numérico (`id_producto`, `id_venta`) como PK.

**D. Valores Nulos (NULL):** a veces falta información (un cliente no dio su teléfono). En SQL representamos esa ausencia con `NULL`.
> ⚠️ **Error común:** `NULL` **no** es lo mismo que un cero (`0`) ni que un texto vacío (`''`).
> - `0` es un valor numérico (*tengo 0 dólares*).
> - `NULL` significa "desconocido" (*no sé cuántos dólares tengo*).

## 3. Tipos de datos en PostgreSQL
Debemos decirle a la base qué tipo de información guarda cada columna. PostgreSQL es muy estricto con esto, lo que ayuda a evitar errores de limpieza más adelante.

| Tipo | Para qué | Ejemplo |
|------|----------|---------|
| `INT` / `INTEGER` | Números enteros | cantidad de productos, edad |
| `DECIMAL` / `NUMERIC` | Números con decimales precisos | precios, salarios |
| `VARCHAR(n)` | Texto de longitud variable (máx. `n` caracteres) | `VARCHAR(100)` para un nombre |
| `BOOLEAN` | Valores lógicos | Verdadero / Falso |
| `DATE` / `TIMESTAMP` | Fechas y horas | `2026-05-15` o `2026-05-15 14:30:00` |

## 4. Introducción a PostgreSQL
**¿Por qué PostgreSQL?** Es **código abierto, gratuito y extremadamente robusto**. Es el estándar de oro para ciencia de datos porque maneja no solo tablas simples, sino también datos geográficos, JSON y análisis estadísticos avanzados.

### Sentencias DDL y DML: las dos caras de SQL
- **DDL (Data Definition Language):** define la **estructura**. Comandos como `CREATE TABLE` fabrican la "caja" donde irán los datos.
- **DML (Data Manipulation Language):** gestiona el **contenido**. `INSERT` (agregar), `SELECT` (ver) y `UPDATE` (modificar).

## 5. Aplicación del mundo real: el esquema de una tienda online
Diseñemos la base para "TechStore 2026". Para evitar que los datos se repitan, aplicamos **normalización** y separamos la info en tablas relacionadas.

**Tabla `Categorias`**

| id_categoria (PK) | nombre |
|-------------------|--------|
| 1 | Laptops |
| 2 | Smartphones |

**Tabla `Productos`**

| id_producto (PK) | nombre | precio | id_categoria (FK) |
|------------------|--------|--------|-------------------|
| 101 | MacBook Pro | 2500.00 | 1 |
| 102 | iPhone 15 | 999.00 | 2 |

La columna `id_categoria` en `Productos` es una **Clave Foránea (Foreign Key)**: conecta el producto con su categoría. Si queremos saber a qué categoría pertenece el iPhone 15, SQL mira el "2" y sabe que es "Smartphones".

> Así, si mañana cambiamos "Smartphones" por "Teléfonos Inteligentes", solo lo editamos en **un** lugar (`Categorias`) y todos los productos se actualizan automáticamente. ¡Eso es eficiencia!

## 6. Buenas prácticas y seguridad inicial
- **Clasificación de datos:** antes de crear una tabla, preguntate si contiene **Datos Personales (PII)**. Nombres, correos y teléfonos deben tratarse con niveles de seguridad interna o confidencial.
- **Atención a los permisos:** no todos deben poder usar `DELETE` o `DROP`. Como analista, tu comando favorito será `SELECT` (solo lectura).
- **Convenciones de nombres:** evitá espacios y tildes en nombres de tablas y columnas. Usá siempre minúsculas y guiones bajos (ej. `fecha_venta` en lugar de `Fecha Venta`).

## 7. Síntesis y conexiones
- Las **bases de datos relacionales** organizan info en tablas conectadas.
- Las **tablas** se componen de columnas (campos) y filas (registros).
- La **clave primaria** es el identificador único que impide el caos.
- **PostgreSQL** es nuestra herramienta para gestionar estas estructuras.

**¿Qué sigue?** En el próximo módulo aprenderás a usar el comando más poderoso del analista: `SELECT`. ¡Estás a punto de escribir tu primera consulta SQL!

---
<p align="center">
<a href="./04-plataformas-cloud-snowflake-bigquery-synapse.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 2</a> · <a href="../entregable/README.md">Ir al entregable (M2) ➡️</a>
</p>
