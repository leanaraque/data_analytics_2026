# Semana 5 — Consultas SQL con Join y Union

> Cruzás información de varias tablas: la operación más frecuente en el análisis de datos real. La condición de unión usa exactamente las **Primary Keys** y **Foreign Keys** que diseñaste en M3.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Combinar tablas con **`JOIN`** usando la condición `ON` sobre PK/FK.
- Usar **`INNER JOIN`** para traer solo coincidencias y aplicarlo a preguntas de negocio.
- Distinguir y aplicar **`LEFT`**, **`RIGHT`** y **`FULL OUTER JOIN`** para incluir filas sin par.
- Interpretar el comportamiento de los **`NULL`** en las uniones.
- Entender el **orden de ejecución real** de una consulta (8 pasos) y por qué evita errores.
- Consolidar filas de varias consultas con **`UNION`** y **`UNION ALL`**.

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | Conociendo la cláusula `JOIN` (sintaxis y tipos) | [📄 Leer](./material/01-clausula-join.md) |
| 2 | `INNER JOIN` con ejemplos de negocio | [📄 Leer](./material/02-inner-join-ejemplos-de-negocio.md) |
| 3 | Conceptos y diferencias: `LEFT`, `RIGHT` y `FULL OUTER JOIN` | [📄 Leer](./material/03-left-right-full-outer-join.md) |
| 4 | Orden de ejecución en SQL (los 8 pasos) | [📄 Leer](./material/04-orden-de-ejecucion-en-sql.md) |
| 5 | Checklist rápida: ¿cuándo usar `LEFT` vs `RIGHT` vs `FULL`? | [📄 Leer](./material/05-checklist-left-right-full.md) |
| 6 | `UNION` vs `UNION ALL`: conceptos y ejemplos | [📄 Leer](./material/06-union-vs-union-all.md) |
| 7 | Ejemplos guiados: compatibilidad de columnas y tipos | [📄 Leer](./material/07-ejemplos-guiados-union.md) |

> 🧭 **Regla mental:** los `JOIN` combinan tablas **horizontalmente** (agregan columnas); `UNION` las combina **verticalmente** (apila filas).

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M5 — Pre-entrega: Consultas con JOINs para el proyecto** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Las consultas de M4 trabajaban sobre tablas individuales. Ahora las **cruzás** para obtener la **vista enriquecida** que necesita Power BI: ventas con nombre de cliente, producto, categoría y región en una sola consulta. Esa vista es la **materia prima del dashboard** que vas a construir en M7.

**Las 4 consultas pedidas:**

| # | Consulta | Técnica clave |
|---|----------|---------------|
| 1 | Vista base del proyecto (ventas + clientes + productos + territorios) | `INNER JOIN` (múltiple) |
| 2 | Clientes sin ventas | `LEFT JOIN` + `WHERE ... IS NULL` |
| 3 | Productos sin ventas | `LEFT JOIN` + `WHERE ... IS NULL` |
| 4 | Consolidado por canal (Online / Presencial) | `UNION ALL` + `GROUP BY` |

**¿Qué entregás?** El **enlace a tu repositorio GitHub público** con `m5_consultas_joins.sql`, en la misma carpeta que M3 y M4.

> 💡 En la [consigna](./entregable/README.md) incluí **ayudas técnicas** con el patrón de JOIN múltiple y el de "registros sin par" (`LEFT JOIN ... IS NULL`).

---

## 📂 Contenido de la carpeta
```
Semana-05-.../
├── README.md            → esta guía
├── material/            → las 7 unidades teóricas
└── entregable/          → consigna de las Consultas con JOINs (M5)
```

---
<p align="center">
<a href="../Semana-04-Sintaxis-SQL-y-Manipulacion-de-Datos/">⬅️ Semana 4</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-06-Introduccion-a-Power-BI-y-Transformacion-de-Datos/">Semana 6 ➡️</a>
</p>
