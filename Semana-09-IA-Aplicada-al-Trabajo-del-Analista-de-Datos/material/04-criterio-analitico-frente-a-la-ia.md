# 4. Criterio analítico frente a la IA

> Desarrollar el criterio profesional para **evaluar y presentar** trabajo asistido por IA: cuándo confiar, cuándo escalar la validación, cómo comunicar el uso de IA y cómo evitar los errores de credibilidad más comunes.

## 1. La alucinación como riesgo profesional
Los modelos de lenguaje generan texto **estadísticamente plausible**, no verificablemente correcto. En análisis de datos, esto se manifiesta como:
- **Cifras inventadas:** "análisis" con números que suenan razonables pero no tienen fuente.
- **Correlaciones falsas:** patrones que son artefactos estadísticos, no relaciones reales.
- **Referencias inexistentes:** estudios o benchmarks que no existen para respaldar una conclusión.

El riesgo es claro: si presentás a la dirección un análisis con una cifra inventada por la IA, **la responsabilidad es tuya**, no de la herramienta. El analista es el autor; la IA es el borrador.

> ⚖️ **El estándar profesional:** ningún número que no puedas rastrear hasta su fuente de datos original debería aparecer en un reporte que firma tu nombre.

## 2. Cuándo confiar y cuándo escalar la validación
No toda interacción requiere el mismo nivel de verificación:

| Nivel | Tareas | Validación |
|-------|--------|------------|
| **Alta confianza** | Transformaciones de formato, código boilerplate, documentación simple | Verificar que **se ejecute sin error** |
| **Confianza media** | Consultas SQL con JOINs/agregaciones, medidas DAX, scripts de limpieza | Comparar con un **sample calculado manualmente** |
| **Baja confianza** | Análisis estadísticos, interpretaciones de tendencias, benchmarks | **Cada cifra** debe trazarse hasta la fuente |

## 3. Cómo comunicar el uso de IA a stakeholders
La respuesta profesional no es **ocultar** el uso ni **sobredimensionarlo**: es comunicar el **proceso**.
- *"Usé IA para generar el borrador de la consulta SQL, que luego revisé y validé contra los datos de producción."*
- *"El resumen ejecutivo fue generado con asistencia de IA a partir de los hallazgos que identifiqué. Todos los números fueron verificados manualmente."*

> Esta transparencia **no debilita** tu trabajo: lo **fortalece**. Muestra que sabés usar las herramientas de manera responsable.

## 4. El analista como árbitro final
Hay decisiones que la IA no puede tomar y que definen el valor real del analista:
- **Relevancia de negocio:** ¿este hallazgo importa para las decisiones de **esta** organización?
- **Contexto histórico:** ¿hay factores externos (una pandemia, un cambio regulatorio) que explican el patrón mejor que los datos solos?
- **Responsabilidad ética:** ¿este análisis podría usarse para perjudicar a personas o grupos?
- **Comunicación empática:** ¿cómo presentar este hallazgo a alguien que puede sentir que los datos lo cuestionan?

> Ninguna de estas preguntas tiene respuesta técnica. Son preguntas **humanas** que requieren juicio profesional.

## 5. Síntesis del módulo: el analista aumentado
Empezaste aprendiendo a escribir mejores prompts. Lo terminás con algo más valioso: un **marco de criterio profesional** para integrar la IA sin perder la responsabilidad sobre los resultados.

> La combinación **SQL sólido + modelado correcto + ETL confiable + DAX preciso + visualización efectiva + criterio estadístico + IA como multiplicador** es el perfil del analista de datos que el mercado busca en 2026. Ese es el perfil que este curso te ayudó a construir.

---
<p align="center">
<a href="./03-ia-en-etl-y-power-bi.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 9</a> · <a href="./05-material-complementario.md">Siguiente ➡️</a>
</p>
