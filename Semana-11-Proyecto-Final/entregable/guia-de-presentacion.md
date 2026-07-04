# 🎨 Guía de Presentación y Checklist Maestro

> Todo lo que necesitás para **armar y entregar** el proyecto final como un reporte profesional. Leé esto **antes** de empezar a escribir el documento.

---

## 📤 Formato de entrega

La entrega se realiza mediante un **único enlace de Google Docs**. Una vez finalizado el trabajo, integrá **capturas de pantalla** que demuestren lo desarrollado, de modo que el evaluador pueda comprender **todo el proceso mirando solo el documento**, sin acceder a cada herramienta.

La presentación debe funcionar como un **reporte visual del análisis**, combinando:
- **Explicaciones** (texto claro y conciso).
- **Gráficos** y visualizaciones (capturas del dashboard).
- **Resultados** (tablas, métricas, hallazgos).
- **Consultas SQL** (capturas desde la herramienta).

### ⚠️ Reglas de entrega (¡no las pases por alto!)
- [ ] Solo se permite **un único enlace** de entrega.
- [ ] El enlace permite **visualización pública** o acceso para revisión.
- [ ] **Todo** el contenido necesario está **dentro** de la presentación.
- [ ] **No** se incluyen enlaces externos para acceder a partes del análisis.
- [ ] El evaluador puede comprender el análisis **únicamente** a partir de la presentación.

> 💡 **Tip de oro:** antes de entregar, abrí tu enlace en una **ventana de incógnito** (sin tu sesión). Si podés verlo ahí, el evaluador también podrá. Es el error de entrega más frecuente.

---

## 🗂️ Estructura recomendada de la presentación (7 secciones)

Organizá tu documento como un **reporte de análisis de datos**. Cada sección debe incluir **capturas relevantes** de lo realizado, junto con una **breve explicación** de los resultados.

### 1. Contexto del problema (pregunta de negocio)
Abrí con la **pregunta estratégica** que resolvés. Debe ser **diagnóstica y accionable**, no descriptiva.
- ❌ *"¿Cuánto vendimos?"* → ✅ *"¿Por qué cayeron las ventas en la región X y qué categoría lo explica?"*
- Presentá el contexto del negocio y por qué esta pregunta importa.
> 🔗 *Es el brief que aprendiste a definir en [S1](../../Semana-01-Introduccion-al-Analisis-de-Datos/).*

### 2. Descripción del dataset y fuentes
Explicá **de dónde vienen los datos** (Kaggle, Excel provisto…), qué **representan**, cuántas filas/columnas y qué **entidades** contienen (ventas, clientes, productos…).
> 🔗 *Distinguí base de datos vs. dataset como en [S2](../../Semana-02-Modelos-y-Disenos-de-Bases-de-Datos/material/07-base-de-datos-vs-dataset.md).*

### 3. Análisis Exploratorio de Datos (EDA)
Mostrá tu primer contacto con los datos: **estadística descriptiva** (media, mediana, moda), **dispersión** y **detección de outliers**. ¿La media representa al grupo o está inflada por valores extremos?
> 🔗 *Aplicá lo de [S10 · Estadística](../../Semana-10-Medidas-de-Tendencia-Central-Estadistica-y-Publicacion-de-Dashboard/). Recordá: media + desviación estándar = la foto completa.*

### 4. Modelo de datos y consultas SQL
Incluí tu **diagrama ER** (entidades, PK/FK, relaciones 1:N) y las **consultas SQL** clave con captura de resultados. Explicá qué responde cada consulta.
> 🔗 *Modelado de [S2](../../Semana-02-Modelos-y-Disenos-de-Bases-de-Datos/) y [S8](../../Semana-08-Modelado-Analitico-y-Calculos-Avanzados-con-DAX/); SQL de [S3–S5](../../Semana-03-Introduccion-a-SQL-y-Sublenguajes/).*

### 5. Transformación y limpieza (Power Query)
Documentá los **pasos de limpieza**: tipos de datos corregidos, nulos y duplicados tratados, columnas renombradas, merges/appends. Mostrá el "antes y después".
> 🔗 *Pipeline ETL de [S6](../../Semana-06-Introduccion-a-Power-BI-y-Transformacion-de-Datos/). Recordá: "Garbage In, Garbage Out".*

### 6. Dashboard y visualizaciones (Power BI)
Presentá tu **dashboard** con capturas. Explicá por qué elegiste cada gráfico y cómo la **jerarquía visual** guía la lectura. Mostrá tus **KPIs/medidas DAX**.
> 🔗 *Diseño y storytelling de [S7](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/); medidas DAX de [S8](../../Semana-08-Modelado-Analitico-y-Calculos-Avanzados-con-DAX/).*

### 7. Conclusiones e *insights*
Cerrá con los **hallazgos accionables** y una **recomendación** concreta para el negocio. No termines en números: terminá en *"¿y ahora qué hacemos con esta información?"*.
> 🔗 *El "So what?" de [S7](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/material/04-storytelling-con-datos.md).*

---

## ✅ Checklist maestro del Proyecto Final

**Sección 1 — Teoría**
- [ ] Respondidas las **4 preguntas** teóricas, con justificación y ejemplos.

**Sección 2 — Práctica**
- [ ] **Ejercicio 1:** consulta SQL (captura) + explicación de tablas/columnas usadas.
- [ ] **Ejercicio 2:** diagrama ER de clientes-productos-ventas + descripción de entidades y relaciones.
- [ ] **Ejercicio 3:** tipo(s) de gráfico elegidos + estructura de la narrativa.

**Reporte de análisis (7 secciones)**
- [ ] 1. Contexto del problema (pregunta de negocio diagnóstica).
- [ ] 2. Descripción del dataset y fuentes.
- [ ] 3. Análisis exploratorio (EDA con estadística).
- [ ] 4. Modelo de datos y consultas SQL.
- [ ] 5. Transformación y limpieza (Power Query).
- [ ] 6. Dashboard y visualizaciones (Power BI).
- [ ] 7. Conclusiones e *insights* con recomendación.

**Hilo conductor y calidad**
- [ ] Hay un **hilo conductor** desde la primera consulta hasta el último gráfico (nada de silos).
- [ ] Todos los pasos de **limpieza** están documentados.
- [ ] Las conclusiones tienen **contexto de negocio** (no números sueltos).

**Entrega**
- [ ] **Un único** enlace de Google Docs.
- [ ] Acceso **público / para revisión** verificado en incógnito.
- [ ] Todo el contenido **dentro** del documento (sin enlaces externos).

---

<p align="center">
🎓 <strong>¡Felicitaciones por llegar hasta acá!</strong><br>
Integraste SQL, ETL, modelado, DAX, visualización, IA y estadística en un proyecto real.<br>
Este no es el fin de tu aprendizaje, sino <strong>el comienzo de tu carrera profesional</strong>.
</p>

---
<p align="center">
<a href="./seccion-2-ejercicios-practicos.md">⬅️ Sección 2</a> · 🏠 <a href="../README.md">Semana 11</a> · <a href="../../README.md">Índice del curso</a>
</p>
