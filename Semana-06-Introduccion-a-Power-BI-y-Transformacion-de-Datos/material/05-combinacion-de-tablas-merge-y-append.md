# 5. Combinación de tablas: Merge y Append en Power Query

> Con las tablas limpias por separado, ahora las combinás. **Merge** es el equivalente visual del `JOIN` de M5; **Append** es el equivalente del `UNION` — los mismos conceptos, ahora en la interfaz gráfica.

La información rara vez vive en un solo lugar. Podés tener una tabla de millones de ventas que necesitás conectar con una de clientes, o archivos de ventas separados por mes que necesitás unir en un reporte anual. En Power Query resolvemos esto con dos operaciones: **Merge** y **Append**.

## 1. Append (Anexar): "sumar filas"
Operación de **crecimiento vertical**. Se usa cuando tenés varias tablas con la **misma estructura** (mismas columnas) y querés poner una debajo de la otra.
- **Analogía:** tenés tres listas de invitados en tres papeles distintos; anexar es **graparlos** uno tras otro para tener una sola gran lista.
- **Caso de uso:** unir las ventas de Enero, Febrero y Marzo en una tabla única de `PrimerTrimestre`.

> **Regla de oro:** para que un Append funcione bien, los **nombres de columnas** y sus **tipos de datos** deben coincidir en todas las tablas.

## 2. Merge (Combinar): "añadir columnas"
Operación de **crecimiento horizontal**. Se usa para traer información adicional de una tabla a otra, basándose en una **columna clave** que ambas comparten (como un ID). Es el equivalente visual a los **JOINs** de SQL.
- **Analogía:** tenés una lista de pedidos con `ID_Producto` y, en otra hoja, el catálogo con los nombres. Combinar es buscar el `ID_Producto` en el catálogo y escribir el nombre al lado de cada pedido.
- **Caso de uso:** enriquecer tu tabla de `Ventas` con el `Nombre del Cliente` y la `Ciudad`, usando `ID_Cliente` como puente.

**Tipos de combinación comunes:**
- **Left Outer (izquierda externa):** mantiene todas las filas de la primera tabla y solo trae lo que coincida de la segunda. **Es la más común.**
- **Inner (interna):** solo mantiene las filas donde hay coincidencia en ambas tablas.

## Errores comunes a evitar
- **Confundir Merge con Append:** preguntate siempre *"¿Quiero más registros (filas) o más detalle (columnas)?"*. Más registros → **Append**. Más detalle → **Merge**.
- **Olvidar "Expandir" tras un Merge:** al combinar, Power Query crea una columna con valores tipo `Table`. Hacé clic en el ícono de **dos flechas** en la esquina de la columna para elegir qué campos "expandir" y ver los datos.
- **Tipos de datos diferentes en la clave:** si el `ID` es Texto en una tabla y Número en otra, el Merge fallará o no encontrará coincidencias. Asegurate de que el tipo sea **idéntico** antes de combinar.

---
<p align="center">
<a href="./04-limpieza-y-tipado-en-power-query.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./06-lenguaje-m-y-editor-avanzado.md">Siguiente ➡️</a>
</p>
