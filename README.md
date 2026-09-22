# Data Analytics — Coderhouse (V2)

Repositorio oficial del curso **Data Analytics** de Coderhouse. Aquí se comparte, **semana a semana**, todo el material que se imparte en clase: teoría, ejemplos, ejercicios, datasets y recursos complementarios.

> **Objetivo del curso:** formar analistas de datos capaces de extraer, transformar, modelar, visualizar y comunicar información para la toma de decisiones, usando SQL, Power BI, DAX, estadística e inteligencia artificial aplicada.

---

## Programa del curso

| # | Semana | Tema | Estado |
|---|--------|------|:------:|
| 1 | [Semana 1](./Semana-01-Introduccion-al-Analisis-de-Datos/) | Introducción al Análisis de Datos | Publicada |
| 2 | [Semana 2](./Semana-02-Modelos-y-Disenos-de-Bases-de-Datos/) | Modelos y Diseños de Bases de Datos | Publicada |
| 3 | [Semana 3](./Semana-03-Introduccion-a-SQL-y-Sublenguajes/) | Introducción a SQL y Sublenguajes | Publicada |
| 4 | [Semana 4](./Semana-04-Sintaxis-SQL-y-Manipulacion-de-Datos/) | Sintaxis SQL y Manipulación de Datos | Publicada |
| 5 | [Semana 5](./Semana-05-Consultas-SQL-con-Join-y-Union/) | Consultas SQL con Join y Union | Publicada |
| 6 | [Semana 6](./Semana-06-Introduccion-a-Power-BI-y-Transformacion-de-Datos/) | Introducción a Power BI y Transformación de Datos | Publicada |
| 7 | [Semana 7](./Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/) | Visualización de Datos y Storytelling con Power BI | Publicada |
| 8 | [Semana 8](./Semana-08-Modelado-Analitico-y-Calculos-Avanzados-con-DAX/) | Modelado Analítico y Cálculos Avanzados con DAX | Publicada |
| 9 | [Semana 9](./Semana-09-IA-Aplicada-al-Trabajo-del-Analista-de-Datos/) | IA Aplicada al Trabajo del Analista de Datos | Publicada |
| 10 | [Semana 10](./Semana-10-Medidas-de-Tendencia-Central-Estadistica-y-Publicacion-de-Dashboard/) | Medidas de Tendencia Central, Estadística y Publicación de Dashboard | Publicada |
| 11 | [Semana 11](./Semana-11-Proyecto-Final/) | Proyecto Final | Publicada |

**Leyenda de estado:** En preparación / En curso / Publicada

> **¡Las 11 semanas están publicadas!** El programa completo está disponible, de los fundamentos al proyecto integrador final.

---

## Cómo está organizado el repositorio

Cada semana vive en su propia carpeta (`Semana-XX-...`) y sigue una estructura común:

```
Semana-XX-Nombre-del-Tema/
├── README.md          → Guía de la semana: objetivos, temario y entregable
├── material/          → Las unidades teóricas, numeradas (01-…, 02-…)
├── ejercicios/        → Prácticas guiadas, scripts y repasos (si la semana los tiene)
├── evaluacion/        → Quizzes / autoevaluaciones (si la semana los tiene)
└── entregable/        → Consigna del entregable evaluable de la semana
```

> Todas las semanas tienen `README.md`, `material/` y `entregable/`. Las carpetas `ejercicios/` y `evaluacion/` aparecen solo en las semanas que las incluyen.

Además, en la raíz conviven dos carpetas transversales:

| Carpeta | Qué contiene |
|---------|--------------|
| [`recursos/`](./recursos/) | Material transversal a todo el curso: la [base de datos del proyecto integrador](./recursos/base-de-datos/) (`RetailPro_DB`, SQL Server) y el [material oficial del examen final](./recursos/ejemplo-examen-final/) (dataset, scripts y ejemplo de entrega). |
| [`documentacion/`](./documentacion/) | Desarrollo propio de los entregables del proyecto RetailPro, semana a semana, con sus diagramas en [`assets/`](./documentacion/assets/). |

---

## Cómo usar este repositorio

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/leanaraque/data_analytics_2026.git
   ```
2. **Entrar a la carpeta de la semana** que estés cursando y abrir su `README.md`.
3. **Mantenerlo actualizado** cada semana con:
   ```bash
   git pull
   ```

---

## Herramientas del curso

- **SQL** — **SQL Server** (SSMS) como motor principal del curso; los scripts del proyecto final vienen también en versión **MySQL / Workbench**.
- **Power BI Desktop** — transformación (Power Query), modelado y visualización.
- **DAX** — cálculos y medidas avanzadas.
- **Estadística aplicada** — medidas de tendencia central y dispersión.
- **IA aplicada** — asistentes y herramientas para el analista de datos.

---

## Convenciones del repositorio

Las reglas de escritura y de trabajo con git están en [`CLAUDE.md`](./CLAUDE.md). Las dos que no se negocian: **sin emojis** en la documentación y **sin atribución a herramientas de IA** en los commits.

---

## Contribuciones y dudas

Este es un repositorio educativo. Si encontrás un error o tenés una sugerencia, podés abrir un *issue*. Las dudas de clase se canalizan por los medios oficiales de Coderhouse.

---

<p align="center">
  Hecho con para la comunidad de <strong>Coderhouse — Data Analytics</strong>
</p>
