# 📦 M10 — Pre-entrega: Validación estadística del proyecto

> **Título:** Validando que tus KPIs sean estadísticamente confiables.

## 🎯 En una frase
Esta pre-entrega tiene **dos partes**. En la primera aplicás **tendencia central y dispersión** sobre un caso guiado para afianzar la técnica. En la segunda aplicás esos mismos conceptos sobre los **datos reales de RetailPro** para validar que los KPIs de tu dashboard son estadísticamente confiables.

## ✅ ¿Qué entregás?
Un documento **`.docx` o `.pdf`** con **ambas partes** y los cálculos presentados en **tabla**, más una sección final indicando si ajustaste algún KPI o título narrativo del dashboard.

---

## Parte 1 — Analizando la consistencia de ventas (caso guiado)
Sos el analista de una tienda de electrónica. Tenés las ventas diarias de dos sucursales durante 5 días laborales. Objetivo: determinar **cuál es más estable**.

**Datos de ventas (USD):**
- **Sucursal Norte:** 500, 510, 490, 505, 495
- **Sucursal Sur:** 100, 900, 50, 1.200, 250

**Pasos:**
1. Calculá la **media** de ambas sucursales.
2. Calculá el **rango** de ambas.
3. Calculá la **desviación estándar muestral** de ambas (asumí que son una muestra de la operación anual).
4. Redactá una **conclusión de 3 líneas** explicando cuál sucursal preferirías gestionar y por qué, basándote en la **variabilidad**.

> 💡 *Pista:* ambas sucursales tienen una media parecida, pero una es mucho más **predecible** que la otra. La desviación estándar lo revela.

---

## Parte 2 — Validación estadística de RetailPro (acumulativa)
Con los mismos conceptos, validá los datos de tu **propio proyecto**. Un dashboard sin validación estadística puede mostrar promedios que **no representan a nadie**.

### a) Ticket promedio real vs. representativo
Calculá la **media** y la **mediana** del `total_venta` de RetailPro.
- ¿Son similares o muy distintas?
- Si hay una gran diferencia, ¿qué te indica sobre la **distribución** de los datos?
- ¿El KPI de **Ticket Promedio** de tu dashboard es representativo o está **inflado** por ventas extremas?

### b) Detección de outliers con IQR
Aplicá el método **IQR** sobre la columna `total_venta`:
- Calculá **Q1, Q3 e IQR**.
- Determiná los **límites** inferior y superior.
- Identificá **cuántos** registros son outliers y cuáles son sus valores.
- Determiná si representan **errores de datos** o **eventos legítimos** de negocio.

### c) Conexión con el dashboard
Revisá los KPIs y gráficos del **boceto de M7**. ¿Algún resultado estadístico de esta parte **confirma o contradice** lo que planeaste mostrar? Si corresponde, **ajustá el título narrativo** de algún visual para que comunique el hallazgo real.

> 💡 **Tip:** si la media y la mediana de tus ventas son muy distintas, considerá agregar **ambas** como KPIs en el dashboard, o una **nota aclaratoria**. Un promedio inflado por outliers puede llevar al gerente a conclusiones erróneas.

---

## ✔️ Checklist de entrega
- [ ] Documento `.docx` o `.pdf` con **ambas partes**.
- [ ] Parte 1: media, rango y desviación estándar de ambas sucursales + conclusión.
- [ ] Parte 2a: **media vs. mediana** del ticket con interpretación.
- [ ] Parte 2b: **IQR** con Q1, Q3, límites, conteo de outliers y su naturaleza.
- [ ] Parte 2c: sección indicando si **ajustaste** algún KPI o título del dashboard.
- [ ] Cálculos presentados en **tabla**.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 10</a> · <a href="../../README.md">Índice del curso</a>
</p>
