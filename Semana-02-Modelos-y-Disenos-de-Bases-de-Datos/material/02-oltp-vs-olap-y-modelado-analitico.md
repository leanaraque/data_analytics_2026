# 2. OLTP vs OLAP y patrones de modelado analítico (star, snowflake)

> Con los modelos de datos en claro, ahora entendés para qué se usa cada tipo de sistema.

¿Alguna vez te has preguntado cómo las empresas gestionan tanto las operaciones diarias como el análisis profundo de sus datos? En esta unidad exploramos dos tipos fundamentales de sistemas —**OLTP** y **OLAP**— y los patrones de modelado dimensional más usados —**star schema** y **snowflake schema**.

## OLTP vs OLAP: fundamentos y diferencias

**OLTP (Online Transaction Processing)** — sistemas diseñados para gestionar las **operaciones diarias** de una organización (ventas, inventarios, registros de clientes). Altamente normalizados, optimizados para transacciones rápidas y consistentes.
- Alta concurrencia y volumen de transacciones.
- Integridad y consistencia de datos.
- Esquemas normalizados para evitar redundancia.

**OLAP (Online Analytical Processing)** — orientado al **análisis y consulta** de grandes volúmenes de datos históricos para apoyar decisiones estratégicas.
- Consultas complejas y agregaciones.
- Datos organizados para facilitar el análisis.
- Uso de esquemas dimensionales (star, snowflake).

| | OLTP | OLAP |
|---|------|------|
| **Objetivo** | Eficiencia **operativa** | Eficiencia **analítica** |
| **Operaciones** | Transacciones rápidas (insertar, actualizar) | Consultas y agregaciones complejas |
| **Datos** | Actuales, detallados | Históricos, resumidos |
| **Esquema** | Normalizado | Dimensional (star / snowflake) |

## Arquitectura de un Data Warehouse
Un **Data Warehouse** es un sistema centralizado que integra datos de múltiples fuentes para análisis y reporting. Se estructura en capas:

| Capa | Descripción |
|------|-------------|
| **Raw** | Datos en su forma original, sin transformación |
| **Staging** | Datos limpiados, transformados y validados |
| **Data Marts** | Subconjuntos orientados a áreas específicas |

Esta arquitectura permite mantener la **calidad y consistencia** de los datos para análisis confiables.

## Patrones de modelado analítico

### Star Schema (esquema estrella)
Modelo dimensional donde una **tabla central de hechos** (*fact table*) se conecta directamente a varias **tablas de dimensiones**.
- **Tabla de hechos:** contiene métricas cuantitativas (ventas, ingresos).
- **Tablas de dimensiones:** contienen atributos descriptivos (tiempo, producto, cliente).

**Ventajas:** simplicidad y rapidez en consultas; fácil comprensión y mantenimiento.

### Snowflake Schema (esquema copo de nieve)
> 📖 **Para profundizar** — Esta sección amplía el tema con contenido avanzado. Podés continuar al siguiente tema sin leerla y volver cuando quieras ir más lejos.

Extensión del star schema donde las tablas de dimensiones están **normalizadas** en múltiples tablas relacionadas.
- Reduce redundancia de datos.
- Puede mejorar la integridad y el mantenimiento.
- **Desventaja:** consultas más complejas y lentas.

### Slowly Changing Dimensions (SCD)
Las dimensiones que cambian con el tiempo requieren estrategias para mantener el historial:
- **Tipo 1:** sobrescribir datos antiguos.
- **Tipo 2:** mantener historial con nuevas filas.
- **Tipo 3:** añadir columnas para cambios limitados.

La elección depende del requerimiento de análisis histórico.

## Ejemplo de reporting
Imaginá un reporte de **ventas por región y periodo**. Un *star schema* permite consultas rápidas agregando ventas por dimensiones de tiempo y ubicación, facilitando dashboards y análisis de tendencias.

En la práctica, las organizaciones combinan **OLTP** para operaciones diarias con **Data Warehouses OLAP** para análisis estratégico. Por ejemplo, un retailer usa OLTP para registrar cada venta en tiempo real, mientras que su equipo de BI consulta el Data Warehouse para analizar patrones de compra y planificar campañas.

El diseño adecuado del esquema dimensional impacta directamente en la **velocidad y calidad** del análisis: un star schema sencillo puede bastar para reportes estándar, mientras que un snowflake puede preferirse cuando se requiere mayor normalización y control de datos.

---
<p align="center">
<a href="./01-vision-general-de-modelos-de-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 2</a> · <a href="./03-normalizacion-de-datos.md">Siguiente ➡️</a>
</p>
