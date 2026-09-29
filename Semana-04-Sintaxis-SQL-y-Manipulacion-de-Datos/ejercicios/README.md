# Ejercicios y scripts de la Semana 4

Todo el SQL que se ejecuta en la clase, en el mismo orden. Se trabaja sobre **`Ventas_Tech_DB`**, la base que construiste en la Semana 3.

| Archivo | Qué es |
|---------|--------|
| [`clase-04-paso-a-paso.sql`](./clase-04-paso-a-paso.sql) | Todo el SQL de la clase, paso a paso, con los bloques numerados por momento |

---

## Empezá por el bloque A.0

El script arranca con un bloque que **deja la base lista**, pase lo que pase:

- **No tenés la base**: la crea desde cero.
- **La tenés a medias**, o le hiciste pruebas: la borra y la rehace.
- **Ya hiciste esta clase**: vuelve a dejarla en el punto de partida.

Es repetible: podés ejecutarlo las veces que haga falta. No necesitás el script de la Semana 3 ni nada previo.

Después de A.0 la base queda con **10 ventas, todas en marzo de 2024**. Ese es el estado con el que termina la Semana 3, y el punto donde arranca esta clase.

---

## Cómo usarlo

No ejecutes el archivo entero de una. Cada paso se selecciona con el mouse y se corre con **F5**, igual que en la clase.

Los bloques están numerados por momento:

| Bloque | Momento de la clase |
|--------|---------------------|
| A.0 | Poner la base en condiciones: borra y rehace todo |
| A.1 | Confirmar el punto de partida: 10 ventas en 1 mes |
| B, C | Consultar: `SELECT`, alias y `DISTINCT` |
| D, E | Filtrar y ordenar: `WHERE`, `ORDER BY` y `TOP` |
| F | Medir: las cinco funciones de agregación |
| G1 | Ampliar el dataset a seis meses |
| G, H | Agrupar: `GROUP BY`, `HAVING` y `CASE WHEN` |
| I | El entregable M4 |

### Los pasos que fallan a propósito

Algunos están ahí para que veas el problema real. El comentario siempre lo avisa:

| Paso | Qué muestra |
|------|-------------|
| `B.4` | La coma olvidada. **No da error**: devuelve una columna de menos |
| `D.4` | Un `AND` imposible. **No da error**: devuelve cero filas |
| `D.5` | Un alias del `SELECT` usado en el `WHERE`. Este sí falla |
| `E.2` | Un `TOP` sin `ORDER BY`: devuelve filas al azar |
| `F.4` | Una columna suelta junto a una agregación. Falla, y el mensaje nombra la solución: `GROUP BY` |

Los tres primeros son los peligrosos, porque el motor no avisa.

---

## Sobre el bloque G1

La base de la Semana 3 tiene las diez ventas **en marzo**. Para poder analizar por mes hacen falta varios meses, así que el bloque `G1.1` carga 24 ventas más y deja **34 ventas repartidas en seis meses**.

Es repetible: borra lo que haya cargado antes y vuelve a insertar.

**Si querés volver al principio**, ejecutá de nuevo el bloque `A.0`: deja las 10 ventas originales. Y si después querés recuperar los seis meses, corré `G1.1` otra vez.

---

## Dos diferencias de motor que te van a romper el script

El material de la semana usa sintaxis de otros motores. En **SQL Server**, que es el del curso, no funcionan:

| Lo que dice el material | Lo que hay que escribir |
|-------------------------|-------------------------|
| `LIMIT 5` al final | `SELECT TOP 5` al principio |
| `EXTRACT(MONTH FROM fecha_venta)` | `MONTH(fecha_venta)` o `DATEPART(MONTH, fecha_venta)` |

---

## Y después

La [consigna del Checkpoint M4](../entregable/README.md), que es lo que se entrega. Tres de las cuatro consultas se resuelven en clase: la 1 es el bloque `G.2`, la 3 es `H.1` y la 4 es `H.3`.

> **Requisito:** SQL Server 2016 o superior, y SSMS. El script usa separadores `GO`, así que hay que ejecutarlo desde SSMS o Azure Data Studio.

---
<p align="center">
<a href="../README.md">Volver a la Semana 4</a> · <a href="../../README.md">Índice del curso</a>
</p>
