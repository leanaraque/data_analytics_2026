# 2. Medidas de tendencia central con SQL: media, mediana y moda

> Con las variables clasificadas, el primer análisis es entender **dónde se concentran** los datos. Vas a ver también cuándo la media **miente** y la mediana es más honesta.

Antes de crear gráficos complejos, necesitamos entender el "comportamiento típico" de la información. Las **medidas de tendencia central** resumen un conjunto de valores en uno solo que represente el "centro".

## ¿Por qué necesitamos tres medidas diferentes?
Imaginá los salarios en una empresa de 5 personas:
- 4 empleados ganan **$1.000** cada uno.
- El dueño gana **$20.000**.

Si solo usás el **promedio (media)**, dirás que el salario promedio es de **$4.800** *(porque (4×1.000 + 20.000) / 5 = 4.800)* — un número que **no representa a nadie**. En cambio, la **mediana ($1.000)** o la **moda ($1.000)** dan una imagen mucho más real de la situación.

## 1. La Media (`AVG`)
La suma de todos los valores dividida por el número total. Es la más sencilla en SQL.
> **Uso ideal:** datos numéricos **sin** valores extremadamente altos o bajos (distribuciones simétricas).
```sql
SELECT AVG(monto_pedido) AS promedio_ventas
FROM pedidos;
```

## 2. La Mediana
El valor que queda justo **en medio** al ordenar los datos de menor a mayor: el 50% está por debajo y el 50% por encima.
> **Uso ideal:** cuando tus datos tienen "ruido" o **outliers** (como el salario del dueño).

En PostgreSQL o SQL Server usamos `PERCENTILE_CONT` (percentil continuo):
```sql
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY edad) AS mediana_edad
FROM clientes;
```

## 3. La Moda
El valor que **más se repite**. A diferencia de las otras, es la única que se puede usar con datos **categóricos** (texto).
> **Uso ideal:** el producto más vendido, el color favorito, la ciudad con más clientes.

En SQL no hay función `MODA()`, así que usamos conteo y agrupamiento:
```sql
SELECT ciudad, COUNT(*) AS frecuencia
FROM clientes
GROUP BY ciudad
ORDER BY frecuencia DESC
LIMIT 1;
```

## Errores comunes al analizar el "centro"
- **Usar la media para todo:** no siempre es el mejor representante. Preguntate: *"¿Hay valores extremos que estén afectando este promedio?"*.
- **Confundir media con moda:** la **media** es un cálculo aritmético; la **moda** es un registro de frecuencia (el que más veces aparece).
- **No limpiar nulos:** funciones como `AVG()` suelen ignorar los `NULL`, pero conviene saber cuántos nulos tenés antes de confiar ciegamente en el resultado.

## Resumen rápido
- **Media:** "el promedio democrático".
- **Mediana:** "el punto exacto de equilibrio".
- **Moda:** "el grito más fuerte (el más popular)".

---
<p align="center">
<a href="./01-variables-cualitativas-y-cuantitativas.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./03-medidas-de-dispersion.md">Siguiente ➡️</a>
</p>
