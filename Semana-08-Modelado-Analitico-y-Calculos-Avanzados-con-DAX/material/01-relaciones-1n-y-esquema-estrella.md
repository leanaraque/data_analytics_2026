# 1. Relaciones 1:N y esquema estrella en el modelo de Power BI

> Arranca el bloque de DAX. Antes de escribir una sola medida, el modelo tiene que estar bien construido — el mismo esquema en estrella de M2 y M6, ahora con el foco en cómo Power BI lo usa para **filtrar correctamente**.

Si tenés una tabla de miles de ventas y otra de clientes, y querés saber cuánto compró Juan Pérez, Power BI necesita un **puente** que conecte su nombre con sus transacciones. Sin ese puente, tus segmentadores no filtran y tus medidas DAX devuelven resultados incorrectos, aunque los datos estén perfectos. Ese puente es la **relación**.

## 1. Tablas de hechos y tablas de dimensiones
- **Tabla de Hechos (Fact):** la tabla **central**. Contiene los eventos/transacciones del negocio (ventas, pedidos, pagos). Tiene **muchas filas**, crece constantemente; sus columnas son métricas numéricas y claves foráneas.
- **Tabla de Dimensiones (Dimension):** la información **descriptiva** que da contexto (quién, qué, dónde, cuándo). **Menos filas**, estable; columnas de texto o fechas (clientes, productos, fechas, regiones).

> **Regla fundamental:** las **dimensiones siempre filtran a los hechos**, nunca al revés. Un cliente puede tener muchas ventas, pero cada venta pertenece a un solo cliente.

## 2. El esquema estrella: el estándar de oro
Una tabla de hechos central rodeada de dimensiones que irradian hacia afuera. Es el estándar porque:
- **Rendimiento:** Power BI está optimizado para este esquema (más rápido que modelos planos o sobre-normalizados).
- **Simplicidad:** fácil de leer, mantener y explicar.
- **DAX predecible:** las medidas funcionan de forma más intuitiva y confiable.

```
[dim_clientes] ──────┐
[dim_productos] ─────┤──── [fact_ventas]
[dim_fechas] ────────┤
[dim_regiones] ──────┘
```
Cada dimensión se conecta a los hechos con una relación **1:N**, donde el lado **1** está en la dimensión y el lado **N** en los hechos.

## 3. Propiedades de una relación
- **Cardinalidad:**
  - **1:N (Uno a Muchos):** la estándar y más usada. Power BI la detecta cuando una columna tiene valores únicos y la otra duplicados.
  - **1:1 (Uno a Uno):** se usa poco; suele indicar que las tablas podrían fusionarse.
  - **N:N (Muchos a Muchos):** la más **problemática**; evitala siempre que puedas (distorsiona los cálculos DAX de formas difíciles de detectar).
- **Dirección del filtro cruzado:**
  - **Única (Single):** el filtro viaja **en una sola dirección**, de la dimensión hacia los hechos. **Es la recomendada** en el esquema estrella: predecible y eficiente.
  - **Ambas (Both):** el filtro viaja en ambas direcciones. Usar con **extrema precaución**: puede generar comportamientos inesperados y problemas de rendimiento.
- **Activa vs. inactiva:** solo puede haber **una** relación activa (línea continua) entre dos tablas. Una segunda se marca como inactiva (punteada) y se activa puntualmente en una medida con **`USERELATIONSHIP`**.

> **Caso real:** `ventas` tiene `fecha_pedido` y `fecha_envio`, ambas relacionadas con `dim_fechas`, pero solo una puede ser activa. La activa se usa en la mayoría de los cálculos; la inactiva se activa con `USERELATIONSHIP` en medidas que analicen por fecha de envío.

## 4. La regla de oro del analista
> *"La clave del Uno (Dimensión) viaja hacia el Muchos (Hechos)."*

- **Lado 1 (Dimensión):** siempre valores **únicos** (la Primary Key). Si Power BI detecta duplicados acá, la relación se vuelve N:N automáticamente.
- **Lado N (Hechos):** los valores que se **repiten** (la Foreign Key).

**Cómo verificarlo:** antes de crear la relación, revisá en Power Query que la columna del lado 1 **no** tenga duplicados (`Ver > Calidad de columna`).

## 5. La tabla de fechas: el caso especial
La dimensión de fechas es la más importante y la más mal implementada. Power BI puede generar una automática, pero en modelos profesionales siempre se crea una **tabla de fechas personalizada** porque:
- Permite definir el **año fiscal** de la empresa.
- Permite agregar columnas (trimestre, semana, día hábil, feriado).
- Garantiza que **no haya fechas faltantes**, algo crítico para `TOTALYTD`, `SAMEPERIODLASTYEAR` o `DATEADD`.

> **Requisito técnico:** debe estar marcada como tal (**Herramientas de tabla > Marcar como tabla de fechas**) y contener una fila por cada día del rango, **sin interrupciones**.

## 6. Errores comunes en el modelado
- **Relación N:N no intencionada:** ambas columnas con duplicados → medidas DAX **infladas**. Solución: asegurar que el lado 1 tenga valores únicos.
- **Relaciones en círculo (dependencias circulares):** A filtra a B, B a C y C vuelve a A → Power BI lo bloquea por ambigüedad. Solución: eliminar la relación que cierra el ciclo.
- **Filtro bidireccional innecesario:** activar "Ambas" en todo "porque así funciona Excel". Tiene costo de rendimiento y genera resultados inesperados. Usalo **solo** con razón técnica justificada.
- **Relacionar por columnas de texto:** relacionar por `nombre_cliente` en vez de por ID numérico es frágil (un espacio, una tilde o una mayúscula rompe la relación en silencio). Relacioná siempre por **IDs numéricos**.

## Checklist del modelo bien construido

| Verificación | ✓ |
|--------------|:-:|
| Cada tabla tiene un propósito claro: hechos o dimensión | ☐ |
| Las columnas del lado 1 no tienen valores duplicados | ☐ |
| Todas las relaciones son 1:N con dirección única | ☐ |
| Existe una tabla de fechas completa y marcada correctamente | ☐ |
| No hay relaciones en círculo ni N:N no intencionadas | ☐ |
| El modelo tiene forma de estrella, no de cadena lineal | ☐ |

---
<p align="center">
🏠 <a href="../README.md">Semana 8</a> · <a href="./02-medidas-vs-columnas-calculadas.md">Siguiente: Medidas vs. columnas calculadas ➡️</a>
</p>
