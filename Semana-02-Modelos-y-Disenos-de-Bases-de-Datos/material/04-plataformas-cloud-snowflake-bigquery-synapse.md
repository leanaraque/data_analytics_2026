# 4. Introducción práctica a Snowflake, BigQuery y Azure Synapse

> 📖 **Para profundizar** — Esta unidad amplía el tema con contenido avanzado. Podés continuar al siguiente tema sin leerla y volver cuando quieras ir más lejos o cuando ya domines los conceptos anteriores.

> La normalización te enseñó a diseñar bases de datos locales. Esta unidad te muestra **dónde viven** esas bases de datos en el mundo profesional.

Imaginá que tu empresa necesita procesar grandes volúmenes de datos para análisis en tiempo real y reportes estratégicos. ¿Cómo elegir la plataforma cloud adecuada que combine **escalabilidad, rendimiento y control de costes**? Exploramos tres plataformas líderes para almacenamiento y procesamiento analítico (OLAP): **Snowflake, Google BigQuery y Azure Synapse**.

## Snowflake
Plataforma de **data warehouse como servicio (DWaaS)** que **separa el almacenamiento del cómputo**, permitiendo escalabilidad independiente y concurrente. Arquitectura en tres capas:
- **Almacenamiento centralizado:** datos en formato columnar en la nube (AWS, Azure o GCP).
- **Capa de cómputo:** clusters virtuales llamados *warehouses* que procesan consultas de forma aislada.
- **Servicios en la nube:** gestión de metadatos, seguridad, optimización y transacciones.

**Buenas prácticas:**
- Usar *warehouses* separados para cargas concurrentes y evitar contención.
- Aplicar particionado lógico mediante *clustering keys* para mejorar el rendimiento.
- Monitorizar el uso para **pausar** *warehouses* y controlar costes.

## Google BigQuery
Almacén de datos **serverless** con procesamiento masivo paralelo (MPP) y almacenamiento columnar.
- **Almacenamiento separado:** datos en Google Cloud Storage.
- **Motor de consulta Dremel:** procesa consultas SQL distribuidas y optimizadas.

**Buenas prácticas:**
- **Particionar** tablas por fecha o campos relevantes para reducir el escaneo de datos.
- Usar **clustering** para ordenar datos y acelerar consultas.
- Controlar costes mediante estimación previa y uso de cuotas.

## Azure Synapse Analytics
Combina capacidades de data warehousing y big data.
- **SQL Pools dedicados:** recursos de cómputo para consultas SQL.
- **Integración con Spark Pools:** para procesamiento de big data.
- **Almacenamiento** en Azure Data Lake Storage Gen2.

**Buenas prácticas:**
- Diseñar esquemas optimizados para consultas OLAP.
- Usar particionado y distribución de datos para balancear la carga.
- Monitorizar y escalar recursos según demanda.

## Modelos de costes y optimizaciones básicas

| Plataforma | Modelo de costes | Optimización clave |
|------------|------------------|--------------------|
| **Snowflake** | Pago por segundo de cómputo y almacenamiento separado | Pausar *warehouses* cuando no se usan; *clustering* para consultas eficientes |
| **BigQuery** | Pago por bytes procesados en consultas y almacenamiento | Particionado y *clustering* para minimizar datos escaneados |
| **Synapse** | Pago por recursos dedicados (SQL Pools) y almacenamiento | Escalado dinámico y distribución de datos para rendimiento |

> **Nota:** entender el modelo de costes es fundamental para evitar sorpresas en la facturación y optimizar el uso de recursos.

## Conocimiento clave
- Las tres plataformas soportan **SQL estándar** con extensiones propias.
- Cada una ofrece integración con herramientas de orquestación y transformación como **dbt**.
- La elección depende del caso de uso, volumen de datos, presupuesto y ecosistema tecnológico.

## Aplicación práctica en entornos reales
- **Snowflake** es popular en empresas que requieren alta concurrencia y flexibilidad en cómputo (fintechs, retail).
- **BigQuery** es ideal para organizaciones que ya usan Google Cloud y necesitan procesamiento serverless sin gestión de infraestructura.
- **Azure Synapse** se integra bien en entornos Microsoft, combinando análisis SQL y big data.

Comprender sus arquitecturas y modelos de costes permite diseñar soluciones eficientes, evitar gastos innecesarios y aplicar optimizaciones que mejoran el rendimiento.

---
<p align="center">
<a href="./03-normalizacion-de-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 2</a> · <a href="./05-bases-de-datos-relacionales-y-postgresql.md">Siguiente ➡️</a>
</p>
