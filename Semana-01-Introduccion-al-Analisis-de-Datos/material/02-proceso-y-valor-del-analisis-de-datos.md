# 2. El proceso y valor del análisis de datos

> Ya sabés qué son los datos y la información. Ahora entendés cómo se convierten en decisiones.

## El ciclo de vida del análisis de datos: de la pregunta a la decisión

Imaginá que sos el dueño de una pequeña cadena de cafeterías. Notás que, aunque tenés muchos clientes, las ganancias no crecen como esperabas. Tenés montañas de tickets de venta, registros de inventario y horarios de empleados. Tenés **datos**, pero no tenés **respuestas**.

¿Qué productos se venden más los martes? ¿Estamos perdiendo dinero por desperdicio de leche? ¿Deberíamos cerrar una hora antes o abrir una hora después?

El análisis de datos no se trata de usar fórmulas complejas o software costoso; se trata de **resolver problemas de negocio usando evidencia**.

## 1. El marco mental: ¿por qué analizamos datos?
El análisis de datos existe para **reducir la incertidumbre**.

En el pasado, muchas decisiones se tomaban por "instinto" o por la opinión de la persona con el salario más alto (lo que en la industria llamamos el **HiPPO**: *Highest Paid Person's Opinion*). El análisis de datos democratiza la toma de decisiones, permitiendo que sea la **realidad de los hechos** la que guíe el camino.

### El flujo de valor
El valor no está en el dato en sí, sino en la **acción** que provoca:

1. **Datos:** los hechos crudos → *"Venta: 1 Capuchino, $4.50, 10:15 AM"*.
2. **Información:** datos organizados con contexto → *"El 70% de las ventas de capuchino ocurren antes de las 11 AM"*.
3. **Conocimiento:** patrones extraídos de la información → *"Los clientes de la mañana prefieren bebidas calientes; los de la tarde, snacks fríos"*.
4. **Sabiduría / Acción:** aplicar el conocimiento para decidir → *"Crear un combo de café y muffin solo para el turno mañana para subir el ticket promedio"*.

## 2. El proceso de análisis, paso a paso
Un error común de los principiantes es saltar directo a "jugar con los datos". Un analista profesional sigue un proceso estructurado. Aunque existen metodologías famosas como **CRISP-DM**, para fines prácticos lo dividimos en cinco etapas:

### A. Definición del problema (la etapa más crítica)
Si hacés la pregunta equivocada, obtendrás la respuesta correcta a un problema que no importa.
- ❌ **Mal planteamiento:** *"¿Cuántas ventas tuvimos?"* (métrica de vanidad, no resuelve nada).
- ✅ **Buen planteamiento:** *"¿Por qué las ventas de la sucursal Centro cayeron un 15% respecto al mes pasado?"*

### B. Recolección y preparación
Aquí vive el **80% del tiempo** de un analista. Los datos del mundo real están "sucios": nombres mal escritos, fechas en formatos distintos, valores faltantes.
> **Ejemplo:** en un dataset de clientes podrías encontrar "Juan Pérez", "juan perez" y "J. Perez". Para el análisis deben normalizarse en una sola identidad.

### C. Análisis Exploratorio de Datos (EDA)
Es la fase de "conocer" el dataset. Buscamos:
- **Tendencias:** ¿las ventas suben o bajan con el tiempo?
- **Valores atípicos (outliers):** ¿hubo un día con ventas 500% mayores? ¿Error de sistema o promoción?
- **Correlaciones:** ¿cuando sube la temperatura, bajan las ventas de café caliente? (Probablemente sí).

### D. Interpretación y comunicación
Aquí el analista se convierte en **contador de historias (storyteller)**. No entregás una tabla de Excel con 10.000 filas; entregás un gráfico que muestra claramente el hallazgo principal.

### E. Acción
El análisis termina cuando se **toma una decisión** basada en tus hallazgos. Si después de tu reporte no cambia nada, fue un ejercicio académico, no profesional.

## 3. Análisis descriptivo vs. diagnóstico

| Tipo de análisis | Pregunta que responde | Ejemplo en retail |
|------------------|-----------------------|-------------------|
| **Descriptivo** | ¿Qué pasó? | "El mes pasado vendimos 500 unidades de chocolate." |
| **Diagnóstico** | ¿Por qué pasó? | "Las ventas de chocolate subieron por una ola de frío y un cupón de descuento." |

> **Error común:** muchos analistas se quedan solo en lo descriptivo ("Las ventas bajaron"). Un analista de alto valor dice: *"Las ventas bajaron porque el tiempo de espera en caja subió de 2 a 5 minutos y los clientes abandonaron la fila."*

## 4. Casos reales: el impacto del análisis

### Caso 1 — Optimización de inventario en un supermercado
Un analista observó que los viernes por la tarde las ventas de **pañales** y de **cerveza** aumentaban simultáneamente.
- **Hallazgo:** los padres jóvenes, al ir por pañales antes del fin de semana, aprovechaban para comprar cerveza.
- **Acción:** colocaron los estantes de cerveza cerca de los de pañales.
- **Resultado:** incremento significativo en las ventas de ambos por pura conveniencia.

### Caso 2 — Marketing en una app de streaming
Una plataforma de música nota que los usuarios que crean al menos una lista de reproducción en su primera semana tienen un **50% menos de probabilidad de cancelar**.
- **Acción:** rediseñan la interfaz para que "Crear Playlist" sea lo primero que ve un usuario nuevo.
- **Resultado:** mayor retención y mayor Valor de Vida del Cliente (LTV).

## 5. Trampas conceptuales y errores comunes

### Confundir correlación con causalidad
El error más famoso en estadística.
> **Ejemplo:** en los meses donde se venden más helados también hay más ataques de tiburones. ¿El helado atrae tiburones? No: hay una **variable oculta**, el **verano** — el calor hace que la gente coma helado *y* se meta al mar.

**Lección:** siempre preguntate si hay un tercer factor explicando la relación que ves.

### El sesgo de confirmación
La tendencia a buscar datos que apoyen lo que ya creemos.
> **Escenario:** el gerente cree que la nueva publicidad en Instagram fue un éxito. Vos ves que las ventas subieron, pero descubrís que en realidad subieron porque un competidor cerró esa semana, no por el anuncio.

**Tu deber:** ser objetivo. Tu trabajo no es darle la razón al jefe, sino darle la **verdad** a la organización.

## 6. Síntesis y conexión
El análisis de datos no es una línea recta; es un **ciclo**. Una vez que tomás una acción (paso E), esa acción genera nuevos datos que deben volver a analizarse para ver si la decisión fue correcta.

> Recordá siempre: detrás de cada fila en una base de datos hay un cliente, un proceso o un evento real. Tu trabajo es **darle voz a esos números**.

**Pregunta para reflexionar:** si tuvieras que analizar el éxito de tu propia carrera profesional hasta hoy, ¿qué datos recolectarías y qué pregunta *diagnóstica* te harías?

---
<p align="center">
<a href="./01-datos-vs-informacion.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 1</a> · <a href="./03-bi-data-analytics-data-science.md">Siguiente ➡️</a>
</p>
