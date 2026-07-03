# 📦 M5 — Pre-entrega: Consultas con JOINs para el proyecto

> **Título:** Cruzando tablas para enriquecer el análisis.

## 🎯 En una frase
Las consultas de **M4** trabajaban sobre tablas individuales. Ahora las **cruzás** para obtener la **vista enriquecida** que necesita Power BI: ventas con nombre de cliente, nombre de producto, categoría y región en una sola consulta. Esa vista es la **materia prima del dashboard** que vas a construir en M7.

## 🏢 Contexto
El equipo de análisis de **RetailPro** necesita una **vista única** que cruce toda la información del negocio. Además, el área de **CRM** quiere saber qué clientes **nunca compraron**, y el área de **producto** quiere identificar qué artículos del catálogo **no tienen movimiento**. Tu tarea es responder las tres preguntas con JOINs.

## ✅ ¿Qué entregás?
El **enlace a tu repositorio GitHub público** con el archivo **`m5_consultas_joins.sql`**, en la misma carpeta que los archivos de M3 y M4.

---

## 📝 Instrucciones
Creá `m5_consultas_joins.sql` con las siguientes consultas:

### Consulta 1 — Vista base del proyecto (`INNER JOIN`)
Combiná `ventas`, `clientes`, `productos` y `territorios` para obtener en una sola fila: **fecha, nombre del cliente, segmento, región, nombre del producto, categoría, cantidad, precio unitario, total de venta y canal**.
> Esta consulta será la **fuente de datos principal** en Power BI.

### Consulta 2 — Clientes sin ventas (`LEFT JOIN`)
Identificá clientes registrados que **aún no compraron**. Mostrá su nombre, email y fecha de registro.
> Usá `WHERE ... IS NULL` para aislar los casos.

### Consulta 3 — Productos sin ventas (`LEFT JOIN`)
Identificá productos del catálogo que **no tienen ninguna venta** registrada. Mostrá nombre del producto, categoría y precio.
> Usá `WHERE ... IS NULL`.

### Consulta 4 — Consolidado por canal (`UNION ALL`)
Usá `UNION ALL` para combinar en un solo resultado las ventas **Online** y **Presencial**, agregando una columna `canal` que identifique el origen de cada fila. Al final, calculá el **total por canal** con un `GROUP BY`.

---

## 💡 Ayudas técnicas (patrones, no la solución)

**JOIN de varias tablas encadenadas** (para la Consulta 1):
```sql
SELECT ...
FROM ventas v
INNER JOIN clientes    c ON v.id_cliente    = c.id_cliente
INNER JOIN productos   p ON v.id_producto   = p.id_producto
INNER JOIN territorios t ON v.id_territorio = t.id_territorio;
```

**Registros "sin par"** (patrón `LEFT JOIN ... IS NULL`, para Consultas 2 y 3):
```sql
SELECT c.nombre, c.email, c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;   -- se quedan solo los que NO tienen venta
```

**Consolidar con `UNION ALL` + etiqueta de origen** (para la Consulta 4):
```sql
SELECT 'Online' AS canal, total_venta FROM ventas WHERE canal = 'Online'
UNION ALL
SELECT 'Presencial' AS canal, total_venta FROM ventas WHERE canal = 'Presencial';
-- luego envolvés esto en un GROUP BY canal para el total
```

> 🧩 *Ajustá los nombres de columnas a tu modelo de RetailPro (M2). El resultado final lo vas a conectar a Power BI en M6/M7.*

---

## ✔️ Checklist de entrega
- [ ] Archivo **`m5_consultas_joins.sql`** con las **4 consultas**.
- [ ] Consulta 1: `INNER JOIN` de las 4 tablas con todas las columnas pedidas.
- [ ] Consultas 2 y 3: `LEFT JOIN` + `IS NULL` para aislar los "sin par".
- [ ] Consulta 4: `UNION ALL` con columna `canal` + `GROUP BY`.
- [ ] Repositorio de GitHub **público**, misma carpeta que M3 y M4.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 5</a> · <a href="../../README.md">Índice del curso</a>
</p>
