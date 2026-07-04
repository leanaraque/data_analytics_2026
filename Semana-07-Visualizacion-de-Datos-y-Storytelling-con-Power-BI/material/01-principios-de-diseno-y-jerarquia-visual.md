# 1. Principios de diseño de dashboards y jerarquía visual

> Arranca el bloque de Visualización: los datos están limpios y modelados, ahora los comunicás.

Imaginá que sos piloto de avión. En medio de una tormenta no querés mirar cien pantallas con números pequeños; necesitás saber tres cosas críticas: *¿a qué altura estoy?, ¿cuánto combustible queda?, ¿hay obstáculos cerca?*. Un **dashboard** es exactamente eso para un negocio: una herramienta para tomar decisiones rápidas, **no** un lienzo para mostrar todo lo que sabés hacer en Power BI.

> El diseño no es "hacer que las cosas se vean bonitas", sino **hacer que los datos funcionen**.

## 1. ¿Qué es realmente un dashboard?
Una representación visual de la información **más importante** para lograr uno o más objetivos, consolidada en una sola pantalla para monitorearla **de un vistazo**.

**El propósito antes que la herramienta:** antes de diseñar, escribí en una sola frase el propósito del dashboard.
- ❌ *"Mostrar las ventas de la empresa"* (demasiado vago).
- ✅ *"¿Cuál fue el volumen de ventas de esta semana en la región Norte y por qué cambió respecto a la anterior?"* (claro y accionable).

> Si un dashboard requiere 10 minutos de explicación para entenderlo, **fracasó** en su diseño.

## 2. El concepto central: jerarquía visual
Es la organización y prioridad de los elementos para guiar el ojo hacia lo más importante **primero**. Pensá en un periódico: la noticia principal tiene el título más grande y arriba; las secundarias, títulos medianos; los anuncios pequeños, al final. Si en un dashboard todo tiene el mismo tamaño y color, **nada destaca** y el usuario se abruma.

**¿Cómo "lee" el ojo un dashboard?** La mayoría lee siguiendo un **patrón en Z** (o en F): empieza arriba-izquierda, se mueve a la derecha, baja en diagonal y termina abajo-derecha. Por eso, la información más crítica (tus **KPIs principales**) va **arriba a la izquierda**.

## 3. Las 4 herramientas de la jerarquía visual
- **A. Posicionamiento:** *Zona de Oro* (arriba-izquierda) → KPIs críticos · Zona media → tendencias · Zona de detalle (abajo-derecha) → tablas.
- **B. Tamaño y escala:** el ojo detecta primero lo más grande. Si un KPI es 3× más grande que un gráfico, se entiende que es el corazón del reporte. No temas hacer tus métricas principales grandes.
- **C. Color y contraste:** el color es **comunicación**, no decoración. Un color brillante sobre fondo neutro atrae la atención. En datos, **rojo** = peligro/caída, **verde** = éxito/crecimiento (no los uses al revés).
- **D. Tipografía:** usá peso (negritas) y tamaño para crear niveles. En vez de "Ventas", titulá "Evolución Mensual de Ventas (2025-2026)".

## 4. Mejores prácticas: revelación progresiva
No agobies al usuario con todo a la vez. Flujo ideal:
1. **Resumen (overview):** KPIs de alto nivel para comprensión instantánea.
2. **Contexto/comparativa:** ¿mejor o peor que el mes pasado? (filtros y segmentadores).
3. **Detalle (drill-down):** clic en un dato para ver el desglose.

> **Ejemplo (logística):** arriba-izquierda "% de entregas a tiempo hoy" (KPI) · centro "tendencia de entregas por hora" (líneas) · abajo "lista de paquetes retrasados" (tabla, se consulta solo si hay problema).

## 5. Errores comunes que debés evitar
- **Fatiga visual ("ponerlo todo"):** 15 gráficos en una página. **Regla de oro: no más de 5 a 7 elementos** visuales por página. Si necesitás más, creá otra pestaña.
- **El "árbol de Navidad":** demasiados colores sin razón. Mantené una paleta de **2 o 3 colores** principales.
- **Falta de contexto:** mostrar "$1.5M" sin decir si es bueno, malo o cuál era la meta. Usá siempre **comparativas** (vs. año anterior o vs. meta).
- **No conocer a tu audiencia:** un CFO necesita rentabilidad global; un jefe de almacén, rotación de inventario. No hagas un dashboard que sirva para todos a la vez.

## 6. Síntesis
Diseñar es **iterativo**: tu primer diseño nunca es el final. Los tres pilares:
1. **Propósito:** definí qué pregunta responde antes de arrastrar el primer gráfico.
2. **Jerarquía:** usá tamaño, posición (patrón Z) y color para guiar el ojo.
3. **Simplicidad:** "menos es más". Eliminá cualquier elemento que no ayude a decidir.

> 🎥 **Video — Diseñá antes de construir (mockup):** hacé un **prototipo visual** del reporte (papel, PowerPoint, Figma, Miro) **antes** de abrir Power BI. Te ahorra rediseños y alinea expectativas con el cliente. Definí ahí la disposición de gráficos, filtros, KPIs y la jerarquía. *(Es exactamente el entregable de esta semana.)*

---
<p align="center">
🏠 <a href="../README.md">Semana 7</a> · <a href="./02-visualizaciones-clave.md">Siguiente: Visualizaciones clave ➡️</a>
</p>
