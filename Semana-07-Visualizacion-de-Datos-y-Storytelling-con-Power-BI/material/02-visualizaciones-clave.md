# 2. Visualizaciones clave: barras, líneas, mapas y matrices

> Con los principios de diseño claros, ahora los aplicás construyendo los gráficos concretos más usados en análisis de negocio.

Para un gerente que decide en cinco minutos, una tabla de 100.000 filas es tan útil como no tener datos. **Visualizar no es "hacer dibujos": es traducir números en respuestas.** Elegir el gráfico incorrecto puede llevar a conclusiones equivocadas aunque los datos sean perfectos.

## 1. Gráficos de barras y columnas: el rey de la comparación
La mejor opción para **comparar una métrica entre categorías** (productos, vendedores, sucursales).
- **¿Por qué funcionan?** El ojo humano es extraordinariamente preciso comparando **longitudes** (más que ángulos —tortas— o colores).
- **Consejo:** si los nombres de categorías son **largos**, usá barras **horizontales**; si son cortos (años, meses, siglas), columnas **verticales**.
- **Error a evitar:** no pongas más de **8-10 categorías**. Si tenés 30 productos, agrupá los menos relevantes en "Otros" o usá una tabla para el detalle.

## 2. Gráficos de líneas: la película del tiempo
Si una barra es una **fotografía** de un momento, la línea es una **película** que muestra hacia dónde van los datos. Es ideal para cualquier **análisis temporal**: tendencias, estacionalidad, ciclos.
- **Regla fundamental:** **nunca** uses líneas para comparar categorías **sin secuencia lógica** (conectar con línea los colores de autos o nombres de vendedores no tiene sentido: la línea implica continuidad y el cerebro buscará una tendencia inexistente).
- **Consejo:** no superes **3-4 series** por gráfico, o generás *espagueti visual* (líneas entrelazadas imposibles de seguir).

## 3. Mapas: ubicación y contexto geográfico
La visualización más poderosa cuando los datos tienen **dimensión geográfica**. Power BI ubica datos por nombres de ciudades/provincias/países, con tamaño de burbujas o intensidad de color.
- **¿Cuándo?** Cuando la pregunta tiene respuesta geográfica: *"¿en qué región vendemos más?"*.
- **Requisito técnico:** el campo debe estar **categorizado** en la pestaña **Modelado** con su tipo geográfico correcto (Ciudad, País, Provincia). Si no, el motor puede confundir ciudades homónimas de distintos países.
- **Limitación:** son excelentes para **distribución**, pero no para comparar magnitudes precisas. Complementá con una tabla o barras si el gerente necesita cuánto vendió cada región.

## 4. Matrices: el detalle preciso cuando los números importan
La **Matriz** cumple la función de una tabla dinámica de Excel, integrada en el reporte interactivo. A veces el usuario no necesita una tendencia, sino el **número exacto**.
- **El poder del drill-down:** permite profundizar con un clic (ventas por continente → país → provincia → ciudad) sin cambiar de visual.
- **¿Cuándo?** Cuando hay que validar un número específico, exportar datos o **cruzar dos dimensiones** (productos vs. meses).
- **Analogía:** si el gráfico es el **titular** de la noticia, la matriz es el **cuerpo** del artículo con todos los datos técnicos.

## ¿Cómo elegir el gráfico correcto?
Antes de arrastrar campos, preguntate: *¿qué quiero que el usuario descubra primero?*

| Pregunta de negocio | Visualización correcta |
|---------------------|------------------------|
| ¿Cuál es el mejor o peor? | Barras o columnas |
| ¿Cómo evolucionó en el tiempo? | Líneas |
| ¿Dónde está pasando? | Mapa |
| ¿Cuál es el número exacto? | Matriz |

> La elección del gráfico no es estética: es una **decisión de comunicación**. Un gráfico equivocado puede llevar a decisiones basadas en una interpretación incorrecta. Esa responsabilidad es tuya.

---
<p align="center">
<a href="./01-principios-de-diseno-y-jerarquia-visual.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 7</a> · <a href="./03-segmentadores-filtros-e-interacciones.md">Siguiente ➡️</a>
</p>
