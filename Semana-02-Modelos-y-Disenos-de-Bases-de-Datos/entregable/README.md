# 📦 M2 — Pre-entrega: Modelo de datos RetailPro

> **Título:** Diseño del modelo relacional — las tablas del proyecto.

## 🎯 En una frase
Con el brief definido en **M1**, ahora vas a diseñar la **arquitectura de datos** que va a sostener todo el análisis: el modelo relacional de RetailPro, normalizado hasta **3NF**.

> 🧱 Esta pre-entrega es **el plano del edificio**: si el diseño es sólido, todo lo que construyas encima va a funcionar. En **M3** vas a implementar exactamente este modelo en SQL, así que cada decisión que tomes acá tiene consecuencias directas en los módulos siguientes.

## ✅ ¿Qué entregás?
Un documento **PDF o DOCX** con el **diagrama ER** (incluido como imagen) y las justificaciones, subido directo en la plataforma.

> ⚠️ **Esta pre-entrega SÍ es evaluable** (es el modelo relacional de RetailPro). No la confundas con el ejercicio guiado de **Normalización del Videoclub**, que es práctica **(no evaluable)**.

---

## 🏢 Contexto
RetailPro necesita migrar sus datos desde **planillas de Excel desorganizadas** a una base de datos relacional. Tu tarea es diseñar el modelo que va a contener toda la información del negocio, aplicando las reglas de **normalización hasta 3NF** aprendidas en este módulo.

---

## 🧩 Mini-ejemplo resuelto: cómo se normaliza a 3NF
Antes de armar RetailPro, mirá cómo se pasa de **UNA** tabla desnormalizada a **tres** tablas relacionadas.

**Tabla original** (todo mezclado y con datos repetidos):

| id_pedido | cliente | email_cliente | producto | categoria | precio |
|-----------|---------|---------------|----------|-----------|--------|
| 1 | Juan Pérez | juan@mail.com | Teclado | Periféricos | 20 |
| 2 | Juan Pérez | juan@mail.com | Monitor | Pantallas | 150 |

**Resultado en 3NF** (3 tablas, sin datos repetidos):
- **`clientes`**: `id_cliente` (PK), `nombre`, `email`
- **`productos`**: `id_producto` (PK), `nombre_producto`, `categoria`, `precio`
- **`pedidos`**: `id_pedido` (PK), `id_cliente` (FK), `id_producto` (FK), `cantidad`, `fecha`

> Fijate que los datos del cliente y del producto **dejan de repetirse**: cada uno vive en su tabla y `pedidos` los referencia con **claves foráneas (FK)**. Ese mismo criterio aplicalo a RetailPro.

---

## 📝 Instrucciones

### 1. Diagrama ER
Diseñá el modelo relacional de RetailPro con **todas sus tablas, columnas, tipos de datos, claves primarias (PK) y claves foráneas (FK)**. Podés usar **draw.io, Lucidchart, dbdiagram.io** o cualquier herramienta equivalente. También podés dibujarlo a mano y fotografiarlo.

Tu modelo debe incluir **obligatoriamente**:

| Tabla | Columnas mínimas requeridas |
|-------|-----------------------------|
| `clientes` | `id_cliente` (PK), `nombre`, `email`, `ciudad`, `segmento`, `fecha_registro` |
| `productos` | `id_producto` (PK), `nombre_producto`, `categoria`, `subcategoria`, `precio`, `costo` |
| `ventas` | `id_venta` (PK), `fecha_venta`, `id_cliente` (FK), `id_producto` (FK), `cantidad`, `total_venta`, `canal` |
| `territorios` | `id_territorio` (PK), `region`, `pais`, `zona` |

### 2. Justificación de normalización
Explicá en un párrafo por qué tu diseño cumple con la **3NF**, indicando específicamente:
- Qué **dependencias parciales** eliminaste.
- Qué **dependencias transitivas** evitaste.
- Por qué **no hay redundancia** de datos entre tablas.

### 3. Conexión con el brief de M1
Para cada tabla, indicá **a cuál de las preguntas de análisis** que definiste en M1 contribuye y **qué columna específica** permite responderla.

> **Ejemplo:** la tabla `territorios`, con la columna `region`, permite responder *"¿Qué región genera más ingresos?"* (cruzándola con `ventas.total_venta`).

---

## ✔️ Checklist de entrega
- [ ] **1 archivo único** en PDF o DOCX.
- [ ] **Diagrama ER** incluido como **imagen** (con PK y FK visibles).
- [ ] Las 4 tablas obligatorias con sus **columnas mínimas** y **tipos de datos**.
- [ ] Párrafo de **justificación de normalización (3NF)**.
- [ ] **Conexión con las preguntas de M1** para cada tabla.
- [ ] Se sube **directo en la plataforma**.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 2</a> · <a href="../../README.md">Índice del curso</a>
</p>
