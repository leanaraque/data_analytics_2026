# 6. Tecnologías y Herramientas

> Con el rol definido, este es el mapa de herramientas que vas a usar a lo largo del curso.

En esta unidad vas a recorrer las principales tecnologías del análisis de datos, comprendiendo cuál es la función de cada una dentro del **ciclo de vida de los datos**: bases de datos relacionales, procesos ETL/ELT, data lakes y plataformas de visualización.

## Bases de datos relacionales
Sistemas como **MySQL, PostgreSQL y SQL Server** almacenan datos **estructurados** en tablas con filas y columnas, facilitando consultas eficientes mediante el lenguaje **SQL**.

> **Ejemplo:** una empresa de retail usa PostgreSQL para gestionar su inventario y ventas, permitiendo consultas rápidas para reportes diarios.

## Procesos ETL y ELT
Metodologías para mover y preparar datos:
- **ETL (Extract, Transform, Load):** extrae datos de fuentes diversas, los **transforma** (limpieza, normalización) y luego los **carga** en un sistema destino.
- **ELT (Extract, Load, Transform):** extrae y **carga** primero; la **transformación** se hace dentro del sistema destino. Común en arquitecturas modernas con gran capacidad de procesamiento.

> **Importancia:** estos procesos aseguran que los datos estén **listos y confiables** para el análisis posterior.

## Almacenamiento en la nube y Data Lakes
Los **Data Lakes** son repositorios que almacenan datos en su forma original —estructurados y no estructurados— a gran escala, generalmente en la nube.
- Permiten almacenar grandes volúmenes sin estructurarlos previamente.
- Facilitan análisis avanzados y *machine learning*.

> **Ejemplo:** una empresa tecnológica usa un data lake en AWS para almacenar logs de usuarios y datos de sensores, que luego analiza para mejorar sus servicios.

## Herramientas de visualización
Plataformas como **Power BI, Tableau y Looker Studio** permiten crear visualizaciones interactivas que facilitan la interpretación y comunicación de insights.
- Integran datos de múltiples fuentes.
- Ofrecen dashboards personalizables y reportes dinámicos.

> **Caso práctico:** un equipo de marketing usa Tableau para monitorear campañas en tiempo real y ajustar estrategias basadas en datos visuales claros.

## Cómo se integran (el flujo completo)
En la práctica, estas tecnologías trabajan en conjunto para transformar datos crudos en información valiosa:

1. Las **bases de datos relacionales** almacenan datos transaccionales y estructurados.
2. Los **procesos ETL/ELT** extraen esos datos, los limpian y los preparan.
3. Los **Data Lakes** almacenan datos variados y en gran volumen, permitiendo análisis flexibles.
4. Las **herramientas de visualización** presentan los resultados de forma clara y accionable.

> **Ejemplo integral:** una empresa extrae datos de ventas de su base **MySQL**, los procesa con un pipeline **ETL**, almacena resultados en un **data lake** y crea dashboards en **Power BI** para que los gerentes tomen decisiones informadas.

Este flujo es esencial para roles en marketing, operaciones y tecnología, donde la rapidez y precisión en el manejo de datos impactan directamente en la competitividad.

---
<p align="center">
<a href="./05-excel-basico-formulas-y-funciones.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 1</a> · <a href="./07-base-de-datos-vs-dataset.md">Siguiente ➡️</a>
</p>
