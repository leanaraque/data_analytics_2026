# 7. Automatización de procesos de limpieza con funciones de Power Query

> Ya conocés el lenguaje M. Esta unidad lo aplica al problema más común del analista: limpiar el mismo tipo de archivo una y otra vez.

## El problema de la repetitividad en ETL
Imaginá que conectás Power BI a una cadena de supermercados con **12 tablas** (una por mes de ventas). Todas tienen los mismos problemas: filas nulas al final, registros duplicados, valores faltantes. Podrías aplicar los mismos 10 pasos manualmente a las 12 tablas… pero si el próximo mes llega una tabla nueva, tendrías que repetir todo. Y si cambia la lógica de limpieza, tendrías que editar 12 consultas.

Ahí entran las **Funciones de Power Query**: una "receta guardada" a la que le das ingredientes (datos sucios) y te devuelve el plato terminado (datos limpios), siempre con las mismas instrucciones.

## Conceptos clave: funciones en lenguaje M
- **Parámetros:** el "hueco" donde ponés la tabla a limpiar. Se define al inicio como `(miTabla as table) =>`.
- **Cuerpo de la función:** la lista de pasos (`let ... in`) que se aplica a `miTabla`.
- **Invocación:** el acto de llamar a la función para que trabaje sobre una consulta específica.

```powerquery
(tabla_entrada as table) =>
let
    CorregirNombre = Table.RenameColumns(tabla_entrada, {{"OldName", "NewName"}})
in
    CorregirNombre
```

## ¿Por qué automatizar?
- **Mantenibilidad:** si la lógica cambia (ej. ahora los nulos se reemplazan por `"N/A"` en vez de `0`), solo cambiás la función en **un** lugar.
- **Consistencia:** todas las tablas siguen el mismo estándar de calidad.
- **Eficiencia:** ahorrás horas de trabajo manual en proyectos con muchas fuentes similares.

## Errores comunes
- **Hardcoding de nombres:** si tu función busca una columna `"Precio"` y se la aplicás a una tabla que no la tiene, fallará. Las funciones deben ser lo más **genéricas** posible o estar bien documentadas.
- **Error de tipos:** aplicar una limpieza numérica (reemplazar nulos por `0`) a una columna que solo tiene texto provoca errores.

---

## 🧪 Desafío guiado — Automatización ETL con el Editor Avanzado
> 📖 **Para profundizar** — Contenido avanzado; podés continuar sin hacerlo y volver luego.

Actuás como un Data Analyst que recibió una tabla de productos con **inconsistencias**: espacios alrededor de los nombres (`" Laptop "`), mayúsculas/minúsculas mezcladas, y registros de `"PRUEBA"` que no deben llegar al reporte. Tu objetivo es completar el código M para **limpiar, filtrar y tipar**.

**Reglas del ejercicio:**
1. **Limpieza:** los nombres de productos deben quedar en **MAYÚSCULAS** y **sin espacios** al inicio/final.
2. **Filtro:** eliminar cualquier registro cuya categoría sea `"PRUEBA"`.
3. **Tipado:** la columna `ID` debe ser **numérica** y el resto **texto**.

**Entrada:**

| ID | Producto | Categoria |
|----|----------|-----------|
| 1 | `" Laptop "` | `"Electrónica"` |
| 3 | `" Teclado "` | `"PRUEBA"` |

**Salida esperada:**

| ID | Producto | Categoria |
|----|----------|-----------|
| 1 | `"LAPTOP"` | `"Electrónica"` |

*(El registro 3 desaparece por ser de categoría `PRUEBA`.)*

> 💡 **Pistas de funciones M:** `Text.Trim` (quitar espacios), `Text.Upper` (mayúsculas) y `Table.SelectRows` (filtrar). Recordá: **M es case-sensitive** (`Table.SelectRows` ≠ `table.selectrows`).

---
<p align="center">
<a href="./06-lenguaje-m-y-editor-avanzado.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./08-maestria-del-etl.md">Siguiente ➡️</a>
</p>
