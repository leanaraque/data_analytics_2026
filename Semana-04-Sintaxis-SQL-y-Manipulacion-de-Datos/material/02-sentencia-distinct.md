# 2. Sentencia `DISTINCT`

> Ya sabés extraer columnas con `SELECT`. `DISTINCT` resuelve uno de los problemas más frecuentes en datos reales: los **duplicados** que generan sobreconteos en los reportes.

¿Alguna vez te encontraste con datos repetidos que distorsionan tus análisis? Imaginá una tabla de ventas donde algunos clientes aparecen varias veces y necesitás saber **cuántos clientes únicos** compraron. Ahí `DISTINCT` es tu mejor aliada.

## Uso básico de `DISTINCT`
La sentencia `DISTINCT` elimina filas duplicadas en el resultado de una consulta. Sintaxis general:
```sql
SELECT DISTINCT columna1, columna2, ...
FROM tabla;
```

**Ejemplo** — una lista de clientes únicos que realizaron compras:
```sql
SELECT DISTINCT ClienteID
FROM Ventas;
```

## `DISTINCT` con múltiples columnas
Cuando se usan varias columnas, `DISTINCT` considera la **combinación completa** de valores para determinar duplicados:
```sql
SELECT DISTINCT ClienteID, ProductoID
FROM Ventas;
```
> Esto devuelve combinaciones únicas de cliente y producto.

## Comparación con `GROUP BY` para deduplicación
Aunque `GROUP BY` también puede usarse para obtener valores únicos, su propósito principal es **agrupar filas para aplicar funciones agregadas**.

```sql
-- Equivalente con GROUP BY (mismos clientes únicos):
SELECT ClienteID
FROM Ventas
GROUP BY ClienteID;
```
Ambas consultas devuelven clientes únicos, pero `GROUP BY` es **más flexible** para agregar datos (sumar, contar, promediar por grupo).

## Impacto en el rendimiento
- `DISTINCT` puede ser **costoso** en tablas grandes porque requiere comparar filas para eliminar duplicados.
- Es importante usar **índices** adecuados para mejorar el rendimiento.
- En algunos casos, `GROUP BY` puede ser más eficiente si se aplican agregaciones.

> **Nota:** siempre evaluá el contexto y el volumen de datos para elegir la mejor opción.

## Terminología clave
- **`DISTINCT`:** palabra clave para eliminar duplicados en resultados.
- **`GROUP BY`:** cláusula para agrupar filas según columnas.
- **Duplicados:** filas con valores idénticos en las columnas seleccionadas.

> **En resumen:** usá `DISTINCT` cuando solo necesitás **eliminar duplicados**; usá `GROUP BY` cuando además necesitás **calcular** algo por grupo (ej. sumar ventas por cliente).

---
<p align="center">
<a href="./01-select-y-alias-de-columnas.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 4</a> · <a href="./03-where-y-operadores-logicos.md">Siguiente ➡️</a>
</p>
