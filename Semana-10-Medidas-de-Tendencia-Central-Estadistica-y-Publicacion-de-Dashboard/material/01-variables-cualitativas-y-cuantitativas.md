# 1. Variables cualitativas y cuantitativas: fundamentos para el análisis

> Arranca el bloque de Estadística. Antes de aplicar cualquier cálculo, necesitás saber **qué tipo de dato** tenés — porque eso determina qué operaciones tienen sentido matemático.

Imaginá que sos analista de una plataforma de streaming. Recibís miles de datos: el nombre de la película, cuántos minutos la vieron, la calificación de 1 a 5 estrellas, el país de conexión. Si intentaras **promediar los nombres** de las películas, obtendrías un error. Clasificar bien las variables no es académico: determina qué cálculos podés hacer, qué gráficos usar y si tus conclusiones tienen sentido o son **basura estadística**.

## 1. El lenguaje de los datos: ¿cualidad o cantidad?
Una **variable** es cualquier característica que se puede medir o contar. Se dividen en dos familias:
- **Cualitativas (categóricas):** describen cualidades o atributos que **no** se miden con números de forma natural. Son "etiquetas" que **clasifican**. Ej.: `Color_Prenda` (Rojo, Azul, Negro) — no podés hacer "Azul + Rojo = Morado".
- **Cuantitativas:** se expresan con **cantidades numéricas**; tiene sentido sumar, restar o promediar. Existen para **medir** magnitudes o **contar** unidades. Ej.: `Precio` — tiene sentido calcular el precio promedio.

## 2. Profundizando en las cualitativas
- **Nominales (sin orden):** etiquetas que distinguen pero **no** jerarquizan. Ej.: `Estado_Civil`, `Método_Pago`, `País`. **Regla:** si cambiar el orden de las opciones no altera la lógica, es nominal.
- **Ordinales (con orden):** categorías con una **jerarquía** lógica. Ej.: `Nivel_Satisfacción` (Pésimo → Excelente), `Talle` (S, M, L, XL), `Nivel_Educativo`. *En Power BI querrás que el gráfico ordene "Pésimo → Excelente", no alfabéticamente.*

## 3. Profundizando en las cuantitativas
- **Discretas (conteos enteros):** surgen de **contar**; no admiten valores intermedios. Ej.: `Cantidad_Hijos` (no hay 1,5 hijos), `Stock`, `Número_Likes`.
- **Continuas (mediciones decimales):** pueden tomar **cualquier valor** dentro de un intervalo; suelen tener decimales. Ej.: `Estatura` (1,75 m), `Ingresos` ($2.500,50), `Temperatura` (24,8 °C). En SQL se guardan como `FLOAT`, `DECIMAL` o `NUMERIC`.

## 4. El peligro de las "variables camufladas"
No todo lo que parece un número es cuantitativo:
- **ID de Cliente o Código Postal:** valores como `28001`. **¿Es cuantitativa?** ¡No! Es **cualitativa nominal**: no tiene sentido sumar ni promediar códigos postales. El número es solo una **etiqueta**.
- **Codificación numérica (ratings):** `1 = Muy Insatisfecho … 5 = Muy Satisfecho`. Aunque veas números, la variable es **cualitativa ordinal**. Decir que "el promedio es 2,5" puede ser engañoso: la "distancia" entre categorías no es necesariamente igual.

## 5. Aplicación en el flujo del analista
Clasificar dicta tus herramientas:
- **En SQL:** para cualitativas usás `COUNT` y `GROUP BY` (cuántos registros por categoría); para cuantitativas, `AVG`, `SUM` y funciones de dispersión.
- **En Power BI:** las cualitativas suelen ir en el **Eje** o la **Leyenda**; las cuantitativas en **Valores** para resumirse.
- **Detección de errores:** si intentás calcular la desviación estándar de "Nombres de ciudades", el software dará error o un resultado sin sentido.

## Resumen visual

| Tipo | Subtipo | Operación común | Gráfico sugerido |
|------|---------|-----------------|------------------|
| **Cualitativa** | Nominal | Contar frecuencias (%) | Gráfico de sectores (torta) |
| | Ordinal | Ordenar y contar | Gráfico de barras |
| **Cuantitativa** | Discreta | Sumar, contar, Máx/Mín | Gráfico de columnas |
| | Continua | Promediar, calcular variabilidad | Histograma, gráfico de líneas |

> Antes de analizar, preguntale a tus datos: *"¿Sos una etiqueta o sos una medida?"*. La respuesta te ahorra horas de trabajo mal enfocado.

---
<p align="center">
🏠 <a href="../README.md">Semana 10</a> · <a href="./02-medidas-de-tendencia-central-con-sql.md">Siguiente: Tendencia central con SQL ➡️</a>
</p>
