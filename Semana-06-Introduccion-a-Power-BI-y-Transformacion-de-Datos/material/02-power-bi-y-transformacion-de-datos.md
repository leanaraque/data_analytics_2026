# 2. Power BI y transformación de datos

> Con Power BI instalado y contextualizado, esta unidad explica el proceso completo que vas a seguir: cómo los datos viajan desde tu base de datos SQL hasta un reporte visual.

## Arquitectura de Power BI
Es un conjunto de servicios, motores y capas que transforman datos sin procesar en dashboards interactivos. Sostiene **cuatro fases** del proceso analítico:

1. **Extracción e integración** → conectores nativos y **Power Query**.
2. **Modelado** → relaciones, DAX, estructura del modelo.
3. **Visualización** → dashboards, reportes, análisis interactivo.
4. **Publicación y consumo** → Power BI Service y Mobile.
5. **Actualización continua** → *gateways* y programación de refrescos.

Así, Power BI es una solución robusta para análisis empresarial **de punta a punta**.

## Normalización de datos en Power BI
La preparación de datos se realiza principalmente con **Power Query**, que permite transformar, limpiar y reorganizar la información **antes** de cargarla al modelo. Es el mismo proceso de normalización que trabajaste en Excel (M2), ahora dentro de Power BI.

## Tipos de conectores disponibles
> 📖 **Para profundizar** — Esta sección amplía el tema con contenido avanzado. Podés continuar sin leerla.

Los conectores permiten que Power BI se comunique con distintos sistemas:

- **Bases de datos:** estándares como **ODBC** (independiente del lenguaje, compatible con múltiples DBMS mediante *drivers*) y **JDBC** (API para aplicaciones Java). También conectores nativos cloud: **BigQuery, Snowflake, Redshift, Azure SQL**.
- **Servicios en línea (APIs):** **REST** (usa HTTP para operaciones CRUD, formatos JSON/XML — el estándar actual) y **SOAP** (mensajes XML estructurados, más robusto/seguro, usado en banca y telecomunicaciones).
- **Archivos planos:** **CSV** (datos tabulares separados por comas) y **TXT** (texto sin procesar, delimitado por tabulaciones o espacios).

## ¿Qué es un ETL?
**ETL** = **Extract, Transform, Load** (Extracción, Transformación y Carga). Es fundamental para consolidar datos de diferentes fuentes en un sistema centralizado para su análisis.

- **Extracción (Extract):** obtener datos de bases, archivos planos, servicios web, cloud o APIs.
- **Transformación (Transform):** limpiar, normalizar, agregar y convertir los datos para cumplir los requisitos del análisis.
- **Carga (Load):** cargar los datos transformados en el destino (data warehouse, base analítica…), de forma incremental o en tiempo real.

> **Variante moderna — ELT:** en entornos cloud (BigQuery, Snowflake, Synapse) se **carga primero** y se **transforma después**, aprovechando la potencia de procesamiento de esas plataformas.

Un ETL robusto es la base para que Power BI construya **modelos sólidos, visualizaciones precisas y dashboards estratégicos**.

## ¿Qué son las dimensiones?
Tablas o campos con **información cualitativa** (datos descriptivos) que permiten **clasificar, agrupar y contextualizar** los valores numéricos de las tablas de hechos. Responden *¿Quién? ¿Qué? ¿Dónde? ¿Cuándo? ¿En qué categoría?*

**Características:**
- Contienen atributos descriptivos: nombre de producto, región, categoría, cliente, fecha, canal…
- Permiten **segmentar** los datos en grupos significativos.
- Son relativamente **estables** (no cambian con frecuencia).
- Otorgan **contexto** a los cálculos numéricos.

**Ejemplos:** Dimensión Producto (categoría, marca, proveedor) · Cliente (segmento, ubicación) · Fecha (año, mes, trimestre) · Geografía (país, región, ciudad).

> En un dashboard, las dimensiones son el **"marco"** que rodea a las métricas.

## ¿Qué son las medidas?
Expresiones **numéricas calculadas con DAX** que realizan operaciones dinámicas sobre los datos de una tabla de hechos. Mientras las dimensiones **describen**, las medidas **miden**.

**Características:**
- Son **cálculos dinámicos** que se actualizan automáticamente según los filtros aplicados.
- Se evalúan en el **contexto de filtro**: su resultado depende del segmento seleccionado.
- **No** ocupan espacio físico significativo: calculan en tiempo de ejecución.
- Son esenciales para KPIs, comparaciones, ratios y análisis avanzados.

**Ejemplos:**
- **Total Ventas:** `SUM(Ventas[Monto])`
- **Cantidad de transacciones:** `COUNT(Ventas[ID])`
- **Margen de ganancia:** `SUM(Ventas[Ventas]) - SUM(Ventas[Costos])`
- **Crecimiento %** y **YTD (Year-to-Date)** con `CALCULATE` y *time intelligence*.

> Sin medidas, un dashboard sería solo una colección de datos descriptivos, sin capacidad de síntesis ni indicadores accionables.

---
<p align="center">
<a href="./01-ecosistema-power-bi-y-desktop.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./03-conexion-a-postgresql-y-sql-server.md">Siguiente ➡️</a>
</p>
