# Práctica 1 — Elegir los tipos de datos

> Práctica guiada **(no evaluable)** de la unidad *Diseño de esquemas con DDL*.
> Es el **bloque C** del guion de la clase: [`clase-03-paso-a-paso.sql`](./clase-03-paso-a-paso.sql).

## Propósito
Decidir **qué tipo de dato le corresponde a cada columna** de TechStore, y poder justificar cada decisión. Nada más que eso: las claves y las relaciones llegan en el bloque siguiente.

Es la misma tabla `clientes` y la misma tabla `productos` que vas a tener al final de la clase. Lo único que les falta todavía son las restricciones.

## Contexto
Sos el DBA de **TechStore**, una cadena de tiendas de tecnología. Ya sabés qué información hay que guardar. Falta traducirla a tipos de datos concretos.

---

## Consigna

Escribí las dos tablas eligiendo el tipo de cada columna, y **agregá un comentario con `--` justificando cada elección**. La justificación es lo que importa, no el tipeo.

### Tabla `clientes` — quién compra

| Columna | Qué guarda | La pregunta que tenés que hacerte |
|---------|-----------|-----------------------------------|
| `id_cliente` | Un número que identifica al cliente | ¿Vas a hacer cuentas con él? |
| `nombre` | Nombre y apellido | ¿Cuántos caracteres como máximo? |
| `email` | Correo de contacto | ¿El límite lo da el dato o el formato? |
| `ciudad` | Dónde vive | |
| `fecha_registro` | Cuándo se dio de alta | ¿Texto o fecha de verdad? |

### Tabla `productos` — qué se vende

| Columna | Qué guarda | La pregunta que tenés que hacerte |
|---------|-----------|-----------------------------------|
| `id_producto` | Un número que identifica al producto | |
| `nombre_producto` | Cómo se llama | |
| `id_categoria` | A qué categoría pertenece | ¿Número o texto? |
| `precio` | Cuánto cuesta | Es dinero. ¿Qué tipo va? |
| `stock` | Cuántas unidades hay | |
| `activo` | Si está a la venta o no | Es verdadero o falso. ¿Cómo se guarda eso? |

---

## Solución de referencia

```sql
-- Clientes: quien compra.
CREATE TABLE clientes (
    id_cliente     INT,            -- identificador: no se hacen cuentas con el
    nombre         NVARCHAR(100),  -- texto de longitud variable
    email          NVARCHAR(100),  -- texto; el limite lo da el formato, no el dato
    ciudad         NVARCHAR(50),
    fecha_registro DATE            -- fecha de verdad, para poder analizar por periodo
);

-- Productos: que se vende.
CREATE TABLE productos (
    id_producto     INT,
    nombre_producto NVARCHAR(100),
    id_categoria    INT,           -- por ahora es un numero suelto; despues pasa a ser FK
    precio          DECIMAL(10,2), -- DECIMAL para dinero, nunca FLOAT
    stock           INT,
    activo          BIT            -- verdadero / falso
);
```

---

## Las cuatro decisiones que se evalúan

| Decisión | Por qué |
|----------|---------|
| `precio` es `DECIMAL(10,2)`, no `FLOAT` | `FLOAT` guarda aproximaciones. En dinero, una aproximación es un error contable que aparece recién cuando sumás miles de ventas. |
| `fecha_registro` es `DATE`, no texto | Si la guardás como texto, cuando la lleves a Power BI para un reporte por mes, la herramienta no va a entender que es una fecha. |
| `activo` es `BIT`, no texto | Es verdadero o falso. En SQL Server ese tipo es `BIT`, y ocupa un bit en vez de varios bytes. |
| `id_categoria` es `INT`, no texto | Tiene que coincidir con el tipo de la clave de `categorias`, porque en el bloque siguiente se convierte en una clave foránea. |

> **Sobre `NVARCHAR` y `VARCHAR`:** los dos guardan texto. `NVARCHAR` guarda Unicode, así que las tildes y las eñes sobreviven siempre. Como el curso trabaja en SQL Server con datos en español, usamos `NVARCHAR` en todo el proyecto.

> **Sobre `TEXT`:** en el material vas a ver `TEXT` para bloques largos. En SQL Server moderno ese tipo está **deprecado**: se usa `NVARCHAR(MAX)`. Y para una descripción de 200 caracteres no hace falta ninguno de los dos: `NVARCHAR(200)` alcanza. Poner el máximo "por las dudas" es uno de los errores de la unidad.

---

## Criterios de aceptación
- Las dos tablas se crean **sin errores de sintaxis** en SQL Server, desde SSMS.
- Se usa `DECIMAL` para el precio, **no `FLOAT`**.
- `fecha_registro` es `DATE`, no texto.
- Cada columna tiene un comentario que justifica el tipo elegido.

## Error común a evitar
No olvides las **comas** al final de cada columna, **excepto en la última** antes de cerrar el paréntesis. Si falta una, SQL no entiende dónde termina un campo y empieza el otro. Es el error que más se repite en esta clase.

---
<p align="center">
<a href="../README.md">Volver a la Semana 3</a> · <a href="./practica-02-ventas-tech-db.md">Práctica 2: Ventas_Tech_DB</a>
</p>
