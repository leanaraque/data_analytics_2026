# 5. Manipulación de datos con DML: `INSERT`, `UPDATE` y `DELETE`

> Con la estructura DDL dominada, ahora trabajás con el **contenido**: los datos que viven dentro de esas tablas. Son las mismas operaciones que realizan los sistemas transaccionales (**OLTP**) que viste en la Semana 2.

Como analista, no siempre recibirás la información "lista para consumir". Muchas veces tendrás que preparar tus propios sets de datos, corregir errores de carga o limpiar registros obsoletos directamente en el origen. Ahí entra el **DML (Data Manipulation Language)**.

Mientras que el **DDL** define la estructura del "contenedor" (la tabla), el **DML** gestiona su **contenido**.

## 1. Inserción: `INSERT INTO`
Añade nuevas filas a tus tablas. Es el primer paso para poblar un modelo de datos.

```sql
INSERT INTO nombre_tabla (columna1, columna2)
VALUES (valor1, valor2);
```

> **Regla de oro:** los valores de **texto y fechas** siempre van entre **comillas simples** (`'Enero'`), mientras que los **números** van **sin comillas** (`25.50`).

> 🎥 **Autoincremental:** podés delegar en el motor la generación automática de los IDs con `IDENTITY` (SQL Server) o `SERIAL` (PostgreSQL). Se configura al crear la tabla y simplifica los `INSERT` en sistemas con muchas inserciones simultáneas.

## 2. Actualización: `UPDATE`
Modifica valores que ya existen (un producto cambia de precio, un cliente cambia su email).

> ⚠️ **¡Cuidado!** El `UPDATE` es muy potente. **Siempre** debe ir acompañado de una cláusula `WHERE`. Si la olvidás, SQL aplica el cambio a **todas** las filas de la tabla.

```sql
-- Ejemplo seguro:
UPDATE productos SET precio = 10.99 WHERE id = 5;

-- Ejemplo PELIGROSO (cambia TODO):
UPDATE productos SET precio = 10.99;
```

## 3. Borrado: `DELETE`
Elimina registros completos de una tabla. Igual que con el `UPDATE`, el uso del `WHERE` es **crítico** para no borrar la base entera por error.

> **Diferencia clave:** `DELETE` borra la **fila**, pero no la tabla. Si querés borrar la tabla completa (la estructura), usás `DROP TABLE` (DDL).

## Analogía para entender el DML
Imaginá que tu base de datos es un **archivador de oficina**:
- **`INSERT`:** tomás una ficha en blanco, escribís los datos de un cliente y la metés en un cajón.
- **`UPDATE`:** sacás una ficha existente, borrás el teléfono con corrector y escribís el nuevo.
- **`DELETE`:** sacás una ficha y la pasás por la trituradora de papel.
- **`WHERE`:** es el dedo que señala exactamente **qué ficha** querés sacar del archivador.

## Errores comunes que debés evitar
- **Olvidar el `WHERE`:** el error más común y costoso. Siempre verificá tu condición antes de ejecutar.
- **Error de tipos de datos:** intentar insertar texto en una columna numérica, o saltarse campos obligatorios (`NOT NULL`).
- **No usar transacciones:** en entornos profesionales se usan `BEGIN` y `COMMIT` para "confirmar" los cambios solo después de estar seguros (esto es **TCL**). En este nivel inicial practicamos la precisión manual.

> 🎥 **`DELETE` vs `TRUNCATE`:** ambos vacían datos, pero difieren en rendimiento y uso. `TRUNCATE` borra todas las filas de golpe (más rápido, no admite `WHERE`); `DELETE` borra filas específicas según la condición.

---
<p align="center">
<a href="./04-comandos-ddl-alter-y-drop.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="./06-permisos-y-roles-dcl.md">Siguiente ➡️</a>
</p>
