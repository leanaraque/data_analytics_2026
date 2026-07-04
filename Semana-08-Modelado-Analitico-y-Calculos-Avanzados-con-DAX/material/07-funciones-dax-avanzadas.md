# 7. Funciones DAX avanzadas

> 📖 **Para profundizar** — Contenido avanzado. Con `CALCULATE`, YoY y YTD dominados, esta unidad extiende el *toolkit* con **lógica condicional** y **segmentación dinámica**.

Las funciones condicionales `IF` y `SWITCH` son esenciales para clasificaciones y segmentaciones dinámicas que responden a las necesidades del negocio.

## Funciones condicionales: `IF` y `SWITCH`

### `IF`
Evalúa una condición y devuelve un valor si es verdadera y otro si es falsa.
```dax
IF(<condición>, <valor_si_verdadero>, <valor_si_falso>)

-- Clasificar ventas como "Alta" o "Baja":
Clasificación Ventas = IF([Total Ventas] > 100000, "Alta", "Baja")
```

### `SWITCH`
Evalúa una expresión y la compara con múltiples valores. Con `TRUE()` como primer argumento, permite evaluar **condiciones** en cascada (más legible que anidar muchos `IF`):
```dax
Segmento Ventas =
SWITCH(
    TRUE(),
    [Total Ventas] > 200000, "Premium",
    [Total Ventas] > 100000, "Estándar",
    "Básico"
)
```

## Uso de variables (`VAR`)
Almacenan resultados intermedios, mejorando legibilidad y reduciendo cálculos repetidos:
```dax
Total Ventas =
VAR VentasProducto = SUM('Ventas'[Cantidad] * 'Ventas'[PrecioUnitario])
RETURN VentasProducto
```
> Las variables son **inmutables** y su ámbito está limitado a la expresión donde se definen.

## Técnicas básicas de optimización
- **Evitá iteradores innecesarios:** preferí funciones agregadas simples (`SUM`, `COUNT`) sobre iteradores (`SUMX`, `FILTER`) cuando sea posible.
- **Uso adecuado de `SUMX`:** cuando iteres, asegurate de que la tabla tenga **cardinalidad controlada** para evitar cálculos costosos.
- **Gestioná la cardinalidad:** minimizá relaciones y columnas con alta cardinalidad.
- **Usá variables** para evitar cálculos repetidos.

## Documentación y convenciones de nombrado
- Usá **prefijos** para diferenciar tipos de objetos (`m_` para medidas, `c_` para columnas calculadas).
- Incluí **comentarios** en DAX con `//` para explicar partes complejas.

## 🤖 Introducción a Copilot en Power BI
Copilot es la IA integrada que **sugiere fórmulas DAX** y ayuda a crear medidas rápidamente.
- **Ventajas:** acelera la creación de expresiones, sugiere sintaxis correcta y patrones comunes.
- **Limitaciones:** **no** reemplaza la validación humana; las sugerencias deben revisarse críticamente.

> **Recomendación:** usá Copilot como asistente para ganar productividad, pero **siempre** verificá que las fórmulas se ajusten a la lógica de negocio y al rendimiento esperado.

---
<p align="center">
<a href="./06-optimizacion-variables-y-dax-studio.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="../entregable/README.md">Ir al entregable (M8) ➡️</a>
</p>
