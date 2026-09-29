# Scripts de la Semana 4

Todo el SQL que se ejecuta en la clase, repartido en seis archivos. **Empezá por el `00`.**

| Archivo | Qué hace |
|---------|----------|
| [`00-preparar-base.sql`](./00-preparar-base.sql) | **Empezá por acá.** Deja la base `Ventas_Tech_DB` lista |
| [`01-consultar.sql`](./01-consultar.sql) | `SELECT`, alias y `DISTINCT` |
| [`02-filtrar-y-ordenar.sql`](./02-filtrar-y-ordenar.sql) | `WHERE`, `ORDER BY` y `TOP` |
| [`03-medir.sql`](./03-medir.sql) | `COUNT`, `SUM`, `AVG`, `MIN` y `MAX` |
| [`04-agrupar.sql`](./04-agrupar.sql) | `GROUP BY`, `HAVING` y `CASE WHEN` |
| [`05-entregable.sql`](./05-entregable.sql) | El punto de partida del Checkpoint M4 |

Se abren **en orden**. Cada uno arranca con `USE Ventas_Tech_DB`, así que podés abrir cualquiera en una ventana nueva sin perderte.

---

## El 00 es el que resuelve los problemas

`00-preparar-base.sql` crea y carga la base entera. Sirve en los tres casos:

- **No tenés la base**: la crea desde cero.
- **La tenés a medias**, o le hiciste pruebas que la dejaron rara: la borra y la rehace.
- **Ya hiciste esta clase**: vuelve a dejarla en el punto de partida.

Es repetible: ejecutalo las veces que haga falta. No necesitás el script de la Semana 3 ni nada previo.

Al terminar tenés **10 ventas, todas en marzo de 2024**. Ese es el estado con el que termina la Semana 3 y donde arranca esta clase.

> Si en algún momento algo se desordena, volvé a correr el `00` y seguí desde donde estabas.

---

## Cómo se usan

**No ejecutes el archivo entero de una.** Cada paso se selecciona con el mouse y se corre con **F5**, igual que en la clase.

Los pasos están numerados con la letra de su bloque (`B.1`, `D.4`, `G1.1`), que es la misma que usa el profesor. Si en la grabación dice "vamos al paso H.3", está en `04-agrupar.sql`.

---

## Los pasos que fallan a propósito

Algunos están ahí para que veas el problema real. El comentario siempre lo avisa.

| Paso | Archivo | Qué muestra |
|------|---------|-------------|
| `B.4` | 01 | La coma olvidada. **No da error**: devuelve una columna de menos |
| `D.4` | 02 | Un `AND` imposible. **No da error**: devuelve cero filas |
| `D.5` | 02 | Un alias del `SELECT` usado en el `WHERE`. Este sí falla |
| `E.2` | 02 | Un `TOP` sin `ORDER BY`: devuelve filas al azar |
| `F.4` | 03 | Una columna suelta junto a una agregación. Falla, y el mensaje nombra la solución: `GROUP BY` |

Los tres primeros son los peligrosos, porque el motor no avisa.

---

## Sobre el paso G1.1

La base tiene las diez ventas **en marzo**. Para analizar por mes hacen falta varios meses, así que `G1.1` carga 24 ventas más y deja **34 ventas repartidas en seis meses**.

Está al principio de `04-agrupar.sql` y **hay que ejecutarlo antes** que el resto de ese archivo. Es repetible.

---

## Dos diferencias de motor que te van a romper el script

El material de la semana usa sintaxis de otros motores. En **SQL Server**, que es el del curso, no funcionan:

| Lo que dice el material | Lo que hay que escribir |
|-------------------------|-------------------------|
| `LIMIT 5` al final | `SELECT TOP 5` al principio |
| `EXTRACT(MONTH FROM fecha_venta)` | `MONTH(fecha_venta)` o `DATEPART(MONTH, fecha_venta)` |

Es la causa número uno de entregas que no ejecutan.

---

## Y después

La [consigna del Checkpoint M4](../entregable/README.md), que es lo que se entrega. Tres de las cuatro consultas se resuelven en clase, en `04-agrupar.sql`:

| Consulta del entregable | Paso |
|-------------------------|------|
| 1 — Resumen mensual | `G.2` |
| 3 — Clientes recurrentes | `H.1` |
| 4 — Meses sobre el promedio | `H.3` |

La 2, el top 5 de productos, es juntar el `GROUP BY` de `04` con el `TOP` de `02`. El esqueleto está en `05-entregable.sql`.

> **Requisito:** SQL Server 2016 o superior, y SSMS. Los scripts usan separadores `GO`, así que hay que ejecutarlos desde SSMS o Azure Data Studio.

---
<p align="center">
<a href="../README.md">Volver a la Semana 4</a> · <a href="../../README.md">Índice del curso</a>
</p>
