# 3. Interactividad: filtros, segmentadores y parámetros

> Los gráficos muestran los datos; los segmentadores dejan que el usuario los **explore**. Esta capa convierte un reporte estático en una **herramienta de exploración**.

En el análisis moderno no entregamos fotos fijas: entregamos **herramientas de exploración**. La diferencia entre un analista junior y uno SSR está en diseñar experiencias donde el usuario encuentra sus propios *insights* sin depender de vos para cada pregunta.

## 1. ¿Qué es filtrar en Power BI?
Filtrar **no** es borrar datos: es **restringir la vista** temporalmente. Es como usar una linterna en una habitación oscura: los objetos siguen ahí, pero solo iluminás lo que necesitás. Existen **tres niveles** de filtros (panel de Filtros):
- **Filtro de Informe:** afecta a **todas** las páginas. Para restricciones globales (ej. solo el año fiscal en curso).
- **Filtro de Página:** afecta solo a la pestaña. Ideal cuando cada página tiene un propósito distinto.
- **Filtro de Visual:** afecta a **un solo** gráfico. Caso típico: mostrar el Top 5 de productos sin alterar los demás.

> El panel de filtros es una herramienta **técnica** para el desarrollador, **no** para el usuario final. Si querés que el usuario filtre por sí mismo, usá **segmentadores**.

## 2. Segmentadores (slicers): el control remoto del dashboard
Objeto visual que colocás en el lienzo para que el usuario filtre de forma **autónoma**.
> **Analogía:** si el panel de filtros es el tablero eléctrico oculto de la casa, el segmentador es el **interruptor de luz** en la pared: visible e intuitivo.

**Tipos:** **Lista** (pocos valores: regiones, categorías) · **Desplegable** (ocupa menos espacio; muchos valores) · **Rango de fechas / Slider** (dimensiones temporales) · **Búsqueda** (muchos valores: clientes, productos).

**Buenas prácticas:** agrupá los segmentadores en una **zona fija** (arriba o panel lateral) · títulos descriptivos · **Sincronizá** segmentadores entre páginas (pestaña **Vista > Sincronizar segmentadores**).

## 3. Interacciones entre visuales: el filtrado cruzado
Por defecto, todos los gráficos de una página están **comunicados**: al hacer clic en una barra, el resto se actualiza. Esto es el **Filtrado Cruzado**, una de las funciones más poderosas para el análisis exploratorio.

Pero a veces el comportamiento por defecto no es el deseado (ej. un KPI de "ventas totales" de referencia que **no** querés que se filtre). Usá **Editar Interacciones** (pestaña **Formato**). Aparecen íconos sobre cada gráfico:
- **Filtro (embudo):** el gráfico se filtra según la selección (por defecto).
- **Resaltar (gráfico parcial):** mantiene todo visible pero **resalta** la selección (no pierde el contexto del total).
- **Ninguno (círculo tachado):** el gráfico **ignora** la selección. Ideal para KPIs de referencia global.

> Documentá siempre qué visuales tienen interacciones desactivadas y por qué: un gráfico que no reacciona puede confundir si no está señalado como "referencia global".

## 4. Marcadores (bookmarks): guardar estados del reporte
Un **marcador** guarda el estado completo de una página: qué filtros están activos, qué segmentadores seleccionados, qué visuales visibles.
- **Botones de navegación** de una vista resumen a una de detalle.
- **Simular pestañas** dentro de una misma página.
- **Presentación ejecutiva** con estados predefinidos.

## 5. Parámetros: análisis hipotéticos y de escenarios
Los filtros restringen **qué datos se ven**; los parámetros permiten **modificar valores** dentro de una visualización para explorar escenarios **sin cambiar los datos** subyacentes.
> **La diferencia clave:** un filtro dice *"mostrá solo las ventas de enero"*. Un parámetro dice *"¿qué pasaría si la tasa de crecimiento fuera 15% en lugar de 8%?"*.

Actúan como **variables** que el usuario ajusta con un slider o campo de entrada; la visualización se actualiza en tiempo real. Usos: **umbrales**, **escenarios** (modelos financieros), **rangos de análisis** (salarial, antigüedad).

**Ejemplo — proyección de ingresos:**
1. Definir el parámetro (tasa de crecimiento anual, 0%–30%).
2. Power BI genera un **slider** asociado.
3. Conectar el parámetro a una **medida DAX** de ingresos proyectados.
4. El usuario desliza y explora el impacto de cada escenario en tiempo real.

> **Segmentador vs. parámetro:** un segmentador **filtra filas** existentes; un parámetro **modifica el comportamiento de un cálculo**. Segmentadores para explorar datos que ya tenés; parámetros para modelar situaciones que aún no ocurrieron.

## 6. Errores comunes
- **Olvidar las relaciones del modelo:** si tu segmentador de Clientes no filtra el gráfico de Ventas, el problema casi siempre está en el **modelo** (M6), no en el segmentador. Sin relaciones activas, el filtro no tiene por dónde viajar.
- **Confundir clics con filtros persistentes:** un clic en una barra es un filtro **temporal**; para filtros que el usuario mantenga, usá **segmentador**.
- **Saturación de segmentadores:** 10-15 segmentadores no dan más poder, **paralizan**. No más de **4-5** dimensiones de filtrado.
- **No sincronizar entre páginas:** el usuario espera que su filtro siga activo al navegar.
- **Confundir parámetros con filtros:** los parámetros son para hipótesis; los segmentadores, para datos reales.

## Resumen: la arquitectura del filtrado

| Herramienta | Quién la controla | Alcance | Cuándo usarla |
|-------------|-------------------|---------|---------------|
| **Filtro de Informe** | Desarrollador | Todo el archivo | Restricciones globales permanentes |
| **Filtro de Página** | Desarrollador | Una página | Contextos distintos por sección |
| **Filtro de Visual** | Desarrollador | Un gráfico | Top N, exclusiones puntuales |
| **Segmentador** | Usuario final | Página (o varias si sync.) | Exploración autónoma |
| **Editar Interacciones** | Desarrollador | Visual específico | KPIs globales, referencias fijas |
| **Marcadores** | Desarrollador | Estado completo de página | Navegación, presentaciones |
| **Parámetros** | Desarrollador | Cálculo específico | Escenarios hipotéticos, proyecciones |

> El objetivo: que el usuario llegue con una pregunta, encuentre la respuesta por sí mismo y se vaya con un *insight* accionable — **sin necesitarte como intermediario**.

---
<p align="center">
<a href="./02-visualizaciones-clave.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 7</a> · <a href="./04-storytelling-con-datos.md">Siguiente ➡️</a>
</p>
