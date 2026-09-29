# Ejercicios y scripts de la Semana 4

Todo el SQL que se ejecuta en la clase, en el mismo orden. Se trabaja sobre **`Ventas_Tech_DB`**, la base que construiste en la Semana 3.

| Archivo | Qué es |
|---------|--------|
| [`clase-04-paso-a-paso.sql`](./clase-04-paso-a-paso.sql) | Todo el SQL de la clase, paso a paso, con los bloques numerados por momento |

---

## Cómo usarlo

No ejecutes el archivo entero de una. Cada paso se selecciona con el mouse y se corre con **F5**, igual que en la clase.

Los bloques están numerados por momento:

| Bloque | Momento de la clase |
|--------|---------------------|
| A | Preparación: pararse en la base y confirmar que hay datos |
| B | `SELECT` y alias |
| C | `DISTINCT` |
| D | `WHERE` y operadores lógicos |
| E | `ORDER BY` y `TOP` |
| F | Funciones de agregación |
| G1 | Ampliar el dataset a seis meses |
| G | `GROUP BY` |
| H | `HAVING` y `CASE WHEN` |
| I | El entregable M4 |

### Los pasos que fallan a propósito

Algunos están ahí para que veas el problema real. El comentario siempre lo avisa:

| Paso | Qué muestra |
|------|-------------|
| `B.6` | La coma olvidada. **No da error**: devuelve una columna de menos |
| `D.5` | Un `AND` imposible. **No da error**: devuelve cero filas |
| `D.6` | Un alias del `SELECT` usado en el `WHERE`. Este sí falla |
| `F.6` | Una columna suelta junto a una agregación. Falla, y el mensaje nombra la solución: `GROUP BY` |

Los dos primeros son los peligrosos, porque el motor no avisa.

---

## Sobre el bloque G1

La base de la Semana 3 tiene las diez ventas **en marzo**. Para poder analizar por mes hacen falta varios meses, así que el bloque `G1.1` carga 24 ventas más y deja **34 ventas repartidas en seis meses**.

Es repetible: borra lo que haya cargado antes y vuelve a insertar. Si alguna vez volvés a correr `ventas_tech_db.sql` de la Semana 3, corré `G1.1` otra vez.

---

## Dos diferencias de motor que te van a romper el script

El material de la semana usa sintaxis de otros motores. En **SQL Server**, que es el del curso, no funcionan:

| Lo que dice el material | Lo que hay que escribir |
|-------------------------|-------------------------|
| `LIMIT 5` al final | `SELECT TOP 5` al principio |
| `EXTRACT(MONTH FROM fecha_venta)` | `MONTH(fecha_venta)` o `DATEPART(MONTH, fecha_venta)` |

---

## Y después

La [consigna del Checkpoint M4](../entregable/README.md), que es lo que se entrega. Tres de las cuatro consultas se resuelven en clase: la 1 es el bloque `G.3`, la 3 es `H.2` y la 4 es `H.4`.

> **Requisito:** SQL Server 2016 o superior, y SSMS. El script usa separadores `GO`, así que hay que ejecutarlo desde SSMS o Azure Data Studio.

---
<p align="center">
<a href="../README.md">Volver a la Semana 4</a> · <a href="../../README.md">Índice del curso</a>
</p>
