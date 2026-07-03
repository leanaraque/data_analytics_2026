# 4. Limpieza y tipado de datos en Power Query

> Los datos ya están conectados. El problema es que raramente llegan limpios: nulos inconsistentes, tipos incorrectos, fechas en formatos mixtos — el mismo tipo de suciedad que ya detectaste con SQL en M4.

Existe una regla de oro: **"Basura entra, basura sale"** (*Garbage In, Garbage Out*). Si alimentás tus reportes con datos desordenados, tus conclusiones serán erróneas. **Power Query** es la herramienta de **ETL** de Power BI que actúa como un filtro de purificación antes de que los datos lleguen a tus gráficos.

## 1. ¿Por qué transformar los datos?
Cuando conectás Power BI a SQL, los datos vienen "crudos". Es común encontrar:
- **Filas vacías:** registros incompletos que ensucian los promedios.
- **Duplicados:** ventas registradas dos veces que inflan artificialmente los ingresos.
- **Tipos de datos incorrectos:** fechas leídas como texto, que impiden crear filtros temporales.

> ⚠️ **Importante:** Power Query **no modifica la base de datos original**. Funciona como una "receta": tomás los ingredientes (datos de SQL), los limpiás en el editor, y el resultado es lo que se sirve en el plato (tu reporte). Si borrás algo en Power Query, los datos en el servidor SQL siguen **intactos**.

## 2. El proceso de limpieza (workflow)
Orden recomendado para principiantes:
1. **Diagnóstico:** pestaña **Vista > Calidad de columna**. Verás barras **verdes** (válidos), **rojas** (errores) y **grises** (vacíos).
2. **Limpieza de estructura:**
   - **Eliminar filas en blanco:** *Inicio > Quitar filas > Quitar filas en blanco*.
   - **Eliminar duplicados:** seleccioná la columna clave (`ID`, `SKU`) y *Quitar filas > Quitar duplicados*.
3. **Tipado (el paso crítico):** observá el ícono al lado del nombre de cada columna (`ABC` = texto, `123` = número):
   - **Texto:** para nombres o categorías.
   - **Número:** necesario para hacer `SUM` o `AVG`.
   - **Fecha:** vital para líneas de tiempo y segmentadores de fecha.

## 3. Error común: el falso número
A veces un precio llega como `"100.50"` (en **texto**). Si intentás sumarlo, Power BI no te deja porque *"no sabe sumar palabras"*. Debés cambiar el tipo a **Número decimal** para "desbloquear" las propiedades matemáticas de esa columna.

> **Regla de oro:** siempre revisá que tus fechas tengan el ícono de un **calendario** pequeño. Si tienen el ícono `ABC`, Power BI no entenderá que "Enero" viene antes que "Febrero".

## 🎥 Video — Dimensiones y medidas en Power BI
Cómo **identificar** qué campos describen o categorizan (dimensiones: nombre de cliente, categoría, fecha) y cuáles son valores numéricos que se agregan o calculan (medidas: ventas totales, cantidad, promedio). Power BI las clasifica automáticamente, pero a veces se equivoca; aprendé a **corregir** esa clasificación manualmente para evitar errores en las visualizaciones.

## Síntesis
Power Query es tu **zona segura** para limpiar datos sin romper el origen. El tipado correcto no es solo estética: es lo que permite que las fórmulas funcionen correctamente más adelante.

---
<p align="center">
<a href="./03-conexion-a-postgresql-y-sql-server.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./05-combinacion-de-tablas-merge-y-append.md">Siguiente ➡️</a>
</p>
