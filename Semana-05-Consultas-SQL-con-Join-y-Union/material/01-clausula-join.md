# 1. Conociendo la cláusula `JOIN`

> Con `SELECT`, `WHERE` y agregaciones dominados, ahora cruzás información de varias tablas — la operación más frecuente en análisis de datos reales. La condición de unión usa exactamente las **Primary Keys** y **Foreign Keys** que diseñaste en M3.

La cláusula **`JOIN`** permite combinar registros de diferentes tablas dentro de una consulta SQL. Es fundamental en bases de datos relacionales: posibilita analizar y obtener datos combinados de múltiples tablas asociándolas por **al menos un campo en común** (por ejemplo, una columna).

> 🎥 **Preparación del entorno:** antes de los ejercicios, el módulo incluye un video que crea desde cero la base de datos, define las tablas y carga los datos de práctica (a partir de un archivo `.sql`). Si todavía no tenés el entorno listo, empezá por ahí.

## ¿Qué permite hacer la cláusula `JOIN`?
Hoy `JOIN` no se limita a bases tradicionales: también se aplica en entornos modernos como **Google BigQuery, Snowflake o Azure Synapse**, donde las consultas abarcan grandes volúmenes y aprovechan procesamiento paralelo. Además, herramientas de **IA** (como Copilot en Fabric/Synapse o AI SQL en Databricks) permiten generar consultas `JOIN` a partir de descripciones en lenguaje natural, facilitando reportes incluso a usuarios no técnicos.

## ¿Qué partes componen la sintaxis de un `JOIN`?
En SQL relacional, los `JOIN` aparecen en consultas **DML** (Data Manipulation Language), con esta estructura:

- **`SELECT columnas`** → las columnas que querés obtener en el resultado.
- **`FROM tabla1`** → la primera tabla.
- **`JOIN tabla2`** → la segunda tabla que se une con la primera.
- **`ON tabla1.campo_comun = tabla2.campo_comun`** → la **condición de unión** entre las dos tablas.

```sql
SELECT columnas
FROM   tabla1
JOIN   tabla2 ON tabla1.campo_comun = tabla2.campo_comun;
```

La cláusula `JOIN` se complementa con **`ON`**, que define la condición por la cual se unen las tablas. Esa condición generalmente se basa en campos que las tablas tienen en común, como **claves primarias (PK)** y **foráneas (FK)**.

## Tipos de `JOIN`
Existen varios tipos según la necesidad de la consulta. En todos los casos, cuando **no** hay coincidencia entre tablas, los campos correspondientes se completan con **`NULL`**:

- **`INNER JOIN`:** retorna **solo** los registros con coincidencia en ambas tablas. Si una fila no encuentra par, no aparece (los `NULL` se descartan).
- **`LEFT JOIN`** (o `LEFT OUTER JOIN`): retorna **todos** los registros de la tabla **izquierda** y los coincidentes de la derecha. Sin coincidencia → columnas de la derecha en `NULL`.
- **`RIGHT JOIN`** (o `RIGHT OUTER JOIN`): retorna **todos** los registros de la tabla **derecha** y los coincidentes de la izquierda. Sin coincidencia → columnas de la izquierda en `NULL`.
- **`FULL OUTER JOIN`:** retorna **todos** los registros de **ambas** tablas, con `NULL` donde no haya coincidencias.

## ¿Por qué importa?
En el mundo real, los datos suelen estar distribuidos en múltiples tablas relacionadas (por ejemplo, una tabla de `clientes` y otra de `pedidos`). Para analizar el comportamiento de compra hay que **unir** esas tablas y extraer información combinada.

Los gestores **MySQL, PostgreSQL y SQL Server** tienen sintaxis muy similares para `SELECT` e `INNER JOIN`, con pequeñas diferencias de compatibilidad. Entender cómo manejar los `NULL` y combinar resultados con `UNION` es clave para evitar errores y obtener insights precisos.

Esta unidad te prepara para responder preguntas como *"¿Qué clientes realizaron pedidos en el último mes?"* o *"¿En qué ciudades tenemos clientes y proveedores?"*.

---
<p align="center">
🏠 <a href="../README.md">Semana 5</a> · <a href="./02-inner-join-ejemplos-de-negocio.md">Siguiente: INNER JOIN con ejemplos de negocio ➡️</a>
</p>
