# Ejercicios y scripts de la Semana 3

Todo lo que se ejecuta en la clase, y las dos prácticas guiadas. **Es un solo modelo de datos**: `Ventas_Tech_DB`, la base de TechStore, la misma que vas a usar durante todo el curso.

---

## Los dos scripts

| Archivo | Qué es | Cuándo lo usás |
|---------|--------|----------------|
| [`clase-03-paso-a-paso.sql`](./clase-03-paso-a-paso.sql) | **Todo el SQL de la clase**, paso a paso y en el mismo orden en que se ejecutó, incluidos los errores que provocamos a propósito | Para rehacer la clase completa, o para ubicarte en la grabación |
| [`ventas_tech_db.sql`](./ventas_tech_db.sql) | **El mismo resultado, consolidado** en un solo script repetible | Es el modelo del Checkpoint M3, tu entregable |

Los dos dejan **exactamente la misma base**: 4 categorías, 5 clientes, 6 productos y 10 ventas. Uno te muestra el camino, el otro te muestra el destino.

### Cómo leer el paso a paso

El script está dividido en bloques, y cada bloque dice a qué slide de la presentación corresponde:

```
BLOQUE D  ·  [slide 27]  ·  El modelo, ahora con claves
```

Así podés saltar a ese momento de la clase grabada si algo no te cerró.

Algunos pasos **fallan a propósito**: están ahí para que veas el mensaje de error real. Cuando es el caso, el comentario lo avisa. No son errores del script.

---

## El recorrido

| Bloque | Slide | Qué construye |
|--------|-------|---------------|
| A | 13 | Crear la base y pararse adentro |
| B | 21 | La primera tabla, en borrador |
| C | 23 | Elegir los tipos de `clientes` y `productos` — es la [Práctica 1](./practica-01-diseno-de-tablas.md) |
| D | 27 | Rehacer las tablas con sus claves, y sumar `ventas` |
| E | 29 | Romper las reglas a propósito y ver qué protege cada restricción |
| F | 33 | `ALTER`: cambiar sin perder los datos |
| G | 34 | `DROP` y el orden de las dependencias |
| H | 42 | Cargar los datos con `INSERT` |
| I | 42 | `UPDATE` y `DELETE`, sobre una copia |
| J | 46 | `GRANT` y `REVOKE` (solo se muestran) |

Del bloque D al H sale, exactamente, el contenido de [`ventas_tech_db.sql`](./ventas_tech_db.sql).

---

## Las prácticas guiadas *(no evaluables)*

| Práctica | Qué trabaja | Bloque |
|----------|-------------|--------|
| [Práctica 1 — Elegir los tipos de datos](./practica-01-diseno-de-tablas.md) | Qué tipo le corresponde a cada columna, y por qué | C |
| [Práctica 2 — Construir `Ventas_Tech_DB`](./practica-02-ventas-tech-db.md) | El modelo completo: claves, relaciones y carga de datos | D y H |

---

## Y después

[`repaso-flashcards.md`](./repaso-flashcards.md) para fijar los conceptos, y la [consigna del Checkpoint M3](../entregable/README.md), que es lo que se entrega.

> **Requisito:** SQL Server 2016 o superior, y SSMS. Los scripts usan separadores `GO`, que interpreta el cliente, así que hay que ejecutarlos desde SSMS o Azure Data Studio.

---
<p align="center">
<a href="../README.md">Volver a la Semana 3</a> · <a href="../../README.md">Índice del curso</a>
</p>
