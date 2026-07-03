# 7. Diferencias entre base de datos y dataset

> Última unidad conceptual antes de entrar de lleno al modelado y SQL.

En esta unidad vas a explorar las diferencias entre una **base de datos** y un **dataset**, comprendiendo cuándo conviene trabajar directamente sobre bases de datos y cuándo es mejor usar datasets extraídos para análisis específicos.

> ¿Alguna vez te has preguntado por qué a veces trabajamos directamente con bases de datos y otras veces con datasets extraídos?

Esta distinción es clave para cualquier analista que busca **eficiencia, reproducibilidad y gobernanza** en sus proyectos.

## ¿Qué es una base de datos?
Un sistema **estructurado y gestionado** mediante un **DBMS** (Sistema de Gestión de Bases de Datos) que almacena datos de forma persistente, organizada y accesible para múltiples usuarios y aplicaciones. Ejemplos: MySQL, PostgreSQL, SQL Server.

**Características principales:**
- **Persistencia:** los datos se almacenan de forma duradera y segura.
- **Esquema definido:** estructura rígida que define tablas, relaciones y tipos de datos.
- **Gobernanza:** control de acceso, integridad y seguridad.
- **Rendimiento:** optimizada para consultas concurrentes y transacciones.

## ¿Qué es un dataset?
Un **conjunto de datos** extraído o generado, generalmente en formato tabular (CSV, Excel, JSON), utilizado para un análisis específico o puntual.

**Características principales:**
- **Temporalidad:** puede ser una instantánea o subconjunto de datos.
- **Flexibilidad:** menos rígido en estructura, fácil de modificar.
- **Uso focalizado:** orientado a análisis ad-hoc o experimentación.
- **Portabilidad:** fácil de compartir y transportar.

## Comparación práctica

| Aspecto | Base de datos | Dataset |
|---------|---------------|---------|
| **Persistencia** | Permanente y gestionada | Temporal o estática |
| **Esquema** | Rígido y definido | Flexible o variable |
| **Gobernanza** | Control de acceso y seguridad | Limitada o dependiente del usuario |
| **Tamaño** | Puede ser muy grande y escalable | Generalmente más pequeño |
| **Rendimiento** | Optimizado para múltiples usuarios | Depende del entorno de análisis |

> **Nota:** la elección entre base de datos y dataset afecta directamente la **reproducibilidad** y **gobernanza** de tus análisis, aspectos críticos en entornos profesionales.

## En la práctica
Cuando trabajás con datos en **producción**, es común hacer consultas directas a la base de datos para obtener información actualizada y consistente. Para análisis exploratorios o reportes específicos, **extraer un dataset** permite trabajar con una copia controlada, evitando impactos en el sistema productivo y facilitando la reproducibilidad.

En procesos **ETL**, los datasets actúan como **intermediarios** que permiten transformar y limpiar datos antes de cargarlos en sistemas analíticos o visualizaciones. Esta separación ayuda a mantener la integridad y gobernanza de los datos originales.

Saber cuándo y cómo usar cada uno te permite optimizar recursos, garantizar la calidad de tus análisis y facilitar la colaboración con otros equipos.

---
<p align="center">
<a href="./06-tecnologias-y-herramientas.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 1</a> · <a href="../evaluacion/evaluacion-integradora-1.md">Ir a la Evaluación Integradora 1 ➡️</a>
</p>
