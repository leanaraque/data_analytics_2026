# 4. Análisis univariado y detección de outliers con SQL

> Con tendencia central y dispersión entendidas, ahora identificás los valores que **distorsionan** ambas métricas — los mismos outliers que podían inflar un promedio DAX (M8) o distorsionar una tendencia visual en Power BI (M7).

A medida que explorás un dataset, vas a encontrar valores que parecen no pertenecer: un cliente de 150 años, una venta de $1.000.000 en una tienda de caramelos. Son los **outliers** o valores atípicos, y saber detectarlos, interpretarlos y decidir qué hacer con ellos distingue a un analista profesional.

## 1. ¿Qué es el análisis univariado?
Literal: "uni" (uno) + "variado" (variable). Analizar **una sola columna** a la vez para entender cómo se distribuyen sus valores antes de explorar relaciones con otras variables. Es fundamental: si el precio tiene outliers no detectados, cualquier correlación que calcules después estará distorsionada desde el origen.

**Preguntas que responde:** ¿cuál es el valor típico? (media, mediana, moda) · ¿qué tan dispersos están? (rango, desviación, IQR) · ¿hay valores que se alejan del resto? (outliers) · ¿la distribución es simétrica o sesgada?

## 2. ¿Qué es un outlier?
Una observación que se aleja **significativamente** del resto. No hay una definición universal de "qué tan lejos es suficiente", por eso usamos métodos estadísticos con criterio objetivo en lugar de decidir a ojo.

**Orígenes más frecuentes:**
- **Errores de entrada:** un cero de más ($100 → $1.000). Debe corregirse o eliminarse.
- **Errores de medición/sistema:** un sensor que registra `-999` por defecto. Deben tratarse.
- **Eventos reales pero extremos:** un cliente mayorista que compra $50.000 donde el ticket promedio es $200. **Legítimo y valioso**: no se elimina, se analiza por separado.
- **Fraude o anomalías:** una transacción inusual a las 3am desde una ubicación desconocida. Exactamente lo que buscan los sistemas de detección de fraude.

## 3. ¿Por qué son peligrosos?
La **media aritmética** es extremadamente sensible a los valores extremos. Un solo outlier puede desplazar el promedio tanto que deje de representar al grupo.
> **Ejemplo:** cinco amigos ganan $1.000/mes → promedio $1.000, representa a todos. Llega un sexto que gana $167.500 → el promedio salta a **$28.917**, un número que **no representa a nadie**. La **mediana ($1.000)** sigue siendo representativa. Por eso, en presencia de outliers, mejor usar la **mediana**.

## 4. El método del Rango Intercuartílico (IQR)
La **Regla del 1,5 × IQR**, uno de los métodos más robustos de la industria:
- **Q1 (primer cuartil):** el valor por debajo del cual está el **25%** de los datos.
- **Q3 (tercer cuartil):** el valor por debajo del cual está el **75%** de los datos.
- **IQR (rango intercuartílico):** `Q3 − Q1`. Es el rango donde vive el **50% central** de los datos (el comportamiento típico, sin los extremos).

```
IQR = Q3 − Q1
Límite Inferior = Q1 − (1,5 × IQR)
Límite Superior = Q3 + (1,5 × IQR)
```
Cualquier valor por debajo del límite inferior o por encima del superior es un **outlier**.

> **¿Por qué 1,5?** Es una convención de **John Tukey (1977)** que en una distribución normal captura ~99,3% de los datos como "normales". Para mayor sensibilidad se usa el factor **3** en lugar de 1,5.

## 5. Implementación en SQL
PostgreSQL ofrece `percentile_cont` de forma nativa.

**Paso 1 — Calcular cuartiles y límites:**
```sql
WITH metricas AS (
    SELECT
        percentile_cont(0.25) WITHIN GROUP (ORDER BY monto) AS q1,
        percentile_cont(0.75) WITHIN GROUP (ORDER BY monto) AS q3
    FROM ventas
),
limites AS (
    SELECT
        q1, q3,
        (q3 - q1) AS iqr,
        (q1 - 1.5 * (q3 - q1)) AS limite_inferior,
        (q3 + 1.5 * (q3 - q1)) AS limite_superior
    FROM metricas
)
SELECT * FROM limites;
```

**Paso 2 — Identificar los registros outliers:**
```sql
WITH metricas AS (
    SELECT
        percentile_cont(0.25) WITHIN GROUP (ORDER BY monto) AS q1,
        percentile_cont(0.75) WITHIN GROUP (ORDER BY monto) AS q3
    FROM ventas
),
limites AS (
    SELECT
        q1 - 1.5 * (q3 - q1) AS limite_inferior,
        q3 + 1.5 * (q3 - q1) AS limite_superior
    FROM metricas
)
SELECT
    v.*,
    CASE
        WHEN v.monto < l.limite_inferior THEN 'Outlier Inferior'
        WHEN v.monto > l.limite_superior THEN 'Outlier Superior'
        ELSE 'Normal'
    END AS clasificacion
FROM ventas v
CROSS JOIN limites l
ORDER BY v.monto DESC;
```

**Paso 3 — Contar y resumir:**
```sql
WITH metricas AS (
    SELECT
        percentile_cont(0.25) WITHIN GROUP (ORDER BY monto) AS q1,
        percentile_cont(0.75) WITHIN GROUP (ORDER BY monto) AS q3
    FROM ventas
),
limites AS (
    SELECT
        q1 - 1.5 * (q3 - q1) AS limite_inferior,
        q3 + 1.5 * (q3 - q1) AS limite_superior
    FROM metricas
)
SELECT
    COUNT(*) AS total_outliers,
    MIN(v.monto) AS valor_minimo_outlier,
    MAX(v.monto) AS valor_maximo_outlier
FROM ventas v
CROSS JOIN limites l
WHERE v.monto < l.limite_inferior
   OR v.monto > l.limite_superior;
```

> 📎 **Nota SQL Server:** no tiene `percentile_cont` como función de agregación directa, sino como **función de ventana**:
> ```sql
> SELECT DISTINCT
>     PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY monto) OVER () AS q1,
>     PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY monto) OVER () AS q3
> FROM ventas;
> ```

## 6. ¿Qué hacer con un outlier detectado?

| Tipo de outlier | Acción recomendada |
|-----------------|--------------------|
| Error de tipeo o sistema | Corregir si se conoce el valor real, eliminar si no |
| Valor físicamente imposible | Eliminar siempre (edad negativa, precio cero en producto físico) |
| Evento real pero extremo | Analizar por separado, **nunca eliminar** sin justificación |
| Posible fraude o anomalía | **Escalar** al área correspondiente, no eliminar |
| Cliente o segmento diferente | **Segmentar** el análisis, no mezclar con el resto |

> ⚖️ **La regla de oro:** nunca elimines un outlier **sin investigarlo primero**. Un outlier de gasto alto podría ser tu cliente más valioso; uno de devoluciones podría señalar un problema de calidad. **Los outliers más interesantes no son errores, son señales.**

## 7. Errores comunes al trabajar con outliers
- **Eliminar todos los outliers por defecto:** el error más grave. Entendé de dónde viene y qué representa antes de eliminar.
- **Confundir outliers con errores:** un valor es **error** cuando es físicamente imposible (edad −5); es **outlier legítimo** cuando es posible pero infrecuente (edad 105).
- **Aplicar IQR a variables no continuas:** fue diseñado para variables numéricas **continuas**. Aplicarlo a ordinales (1 a 5) o discretas con pocos valores puede dar resultados sin sentido.
- **Analizar sin contexto temporal:** $10.000 puede ser normal en diciembre (navidad) y un outlier claro en julio.

---
<p align="center">
<a href="./03-medidas-de-dispersion.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./05-distribuciones-de-frecuencias-y-probabilidad.md">Siguiente ➡️</a>
</p>
