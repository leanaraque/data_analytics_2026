# Semana 8 — Modelado Analítico y Cálculos Avanzados con DAX

> Cierra el bloque de Power BI. Antes de escribir una sola medida, el **modelo** tiene que estar bien construido; después le das **inteligencia** con DAX. Es el esquema en estrella de M2 y M6, ahora con el foco en el cálculo.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Configurar **relaciones 1:N** correctas y un **esquema en estrella** robusto.
- Decidir entre **medida** y **columna calculada** según el caso.
- Escribir cálculos con **DAX**: agregaciones, iteradores (`SUMX`) y la función clave **`CALCULATE`**.
- Distinguir **contexto de fila** de **contexto de filtro**.
- Crear una **tabla calendario** y usar **inteligencia de tiempo** (YTD, YoY).
- Optimizar medidas con **variables (`VAR`)** y depurarlas con **DAX Studio**.

## 📚 Temario y material

| # | Unidad | Material |
|---|--------|----------|
| 1 | Relaciones 1:N y esquema estrella en el modelo | [📄 Leer](./material/01-relaciones-1n-y-esquema-estrella.md) |
| 2 | Medidas vs. columnas calculadas | [📄 Leer](./material/02-medidas-vs-columnas-calculadas.md) |
| 3 | DAX fundamental: `CALCULATE`, contexto e iteradores (`SUMX`) | [📄 Leer](./material/03-dax-fundamental-calculate-iteradores.md) |
| 4 | Organizar el modelo: tabla de medidas y tabla calendario | [📄 Leer](./material/04-tabla-de-medidas-y-calendario.md) |
| 5 | Inteligencia de tiempo: comparativas YoY y acumulados YTD | [📄 Leer](./material/05-inteligencia-de-tiempo-yoy-ytd.md) |
| 6 | 📖 *Avanzado:* Optimización con variables y DAX Studio | [📄 Leer](./material/06-optimizacion-variables-y-dax-studio.md) |
| 7 | 📖 *Avanzado:* Funciones DAX avanzadas (`IF`, `SWITCH`) | [📄 Leer](./material/07-funciones-dax-avanzadas.md) |

> 🔗 **Puente:** el modelo 1:N viene de M2/M6; las medidas que creás acá alimentan las visualizaciones de M7 y el proyecto final de M11.

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M8 — Checkpoint 2: Modelo de datos + tabla de medidas core** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** Le das **inteligencia** al `.pbix` limpio de M6: creás las **relaciones 1:N**, la **tabla calendario** y **5 medidas DAX** fundamentales que van a alimentar todos tus reportes.

**Lo que tiene que tener tu `.pbix`:**

| Requisito | Detalle |
|-----------|---------|
| Esquema en estrella | 4 relaciones **1:N** con dirección **única** |
| Tabla calendario | `Dim_Fechas` marcada como tabla de fechas |
| Tabla de medidas | `_Medidas` (con ícono de calculadora) |
| 5 medidas DAX | Base (`SUM`), `CALCULATE`, `TOTALYTD`, `SAMEPERIODLASTYEAR`, y `VAR`+`DIVIDE` |
| Validación | Matriz que confirme YTD acumulado y LY del año anterior |

**¿Qué entregás?** El **enlace a tu repositorio GitHub público** con `Apellido_Nombre_Checkpoint2.pbix`.

> 🔗 Este `.pbix` es el **punto de partida del proyecto integrador de M11**. Sin modelo y medidas correctas, no vas a poder responder las preguntas de la evaluación final.

---

## 📂 Contenido de la carpeta
```
Semana-08-.../
├── README.md            → esta guía
├── material/            → las 7 unidades teóricas
└── entregable/          → consigna del Checkpoint 2 (M8)
```

---
<p align="center">
<a href="../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/">⬅️ Semana 7</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-09-IA-Aplicada-al-Trabajo-del-Analista-de-Datos/">Semana 9 ➡️</a>
</p>
