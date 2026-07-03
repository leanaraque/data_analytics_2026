# 6. Introducción al lenguaje M y Editor Avanzado

> La interfaz gráfica de Power Query resuelve el 80% de los casos. El **lenguaje M** te da control total sobre el 20% restante — las transformaciones que los botones no permiten hacer.

## Antes: métodos de conexión de datos
Power BI usa principalmente **tres métodos** para acceder a los datos:
1. **Importación directa:** la más común; los datos se importan a Power BI. Ideal para datasets que no requieren actualizaciones muy frecuentes. Interacción rápida.
2. **Conexión en directo (DirectQuery):** no importa los datos, sino que envía consultas en **tiempo real** a la fuente. Ideal para **volúmenes enormes**; los datos están siempre actualizados, aunque puede limitar algunas funcionalidades.
3. **Conjuntos de datos compartidos y flujos de datos:** reutilizan modelos ya preparados y almacenados en la nube; mantienen **consistencia** de métricas entre múltiples reportes.

> La elección depende del **volumen**, la **frecuencia de actualización** y la **complejidad** del análisis. Datasets chicos → Importación; datos que cambian constantemente → DirectQuery.

## 1. ¿Qué es el lenguaje M?
El **Lenguaje M** (*Power Query Formula Language*) es el motor que impulsa todo lo que hacés en Power Query. Es un lenguaje **funcional y basado en fórmulas**, diseñado para procesos de **ETL**.

> **El mito del "código invisible":** ya venís usando M sin saberlo. Cada vez que hiciste clic en *"Usar la primera fila como encabezado"* o *"Cambiar tipo de datos"*, Power Query escribió una línea de M por vos. La interfaz gráfica es un **traductor** que convierte tus clics en instrucciones de M.

**Características fundamentales:**
- **Case sensitive:** `Table.SelectRows` es distinto de `table.selectrows`. Un error de una sola letra detiene todo el proceso.
- **Lenguaje de pasos:** cada línea construye sobre el resultado de la anterior (como una receta).
- **Fórmulas ante todo:** casi todo en M es una **función**.

## 2. La estructura `let ... in`: el esqueleto de M
Todo bloque de M tiene una estructura fija:
- **`let` (preparar):** definís tus "variables" o pasos.
- **`in` (servir):** indicás cuál es el **resultado final** que querés ver.

```powerquery
let
    PrecioUnitario = 100,
    Cantidad = 5,
    TotalVenta = PrecioUnitario * Cantidad
in
    TotalVenta
```
> En `let` creamos tres pasos; en `in` llamamos a `TotalVenta`. Power BI muestra `500`.

## 3. Navegando el Editor Avanzado
Para ver la "receta" completa: en Power Query, pestaña **Inicio > grupo Consulta > Editor Avanzado** (también en la pestaña **Ver**).

```powerquery
let
    Origen = Sql.Database("ServidorSQL", "VentasDB"),
    TablaVentas = Origen{[Schema="dbo", Item="FactVentas"]}[Data],
    ColumnasQuitadas = Table.RemoveColumns(TablaVentas,{"Notas"}),
    TipoCambiado = Table.TransformColumnTypes(ColumnasQuitadas,{{"Fecha", type date}})
in
    TipoCambiado
```

**Tres detalles críticos del código:**
- **El signo `#`:** si el nombre de un paso tiene espacios, M lo escribe como `#"Tipo Cambiado"`.
- **Las comas:** cada línea del bloque `let` termina en **coma**, **excepto la última** justo antes del `in`.
- **La secuencialidad:** cada paso llama al anterior (`TipoCambiado` usa a `ColumnasQuitadas`, que usa a `TablaVentas`). Si rompés la cadena, los datos "desaparecen" del flujo.

## 4. Aplicaciones del mundo real
- **Renombrar pasos:** cambiá `"Otras columnas quitadas1"` por algo significativo como `"Limpieza_Inicial_Precios"` para auditar más fácil.
- **Optimización (*Query Folding*):** al conectar con SQL, podés revisar en el Editor si las transformaciones se **envían al servidor** o si Power BI las hace "en casa". Los analistas senior editan M para que el **servidor SQL** haga el trabajo pesado.
- **Transformaciones sin botón:** funciones como `Table.FuzzyJoin` (unir tablas donde los nombres no coinciden exacto, como "García" y "Garcia") requieren ajustes manuales en el Editor.

## 5. Errores comunes
- **Olvidar que M es case-sensitive:** `Table.SelectRows` ✅ vs `table.selectrows` ❌.
- **La "coma huérfana":** nunca pongas coma después del **último** paso antes del `in`.
- **Romper la cadena de pasos:** si borrás un paso del medio, el siguiente da error porque busca un "ingrediente" que ya no existe.

## 6. Síntesis
Pasamos de ser "usuarios de botones" a entender el "cerebro" de Power Query. M es un lenguaje **funcional** donde cada paso es una función aplicada a los datos; la estructura `let...in` separa la **preparación** del **resultado final**; y el **Editor Avanzado** te muestra la receta completa.

> 💡 **Reflexión:** la próxima vez que apliques un paso en Power Query, mirá la barra de fórmulas y tratá de "leer" lo que M escribió por vos. Ese hábito es el primer paso para dominar el análisis a nivel profesional.

---
<p align="center">
<a href="./05-combinacion-de-tablas-merge-y-append.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./07-automatizacion-con-funciones-de-power-query.md">Siguiente ➡️</a>
</p>
