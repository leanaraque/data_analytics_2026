# 📝 Sección 1 — Preguntas Teóricas

> 4 preguntas que cubren conceptos clave del programa. Enfocadas en **recordar y analizar** los fundamentos de análisis de datos, bases de datos, SQL, modelado y visualización.

**Cómo responder:** desarrollá cada respuesta con tus palabras, justificando y (cuando ayude) con un ejemplo concreto. Debajo de cada pregunta tenés una **guía de qué debe incluir una respuesta completa** y un enlace al material del curso para repasar. La guía **no es la respuesta**: es el mapa de los puntos que no pueden faltar.

---

## Pregunta 1
> **¿Cuál es la diferencia fundamental entre datos e información y por qué es importante para la toma de decisiones?**

<details><summary>🧭 Guía de qué debe incluir tu respuesta</summary>

- **Datos:** hechos/registros **en bruto**, sin significado por sí solos (la materia prima).
- **Información:** datos **procesados, organizados y contextualizados** que adquieren significado y son útiles para decidir.
- El rol del **contexto, la calidad y la agregación** para transformar datos en información.
- **Por qué importa:** decisiones basadas en información confiable (y no en números aislados) reducen la incertidumbre y mejoran resultados. Un ejemplo del tipo *"cifra de ventas sin contexto"* vs. *"ventas por región y temporada"*.

📖 Repasá: [S1 · Datos vs. Información](../../Semana-01-Introduccion-al-Analisis-de-Datos/material/01-datos-vs-informacion.md)
</details>

---

## Pregunta 2
> **Enumerá y describí brevemente los sublenguajes de SQL y su función principal.**

<details><summary>🧭 Guía de qué debe incluir tu respuesta</summary>

Los **cuatro sublenguajes** con su función y al menos un comando de ejemplo:
- **DDL** (Data Definition Language): define/modifica la **estructura** → `CREATE`, `ALTER`, `DROP`.
- **DML** (Data Manipulation Language): manipula el **contenido** → `INSERT`, `UPDATE`, `DELETE`, `SELECT`.
- **DCL** (Data Control Language): controla **permisos y accesos** → `GRANT`, `REVOKE`.
- **TCL** (Transaction Control Language): gestiona **transacciones** → `COMMIT`, `ROLLBACK`.

Bonus: un ejemplo del flujo real (crear tabla → insertar cliente → dar acceso a un analista → confirmar cambios).

📖 Repasá: [S3 · SQL para analistas](../../Semana-03-Introduccion-a-SQL-y-Sublenguajes/material/01-introduccion-a-sql.md)
</details>

---

## Pregunta 3
> **Explicá cómo la inteligencia artificial puede complementar el análisis de datos en un entorno empresarial.**

<details><summary>🧭 Guía de qué debe incluir tu respuesta</summary>

- La IA como **co-piloto / multiplicador**, no como sustituto (analogía del piloto automático).
- Casos concretos: **generar y depurar SQL**, automatizar **limpieza** y **documentación**, asistir en **DAX** y en **Copilot** para narrativas.
- El límite clave: la IA produce texto **estadísticamente plausible**, no verdad → la **validación es obligatoria** (riesgo de *alucinación*).
- El **criterio y la responsabilidad** siguen siendo del analista: *"la IA es el borrador, vos sos el autor"*.

📖 Repasá: [S9 · IA como co-piloto](../../Semana-09-IA-Aplicada-al-Trabajo-del-Analista-de-Datos/material/01-ia-como-copiloto-del-analista.md) y [S9 · IA en ETL y Power BI](../../Semana-09-IA-Aplicada-al-Trabajo-del-Analista-de-Datos/material/03-ia-en-etl-y-power-bi.md)
</details>

---

## Pregunta 4
> **¿Qué principios básicos del storytelling aplicado a datos son esenciales para crear narrativas visuales efectivas?**

<details><summary>🧭 Guía de qué debe incluir tu respuesta</summary>

- Los **3 pilares:** Datos (la verdad, limpios y con contexto) + Visualizaciones (la lente adecuada) + Narrativa (el hilo conductor).
- La diferencia entre **dato** e ***insight*** (conectar puntos y proponer una acción).
- Técnicas: **jerarquía visual** (patrón Z), **color estratégico** para resaltar, **títulos probativos**, **comparativas** obligatorias (vs. meta o año anterior).
- Una **estructura narrativa** (ej. Contexto → Problema → Solución) y la pregunta *"So what?"* (¿qué decisión permite tomar cada gráfico?).

📖 Repasá: [S7 · Storytelling con datos](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/material/04-storytelling-con-datos.md) y [S7 · Principios de diseño](../../Semana-07-Visualizacion-de-Datos-y-Storytelling-con-Power-BI/material/01-principios-de-diseno-y-jerarquia-visual.md)
</details>

---
<p align="center">
🏠 <a href="../README.md">Semana 11</a> · <a href="./seccion-2-ejercicios-practicos.md">Siguiente: Sección 2 — Ejercicios Prácticos ➡️</a>
</p>
