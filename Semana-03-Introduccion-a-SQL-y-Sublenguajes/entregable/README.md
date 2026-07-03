# 📦 Checkpoint M3 — Script SQL: esquema normalizado + datos iniciales

> **Título:** Pre-entrega técnica — el back-end de tu proyecto de análisis.

## 🎯 En una frase
Un **dashboard es tan bueno como los datos que lo alimentan.** Este checkpoint es la creación del **back-end** de tu proyecto: un script **`.sql`** que genera una base de datos profesional, limpia y **normalizada (3NF)**, donde residirá toda la información de ventas.

> 🎓 **Contexto del proyecto final:** para tu certificación como Data Analyst, el entregable final es un **Dashboard de Inteligencia de Negocios** que responda preguntas estratégicas de una empresa de retail. Este script es el primer eslabón de ese back-end.

## ✅ ¿Qué entregás?
El **enlace a tu repositorio de GitHub público** con el archivo **`ventas_tech_db.sql`** dentro de la carpeta del módulo.

---

## 🧱 ¿Qué debés construir?
Un archivo `.sql` con **tres secciones** claramente identificadas:

### 1. Definición del esquema (DDL)
Diseñá y creá las tablas para un modelo de **Ventas de Tecnología**. Debe incluir **al menos**:

| Tabla | Detalle |
|-------|---------|
| `categorias` | Para cumplir con la **3NF**, las categorías **no** deben ser texto dentro de productos, sino una **tabla aparte**. |
| `productos` | `ID`, `Nombre`, `Precio`, `CategoriaID` (FK). |
| `clientes` | `ID`, `Nombre`, `Email`, `Ciudad`. |
| `ventas` (hechos) | Tabla central que conecta a las demás: `ID_Venta`, `Fecha`, `ClienteID`, `ProductoID`, `Cantidad`. |

### 2. Restricciones de integridad
- Cada tabla con su **`PRIMARY KEY`**.
- **`FOREIGN KEYS`** en `ventas` para asegurar la integridad referencial (no se puede vender un producto que no existe).
- **`NOT NULL`** en campos críticos (precio, nombre del cliente…).

### 3. Carga inicial de datos (DML)
- Al menos **3 categorías** diferentes.
- Al menos **5 productos** distribuidos en esas categorías.
- Al menos **3 clientes**.
- Al menos **10 transacciones** de venta para tener datos que analizar.

---

## 🪜 Pasos sugeridos
1. **Dibujá tu modelo** antes de escribir código (papel o herramienta digital): cómo se conectan las tablas.
2. **Escribí el DDL** con `CREATE TABLE`. Orden: primero las dimensiones, al final la tabla de hechos.
3. **Añadí las restricciones** (PK y FK) dentro del `CREATE TABLE` o mediante `ALTER TABLE`.
4. **Cargá los datos** con `INSERT INTO` en el mismo orden lógico.
5. **Probá tu script:** ejecutalo, borrá las tablas y volvé a ejecutarlo para asegurarte de que es **repetible**.

> 💡 Tenés una implementación completa de referencia en [`../ejercicios/ventas_tech_db.sql`](../ejercicios/ventas_tech_db.sql) y la guía paso a paso en la [Práctica 2](../ejercicios/practica-02-ventas-tech-db.md).

---

## ✔️ Criterios de aceptación
- [ ] El script se ejecuta **sin errores** en PostgreSQL o SQL Server.
- [ ] Las **FK** están definidas correctamente en `productos` y `ventas`.
- [ ] No hay valores nulos en columnas `NOT NULL`.
- [ ] El `DROP TABLE` respeta el **orden inverso** de dependencias.
- [ ] Las 4 tablas se cargan y `ventas` contiene **10 registros**.
- [ ] Repositorio de GitHub **público** con el archivo `ventas_tech_db.sql`.

## ⚠️ Errores comunes a evitar
- **El "huevo y la gallina":** crear la tabla `ventas` antes de que existan `productos` o `clientes`. Las FK no encontrarán su referencia y SQL dará error.
- **Cifras monetarias imprecisas:** usar tipos de **texto** o `FLOAT` para precios/fechas impide cálculos matemáticos (`SUM`, `AVG`) más adelante. Usá `DECIMAL(10,2)` y `DATE`.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 3</a> · <a href="../../README.md">Índice del curso</a>
</p>
