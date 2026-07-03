# 6. Permisos y roles: una introducción al DCL

> Ya viste **DDL** (crear estructuras) y **DML** (manipular datos). Falta una pieza del trabajo real con bases de datos: decidir **quién puede hacer qué**. De eso se encarga el **DCL (Data Control Language)**, el cuarto sublenguaje de la tabla del inicio del módulo.

Como analista, casi siempre vas a trabajar con **permisos de solo lectura (`SELECT`)**. Entender cómo se otorgan y se quitan te permite pedir el acceso correcto y hablar con los DBA en su mismo idioma.

## Permiso vs. rol
- Un **permiso** autoriza una acción sobre un objeto: por ejemplo, `SELECT` sobre la tabla `ventas`.
- Un **rol** es un "paquete" de permisos con nombre. En vez de dar permisos uno por uno a cada persona, creás un rol (ej. `rol_analista`), le cargás los permisos una sola vez y se lo asignás a quien lo necesite.

> **Analogía:** el permiso es una **llave suelta**; el rol es un **llavero etiquetado** ("Analistas") con todas las llaves que ese grupo necesita. Cuando entra alguien nuevo, le das el llavero, no llave por llave.

## Los dos comandos centrales: `GRANT` y `REVOKE`
- **`GRANT`** concede permisos.
- **`REVOKE`** los quita.

```sql
-- Conceder permiso de solo lectura sobre una tabla
GRANT SELECT ON ventas TO usuario_analista;

-- Quitar ese permiso
REVOKE SELECT ON ventas FROM usuario_analista;
```

## Crear y usar un rol
El flujo profesional es: creás el rol, le cargás los permisos y se lo asignás a las personas.

```sql
-- 1. Crear el rol
CREATE ROLE rol_analista;

-- 2. Asignarle permisos (solo lectura sobre las tablas del negocio)
GRANT SELECT ON ventas TO rol_analista;
GRANT SELECT ON productos TO rol_analista;
GRANT SELECT ON clientes TO rol_analista;

-- 3. Asignar el rol a una persona
GRANT rol_analista TO maria_lopez;
```

> Si mañana el equipo necesita acceso a una tabla nueva, agregás un solo `GRANT ... TO rol_analista` y **todos** los analistas lo heredan.

## Principio de menor privilegio
La regla de oro: otorgá siempre el **permiso mínimo necesario**. Si alguien solo lee reportes, dale `SELECT`, nunca `DELETE` ni `DROP`. Un permiso de más es una puerta abierta a borrados accidentales o fugas de datos.

> **Ojo:** los **Roles de Power BI** y la **Seguridad a Nivel de Fila (RLS)** que verás más adelante son otra cosa: controlan la **visualización** de reportes. El **DCL** actúa en el **motor de base de datos**; el RBAC/RLS actúan en la **capa de visualización**.

---
<p align="center">
<a href="./05-manipulacion-de-datos-dml.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="./07-data-warehousing-estrella-copo-de-nieve.md">Siguiente ➡️</a>
</p>
