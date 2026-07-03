# ✅ Evaluación Integradora 1

Evalúa tu comprensión de los conceptos fundamentales de la **Semana 1**, cubriendo desde la distinción entre datos e información hasta los roles y herramientas de la industria.

| | |
|---|---|
| 📊 **Preguntas** | 6 |
| ✅ **Nota de aprobación** | 70% |
| 🔄 **Intentos** | 3 |

> 💡 Intentá responder por tu cuenta antes de abrir la explicación de cada pregunta.

---

### Pregunta 1
Eres contratado por una tienda de e-commerce que quiere saber por qué bajaron sus ventas el mes pasado. Según el proceso estándar de análisis, ¿cuál debería ser tu **primer paso**?

- A. Limpiar y organizar el dataset para eliminar errores.
- B. Entender el objetivo del negocio y definir la pregunta de investigación.
- C. Crear gráficos interactivos en Power BI o Tableau.
- D. Recolectar la mayor cantidad de datos posible de todas las fuentes disponibles.

<details><summary>Ver respuesta y explicación</summary>

**Respuesta correcta: B.**

El análisis de datos no comienza con los datos, sino con una **pregunta de negocio**. Antes de recolectar o limpiar nada, necesitás saber *por qué* lo hacés. **Entender el objetivo** es el primer paso según marcos como CRISP-DM, porque define qué datos necesitás.
- Limpiar los datos (A) es fundamental pero ocurre después de tenerlos.
- Crear visualizaciones (C) es de las etapas finales para comunicar hallazgos.
- Recolectar datos (D) es el segundo paso, una vez definido el objetivo.
</details>

---

### Pregunta 2
Un reporte mensual que muestra que el promedio de ventas por cliente fue de $50 USD durante el año 2024 es un ejemplo de:

- A. Análisis Descriptivo.
- B. Análisis Inferencial.
- C. Análisis Predictivo.
- D. Análisis Prescriptivo.

<details><summary>Ver respuesta y explicación</summary>

**Respuesta correcta: A.**

El **Análisis Descriptivo** responde a la pregunta *"¿Qué pasó?"*. Es como mirar una fotografía del pasado: el resumen de ventas del año anterior describe hechos históricos.
- El **Inferencial** (B) hace predicciones o generalizaciones sobre una población mayor a partir de una muestra.
- El **Predictivo** (C) usa modelos para decir qué pasará en el futuro.
- El **Prescriptivo** (D) sugiere qué acciones tomar para obtener un resultado.
</details>

---

### Pregunta 3
¿Cuál de los siguientes es un ejemplo de **datos cualitativos**?

- A. Las temperaturas registradas en una ciudad durante una semana.
- B. Las reseñas de texto donde los clientes describen su experiencia con un producto.
- C. El número de habitantes en diferentes provincias de un país.
- D. El precio de cierre de las acciones en la bolsa de valores.

<details><summary>Ver respuesta y explicación</summary>

**Respuesta correcta: B.**

Los datos **cualitativos** describen cualidades o categorías que no se miden con números, sino con etiquetas (como sentimientos o nombres). Las reseñas de texto son el ejemplo perfecto.
- Temperaturas (A), número de habitantes (C) y precios (D) son **cuantitativos** (cantidades).

**Tip:** 'Cualitativo' viene de 'Cualidad'.
</details>

---

### Pregunta 4
Tienes un dataset con los salarios de 5 empleados: `[$10k, $12k, $15k, $18k, $1.000.000]`. ¿Qué métrica deberías usar para describir el "salario típico" sin que el resultado sea engañoso?

- A. El Promedio (Media), porque incluye todos los datos en el cálculo.
- B. La Mediana, porque no se ve afectada por el salario extremadamente alto.
- C. La Moda, para ver cuántos empleados ganan exactamente lo mismo.
- D. La Suma Total, para saber cuánto gasta la empresa en total.

<details><summary>Ver respuesta y explicación</summary>

**Respuesta correcta: B.**

En datos con **valores extremos (outliers)**, la **Mediana** es mucho más confiable que el promedio.
- El salario de $1.000.000 "jala" el promedio hacia arriba (~$250k), dando la falsa impresión de que todos ganan mucho.
- La mediana se queda en el valor central ($15k), que representa mucho mejor la realidad de la mayoría.
- La moda solo diría el salario más repetido, poco útil si todos son distintos.
</details>

---

### Pregunta 5
¿Cuál es la diferencia fundamental entre una "Base de Datos" y un "Dataset"?

- A. Un dataset siempre es más grande que una base de datos.
- B. La base de datos es un archivo Excel, mientras que el dataset es un servidor.
- C. La base de datos es un sistema estructurado para gestionar datos; el dataset es una colección específica de datos extraída para ser analizada.
- D. No hay diferencia; son términos sinónimos en la industria.

<details><summary>Ver respuesta y explicación</summary>

**Respuesta correcta: C.**

Una **base de datos** es un sistema dinámico para almacenar y gestionar grandes volúmenes de datos que cambian constantemente. Un **dataset** suele ser una "foto" o extracción estática de esos datos (un Excel o CSV) lista para un análisis específico.
- A es incorrecta: un dataset puede tener millones de filas.
- B está al revés de la realidad.
- D es un error común: las bases de datos son el origen de la verdad para un analista.
</details>

---

### Pregunta 6 · *(Selección múltiple)*
Selecciona las **DOS** herramientas que se consideran fundamentales para el trabajo diario de un Analista de Datos junior:

- A. SQL para la extracción y manipulación de datos.
- B. Power BI o Tableau para la visualización y reportes.
- C. HTML y CSS para la creación de la estructura del reporte.
- D. Adobe Photoshop para la edición estética de los gráficos.

<details><summary>Ver respuesta y explicación</summary>

**Respuestas correctas: A y B.**

El analista de datos moderno necesita un "stack" equilibrado:
- **SQL** es el lenguaje universal para hablar con las bases de datos (extraer datos).
- **Power BI / Tableau** son las herramientas líderes para crear dashboards e informar hallazgos.

HTML/CSS es para desarrollo web y Photoshop para diseño gráfico: no son herramientas *principales* de análisis de datos.
</details>

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 1</a> · <a href="../entregable/README.md">Ir al entregable (M1) ➡️</a>
</p>
