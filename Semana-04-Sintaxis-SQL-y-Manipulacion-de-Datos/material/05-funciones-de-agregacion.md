# 5. Funciones de agregación: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`

> Hasta acá extrajiste filas individuales. Las agregaciones son el **salto al análisis**: de datos crudos a métricas de negocio. Las mismas métricas que después vas a replicar con **DAX en Power BI (M8)**.

Imaginá que sos analista de una gran plataforma de e-commerce con millones de transacciones. Tu jefe no quiere ver los millones de filas una por una; quiere saber: *¿Cuánto dinero ganamos hoy en total? ¿Cuántos pedidos se realizaron? ¿Cuál es el precio promedio?*. En análisis rara vez nos interesa la fila individual aislada: buscamos **métricas descriptivas** que resuman grandes volúmenes en una sola cifra significativa. Ahí entran las **funciones de agregación**.

## 1. ¿Qué es una función de agregación?
Realiza un cálculo sobre un **conjunto de valores** y devuelve **un único valor** como resultado. Si un `SELECT` normal te devuelve una lista de nombres, una función de agregación te devuelve una "foto resumida" de esa lista (por ejemplo, cuántos nombres hay).

**El problema que resuelven:** sin estas funciones tendrías que exportar todo a Excel y calcular manualmente, algo ineficiente y propenso a errores con miles de registros. SQL deja que la base haga el trabajo pesado de forma instantánea.

## 2. Las 5 funciones fundamentales

### A. `COUNT` — contar registros
Cuenta el número de filas.
```sql
-- Contar cuántos empleados hay en la empresa
SELECT COUNT(*) AS total_empleados
FROM empleados;
```
> **Dato importante:** `COUNT(*)` cuenta **todas** las filas, incluidas las que tengan valores nulos. `COUNT(columna)` solo cuenta las filas donde esa columna tenga un valor.

### B. `SUM` — sumar valores numéricos
Suma todos los valores de una columna. Solo funciona con datos numéricos.
```sql
-- Calcular el total de ventas en dólares
SELECT SUM(monto_venta) AS ingresos_totales
FROM ventas;
```

### C. `AVG` — calcular el promedio (average)
Devuelve el valor medio de una columna numérica.
```sql
-- Salario promedio de los desarrolladores
SELECT AVG(salario) AS salario_medio
FROM empleados
WHERE departamento = 'IT';
```

### D. `MIN` y `MAX` — los extremos
Encuentran el valor más pequeño (`MIN`) y el más grande (`MAX`). También funcionan con **fechas** y **texto** (alfabéticamente).
```sql
-- El precio más alto y el más bajo de los productos
SELECT MIN(precio) AS precio_minimo, MAX(precio) AS precio_maximo
FROM productos;
```

## 3. Aplicaciones del mundo real

**Caso 1 — Gestión de inventario (Retail):**
```sql
SELECT
    COUNT(id_producto)  AS tipos_de_prendas,
    SUM(unidades_stock) AS total_prendas_fisicas,
    MIN(unidades_stock) AS existencias_criticas
FROM inventario;
```
*Interpretación:* hay 150 tipos de prendas (`COUNT`), 5.000 unidades en total (`SUM`), y el producto con menos stock tiene solo 2 unidades (`MIN`) → necesidad urgente de reposición.

**Caso 2 — Recursos Humanos (auditar equidad salarial):**
```sql
SELECT
    AVG(salario)               AS salario_promedio,
    MAX(salario) - MIN(salario) AS brecha_salarial
FROM empleados;
```
*Interpretación:* al restar el `MIN` del `MAX`, el analista comunica rápidamente qué tan amplia es la diferencia entre el sueldo más alto y el más bajo.

## 4. Errores comunes y mejores prácticas

**Error 1 — Confundir `COUNT` con `SUM`.** El más frecuente.
- `COUNT` cuenta "cuántos hay" (cantidad de filas).
- `SUM` suma "cuánto valen" (contenido de las celdas).
- *Ejemplo:* si tenés 2 billetes de $50, `COUNT` es **2**, pero `SUM` es **100**.

**Error 2 — El impacto de los valores `NULL`.** La mayoría de las funciones (excepto `COUNT(*)`) **ignoran** los `NULL`. Si calculás el `AVG` de salarios y algunos empleados tienen salario `NULL`, el promedio se calcula solo sobre los que sí tienen datos, lo que puede **sesgar** tu análisis si no sos consciente.

**Error 3 — Usar agregaciones con columnas individuales sin agrupar.** Un error clásico:
```sql
SELECT nombre, MAX(salario) FROM empleados;  -- ❌ incorrecto en la mayoría de motores
```
SQL se confunde porque `nombre` devuelve muchas filas y `MAX(salario)` solo una. Esto se soluciona con **`GROUP BY`** (próxima etapa). Por ahora, recordá que si usás una función de agregación, el resultado suele ser **una sola fila**.

## 5. Síntesis y conexiones
Aprendimos a transformar miles de filas en métricas clave:
- **`COUNT`:** el contador de registros.
- **`SUM`:** la calculadora de totales.
- **`AVG`:** el buscador de equilibrio (promedio).
- **`MIN` / `MAX`:** los detectores de límites.

Hasta ahora calculamos estas métricas para **toda la tabla**. El siguiente salto es calcular los mismos promedios y totales para **grupos específicos** (ventas promedio por ciudad, empleados totales por departamento) usando **`GROUP BY`**.

> 🎯 *Preguntate:* si tuvieras la base de datos de Spotify, ¿qué función usarías para saber cuántos minutos de música escuchó un usuario este año? Exacto: `SUM(segundos_escuchados) / 60`. **¡Ya estás pensando como un analista!**

---
<p align="center">
<a href="./04-order-by-y-limit.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 4</a> · <a href="../entregable/README.md">Ir al entregable (M4) ➡️</a>
</p>
