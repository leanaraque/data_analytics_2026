# 📦 M6 — Checkpoint: Pipeline ETL Completo

> **Título:** De datos crudos a modelo confiable en Power BI.

## 🎯 En una frase
Un reporte de Power BI es tan confiable como los datos que lo alimentan. Vas a construir el **motor de datos** que va a sostener todos tus reportes futuros: conectás Power BI a una fuente real, **perfilás la calidad**, aplicás **transformaciones profesionales** en Power Query y **documentás** la lógica en lenguaje M. El resultado es un `.pbix` limpio, bien nombrado y listo para construir encima cualquier análisis.

> 🔗 **Posición en la cadena:** en M3 creaste la base `Ventas_Tech_DB`; en este módulo aprendiste a conectar, limpiar y documentar. Este checkpoint **une esas piezas**. En **M8** vas a tomar este `.pbix` limpio y construir encima el modelo analítico (relaciones 1:N, tabla calendario y medidas DAX). **Sin un buen pipeline ETL, las medidas de M8 no funcionarán.**

## ✅ ¿Qué entregás?
El **enlace a tu repositorio GitHub público** con el archivo **`Pipeline_ETL_Apellido_Nombre.pbix`** dentro de la carpeta del módulo.

---

## 🏢 Contexto
Sos analista de datos SSR en **TechStore**, una distribuidora de tecnología. El equipo de BI necesita que los datos crudos del sistema de ventas estén en Power BI de forma **limpia, estructurada y documentada**. El dataset tiene problemas reales: **duplicados, nulos en campos clave y tipos incorrectos** que debés resolver antes de cerrar y aplicar.

## 📂 Dataset
Descargá el archivo **`Pipeline_ETL_Dataset.xlsx`** provisto por el curso. Contiene cuatro hojas:

| Hoja | Descripción | Problemas intencionales |
|------|-------------|-------------------------|
| `clientes` | 12 registros de clientes LATAM | 1 duplicado + 2 nulos |
| `productos` | 13 registros de productos | 1 duplicado + 2 nulos |
| `ventas` | 50 transacciones 2023-2024 | Limpia |
| `categorias` | 4 categorías de referencia | Limpia |

> Las celdas en **amarillo** indican dónde están los problemas. Tu tarea es detectarlos con Power Query y resolverlos con **criterio técnico justificado**.

---

## 📝 Instrucciones

### Paso 1 — Conexión a la fuente
*Inicio > Obtener datos > Excel* → seleccioná `Pipeline_ETL_Dataset.xlsx`. Elegí las cuatro tablas y hacé clic en **Transformar datos** (¡no confirmes la carga todavía!) para entrar directo al Editor de Power Query.

### Paso 2 — Perfilado de datos
Activá desde la pestaña **Vista**: **Calidad de columnas**, **Distribución de columnas** y **Perfil de columna** (cambiá "Primeras 1000 filas" a **Todo el conjunto de datos**). Con esto:
- **`clientes`:** eliminá el duplicado (por `id_cliente`) con *Quitar duplicados*. Decidí qué hacer con los 2 nulos en `email`/`ciudad` y **justificá** (¿eliminar o reemplazar por defecto? ¿por qué?).
- **`productos`:** eliminá el duplicado (`id_producto = 103`). El **precio nulo es crítico** (sin precio no hay ingreso): decidí y justificá. La `categoria` nula puede asignarse a una existente o marcarse como `"Sin Categoría"`: justificá.

### Paso 3 — Transformaciones
**Tipos de datos correctos:**

| Columna | Tipo |
|---------|------|
| Columnas de ID | Whole Number |
| `fecha_venta`, `fecha_registro` | Date |
| `precio`, `costo`, `total_venta`, `descuento` | Decimal Number |
| `cantidad`, `stock`, `activo` | Whole Number |
| Nombres, categorías, `canal`, `email` | Text |

**Nomenclatura profesional** (renombrá las consultas):

| Original | Final |
|----------|-------|
| `clientes` | `Dim_Clientes` |
| `productos` | `Dim_Productos` |
| `categorias` | `Dim_Categorias` |
| `ventas` | `Fact_Ventas` |

Renombrá también las columnas al español con `snake_case`.

**Merge — enriquecer `Fact_Ventas`:** tiene `id_producto` pero no el nombre ni la categoría. *Combinar consultas > como nueva* → unir `Fact_Ventas` con `Dim_Productos` por `id_producto` → expandir solo `nombre_producto` y `categoria`.

### Paso 4 — Documentación en lenguaje M
Abrí el **Editor Avanzado** en **al menos dos** consultas y agregá comentarios con `//` que expliquen la **lógica** de los pasos importantes (técnicos y justificados, no obvios).

```powerquery
// ✅ BUENO:
// Se eliminan duplicados por id_cliente porque Dim_Clientes
// debe tener valores únicos en su PK para que las relaciones
// del modelo funcionen correctamente en Power BI

// ❌ MALO:
// Se eliminan duplicados
```

### Paso 5 — Verificación y cierre
Antes de cerrar: ninguna consulta con ícono de error (triángulo amarillo) y conteos coherentes:
- `Dim_Clientes`: **11 filas** (se eliminó 1 duplicado)
- `Dim_Productos`: **12 filas** (1 duplicado eliminado + decisión sobre el nulo)
- `Fact_Ventas`: **50 filas** · `Dim_Categorias`: **4 filas**

Hacé clic en **Cerrar y aplicar** y confirmá que no hay errores.

### Paso 6 — Entrega
Guardá como `Pipeline_ETL_Apellido_Nombre.pbix` y subilo a tu repositorio GitHub **público**.

---

## ✔️ Criterios de aceptación
- [ ] Las 4 tablas cargadas sin errores con nomenclatura `Dim_` / `Fact_`.
- [ ] Duplicados eliminados en `Dim_Clientes` y `Dim_Productos`.
- [ ] Nulos resueltos con **decisión técnica justificada**.
- [ ] Todas las columnas con el **tipo de dato correcto**.
- [ ] Merge aplicado: `Fact_Ventas` incluye `nombre_producto` y `categoria`.
- [ ] Al menos **dos** consultas con comentarios técnicos en el Editor Avanzado.

## ⚠️ Errores comunes a evitar
- **Confirmar la carga sin transformar:** siempre elegí *"Transformar datos"* al importar.
- **Quitar duplicados en la columna incorrecta:** hacelo por la columna de **ID**, no por todas las columnas a la vez.
- **Eliminar nulos sin justificación:** un **precio** nulo es crítico; una **ciudad** nula puede reemplazarse por `"Sin datos"`.
- **Comentarios genéricos en M:** deben explicar el **razonamiento técnico**, no lo obvio.
- **No verificar el conteo de filas antes de cerrar.**

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 6</a> · <a href="../../README.md">Índice del curso</a>
</p>
