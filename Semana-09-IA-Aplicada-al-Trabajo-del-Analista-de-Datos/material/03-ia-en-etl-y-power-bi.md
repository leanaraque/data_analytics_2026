# 3. IA en el flujo ETL y Power BI

> Integrar la IA en el pipeline completo: desde la asistencia en transformaciones de Power Query hasta el uso avanzado de **Copilot** para acelerar reportes y narrativas.

## 1. IA en el proceso ETL: más allá de la interfaz gráfica
En M6 aprendiste Power Query con su interfaz visual, que resuelve el **80%** de los casos. El otro **20%** involucra transformaciones complejas donde la interfaz se queda corta y el lenguaje M puede intimidar. **La IA es el puente.**

Casos donde la IA potencia el ETL:
- **Generar funciones M personalizadas:** *"Tengo 50 archivos Excel con la misma estructura en carpetas distintas. Generá una función M que los consolide dinámicamente en Power Query."*
- **Depurar pasos rotos:** cuando una transformación falla con un error críptico, pegar el mensaje de error y el código M en la IA suele resolverlo en segundos.
- **Traducir lógica SQL a M:** si ya tenés la transformación en SQL, la IA la convierte al equivalente en lenguaje M.

## 2. Copilot en Power BI: uso avanzado
En M7 viste la introducción a Copilot. Acá profundizamos en los patrones de mayor valor:

### 2.1 Generación de páginas contextualizadas
La diferencia entre un prompt básico y uno efectivo es el **contexto de negocio**:
- ❌ **Básico:** *"Crea una página de ventas."*
- ✅ **Avanzado:** *"Crea una página de análisis de performance comercial para el equipo de ventas. Necesito ver: (1) total de ventas del mes vs. el mismo mes del año anterior, (2) ranking de los 10 mejores vendedores por margen (no por volumen), (3) un mapa de calor de ventas por región. El público es el gerente comercial que toma decisiones semanales. Usá colores corporativos: azul (#2563EB) y gris (#6B7280)."*

### 2.2 Narrativas automáticas y su validación
Copilot genera narrativas que resumen los hallazgos. El proceso profesional de validación:
1. **Pedís** la narrativa a Copilot.
2. **Verificás** cada cifra contra las fuentes originales (DAX Debugger, tabla subyacente).
3. **Editás** el tono y la especificidad según la audiencia.

> ⚠️ **Error frecuente:** Copilot puede describir tendencias que **no** son estadísticamente significativas o que dependen de un **outlier**. Aplicá el criterio estadístico de M10 antes de comunicar un hallazgo como conclusión.

### 2.3 Asistencia en DAX con IA
El flujo recomendado con cualquier herramienta de IA:
1. **Describís** en lenguaje natural el cálculo que necesitás (incluí el esquema de tablas relevantes).
2. **Pedís** la medida DAX con comentarios explicativos.
3. **Probás** la medida en DAX Studio comparando con un cálculo manual de referencia.
4. **Ajustás** si hay discrepancias, documentando la lógica final.

## 3. Límites reales de la IA en el ecosistema Power BI
Conocer los límites es tan importante como conocer las capacidades:
- **No accede a tus datos reales:** Copilot trabaja con los **metadatos** del modelo, no con el dato en sí. Sus análisis son sobre la **estructura**, no sobre los valores.
- **No reemplaza el modelado:** si las relaciones entre tablas están mal, ninguna IA lo corrige. El modelo limpio es **tu** responsabilidad.
- **No conoce tu contexto de negocio:** puede generar una medida técnicamente correcta pero **conceptualmente incorrecta** para tu empresa.

## 4. Síntesis
Este módulo cierra el **ciclo técnico** del curso: SQL extrae (M3–M5), Power Query transforma (M6), DAX calcula (M8), Power BI comunica (M7). **La IA potencia cada uno de esos pasos.**

---
<p align="center">
<a href="./02-automatizacion-de-tareas-repetitivas.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 9</a> · <a href="./04-criterio-analitico-frente-a-la-ia.md">Siguiente ➡️</a>
</p>
