# Semana 2 — Modelos y Diseños de Bases de Datos

> Bloque de **Fundamentos**. Antes de escribir una línea de SQL, necesitás entender cómo se organiza la información.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Explicar los principales **modelos de datos** (relacional, entidad-relación y NoSQL) y sus casos de uso.
- Diferenciar sistemas **OLTP** y **OLAP** y reconocer los patrones de modelado dimensional (star y snowflake).
- Aplicar la **normalización** hasta la 3ª Forma Normal (1NF, 2NF, 3NF).
- Comprender qué es una **base de datos relacional** y sus componentes (tablas, PK, FK, tipos de datos) con **PostgreSQL**.
- Diseñar un **modelo relacional** completo a partir de un caso de negocio.

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | Visión general de modelos de datos (relacional, ER, NoSQL) | [📄 Leer](./material/01-vision-general-de-modelos-de-datos.md) |
| 2 | OLTP vs OLAP y modelado analítico (star / snowflake) | [📄 Leer](./material/02-oltp-vs-olap-y-modelado-analitico.md) |
| 3 | Normalización de datos (1NF, 2NF, 3NF) | [📄 Leer](./material/03-normalizacion-de-datos.md) |
| 4 | 📖 *Avanzado:* Plataformas cloud — Snowflake, BigQuery, Synapse | [📄 Leer](./material/04-plataformas-cloud-snowflake-bigquery-synapse.md) |
| 5 | Bases de datos relacionales y PostgreSQL | [📄 Leer](./material/05-bases-de-datos-relacionales-y-postgresql.md) |

> 📖 La unidad 4 es contenido **avanzado / opcional**: podés avanzar sin leerla y volver cuando quieras ir más lejos.

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M2 — Pre-entrega: Modelo de datos RetailPro** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Con el brief definido en M1, ahora diseñás el **modelo relacional** de RetailPro: todas sus tablas, columnas, tipos de datos, **claves primarias y foráneas**, aplicando **normalización hasta 3NF**. Es el plano del edificio: en M3 vas a implementar exactamente este modelo en SQL.

**¿Qué entregás?** Un único archivo **PDF o DOCX** con el **diagrama ER** (como imagen) y las justificaciones, subido directo en la plataforma.

| Parte | En qué consiste | Ejemplo rápido |
|-------|-----------------|----------------|
| 1. Diagrama ER | Tablas, columnas, tipos, PK y FK | `clientes` (id_cliente **PK**) ←→ `ventas` (id_cliente **FK**) |
| 2. Justificación de normalización | Por qué cumple 3NF | *"Separé el producto en su propia tabla para eliminar la dependencia transitiva precio → producto."* |
| 3. Conexión con el brief M1 | Qué pregunta de M1 responde cada tabla | *`territorios` → "¿Qué región genera más ingresos?" vía la columna `region`.* |

**Tablas obligatorias:** `clientes`, `productos`, `ventas`, `territorios` (ver columnas mínimas en la [consigna](./entregable/README.md)).

> ⚠️ **Ojo:** este entregable (RetailPro) **sí es evaluable**. No confundir con el ejercicio guiado *Normalización del Videoclub*, que **no** suma nota.

---

## 📂 Contenido de la carpeta
```
Semana-02-.../
├── README.md            → esta guía
├── material/            → las 5 unidades teóricas
└── entregable/          → consigna del Modelo de datos RetailPro (M2)
```

---
<p align="center">
<a href="../Semana-01-Introduccion-al-Analisis-de-Datos/">⬅️ Semana 1</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-03-Introduccion-a-SQL-y-Sublenguajes/">Semana 3 ➡️</a>
</p>
