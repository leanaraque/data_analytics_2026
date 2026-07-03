# Semana 4 — Sintaxis SQL y Manipulación de Datos

> El corazón del trabajo diario del analista: **extraer exactamente lo que necesitás** de una base de datos y resumirlo en métricas de negocio.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Escribir consultas **`SELECT`** eligiendo columnas y renombrándolas con **alias (`AS`)**.
- Obtener valores únicos con **`DISTINCT`** y entender cuándo conviene frente a `GROUP BY`.
- Filtrar filas con **`WHERE`** y operadores de comparación y lógicos (`AND`, `OR`, `NOT`, `IN`).
- **Ordenar** (`ORDER BY`) y **limitar** (`LIMIT`) los resultados.
- Calcular métricas con **funciones de agregación** (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | Consultas básicas: `SELECT` y alias de columnas (`AS`) | [📄 Leer](./material/01-select-y-alias-de-columnas.md) |
| 2 | Sentencia `DISTINCT` (eliminar duplicados) | [📄 Leer](./material/02-sentencia-distinct.md) |
| 3 | Filtrado preciso: `WHERE` y operadores lógicos | [📄 Leer](./material/03-where-y-operadores-logicos.md) |
| 4 | Ordenar y limitar: `ORDER BY` y `LIMIT` | [📄 Leer](./material/04-order-by-y-limit.md) |
| 5 | Funciones de agregación: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` | [📄 Leer](./material/05-funciones-de-agregacion.md) |

> 🔗 Las métricas de agregación que aprendés acá son las mismas que después vas a **replicar con DAX en Power BI (M8)**.

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M4 — Pre-entrega: Consultas SQL de negocio** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Sobre la base **`Ventas_Tech_DB`** creada en M3, escribís las primeras consultas que responden a **preguntas de negocio** reales (resúmenes, rankings y comparativas) en un archivo **`m4_consultas_negocio.sql`**.

**Las 4 consultas pedidas:**

| # | Consulta | Técnica clave |
|---|----------|---------------|
| 1 | Resumen ejecutivo mensual (total, nº pedidos, ticket promedio) | `SUM`, `AVG`, `COUNT`, agrupar por mes |
| 2 | Ranking Top 5 de productos por facturación | `GROUP BY` + `ORDER BY` + `LIMIT 5` |
| 3 | Clientes recurrentes (más de un pedido) | `GROUP BY` + `HAVING COUNT(*) > 1` |
| 4 | Meses por encima / por debajo del promedio | `CASE WHEN` |

Más un **bloque de comentarios** al final con **3 hallazgos** concretos que encontraste en los datos.

**¿Qué entregás?** El **enlace a tu repositorio GitHub público** con `m4_consultas_negocio.sql`.

> 💡 En la [consigna](./entregable/README.md) incluí **ayudas técnicas** con la sintaxis de `EXTRACT`, `HAVING` y `CASE WHEN` (patrones, no la solución completa).

---

## 📂 Contenido de la carpeta
```
Semana-04-.../
├── README.md            → esta guía
├── material/            → las 5 unidades teóricas
└── entregable/          → consigna de las Consultas SQL de negocio (M4)
```

---
<p align="center">
<a href="../Semana-03-Introduccion-a-SQL-y-Sublenguajes/">⬅️ Semana 3</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-05-Consultas-SQL-con-Join-y-Union/">Semana 5 ➡️</a>
</p>
