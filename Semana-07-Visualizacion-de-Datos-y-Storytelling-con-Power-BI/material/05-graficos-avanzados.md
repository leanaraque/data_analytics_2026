# 5. Gráficos avanzados en Power BI

> 📖 **Para profundizar** — Amplía tu vocabulario visual con tipos avanzados para casos de negocio específicos. Podés continuar sin leerla y volver cuando domines los gráficos esenciales.

Con los gráficos esenciales dominados (barras, líneas, mapas, matrices), esta unidad suma visualizaciones que van más allá para analizar patrones, comparar comportamientos y comunicar hallazgos de forma más estratégica.

## Visualizaciones nativas avanzadas

- **Treemap:** para datos **jerárquicos** (categorías con subcategorías). Rectángulos cuyo **tamaño** refleja la magnitud; ideal para ver **proporciones** y concentraciones, y para aprovechar espacio limitado. **No** sirve para leer valores exactos.
- **Gráfico de eje doble:** para comparar **dos medidas con escalas diferentes** pero relacionadas (ventas y margen, ingresos y cantidad de clientes). Cada medida conserva su escala. Usalo para comparar **patrones**, no valores exactos.
- **Gráfico de cintas (Ribbon):** para analizar cómo cambia el **ranking** de categorías a lo largo del tiempo. Destaca la **posición relativa** (quién sube y quién baja). Ideal para participación de mercado o performance de productos. Usá pocas categorías para evitar ruido.
- **Gráfico de cascada (Waterfall):** para entender cómo un valor inicial se transforma **paso a paso** hasta uno final, mostrando aumentos y disminuciones. Común en análisis financieros (descomposición de variaciones, ingresos y gastos). Funciona mejor con pocos componentes.
- **Gráfico de dispersión (Scatter):** para analizar la **relación entre dos variables numéricas** y detectar correlaciones, patrones y **valores atípicos**. Cada punto es una observación. Podés sumar una tercera variable con el **tamaño** del punto y segmentar con el **color**.

## Visualizaciones personalizadas (AppSource)
Cuando las nativas no alcanzan, Power BI permite integrar visuales personalizados desde **AppSource** (termómetros, diagramas de **Sankey** para flujos, etc.). Requiere **evaluación previa** de rendimiento y seguridad.

## ¿Qué NO hacer? "Menos es más"
La cita de Mies van der Rohe se aplica perfecto: **simplicidad y claridad** son esenciales. Una visualización sobrecargada confunde. Enfocate en lo esencial y eliminá el **ruido visual**.

### Errores comunes en gráficos de torta
- **Demasiadas categorías:** limitá a **5-7**; si hay más, usá barras.
- **Colores similares:** usá alto contraste.
- **Falta de etiquetas:** etiquetá cada segmento con valor y categoría.
- **Gráficos 3D:** distorsionan la percepción → usá **2D**.

### Errores comunes en gráficos de barras
- **Barras demasiado anchas/estrechas:** ajustá el ancho para comparar fácil.
- **Bajo contraste** o **ejes sin etiquetar** (incluí unidades de medida).
- **Barras apiladas sin etiquetar:** etiquetá cada segmento.

### Errores comunes en gráficos de líneas
- **Demasiadas líneas:** limitá a **3-5**; dividí en varios gráficos si hay más.
- **Colores similares:** usá alto contraste y estilos distintos (sólida, punteada).
- **Escalas de ejes inconsistentes:** mantené escalas consistentes y apropiadas.
- **Falta de puntos de datos:** marcá los puntos significativos.

## Cinco claves de usabilidad (principio "menos es más")
1. **Eliminá elementos innecesarios:** reducí grillas y bordes, evitá sombras y efectos 3D, mostrá solo las etiquetas necesarias.
2. **Elegí el gráfico adecuado:** barras/columnas para comparar, líneas para tendencias, dispersión para relaciones.
3. **Priorizá la claridad:** títulos y descripciones claros, unidades de medida visibles, aprovechá los **espacios en blanco**.
4. **Consistencia de color:** un solo color con una variación para destacar lo importante (ej. el producto con más ventas).
5. **Etiquetas mínimas:** solo en los valores relevantes (el más alto o el más bajo).

> **Beneficios:** interpretación más fácil, decisiones más rápidas y mejor comunicación de la información clave. La simplicidad convierte una visualización en una herramienta poderosa de análisis.

---
<p align="center">
<a href="./04-storytelling-con-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 7</a> · <a href="./06-navegacion-botones-marcadores-tooltips.md">Siguiente ➡️</a>
</p>
