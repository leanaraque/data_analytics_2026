# 1. IA como co-piloto del analista

> Arranca el bloque de IA. El objetivo: comprender cómo la IA generativa se integra en tu flujo de trabajo — formular prompts efectivos, generar y depurar SQL, y desarrollar el criterio para validar sus resultados.

## El analista aumentado: ¿qué cambió realmente?
Hay una narrativa equivocada: *"la IA va a reemplazar a los analistas"*. La evidencia apunta al revés: la IA está **aumentando la demanda** de analistas que saben usarla. Porque alguien tiene que formular las preguntas correctas, evaluar las respuestas y tomar las decisiones.

> **La analogía del piloto automático:** maneja los controles el 90% del tiempo, pero el **piloto humano** decide el destino, gestiona las emergencias y lleva la responsabilidad del vuelo. Vos sos ese piloto.

**El cambio real** no es *qué* hace el analista, sino *cuánto* puede hacer en el mismo tiempo. Un analista que integra IA puede completar en 2 horas lo que antes le llevaba un día. Eso no elimina su rol: lo **amplifica**.

## El ciclo IA-Analista
Pensá la IA como un ciclo integrado en tu trabajo diario:
1. **Definís el problema (vos):** la IA no sabe qué pregunta responder. Eso es tu trabajo.
2. **Formulás el prompt (IA + vos):** la calidad de la instrucción determina la calidad del resultado.
3. **Ejecutás y revisás (vos):** nunca se acepta el primer output sin verificación.
4. **Iterás (IA + vos):** refinás el prompt según lo que no funcionó.
5. **Documentás (vos):** el analista es responsable del resultado final, **no** la IA.

## Prompt engineering para análisis de datos
Un buen prompt para tareas analíticas tiene **cuatro componentes**:
- **Contexto:** qué representan los datos, cuál es el esquema.
- **Objetivo:** qué querés exactamente (una consulta, una explicación, una validación).
- **Restricciones:** qué limitaciones tiene el entorno (SQL Server, PostgreSQL, sin CTEs…).
- **Formato esperado:** cómo querés la respuesta (solo el código, con comentarios, con alternativas).

**Evolución de un prompt para generar SQL:**
- ❌ **Malo:** *"Escribí una consulta SQL de ventas"* → algo genérico que no corresponde a tu esquema.
- ✅ **Bueno:** *"Tengo una tabla `VENTAS` en SQL Server con columnas: `ID_VENTA` (int), `FECHA` (date), `ID_CLIENTE` (int), `MONTO` (decimal), `REGION` (varchar). Necesito una consulta que devuelva el total de ventas por región para el último trimestre, ordenado de mayor a menor. Solo la consulta, sin explicación."*

## Generación y depuración de SQL con IA
El caso de uso más inmediato. La IA puede:
- **Generar** consultas desde una descripción en lenguaje natural.
- **Traducir** consultas entre motores (MySQL → SQL Server, PostgreSQL → BigQuery).
- **Explicar** código SQL heredado que no entendés.
- **Optimizar** consultas lentas (índices faltantes, subconsultas innecesarias).
- **Detectar** errores de sintaxis y proponer correcciones.

**Errores frecuentes que la IA comete en SQL** (y que el analista debe conocer):
- **Inventar** nombres de columnas que no existen (alucinación).
- Usar la **sintaxis del motor equivocado** (`LIMIT` en vez de `TOP` para SQL Server).
- **Ignorar NULLs** en agregaciones (`COUNT(*)` vs `COUNT(columna)`).
- Generar **JOINs incorrectos** cuando hay tablas con nombres similares.

> ⚖️ **Regla de oro:** nunca ejecutes en producción una consulta generada por IA sin haberla **leído línea por línea**. La IA puede sonar muy segura y estar completamente equivocada.

## Errores comunes y trampas conceptuales
- **Tratar la IA como un oráculo:** no "sabe" la verdad, produce texto estadísticamente plausible. La **validación es obligatoria**.
- **Omitir el contexto del esquema:** sin nombres reales de tablas y columnas, el resultado es genérico e inutilizable.
- **No iterar:** el primer prompt raramente produce el mejor resultado. El proceso es **conversacional**.
- **Dependencia sin comprensión:** si no entendés el SQL que generó, no vas a poder debuggearlo cuando falle.

## Síntesis
La IA generativa no reemplaza los fundamentos de los módulos anteriores: los **potencia**. Tu SQL (M3–M5) te permite validar lo que genera; tu modelado (M2) te permite darle el contexto correcto; tu criterio estadístico (M10) te permite detectar resultados absurdos.

---
<p align="center">
🏠 <a href="../README.md">Semana 9</a> · <a href="./02-automatizacion-de-tareas-repetitivas.md">Siguiente: Automatización de tareas repetitivas ➡️</a>
</p>
