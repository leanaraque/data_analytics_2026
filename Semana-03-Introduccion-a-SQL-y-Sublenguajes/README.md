# Semana 3 — Introducción a SQL y Sublenguajes

> Arranca el bloque **SQL** — el lenguaje que te da acceso a cualquier base de datos empresarial. Pasás de "consumidor" a "arquitecto" de datos.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Explicar qué es **SQL**, su ecosistema de herramientas y sus **sublenguajes** (DDL, DML, DCL, TCL).
- Diseñar **esquemas** y crear tablas con **DDL** eligiendo los **tipos de datos** correctos.
- Garantizar la integridad con **claves primarias (PK)** y **foráneas (FK)**.
- Modificar y eliminar estructuras con **`ALTER`** y **`DROP`**.
- Poblar y mantener datos con **DML** (`INSERT`, `UPDATE`, `DELETE`) usando `WHERE` con precisión.
- Entender el control de accesos con **DCL** (`GRANT`, `REVOKE`, roles).
- Construir una **base de datos relacional completa** desde cero.

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | SQL para analistas: qué es SQL, ecosistema y sublenguajes | [📄 Leer](./material/01-introduccion-a-sql.md) |
| 2 | Diseño de esquemas con DDL y tipos de datos (`CREATE TABLE`) | [📄 Leer](./material/02-diseno-de-esquemas-con-ddl-y-tipos-de-datos.md) |
| 3 | Restricciones de integridad: Primary Keys y Foreign Keys | [📄 Leer](./material/03-restricciones-de-integridad-pk-fk.md) |
| 4 | Comandos DDL: `ALTER` y `DROP` | [📄 Leer](./material/04-comandos-ddl-alter-y-drop.md) |
| 5 | Manipulación de datos con DML: `INSERT`, `UPDATE`, `DELETE` | [📄 Leer](./material/05-manipulacion-de-datos-dml.md) |
| 6 | Permisos y roles: introducción al DCL (`GRANT` / `REVOKE`) | [📄 Leer](./material/06-permisos-y-roles-dcl.md) |
| 7 | 📖 *Avanzado:* Data Warehousing — esquema estrella y copo de nieve | [📄 Leer](./material/07-data-warehousing-estrella-copo-de-nieve.md) |

## 🛠️ Prácticas guiadas *(no evaluables)*
- [Práctica 1 — Diseño de tablas con `CREATE TABLE`](./ejercicios/practica-01-diseno-de-tablas.md)
- [Práctica 2 — Construcción de `Ventas_Tech_DB` (DDL + constraints + INSERT)](./ejercicios/practica-02-ventas-tech-db.md) · [💾 script SQL](./ejercicios/ventas_tech_db.sql)
- [🃏 Repaso con flashcards](./ejercicios/repaso-flashcards.md)

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **Checkpoint M3 — Script SQL: esquema normalizado + datos iniciales** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Construís el **back-end** del proyecto: un archivo **`.sql`** que crea una base de datos de ventas de tecnología **normalizada** (tablas con **DDL**, **PK/FK** e `INSERT` de datos iniciales) y lo subís a un **repositorio de GitHub público**.

**El script tiene 3 secciones:**

| Sección | Qué hace | Ejemplo |
|---------|----------|---------|
| 1. DDL (estructura) | `CREATE TABLE` de `categorias`, `clientes`, `productos`, `ventas` | `CREATE TABLE productos (id_producto INT PRIMARY KEY, ...);` |
| 2. Restricciones | PK en cada tabla + FK en `ventas` + `NOT NULL` en campos críticos | `FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)` |
| 3. DML (datos) | `INSERT` de ≥3 categorías, ≥5 productos, ≥3 clientes, ≥10 ventas | `INSERT INTO categorias VALUES (1, 'Computación', '...');` |

> ⚠️ El script debe ser **repetible**: al ejecutarlo dos veces no debe fallar (por eso empieza con `DROP TABLE IF EXISTS` en el **orden inverso** de las dependencias). Y recordá: **`DECIMAL` para dinero**, nunca `FLOAT`.

**¿Qué entregás?** El **enlace a tu repositorio GitHub público** con el archivo `ventas_tech_db.sql` dentro de la carpeta del módulo.

> 💡 Esta base (`Ventas_Tech_DB`) es el **dataset que vas a usar durante todo el curso**: en M6 la conectás a Power BI y en M8 construís el modelo y las medidas DAX encima.

---

## 📂 Contenido de la carpeta
```
Semana-03-.../
├── README.md            → esta guía
├── material/            → las 7 unidades teóricas
├── ejercicios/          → prácticas guiadas + script SQL + repaso
└── entregable/          → consigna del Checkpoint M3
```

---
<p align="center">
<a href="../Semana-02-Modelos-y-Disenos-de-Bases-de-Datos/">⬅️ Semana 2</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-04-Sintaxis-SQL-y-Manipulacion-de-Datos/">Semana 4 ➡️</a>
</p>
