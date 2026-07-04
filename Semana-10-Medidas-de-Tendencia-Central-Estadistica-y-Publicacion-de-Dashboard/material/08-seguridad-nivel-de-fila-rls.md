# 8. Implementación de Seguridad a Nivel de Fila (RLS)

> Con los permisos de workspace configurados, el siguiente nivel de seguridad es el **dato en sí**: que cada usuario vea solo la información que le corresponde, sin necesitar versiones separadas del reporte.

Construiste un dashboard de ventas para toda la empresa, pero el gerente de la región Norte no debería ver las comisiones de la región Sur. ¿Tendrías que crear 50 informes diferentes? ¡Claro que no! Para eso existe la **Seguridad a Nivel de Fila (RLS — Row-Level Security)**.

## ¿Qué es RLS y por qué es vital?
Un mecanismo que restringe el acceso a los datos **a nivel de fila**. A diferencia de los permisos de archivo (ver o no todo el informe), la RLS actúa como un **filtro inteligente y automático** que se aplica según **quién** está mirando el reporte.
- **Un solo informe para todos:** mantenés una **única versión de la verdad** (*Single Source of Truth*), simplificando el mantenimiento.
- **Seguridad garantizada:** el filtro se aplica en el **motor de datos**, así que el usuario no puede "saltárselo" quitando un filtro visual.
- **Privacidad:** fundamental para cumplir normativas de protección de datos (como GDPR).

## Tipos de RLS

### 1. RLS Estática (roles fijos)
La más sencilla: creás un rol para un grupo y definís un **filtro fijo**.
- **Ejemplo:** rol "Finanzas" con el filtro `[Departamento] = "Finanzas"`.
- **Cuándo:** pocos grupos que no cambian (Norte, Sur, Este, Oeste).

### 2. RLS Dinámica (basada en el usuario)
La más potente y profesional. Usa la función DAX **`USERPRINCIPALNAME()`**.
- **Cómo funciona:** Power BI identifica el **correo** del usuario que inició sesión y lo busca en una tabla de "Seguridad" o "Empleados" que cargaste previamente.
- **Fórmula clave:** `[Email] = USERPRINCIPALNAME()`
- **Cuándo:** cientos de usuarios o estructura de permisos que cambia constantemente.

## El proceso de implementación
**En Power BI Desktop (diseño):**
1. Creás los **Roles** (nombres de los grupos).
2. Escribís las **reglas DAX** (el filtro que define qué filas se ven).
3. **Probás** con "Ver como" para simular que sos otro usuario.

**En Power BI Service (distribución):**
1. **Publicás** el informe.
2. Vas a la configuración de seguridad del **dataset**.
3. **Asignás** personas reales (correos) a cada rol creado.

## Errores comunes de principiante
- **Confundir RLS con ocultar columnas:** RLS oculta **filas enteras**. Para ocultar una columna completa (como "Sueldo") necesitás **OLS** (*Object-Level Security*), un concepto más avanzado.
- **Olvidar las relaciones:** para que la RLS dinámica funcione, tu tabla de "Seguridad" debe estar **correctamente relacionada** con la de "Ventas". Sin relación, el filtro no "viaja" entre tablas.
- **No probar antes de publicar:** usá siempre "Ver como". Si el filtro está mal escrito, el usuario podría ver **todo** (brecha de seguridad) o **nada** (error de reporte).

> **Recordá:** los usuarios con rol de **Administrador** o **Miembro** en el workspace suelen **ignorar la RLS** para poder gestionar los datos. La RLS se aplica principalmente a los usuarios con rol de **Espectador (Viewer)**.

---
<p align="center">
<a href="./07-areas-de-trabajo-y-permisos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./09-gateways-y-actualizaciones-programadas.md">Siguiente ➡️</a>
</p>
