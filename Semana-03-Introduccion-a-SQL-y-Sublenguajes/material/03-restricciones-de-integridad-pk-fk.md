# 3. Restricciones de integridad: Primary Keys y Foreign Keys

> Con las tablas creadas, ahora las conectás y protegés su consistencia. Las PK y FK que aprendés acá van a aparecer de nuevo en los **JOINs de la Semana 5** y en el **modelado de Power BI (M8)**.

Imaginá que trabajás en un banco. Un cliente cierra su cuenta, pero el sistema permite que sigan llegando cobros a su nombre. O peor: permite que dos personas tengan el mismo número de cuenta. Ese caos ocurre cuando no hay **integridad de datos**.

Las **restricciones (constraints)** son las reglas que le imponemos a la base para asegurar que la información sea **precisa, consistente y confiable**. Sin ellas, el análisis sería imposible: estaríamos trabajando sobre información corrupta.

## 1. Primary Key (Clave Primaria): tu identidad única
La **Primary Key (PK)** es el "documento de identidad" de cada registro: una columna (o conjunto) que identifica **de forma única** a cada fila.
- **Regla de oro:** no puede haber dos filas con la misma PK, y **nunca** puede ser `NULL`.
- **Importancia:** permite que SQL encuentre un registro específico entre millones de forma instantánea.

> **Ejemplo:** en una tabla de Estudiantes, el `ID_Estudiante` es la PK. No importa si hay dos "Juan Pérez": su ID será distinto.

```sql
CREATE TABLE Estudiantes (
    ID_Estudiante INT PRIMARY KEY,
    Nombre VARCHAR(50)
);
```

## 2. Foreign Key (Clave Foránea): el puente entre tablas
La **Foreign Key (FK)** es una columna que crea un vínculo entre dos tablas: hace referencia a la **Primary Key de otra tabla**.
- **Propósito:** garantizar la **integridad referencial** → no podés asignar un registro a algo que no existe.
- **Analogía:** es como una dirección postal. Si ponés que vivís en "Marte", el sistema de correos (la FK) rechaza el paquete porque esa ciudad no existe en su "tabla de destinos válidos".

> **Ejemplo:** en una tabla de Inscripciones, el campo `ID_Estudiante` debe ser una FK que apunte a la tabla `Estudiantes`. Así es imposible inscribir a un estudiante que no está registrado.

```sql
CREATE TABLE Inscripciones (
    ID_Inscripcion INT PRIMARY KEY,
    ID_Estudiante INT,
    -- Definimos la conexión
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante)
);
```

## ¿Qué pasa si rompemos las reglas?
- **Error de duplicidad:** si intentás insertar un ID que ya existe en una columna PK, SQL detiene la operación con un error.
- **Error de orfandad:** si intentás borrar un Cliente que tiene ventas asociadas, la FK impide el borrado para evitar que la venta quede "huérfana" (sin saber a quién pertenece).

## Errores comunes de principiantes
- **Confundir PK con `UNIQUE`:** `UNIQUE` permite valores `NULL`, pero la `PRIMARY KEY` es obligatoria (`NOT NULL`).
- **Tipos de datos diferentes:** la FK debe ser del **mismo tipo** (ej. `INT`) que la PK a la que hace referencia. Conectar un texto con un número falla.

> **En resumen:** las **PK identifican** y las **FK conectan**. Juntas forman el esqueleto de un modelo de datos profesional.

---
<p align="center">
<a href="./02-diseno-de-esquemas-con-ddl-y-tipos-de-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="./04-comandos-ddl-alter-y-drop.md">Siguiente ➡️</a>
</p>
