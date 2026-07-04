# 6. Optimización de medidas DAX: variables y DAX Studio

> 📖 **Para profundizar** — Contenido avanzado. Con las medidas ya funcionando, el siguiente nivel es hacerlas **eficientes y mantenibles**.

Escribir una fórmula que devuelva el resultado correcto es solo el primer paso. Lo que separa a un analista junior de uno SSR es escribir fórmulas **eficientes, legibles y mantenibles**. Una medida que tarda cinco segundos, que nadie entiende y que vos mismo no recordás tres meses después, está **mal escrita** aunque el número sea correcto. Dos herramientas lo transforman: las **variables (`VAR`)** y **DAX Studio**.

## 1. Variables: el "bowl" de la cocina DAX
Si una receta necesita cebolla picada en tres pasos, no la picás tres veces: la picás una vez, la guardás en un recipiente y la reutilizás. En DAX, las variables (`VAR`) funcionan igual: almacenan un cálculo intermedio y lo reutilizan **sin recalcularlo**.

```dax
NombreMedida =
VAR NombreVariable = [expresión]
VAR OtraVariable   = [expresión que puede usar NombreVariable]
RETURN
    [expresión final que usa las variables]
```
> `RETURN` es **obligatorio** y marca dónde la medida devuelve su resultado final. Todo lo anterior son definiciones de variables.

## 2. ¿Por qué usar variables?
- **Rendimiento:** Power BI calcula cada variable **una sola vez** y la guarda en memoria durante la evaluación. Si usás la misma lógica compleja tres veces sin variables, DAX la ejecuta tres veces. En millones de filas, esa diferencia es milisegundos vs. segundos.
- **Legibilidad:**
```dax
-- Sin variables (difícil de leer):
Crecimiento =
DIVIDE(
    SUM(Ventas[Monto]) - CALCULATE(SUM(Ventas[Monto]), PREVIOUSYEAR(Calendario[Fecha])),
    CALCULATE(SUM(Ventas[Monto]), PREVIOUSYEAR(Calendario[Fecha]))
)

-- Con variables (fácil de leer):
Crecimiento =
VAR VentasActual    = SUM(Ventas[Monto])
VAR VentasAnoPasado = CALCULATE(VentasActual, PREVIOUSYEAR(Calendario[Fecha]))
RETURN
    DIVIDE(VentasActual - VentasAnoPasado, VentasAnoPasado)
```
- **Depuración:** podés cambiar temporalmente el `RETURN` para devolver una variable intermedia y verificar si ese paso es correcto, antes de continuar. Te ahorra horas de debugging.

## 3. Reglas y limitaciones importantes
- **Las variables son estáticas, no dinámicas:** una variable se evalúa **en el momento exacto** en que se define, capturando el contexto de filtro de ese instante. Si la definís fuera de una iteración o un `CALCULATE`, su valor queda "congelado" y **no** se recalcula dentro de bucles.
```dax
VAR Umbral = AVERAGE(Ventas[Monto])  -- Se evalúa UNA vez con el contexto externo
RETURN
    COUNTROWS(FILTER(Ventas, Ventas[Monto] > Umbral))  -- Umbral NO cambia fila a fila
```
- **Solo existen dentro de su medida:** no podés reutilizar una variable de una medida en otra. Para compartir lógica, creá una **medida base** y referenciala.
- **Nombres descriptivos:** `VAR x` o `VAR temp` anulan el beneficio de legibilidad. Usá `VAR VentasActual`, `VAR MargenBruto`.

## 4. Ejemplo de refactorización
```dax
-- Antes (calcula SUM(Ventas[Monto]) dos veces):
% Margen =
DIVIDE( SUM(Ventas[Monto]) - SUM(Ventas[Costo]), SUM(Ventas[Monto]) ) * 100

-- Después (cada valor una sola vez, legible):
% Margen =
VAR IngresoTotal = SUM(Ventas[Monto])
VAR CostoTotal   = SUM(Ventas[Costo])
VAR Ganancia     = IngresoTotal - CostoTotal
RETURN
    DIVIDE(Ganancia, IngresoTotal) * 100
```

## 5. DAX Studio: el taller del mecánico
Cuando necesitás "abrir el motor" de tus fórmulas, usás **DAX Studio**: una herramienta externa **gratuita** que se conecta al modelo de tu `.pbix` abierto. Descarga: **https://daxstudio.org**

- **Server Timing:** mide el tiempo de ejecución exacto de una medida (tiempo de fórmula vs. de almacenamiento). Regla general: si tarda **más de 2 segundos**, optimizala. Te dice **dónde** está el cuello de botella antes de cambiar cosas al azar.
- **Ejecutar consultas DAX** directamente sobre el modelo, sin crear un visual:
```dax
EVALUATE
SUMMARIZECOLUMNS(
    Calendario[Año],
    "Ventas Totales", [Total Ventas],
    "% Margen", [% Margen]
)
```
- **Depurar variables** viendo los pasos intermedios en una tabla completa.
- **Ver el plan de ejecución** (físico y lógico) — el nivel más profundo de diagnóstico.

## 6. Errores comunes al optimizar
- **Optimizar sin medir primero:** confirmá con el Server Timing que la medida **realmente** es un cuello de botella antes de reescribirla.
- **Confundir variables con medidas dinámicas:** se congelan en su contexto; si esperás que se recalculen en una iteración, obtenés resultados incorrectos **sin error visible**.
- **Crear variables para cálculos triviales:** si algo se usa una sola vez y es simple, la variable solo agrega ruido.

## Resumen: ¿cuándo usar `VAR`?

| Situación | ¿Usar `VAR`? |
|-----------|:------------:|
| El mismo cálculo aparece más de una vez | ✅ Siempre |
| La medida tiene más de tres niveles de anidamiento | ✅ Recomendado |
| Necesitás depurar un paso intermedio | ✅ Técnica estándar |
| El cálculo es simple y se usa una sola vez | ❌ No es necesario |
| Esperás que se recalcule dentro de un `FILTER` | ⚠️ Cuidado con el contexto |

---
<p align="center">
<a href="./05-inteligencia-de-tiempo-yoy-ytd.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 8</a> · <a href="./07-funciones-dax-avanzadas.md">Siguiente ➡️</a>
</p>
