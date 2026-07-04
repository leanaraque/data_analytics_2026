# 🛠️ Sección 2 — Ejercicios Prácticos

> Resolución de casos que requieren aplicar **consultas SQL, modelado de datos y creación de narrativas visuales**. Podés usar Excel o Power BI según el ejercicio.

---

## Ejercicio 1 — Consulta SQL

Vas a trabajar con un **dataset real de Kaggle** (elegido por vos) que incluya información de **ventas y clientes**, o que pueda adaptarse a ese escenario.

### Paso 1 · Selección del dataset
- Elegí un **dataset empresarial público** disponible en Kaggle.
- Debe permitir construir (o derivar) **al menos dos tablas**: `ventas` y `clientes`.
- Si el dataset viene en **una sola tabla**, deberás **separarlo o estructurarlo** para representar ambas entidades.
- 📎 *Si no encontrás un dataset adecuado, el curso provee un Excel de ejemplo ("Ejemplo de Ex Final") — pedí el enlace a tu tutor/a.*

### Paso 2 · Preparación de datos *(obligatorio, antes de escribir la consulta)*
- **Revisá y limpiá** lo necesario: valores vacíos, formatos de fecha, nombres de columnas.
- **Conservá solo las columnas relevantes**, como mínimo:
  - Identificador o **nombre del cliente**.
  - **Fecha de compra**.
  - **Total de la venta** (o una variable equivalente que permita calcularlo).
- Asegurate de que la **columna de fecha** esté en un formato que permita filtrar "últimos 30 días".

> 🗓️ **Ojo con "últimos 30 días":** se cuentan a partir de **la fecha de la última venta del dataset**, no de la fecha de hoy. (Los datasets suelen ser históricos; si filtraras contra `CURRENT_DATE`, probablemente no traerías ninguna fila.)

### Paso 3 · La consulta SQL
Escribí una consulta que:
1. **Extraiga** el nombre del cliente, la fecha de la compra y el total de la venta.
2. **Filtre** las ventas realizadas en los **últimos 30 días**.
3. **Ordene** los resultados por **fecha de compra descendente**.

#### 💡 Ayuda técnica — patrón de consulta (adaptá los nombres a tu dataset)
```sql
SELECT
    c.nombre_cliente,
    v.fecha_compra,
    v.total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
WHERE v.fecha_compra >= (
        SELECT MAX(fecha_compra) FROM ventas       -- última venta del dataset
      ) - INTERVAL '30 days'                        -- PostgreSQL
ORDER BY v.fecha_compra DESC;
```
> **Notas de motor:**
> - En **SQL Server** usá `DATEADD(DAY, -30, (SELECT MAX(fecha_compra) FROM ventas))`.
> - En **MySQL** usá `DATE_SUB((SELECT MAX(fecha_compra) FROM ventas), INTERVAL 30 DAY)`.
> - Si tu dataset ya está en **una sola tabla** con el nombre del cliente incluido, podés omitir el `JOIN` y consultar directo esa tabla.

### Qué incluir en tu respuesta
- La **consulta SQL** (captura de pantalla desde tu herramienta).
- Una breve **explicación** de qué columnas y tablas usaste y **por qué** son adecuadas para cumplir la consigna.

---

## Ejercicio 2 — Modelado de Datos

Diseñá un **diagrama ER simple** que represente la relación entre **clientes, productos y ventas**. Describí brevemente las entidades y las relaciones.

### 💡 Ayuda técnica — cómo encararlo
- **Entidades y sus claves:**
  - `clientes` → PK `id_cliente` (+ nombre, ciudad, segmento…).
  - `productos` → PK `id_producto` (+ nombre, categoría, precio…).
  - `ventas` (tabla de **hechos**) → PK `id_venta` + FK `id_cliente` + FK `id_producto` (+ fecha, cantidad, total…).
- **Relaciones (cardinalidad 1:N):**
  - Un **cliente** realiza **muchas** ventas; cada venta pertenece a **un** cliente.
  - Un **producto** aparece en **muchas** ventas; cada línea de venta refiere a **un** producto.
- Es el **esquema en estrella**: `ventas` en el centro, `clientes` y `productos` como dimensiones.
- Herramientas: **draw.io, dbdiagram.io, Lucidchart** o a mano (foto).

📖 Repasá: [S2 · Visión general de modelos de datos](../../Semana-02-Modelos-y-Disenos-de-Bases-de-Datos/material/01-vision-general-de-modelos-de-datos.md) y [S8 · Relaciones y esquema estrella](../../Semana-08-Modelado-Analitico-y-Calculos-Avanzados-con-DAX/material/01-relaciones-1n-y-esquema-estrella.md)

---

## Ejercicio 3 — Visualización y Storytelling

Imaginá que debés presentar un **informe de ventas mensual** a un equipo de **marketing**. Describí qué **tipo(s) de gráfico** usarías y cómo **estructurarías la narrativa** para que sea clara y persuasiva. Podés usar **Excel o Power BI**.

### 💡 Ayuda técnica — cómo encararlo
- **Elegí el gráfico según la pregunta:**
  - Evolución mensual → **gráfico de líneas** (tendencia en el tiempo).
  - Comparación entre categorías/productos/regiones → **gráfico de barras/columnas**.
  - Métricas de cabecera (Total Ventas, Ticket Promedio, % Crecimiento) → **tarjetas KPI**.
- **Estructurá la narrativa** (ej. modelo Contexto → Problema → Solución):
  1. **Contexto:** KPIs de cabecera (¿cómo venimos este mes vs. el anterior?).
  2. **Desarrollo:** la tendencia mensual + el desglose que explique el *porqué*.
  3. **Cierre:** un *insight* accionable y una **recomendación** para el equipo de marketing.
- Aplicá **jerarquía visual** (lo importante arriba-izquierda), **títulos probativos** y **comparativas**. Recordá: por cada gráfico, preguntate *"¿qué decisión permite tomar?"*.

📖 Repasá: [S7 · Visualizaciones clave](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/material/02-visualizaciones-clave.md) y [S7 · Storytelling con datos](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/material/04-storytelling-con-datos.md)

---
<p align="center">
<a href="./seccion-1-preguntas-teoricas.md">⬅️ Sección 1</a> · 🏠 <a href="../README.md">Semana 11</a> · <a href="./guia-de-presentacion.md">Siguiente: Guía de Presentación ➡️</a>
</p>
