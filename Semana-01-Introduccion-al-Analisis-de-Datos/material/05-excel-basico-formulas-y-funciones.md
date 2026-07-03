# 5. Excel básico: fórmulas y funciones fundamentales

> 🚧 **Contenido de clase pendiente.** El material específico de esta unidad se agrega cuando se dicte la clase. Mientras tanto, dejamos esta **guía de referencia rápida** con las funciones fundamentales que todo analista debería dominar.

Excel es la "mesa de laboratorio" del analista: un lugar para limpiar datos, crear tus primeros modelos descriptivos y visualizar hallazgos.

## Conceptos base
- **Celda, fila, columna y rango** (ej. `A1`, `A1:B10`).
- **Referencias relativas vs. absolutas:** `A1` (relativa) vs. `$A$1` (absoluta). El `$` "fija" fila y/o columna al copiar la fórmula.
- Toda fórmula empieza con `=`.

## Funciones fundamentales

| Función | Para qué sirve | Ejemplo |
|---------|----------------|---------|
| `SUMA` / `SUM` | Sumar un rango | `=SUMA(B2:B100)` |
| `PROMEDIO` / `AVERAGE` | Media aritmética | `=PROMEDIO(B2:B100)` |
| `CONTAR` / `COUNT` | Contar números | `=CONTAR(B2:B100)` |
| `CONTARA` / `COUNTA` | Contar celdas no vacías | `=CONTARA(A2:A100)` |
| `MAX` / `MIN` | Valor máximo / mínimo | `=MAX(B2:B100)` |
| `SI` / `IF` | Lógica condicional | `=SI(B2>100;"Alto";"Bajo")` |
| `SUMAR.SI` / `SUMIF` | Sumar con condición | `=SUMAR.SI(A2:A100;"Norte";B2:B100)` |
| `CONTAR.SI` / `COUNTIF` | Contar con condición | `=CONTAR.SI(A2:A100;"Norte")` |
| `BUSCARV` / `VLOOKUP` | Buscar un valor en una tabla | `=BUSCARV(D2;A2:B100;2;FALSO)` |
| `BUSCARX` / `XLOOKUP` | Búsqueda moderna (más flexible) | `=BUSCARX(D2;A2:A100;B2:B100)` |
| `CONCAT` / `TEXTO` | Combinar / formatear texto | `=CONCAT(A2;" ";B2)` |
| `HOY` / `AHORA` | Fecha / fecha-hora actual | `=HOY()` |

## Herramientas útiles para analizar
- **Tablas dinámicas (Pivot Tables):** resumir y agregar datos rápidamente (el equivalente a un `GROUP BY`).
- **Filtros y ordenamiento.**
- **Formato condicional:** resaltar valores según reglas.
- **Gráficos:** columnas, líneas y circulares para una primera visualización.

> 💡 Muchos conceptos de Excel (agregación, filtros, búsquedas) se traducen luego a **SQL** y **Power BI**. Dominarlos acá te da ventaja en los módulos siguientes.

---
<p align="center">
<a href="./04-rol-del-analista-de-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 1</a> · <a href="./06-tecnologias-y-herramientas.md">Siguiente ➡️</a>
</p>
