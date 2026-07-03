# 1. Consultas básicas: `SELECT` y alias de columnas

> Arranca el corazón del trabajo diario del analista: extraer exactamente lo que necesitás de una base de datos.

En el análisis de datos, **SQL** es el puente entre las preguntas de negocio y las respuestas ocultas en las bases de datos. La sentencia más fundamental —y la que usarás el **99% del tiempo**— es `SELECT`.

## ¿Por qué el *cómo* pedís los datos importa?
Imaginá que entrás a una biblioteca inmensa. Si le pedís al bibliotecario *"tráeme todo lo que tenés"*, te verás sepultado por miles de libros que no necesitás. En bases de datos, pedir "todo" consume tiempo, memoria y dinero. Por eso, ser específico con `SELECT` es una habilidad de **eficiencia**, no solo de sintaxis.

## 1. La sentencia `SELECT` y el uso de `*`
La estructura básica de una consulta es:
```sql
SELECT columnas_que_quiero
FROM tabla_donde_estan;
```

Si realmente necesitás ver **cada** columna de una tabla, usamos el asterisco (`*`):
```sql
SELECT * FROM empleados;
```
> **Interpretación:** *"Seleccioná todas las columnas de la tabla `empleados`"*.

## 2. Selección de columnas específicas
Como analista, rara vez necesitás las 50 columnas de una tabla. Al listar las columnas separadas por comas, tu consulta es más **rápida** y **fácil de leer**:
```sql
SELECT nombre, salario FROM empleados;
```

## 3. Alias de columnas: el poder de `AS`
A menudo los nombres de las columnas son técnicos o difíciles de entender (ej. `f_nac_usr` o `tx_total_amt`). Los **alias** te permiten renombrar temporalmente estas columnas en el resultado para que sean amigables:

```sql
SELECT product_name AS producto, price AS precio_unitario
FROM inventario;
```

### ¿Por qué usar alias?
- **Claridad:** `total_gross_revenue` se entiende mejor como `ingresos_totales`.
- **Preparación para reportes:** si vas a enviar estos datos a Power BI o Excel, los alias ya dejan los encabezados listos para una presentación profesional.
- **Cálculos:** (lo verás más adelante) los alias son vitales para dar nombre a resultados de sumas o promedios.

## Errores comunes a evitar
- **Olvidar la coma:** `SELECT nombre apellido FROM tabla` causa un error (SQL pensará que `apellido` es un alias de `nombre`). Debe ser `nombre, apellido`.
- **Coma de más al final:** `SELECT col1, col2, FROM tabla` es un error de sintaxis frecuente. No pongas coma después de la última columna antes del `FROM`.
- **Alias con espacios:** si querés que tu alias tenga espacios (ej. `Precio Final`), usá comillas dobles: `AS "Precio Final"`. Aunque la **mejor práctica** en datos es usar guiones bajos: `AS precio_final`.

---
<p align="center">
🏠 <a href="../README.md">Semana 4</a> · <a href="./02-sentencia-distinct.md">Siguiente: Sentencia DISTINCT ➡️</a>
</p>
