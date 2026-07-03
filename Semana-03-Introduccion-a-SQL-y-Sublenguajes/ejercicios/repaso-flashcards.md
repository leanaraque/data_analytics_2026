# 🃏 Repaso con flashcards — Semana 3

> Unidad de repaso para consolidar SQL, sublenguajes, restricciones y manipulación de datos.

**Cómo usarlas:** leé la pregunta e intentá responderla **antes** de abrir la respuesta. Si fallás, es la señal perfecta de que ese concepto necesita refuerzo — volvé a repasarlo dentro de un par de días (**revisión espaciada**).

> Recordá: SQL es un lenguaje **declarativo**: le indicás al sistema *qué* querés obtener, no *cómo* debe recorrer los archivos físicos para conseguirlo.

---

### 1. ¿Qué sublenguaje de SQL se usa para **crear una tabla**?
<details><summary>Respuesta</summary>

**DDL** (Data Definition Language) — define y modifica la estructura. Comando: `CREATE TABLE`.
</details>

### 2. ¿Y para **insertar, actualizar o eliminar** registros?
<details><summary>Respuesta</summary>

**DML** (Data Manipulation Language) — `INSERT`, `UPDATE`, `DELETE`.
</details>

### 3. ¿Qué sublenguaje usás para **dar o quitar permisos**?
<details><summary>Respuesta</summary>

**DCL** (Data Control Language) — `GRANT` y `REVOKE`.
</details>

### 4. ¿Cuál es la diferencia entre una **Primary Key** y una **Foreign Key**?
<details><summary>Respuesta</summary>

La **PK identifica** de forma única cada fila de una tabla (no se repite, nunca es `NULL`). La **FK conecta** una tabla con la PK de otra, garantizando la **integridad referencial**.
</details>

### 5. ¿Por qué se guarda un precio como `DECIMAL` y no como `FLOAT`?
<details><summary>Respuesta</summary>

Porque `DECIMAL`/`NUMERIC` da **decimales exactos**, imprescindibles para dinero. `FLOAT` es aproximado y puede introducir errores de redondeo en sumas y promedios.
</details>

### 6. ¿Por qué un código postal o un teléfono conviene guardarlo como `VARCHAR` y no como `INT`?
<details><summary>Respuesta</summary>

Porque no vas a hacer operaciones matemáticas con ellos, y como `INT` se perdería un **cero inicial** (`08001` → `8001`).
</details>

### 7. ¿Qué diferencia hay entre `DELETE` y `DROP TABLE`?
<details><summary>Respuesta</summary>

`DELETE` (DML) borra **filas** de la tabla; la tabla sigue existiendo. `DROP TABLE` (DDL) elimina la **estructura completa** (tabla + datos), de forma irreversible.
</details>

### 8. ¿Cuál es el error más común y costoso al usar `UPDATE` o `DELETE`?
<details><summary>Respuesta</summary>

**Olvidar la cláusula `WHERE`**: sin ella, el cambio o borrado se aplica a **todas las filas** de la tabla.
</details>

### 9. ¿Qué diferencia hay entre `NULL`, `0` y `''`?
<details><summary>Respuesta</summary>

`NULL` = valor **desconocido / ausente**. `0` = un número (cero). `''` = una cadena de texto vacía. No son equivalentes.
</details>

### 10. En un esquema estrella, ¿qué contiene la **tabla de hechos** y qué las **dimensiones**?
<details><summary>Respuesta</summary>

La **tabla de hechos** contiene las **métricas numéricas** (cantidades, totales) y las FK. Las **dimensiones** contienen los atributos **descriptivos** que dan contexto (cliente, producto, fecha, ubicación).
</details>

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 3</a>
</p>
