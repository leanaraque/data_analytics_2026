# 4. Técnicas de storytelling con datos en dashboards

> Con gráficos e interactividad dominados, ahora agregás el componente que convierte un reporte técnico en una **herramienta de decisión**.

¿Alguna vez abriste un dashboard lleno de gráficos coloridos y, tras cinco minutos, te preguntaste *"¿y ahora qué hago con esto?"*? Ese es el síntoma de un reporte que tiene **datos pero no historia**. El **Data Storytelling** arma esas piezas para que el usuario vea una imagen clara que le permita **decidir**.

## 1. ¿Qué es y por qué es vital?
Comunicar información de forma clara y atractiva combinando tres elementos: **Datos, Visualizaciones y Narrativa**.

Si notás que las ventas cayeron 20%, tenés dos formas de reportarlo:
- **A (solo datos):** *"Las ventas bajaron 20% en marzo respecto a febrero."*
- **B (storytelling):** *"A pesar de que el tráfico web subió 10% (contexto), las ventas cayeron 20% (problema) por un error en la pasarela de pagos móviles (insight). Necesitamos compensar a los afectados con un cupón para recuperar su confianza (acción)."*

> La opción B explica el **porqué** y propone un **qué sigue**. Eso diferencia a un "generador de reportes" de un **Analista Estratégico**.

## 2. Los 3 pilares del storytelling
- **A. Los datos (la verdad):** limpios y precisos (SQL, Power Query). Incluí solo lo **relevante** y dale **contexto**: "10.000 usuarios" no dice nada sin compararlo con el mes anterior o una meta.
- **B. Las visualizaciones (la lente):** traducí números a formas que el cerebro procesa rápido (tendencias→líneas, comparaciones→barras, relaciones→dispersión). Si el usuario tarda más de 5 segundos en entender un gráfico, falló.
- **C. La narrativa (el viaje):** el hilo conductor. En Power BI se manifiesta en el **orden** de los gráficos, los **títulos descriptivos** y el **uso del color** para resaltar lo importante.

## 3. Estructuras narrativas probadas
**Modelo 1 — "Aristóteles" (Contexto → Problema → Solución):** ideal para reportes ejecutivos.
1. **Contexto:** lo macro (KPIs: "¿cómo estamos hoy?").
2. **Problema:** dónde están las desviaciones (barras: la región Norte es la única bajo la meta).
3. **Solución/Insight:** el porqué (líneas: el stock del Norte se agotó a mitad de mes).

**Modelo 2 — Pirámide invertida de datos** (del periodismo, lo más importante primero):
1. **Visión general:** KPIs principales (el usuario sabe en 3 segundos si va bien o mal).
2. **Análisis comparativo:** filtros y segmentadores.
3. **Detalle:** tablas o gráficos con la "letra pequeña".

## 4. De "dato" a "insight": el arte de contextualizar
- **Dato:** *"Tenemos 500 tickets de soporte abiertos."*
- **Insight:** *"Los tickets subieron 40% tras la actualización del lunes, concentrándose en el módulo de Login."*

El insight **conecta puntos**. Técnicas en Power BI:
- **Títulos probativos:** en vez de "Ventas por Mes", titulá *"Las ventas crecieron 15% impulsadas por la campaña de Verano"*.
- **Color estratégico:** neutros (gris, azul claro) para lo normal; un color contrastante (rojo/naranja) para el punto crítico.
- **Comparativas obligatorias:** nunca muestres ventas actuales sin una línea de "Año Anterior" o "Presupuesto". El cerebro entiende por **comparación**.

## 5. Aplicación: dashboard de Churn (Telco)
- **Sin storytelling:** un gráfico de torta de "clientes que se van vs. se quedan". Fin.
- **Con storytelling:** KPI arriba-izquierda *"Tasa de Churn: 5% (↑ 1.2% vs mes anterior)"* (urgencia) → líneas que muestran que la subida empezó cuando la competencia lanzó una oferta → barras que revelan que los que se van son mayoritariamente de **prepago** (¡el insight!) → tabla de detalle con esos clientes para que ventas los llame hoy.

## 6. Errores comunes
- **El "árbol de Navidad":** demasiados colores sin sentido narrativo. Si todo es importante, nada lo es.
- **Falta de jerarquía:** poner el detalle chico arriba y el KPI abajo. Lo más importante va arriba-izquierda (patrón Z/F).
- **No conocer a tu audiencia:** diseñá historias específicas para cada rol (CFO vs. analista operativo).
- **Ignorar el "So What?":** por cada gráfico preguntate *"¿qué decisión permite tomar?"*. Si la respuesta es "ninguna", **borralo**.

## Síntesis
> Los datos **informan**, pero las historias **convencen**. Usá siempre comparativas para dar contexto y guiá al usuario de lo general (KPIs) a lo particular (detalles).

---
<p align="center">
<a href="./03-segmentadores-filtros-e-interacciones.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 7</a> · <a href="./05-graficos-avanzados.md">Siguiente ➡️</a>
</p>
