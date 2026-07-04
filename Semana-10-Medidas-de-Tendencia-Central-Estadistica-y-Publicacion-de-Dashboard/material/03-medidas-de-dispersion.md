# 3. Medidas de dispersión: entendiendo la variabilidad de los datos

> La tendencia central dice **dónde está el centro**. La dispersión dice **cuán lejos** pueden estar los datos de ese centro — información que un promedio solo jamás revela.

Sos analista de una empresa de logística. Juan y Pedro entregan, **en promedio**, en 20 minutos. Basándote solo en la media, parecen iguales. Pero:
- **Juan** siempre entrega entre 18 y 22 minutos → muy **consistente**.
- **Pedro** a veces en 5 minutos, otros días 45 → **impredecible**.

Si solo usás la media, te falta la mitad de la historia. Las **medidas de dispersión** dicen qué tan "estirados" o "agrupados" están los datos alrededor del centro.

## 1. ¿Qué es la dispersión y por qué es vital?
El grado en que los datos se alejan de su promedio. **Baja dispersión** = datos uniformes y predecibles. **Alta dispersión** = datos diversos, heterogéneos o con valores extremos que "ensucian" el promedio.

> Como analista, **nunca** presentes un promedio sin una medida de dispersión. La media sin dispersión es como una brújula que apunta al norte pero no te dice a qué distancia estás del objetivo.

## 2. El Rango: la medida más simple
La diferencia entre el valor **más alto** y el **más bajo**.
```
Rango = Máximo − Mínimo
```
> **Ejemplo:** Ciudad A (20°, 21°, 20°, 22°, 21°) → Rango = 2°. Ciudad B (10°, 30°, 5°, 35°, 20°) → Rango = 30°.

**El problema:** solo usa **dos valores** e ignora todo lo del medio. Un solo error de digitación (outlier) dispara el rango y deja de representar la realidad.

## 3. Varianza: midiendo la "distancia" al centro
En lugar de mirar solo los extremos, mira **cada dato** y calcula qué tan lejos está de la media:
1. Calculás la **media**.
2. Restás la media a cada dato (su "desviación").
3. **Elevás al cuadrado** cada distancia (para que las negativas no se cancelen con las positivas).
4. **Promediás** esos cuadrados.

### Población vs. Muestra (¡la distinción crucial!)
- **Población (σ²):** cuando tenés el **100%** de los datos (todos los empleados de la empresa). Se divide por **N**.
- **Muestra (s²):** cuando tenés una **parte** representativa (una encuesta a 100 de un millón). Se divide por **n − 1** (la **Corrección de Bessel**, que compensa que una muestra suele ser menos variable que la población real).

## 4. Desviación Estándar: nuestra mejor amiga
La varianza tiene un inconveniente: como elevamos al cuadrado, las **unidades** quedan al cuadrado (ej. "kilogramos²", que nadie usa). La **Desviación Estándar** aplica la **raíz cuadrada** a la varianza, devolviendo el resultado a la unidad original.
> **Interpretación:** representa, en promedio, qué tan lejos está un dato cualquiera de la media.

### Ejemplo paso a paso (muestra)
Tiempos de entrega (minutos): **10, 12, 15, 18, 20**.
1. **Media** = (10+12+15+18+20) / 5 = **15** minutos.
2. **Desviaciones al cuadrado:** (−5)²=25 · (−3)²=9 · 0²=0 · 3²=9 · 5²=25.
3. **Suma** = 25+9+0+9+25 = **68**.
4. **Varianza (muestral)** = 68 / (5−1) = 68/4 = **17**.
5. **Desviación estándar** = √17 ≈ **4,12** minutos.

> **Interpretación:** el tiempo promedio es de 15 minutos, con una desviación típica de ±4,12 minutos.

## 5. Aplicaciones en la industria
- **Control de calidad:** una fábrica de tornillos busca desviación estándar del diámetro casi cero; una desviación alta = muchas piezas defectuosas.
- **Finanzas y riesgo:** la desviación estándar se llama **volatilidad**. Una acción con desviación alta es de **alto riesgo**.
- **Marketing:** si el "Gasto Mensual" de tus clientes tiene desviación muy alta, tu base es muy diversa → necesitás **segmentar** en lugar de aplicar una estrategia única.

## 6. Errores comunes
- **Confundir varianza con desviación estándar:** la varianza es un **paso intermedio** matemático; la **desviación estándar** es lo que usás para explicar al cliente o jefe.
- **Olvidar el contexto:** una desviación de 10 es "pequeña" para precios de casas (millones), pero "gigantesca" para la edad de niños en un jardín.
- **El impacto de los outliers:** la desviación estándar es muy **sensible** a valores extremos. Un solo número muy alto la infla, haciéndote creer que hay más variabilidad de la que hay en el "corazón" de los datos.

## Resumen
- **Rango** = ancho total (Máx − Mín). Rápido pero superficial.
- **Varianza** = promedio de las distancias al cuadrado respecto a la media.
- **Desviación estándar** = raíz cuadrada de la varianza; la más confiable y usada.
- **Muestra vs. Población:** verificá si trabajás con todos los datos o una parte. En Data Analytics, casi siempre trabajás con **muestras** (`n − 1`).
- **Media + Desviación Estándar = la foto completa.** Nunca analices una sin la otra.

---
<p align="center">
<a href="./02-medidas-de-tendencia-central-con-sql.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./04-analisis-univariado-y-outliers-con-sql.md">Siguiente ➡️</a>
</p>
