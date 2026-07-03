# Semana 6 — Introducción a Power BI y Transformación de Datos

> Arranca el bloque **ETL**: ya sabés extraer datos con SQL; ahora conectás esos datos a la herramienta de análisis visual líder del mercado y los preparás para el análisis.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Describir el **ecosistema Power BI** (Desktop, Service, Fabric) y su flujo de trabajo.
- Entender la **arquitectura** de Power BI y el proceso **ETL** (Extraer, Transformar, Cargar).
- Distinguir **dimensiones** (cualitativas) de **medidas** (cuantitativas).
- **Conectar** Power BI a PostgreSQL y SQL Server.
- **Limpiar y tipar** datos con **Power Query**, y combinar tablas con **Merge** y **Append**.
- Leer y escribir transformaciones en **lenguaje M** y automatizarlas con funciones.
- Diseñar un **modelo de datos** con relaciones y **cardinalidad 1:N**.

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | Ecosistema Power BI 2026 y Power BI Desktop | [📄 Leer](./material/01-ecosistema-power-bi-y-desktop.md) |
| 2 | Power BI y transformación de datos (arquitectura, ETL, dimensiones y medidas) | [📄 Leer](./material/02-power-bi-y-transformacion-de-datos.md) |
| 3 | Conexión de Power BI a PostgreSQL y SQL Server | [📄 Leer](./material/03-conexion-a-postgresql-y-sql-server.md) |
| 4 | Limpieza y tipado de datos en Power Query | [📄 Leer](./material/04-limpieza-y-tipado-en-power-query.md) |
| 5 | Combinación de tablas: Merge y Append | [📄 Leer](./material/05-combinacion-de-tablas-merge-y-append.md) |
| 6 | Introducción al lenguaje M y Editor Avanzado | [📄 Leer](./material/06-lenguaje-m-y-editor-avanzado.md) |
| 7 | Automatización de limpieza con funciones de Power Query | [📄 Leer](./material/07-automatizacion-con-funciones-de-power-query.md) |
| 8 | 📖 *Avanzado:* La maestría del ETL (consolidación del flujo) | [📄 Leer](./material/08-maestria-del-etl.md) |
| 9 | Modelado de datos: relaciones y cardinalidad 1:N | [📄 Leer](./material/09-modelado-relaciones-y-cardinalidad.md) |

> 🔗 **Puentes con lo anterior:** conectar Power BI usa el SQL de M3–M5 · **Merge** = el `JOIN` de M5 · **Append** = el `UNION` de M5 · el modelo 1:N es el **esquema estrella** de M2.

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M6 — Checkpoint: Pipeline ETL Completo** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Construís el **motor de datos** que va a sostener todos tus reportes: conectás Power BI a una fuente real, **perfilás la calidad**, aplicás **transformaciones profesionales** en Power Query y **documentás** la lógica en lenguaje M, entregando un `.pbix` limpio.

**Lo que tiene que demostrar tu `.pbix`:**

| Requisito | Detalle |
|-----------|---------|
| Conexión + perfilado | Calidad, distribución y perfil de columna sobre todo el dataset |
| Limpieza | Quitar duplicados (por ID) y resolver nulos **con justificación técnica** |
| Tipado | Cada columna con su tipo correcto (¡las fechas son críticas!) |
| Nomenclatura | Tablas como `Dim_Clientes`, `Dim_Productos`, `Dim_Categorias`, `Fact_Ventas` |
| Merge | Enriquecer `Fact_Ventas` con `nombre_producto` y `categoria` |
| Documentación en M | Comentarios `//` técnicos en ≥2 consultas del Editor Avanzado |

**¿Qué entregás?** El **enlace a tu repositorio GitHub público** con `Pipeline_ETL_Apellido_Nombre.pbix`.

> 🔗 Este `.pbix` limpio es la **base de M8**: encima construís el modelo analítico (relaciones 1:N, tabla calendario) y las medidas DAX. Sin un buen pipeline ETL, las medidas de M8 no funcionarán bien.

---

## 📂 Contenido de la carpeta
```
Semana-06-.../
├── README.md            → esta guía
├── material/            → las 9 unidades teóricas
└── entregable/          → consigna del Pipeline ETL (M6)
```

---
<p align="center">
<a href="../Semana-05-Consultas-SQL-con-Join-y-Union/">⬅️ Semana 5</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/">Semana 7 ➡️</a>
</p>
