# 📦 M4 — Pre-entrega: Consultas SQL de negocio

> **Título:** Extrayendo métricas clave con SQL.

## 🎯 En una frase
Ya tenés la base de datos creada en **M3**. Ahora escribís las primeras consultas que responden directamente a **preguntas de negocio**. Es el primer paso de la extracción de datos que después vas a conectar a Power BI en **M6**.

## 🏢 Contexto
El equipo comercial de **RetailPro** necesita respuestas rápidas antes de la reunión del lunes. No quieren ver todas las filas de la base: quieren **métricas concretas, rankings y comparativas**. Tu tarea es escribir las consultas SQL que generen exactamente esa información.

## ✅ ¿Qué entregás?
El **enlace a tu repositorio GitHub público** con el archivo **`m4_consultas_negocio.sql`** dentro de la carpeta del proyecto.

---

## 📝 Instrucciones
Sobre la base **`Ventas_Tech_DB`** creada en M3, escribí las consultas en `m4_consultas_negocio.sql`. Trabajamos solo sobre la tabla **`ventas`** (recordá que tiene `id_cliente`, `id_producto`, `cantidad`, `precio_unitario` y `fecha_venta`). Los nombres de productos y clientes los vas a poder traer **cruzando tablas con `JOIN` en el Módulo 5**; por ahora trabajamos con los **IDs**.

### Consulta 1 — Resumen ejecutivo mensual
Total facturado, cantidad de pedidos y ticket promedio, **agrupados por mes**.
- Calculá el total como `cantidad * precio_unitario`.
- Usá **alias descriptivos en español**.
- Agrupá por mes con `EXTRACT(MONTH FROM fecha_venta)`.

### Consulta 2 — Ranking de productos
**Top 5** de `id_producto` por total facturado, mostrando las **unidades vendidas** (`SUM(cantidad)`) y el total generado.
- Usá `GROUP BY id_producto`, `ORDER BY` y limitá el resultado a **5**.

### Consulta 3 — Clientes recurrentes
`id_cliente` que hayan realizado **más de un pedido**, mostrando la cantidad de pedidos y el total gastado.
- Usá `GROUP BY id_cliente` y `HAVING COUNT(*) > 1`.

### Consulta 4 — Meses por encima / por debajo del promedio
Total facturado por mes, con una columna adicional que **etiquete con `CASE WHEN`** si ese mes quedó `'Por encima'` o `'Por debajo'` del promedio mensual general.

### Bloque de cierre
Al final del archivo, agregá un bloque de comentarios `--` con **3 hallazgos concretos** que encontraste al revisar los resultados.
> **Ejemplo:** `-- El producto 1 concentra el 40% de la facturación del trimestre.`

---

## 💡 Ayudas técnicas (patrones, no la solución)
Estas piezas nuevas aparecen en la consigna. Acá tenés la **sintaxis** para que las incorpores vos:

**Extraer el mes de una fecha:**
```sql
SELECT EXTRACT(MONTH FROM fecha_venta) AS mes, ...
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);
```

**Filtrar sobre un resultado agrupado (`HAVING`):** `WHERE` filtra filas *antes* de agrupar; `HAVING` filtra *después* de agrupar.
```sql
SELECT id_cliente, COUNT(*) AS pedidos
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;
```

**Crear una etiqueta condicional (`CASE WHEN`):**
```sql
SELECT ...,
       CASE WHEN total_mes > (promedio_general) THEN 'Por encima'
            ELSE 'Por debajo'
       END AS comparativa
FROM ...;
```

> 🧩 *Pista para la Consulta 4:* podés obtener el promedio mensual general con una **subconsulta** dentro del `CASE`, o calcularlo aparte y compararlo. ¡Animate a resolverlo vos!

---

## ✔️ Checklist de entrega
- [ ] Archivo **`m4_consultas_negocio.sql`** con las **4 consultas** resueltas.
- [ ] Alias descriptivos **en español**.
- [ ] Consulta 2 limitada al **Top 5**; Consulta 3 con `HAVING`; Consulta 4 con `CASE WHEN`.
- [ ] Bloque final de comentarios con **3 hallazgos** concretos.
- [ ] Repositorio de GitHub **público**.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 4</a> · <a href="../../README.md">Índice del curso</a>
</p>
