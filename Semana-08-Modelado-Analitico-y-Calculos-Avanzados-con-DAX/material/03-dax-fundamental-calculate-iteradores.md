# 3. DAX fundamental: `CALCULATE`, contexto e iteradores (`SUMX`)

> Ya sabés dónde vive el cálculo. Ahora aprendés el corazón de DAX: cómo el **contexto** afecta los resultados y cómo `CALCULATE` te da control absoluto sobre él.

**DAX** (Data Analysis Expressions) convierte números estáticos en métricas dinámicas. No funciona como las fórmulas de Excel: su potencia reside en el **contexto** — cómo los filtros de tus visualizaciones afectan los cálculos.

- **Agregación básica (`SUM`, `AVERAGE`):** los bloques de construcción.
- **Iteradores (`SUMX`):** para operar **fila por fila** (ej. precio × cantidad) antes de agregar.
- **Lógica (`IF`, `AND`):** para categorizar y crear condiciones.
- **`CALCULATE`:** el **"cerebro"** de DAX: modifica el contexto de filtro.

## La función `CALCULATE`: el cerebro de DAX
Es la función más poderosa de Power BI. Su trabajo es **modificar o sobreescribir los filtros existentes**.

```dax
CALCULATE( <expresión>, <filtro1>, <filtro2>... )
```

> Imaginá que tenés un filtro de "Año" en el reporte, pero querés una medida que **siempre** muestre las ventas de "Bogotá", sin importar qué toque el usuario. `CALCULATE` permite **forzar** ese filtro dentro del cálculo.

## Ejemplo numérico paso a paso: contexto de fila vs. filtro y `CALCULATE`
Tabla `Ventas`:

| Fila | Ciudad | Monto |
|------|--------|-------|
| 1 | Bogotá | 300 |
| 2 | Bogotá | 200 |
| 3 | Medellín | 400 |
| 4 | Medellín | 350 |

**Paso 1 — Contexto de fila (columna calculada).** Creás `Monto con IVA = Ventas[Monto] * 1,19`. DAX la calcula fila por fila, mirando solo el monto de esa fila:
- Fila 1: 300 × 1,19 = **357** · Fila 2: 200 × 1,19 = **238** · Fila 3: 400 × 1,19 = **476** · Fila 4: 350 × 1,19 = **416,5**

Cada resultado depende únicamente de su propia fila. Eso es el **contexto de fila**.

**Paso 2 — Contexto de filtro (medida).** Creás `Total Ventas = SUM(Ventas[Monto])`. Su resultado cambia según lo que el reporte tenga filtrado:
- Sin filtro (una tarjeta sola): 300 + 200 + 400 + 350 = **1.250**.
- En una tabla desglosada por Ciudad, la **misma** medida da distinto por fila del visual: "Bogotá" → **500**; "Medellín" → **750**.
- Con un segmentador en "Medellín": la tarjeta muestra **750**.

La medida no cambió; cambió el **contexto de filtro** que le llega.

**Paso 3 — `CALCULATE` (reescribir el contexto).** Querés una medida que muestre **siempre** las ventas de Bogotá:
```dax
Ventas Bogotá = CALCULATE( SUM(Ventas[Monto]), Ventas[Ciudad] = "Bogotá" )
```
Cuando el usuario tiene seleccionado "Medellín" en un segmentador:
- El contexto entrante sería `Ciudad = "Medellín"` → normalmente daría 750.
- Pero `CALCULATE` **reemplaza** ese filtro por "Bogotá".
- Resultado: **500** (las ventas de Bogotá), ignorando el "Medellín" del segmentador.

> Ese es el superpoder de `CALCULATE`: no se limita a **leer** el contexto de filtro, lo **reescribe**. `Total Ventas` obedece al usuario; `Ventas Bogotá` impone su propia condición.

**En una línea:** el **contexto de fila** mira una fila a la vez (columnas calculadas); el **contexto de filtro** es lo que el reporte tiene seleccionado (medidas); y **`CALCULATE`** es lo único que te deja **cambiar** ese contexto de filtro a voluntad.

## Iteradores: el poder de `SUMX`
A diferencia de `SUM` (que suma una columna completa), las funciones que terminan en **`X`** (`SUMX`, `AVERAGEX`) son **iteradores**: crean un **contexto de fila temporal** sobre una tabla, calculan algo fila por fila y **al final agregan** el resultado. Son vitales cuando necesitás lógica o multiplicación antes de sumar.

```dax
-- Multiplicar precio × cantidad en cada fila y luego sumar:
Ingreso Total = SUMX( Ventas, Ventas[Cantidad] * Ventas[Precio] )
```

## Errores comunes de principiante
- **Confundir `SUM` con `SUMX`:** `SUM(Ventas[Cantidad] * Ventas[Precio])` da **error**. `SUM` solo acepta **una columna**. Para multiplicar y luego sumar, necesitás `SUMX`.
- **Ignorar que `CALCULATE` es necesario para filtrar:** si usás una medida dentro de un `SUMX`, `CALCULATE` ocurre "tras bambalinas" (transición de contexto). Como principiante, acostumbrate a usar `CALCULATE` siempre que quieras filtrar datos de forma específica.

---
<p align="center">
<a href="./02-medidas-vs-columnas-calculadas.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="./04-tabla-de-medidas-y-calendario.md">Siguiente ➡️</a>
</p>
