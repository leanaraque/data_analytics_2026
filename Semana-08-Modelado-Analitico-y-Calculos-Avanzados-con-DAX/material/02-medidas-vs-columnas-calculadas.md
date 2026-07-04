# 2. Medidas vs. columnas calculadas en DAX

> Con el modelo listo, arranca el lenguaje de cálculo de Power BI. La primera decisión en DAX es: **¿dónde vive el cálculo?** La respuesta determina el rendimiento de todo tu reporte.

Dos preguntas muy distintas: *¿cuál es el margen de cada producto individual?* (fijo por fila) vs. *¿cuál fue la venta de este mes vs. el anterior?* (cambia según el filtro). Ambas se responden con **DAX**, pero de formas radicalmente diferentes: **columnas calculadas** o **medidas**.

## 1. El concepto fundamental: el momento del cálculo
- **Columna calculada:** una columna que añadís a una tabla.
  - Se calcula **durante la carga** (fila por fila) y el resultado se **guarda físicamente** en el `.pbix` (aumenta su tamaño).
  - Se comporta como cualquier columna de SQL: podés usarla en filas, columnas o **filtros (slicers)**.
- **Medida:** una fórmula que vive en el modelo pero **no guarda datos**.
  - Se calcula **en tiempo real**, solo cuando la arrastrás a un gráfico o tarjeta.
  - Es **dinámica**: cambia según los filtros que el usuario seleccione.
  - **No** ocupa espacio significativo, sin importar cuántos millones de filas tengas.

## 2. La analogía del chef
- **Columna calculada = comida precocinada:** el chef prepara el plato por la mañana y lo guarda en la nevera (la memoria). Cuando llega el cliente, ya está hecho. **Ocupa espacio**, pero ya está listo.
- **Medida = plato a la carta:** el chef no cocina nada de antemano. Solo cuando el cliente pide algo específico ("Año 2026" + "Región Norte"), lo cocina en ese instante. **No ocupa espacio** en la nevera, pero requiere el esfuerzo del procesador en el momento.

## 3. Comparativa detallada

| Característica | Columna Calculada | Medida |
|---------------|-------------------|--------|
| **Almacenamiento** | Se guarda en disco/RAM | No se guarda; se calcula al vuelo |
| **Respuesta a filtros** | No responde (valor fijo por fila) | Dinámica: recalcula según los filtros |
| **Efecto en el rendimiento** | Aumenta el tamaño del archivo | Aumenta el uso de CPU al visualizar |
| **Cuándo usarla** | Para categorizar, filtrar o agrupar | Para cálculos agregados (sumas, promedios, %) |
| **Contexto** | Contexto de **fila** (mira la fila actual) | Contexto de **filtro** (mira lo que el usuario seleccionó) |

## 4. ¿Cuándo usar cada una?

**Usá columnas calculadas cuando…**
1. **Necesites el resultado en un segmentador (slicer):** las medidas no se pueden poner en un slicer. Ej.: `Rango Precio = IF(Ventas[Precio] > 100, "Premium", "Económico")`.
2. **Categorices fila por fila** (depende solo de esa fila): `Nombre Completo = Clientes[Nombre] & " " & Clientes[Apellido]`.
3. **Necesites una columna "llave"** para relacionar dos tablas.

**Usá medidas cuando… (¡la regla de oro!)** — tu primera opción siempre debería ser una **medida**.
1. **Valores que deben sumarse o promediarse:** `Total Ventas = SUM(Ventas[Monto])`.
2. **Ratios y porcentajes:** el error más común. Si calculás un % como columna, Power BI sumará los % de cada fila y dará un resultado ridículo (5000%). Una medida suma ventas, suma costos y luego divide: `% Margen = DIVIDE([Ganancia Total], [Ventas Totales])`.

## 5. El error fatal del principiante: el "total estático"
Si creás una **columna** `Ventas_Globales = SUM(Ventas[Monto])` en una tabla de 1.000 filas, Power BI pone el **mismo número gigante** en las 1.000 celdas. Al filtrar por "hoy", esa columna **seguirá mostrando el total de toda la historia**, porque se calculó al cargar y no sabe qué botones toca el usuario.

En cambio, una **medida** con `SUM(Ventas[Monto])`, al filtrar por "hoy", **mira** la tabla, ve solo las filas de hoy y da el número correcto.

## 6. Aplicaciones en la industria
- **Retail:** columnas calculadas para "Zonas de Envío" por código postal (no cambian); medidas para el "Ticket Promedio" (varía según la oferta o la tienda).
- **Finanzas:** medidas para KPIs como ROI o EBITDA, porque necesitan cambiar al comparar trimestres.

> **Regla de desempeño:** con 10 millones de filas, una columna calculada ocupa mucha RAM (puede pesar/tildar Power BI); una medida mantiene el archivo liviano y solo usa CPU al interactuar.

## 7. Síntesis
- **Cálculo:** columnas en la **actualización** (estáticas); medidas en la **visualización** (dinámicas).
- **Memoria:** las columnas "pesan"; las medidas no.
- **Filtros:** si el resultado debe cambiar al interactuar → **medida**.
- **Categorización:** si necesitás agrupar/filtrar por el resultado → **columna calculada**.

> 💡 **Consejo PRO:** antes de crear una columna calculada, preguntate: *"¿Necesito poner este resultado en un eje de gráfico o en un filtro lateral?"*. Si la respuesta es **NO**, lo que necesitás es una **medida**.

---
<p align="center">
<a href="./01-relaciones-1n-y-esquema-estrella.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="./03-dax-fundamental-calculate-iteradores.md">Siguiente ➡️</a>
</p>
