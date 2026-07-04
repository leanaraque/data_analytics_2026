# 2. Automatización de tareas repetitivas con IA

> Identificar las tareas de mayor carga repetitiva del analista y automatizarlas con IA: limpieza asistida, generación de documentación técnica y resúmenes ejecutivos.

## 1. El costo invisible de la repetición
Los estudios coinciden en un dato revelador: entre el **60% y el 80%** del tiempo del analista se dedica a **preparación y limpieza** de datos, no al análisis en sí. Cambiar formatos de fecha, estandarizar nombres, detectar duplicados, documentar: tareas necesarias que no agregan valor analítico directo.

La IA generativa es especialmente buena en este territorio porque estas tareas tienen **patrones reconocibles**: no requieren juicio estratégico, sino aplicación sistemática de reglas. Exactamente lo que los modelos de lenguaje hacen bien.

> **El tiempo liberado:** si la IA automatiza el 50% de las tareas repetitivas, no solo trabajás más rápido: liberás **capacidad cognitiva** para lo que importa (interpretar, decidir, comunicar).

## 2. Limpieza de datos asistida por IA
Casos concretos donde la IA puede asistir:
- **Detección de patrones en datos sucios:** *"En esta columna hay valores como 'N/A', 'n/a', '-', 'No aplica'. Generá un script SQL para unificarlos en NULL."*
- **Normalización de texto:** estandarizar nombres de ciudades, países o productos con variaciones tipográficas.
- **Generación de reglas de validación:** *"Estas son mis columnas y tipos. Generá constraints o queries para detectar valores fuera de rango."*
- **Transformación de formatos:** convertir fechas en formatos mixtos (`DD/MM/AAAA`, `AAAA-MM-DD`, texto) a un formato unificado.

> **La clave:** dale a la IA **muestras representativas** de los datos sucios. No describas el problema en abstracto: **mostrá ejemplos reales**.

## 3. Generación automática de documentación
Uno de los trabajos más postergados (y más valorados). La IA puede generarla desde el código existente:
- **Documentación de stored procedures:** *"Este es el código del SP. Generá un README que explique qué hace, qué parámetros recibe y qué devuelve."*
- **Diccionario de datos:** a partir de un `CREATE TABLE`, generar descripciones de cada columna en lenguaje de negocio.
- **Comentarios en código SQL:** agregar explicaciones a consultas complejas heredadas sin documentación.

> ⚠️ **Advertencia:** la IA documenta lo que el código **hace**, no lo que **debería** hacer. Si el código tiene errores de lógica, la documentación generada los **ocultará**. Revisá siempre la documentación contra el comportamiento real.

## 4. Resúmenes ejecutivos de reportes
Traducir un dashboard lleno de números en un párrafo ejecutivo claro es demandante. El flujo correcto:
1. **Describís los hallazgos clave** en bullets (vos, con tu criterio analítico).
2. Le pedís a la IA que los convierta en un **párrafo ejecutivo** para una audiencia específica (*"para el directorio"*, *"para el equipo comercial"*, *"en 3 oraciones"*).
3. **Revisás** que el tono, los números y el mensaje sean correctos.

> **El error más común** es saltear el paso 1 y pedirle a la IA que genere el resumen directamente desde los datos. Sin tu interpretación previa, el resultado es descriptivo pero **carente de insight**.

## 5. Síntesis
Automatizar **no** significa delegar el análisis: significa liberar tiempo del análisis mecánico para dedicarlo al **estratégico**. Las herramientas de ETL de M6 (Power Query, lenguaje M) trabajan en este territorio; ahora podés potenciarlas con IA para casos que la interfaz gráfica no resuelve fácilmente.

---
<p align="center">
<a href="./01-ia-como-copiloto-del-analista.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 9</a> · <a href="./03-ia-en-etl-y-power-bi.md">Siguiente ➡️</a>
</p>
