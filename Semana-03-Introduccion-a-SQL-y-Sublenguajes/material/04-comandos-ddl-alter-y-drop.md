# 4. Comandos DDL: `ALTER` y `DROP`

> Las tablas ya están creadas y relacionadas. Esta unidad te enseña a **modificarlas** o **eliminarlas** cuando el diseño cambia.

¿Alguna vez necesitaste cambiar la estructura de una tabla sin perder los datos? ¿O eliminar una tabla completa asegurándote de no afectar otras partes del sistema? Las cláusulas **`ALTER`** y **`DROP`** son fundamentales para modificar y eliminar objetos en bases relacionales.

## ¿Qué es `ALTER`?
`ALTER` permite **modificar la estructura** de un objeto existente (como una tabla): agregar, modificar o eliminar columnas, cambiar tipos de datos, o modificar restricciones.

> **Ejemplo:** agregar una columna para almacenar la fecha de actualización en una tabla de clientes.

### Sintaxis de `ALTER TABLE`
```sql
-- Añadir una nueva columna a una tabla
ALTER TABLE nombretabla
ADD nombrecolumna tipodatocolumna;

-- Borrar una columna de una tabla
ALTER TABLE nombretabla
DROP COLUMN nombrecolumna;

-- Modificar el tipo de dato de una columna
ALTER TABLE nombretabla
ALTER COLUMN nombrecolumna tipodatocolumna;
```

> ⚠️ La sintaxis para modificar el tipo de una columna varía entre motores: en SQL Server es `ALTER COLUMN`, en MySQL `MODIFY COLUMN`, y en PostgreSQL `ALTER COLUMN ... TYPE`.

## ¿Qué es `DROP`?
`DROP` **elimina objetos de forma permanente** (tablas, esquemas, vistas, bases de datos). Esta operación es **irreversible** y debe usarse con precaución.

```sql
-- Borrar un índice
DROP INDEX nombretabla.nombreindice;

-- Borrar una tabla (estructura + datos)
DROP TABLE nombretabla;

-- Borrar una base de datos completa
DROP DATABASE nombrebasededatos;
```

## ¿Por qué importa en el análisis de datos?
Las estructuras de las bases pueden necesitar ajustes conforme evolucionan los requerimientos del negocio o se identifican nuevas fuentes. Por ejemplo, un analista de ventas puede necesitar **agregar una columna** para registrar promociones especiales, o **eliminar tablas temporales** usadas en procesos anteriores.

Saber **modificar tablas sin perder información** es esencial para mantener la integridad y continuidad del análisis. Eliminar objetos obsoletos ayuda a optimizar el rendimiento y la organización. Además, conocer las particularidades entre **SQL Server, MySQL y PostgreSQL** es clave para aplicar estas operaciones correctamente en distintos entornos.

## 🎥 Videos de la unidad
- **Modificando estructuras — `ALTER TABLE`:** agregar columnas, cambiar el tipo de una existente y eliminar columnas que ya no se necesitan, sin borrar y recrear la tabla.
- **Eliminando estructuras — `DROP TABLE`:** cómo funciona, cuándo tiene sentido usarlo y qué precauciones tomar (es irreversible: borra estructura **y** datos). Diferencia entre eliminar **datos** y eliminar **estructuras** completas.

---
<p align="center">
<a href="./03-restricciones-de-integridad-pk-fk.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="./05-manipulacion-de-datos-dml.md">Siguiente ➡️</a>
</p>
