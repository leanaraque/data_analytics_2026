# 🛠️ Práctica 2 — Creando la base de datos `Ventas_Tech_DB`

> Práctica guiada de la Semana 3: DDL + constraints + `INSERT`. El script completo está en [**`ventas_tech_db.sql`**](./ventas_tech_db.sql).

## Propósito
Construir desde cero la base de datos **`Ventas_Tech_DB`** — el dataset que vas a usar durante **todo el curso**. Vas a definir cuatro tablas relacionadas, establecer las claves foráneas que garantizan la integridad y cargarla con datos iniciales listos para consultar.

> 🔗 En el **Módulo 6** vas a conectar Power BI directamente a esta base para limpiarla y transformarla. En el **Módulo 8** vas a construir el modelo analítico y las medidas DAX encima de ella. Este es el primer paso de ese recorrido.

## Contexto
Sos el **DBA de TechStore**, una cadena de tiendas de tecnología. Tu tarea es crear la base `Ventas_Tech_DB` con un modelo relacional correcto que soporte las operaciones de ventas.

## Modelo de datos esperado
```
categorias (1) ── (N) productos (1) ── (N) ventas (N) ── (1) clientes
```

## Instrucciones

### Paso 1 — Crear la base de datos
```sql
CREATE DATABASE Ventas_Tech_DB;
```

### Paso 2 — Desarrollar el script en 3 secciones

**a) `DROP TABLES`** — al inicio del script, para que sea **repetible**. Respetá el **orden inverso** de las dependencias:
```sql
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
```

**b) `CREATE TABLES`** — creá las cuatro tablas en este orden con estos tipos y restricciones:

**`categorias`**
| Columna | Tipo | Restricción |
|---------|------|-------------|
| `id_categoria` | INT | PRIMARY KEY |
| `nombre_categoria` | VARCHAR(50) | NOT NULL |
| `descripcion` | VARCHAR(200) | |

**`clientes`**
| Columna | Tipo | Restricción |
|---------|------|-------------|
| `id_cliente` | INT | PRIMARY KEY |
| `nombre` | VARCHAR(100) | NOT NULL |
| `email` | VARCHAR(100) | UNIQUE |
| `ciudad` | VARCHAR(50) | |
| `fecha_registro` | DATE | NOT NULL |

**`productos`**
| Columna | Tipo | Restricción |
|---------|------|-------------|
| `id_producto` | INT | PRIMARY KEY |
| `nombre_producto` | VARCHAR(100) | NOT NULL |
| `id_categoria` | INT | FOREIGN KEY → `categorias` |
| `precio` | DECIMAL(10,2) | NOT NULL |
| `stock` | INT | DEFAULT 0 |
| `activo` | TINYINT(1) | DEFAULT 1 |

**`ventas`**
| Columna | Tipo | Restricción |
|---------|------|-------------|
| `id_venta` | INT | PRIMARY KEY |
| `id_cliente` | INT | FOREIGN KEY → `clientes` |
| `id_producto` | INT | FOREIGN KEY → `productos` |
| `cantidad` | INT | NOT NULL |
| `precio_unitario` | DECIMAL(10,2) | NOT NULL |
| `fecha_venta` | DATE | NOT NULL |

**c) `INSERT DATA`** — cargá los datos en el **orden correcto** (primero las tablas sin dependencias): 4 categorías, 5 clientes, 6 productos y 10 ventas. *(Ver los `INSERT` completos en el [script](./ventas_tech_db.sql).)*

### Paso 3 — Verificar la integridad
Ejecutá el script completo, confirmá que no hay errores y validá:
```sql
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
-- (En el Módulo 5 vas a cruzar estas tablas con JOIN para ver
--  las ventas junto al nombre del cliente y del producto.)
```

## Criterios de aceptación
- El script se ejecuta **sin errores** en PostgreSQL o SQL Server.
- Las **foreign keys** están correctamente definidas en `productos` y `ventas`.
- No hay valores nulos en columnas marcadas como `NOT NULL`.
- El `DROP TABLE` respeta el **orden inverso** de dependencias.
- Las 4 tablas se cargan y `ventas` contiene **10 registros**.

## ⚠️ Errores comunes a evitar
- **Orden incorrecto en `DROP TABLE`:** eliminá primero las tablas con FK antes que las referenciadas.
- **Orden incorrecto en `INSERT`:** cargá `categorias` y `clientes` antes de `productos` y `ventas`.
- **`FLOAT` para precios:** usá siempre `DECIMAL(10,2)` para valores monetarios.

> 📎 **Nota de compatibilidad:** `TINYINT(1)` es sintaxis de **MySQL/SQL Server**. En **PostgreSQL** usá `BOOLEAN` (con `DEFAULT TRUE`). El [script](./ventas_tech_db.sql) incluye una nota sobre esto.

---
<p align="center">
<a href="./practica-01-diseno-de-tablas.md">⬅️ Práctica 1</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="../entregable/README.md">Ir al entregable ➡️</a>
</p>
