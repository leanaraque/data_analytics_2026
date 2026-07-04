# 7. Configuración de áreas de trabajo y gestión de permisos

> Ya sabés publicar un reporte. Ahora organizás el trabajo en **equipo** de forma segura y con roles bien definidos.

En el mundo real, los datos no son para una sola persona: los analistas crean, los gerentes revisan, los directivos deciden. Compartir tu contraseña rompería todas las reglas de seguridad. Ahí entran las **Áreas de Trabajo (Workspaces)**: no son solo "carpetas" en la nube, sino **entornos de colaboración controlados**.

## 1. ¿Qué es un área de trabajo?
El contenedor donde organizamos el contenido. Pensalo como la **oficina digital** de un proyecto o departamento.
- **Mi área de trabajo:** tu "cajón personal"; nadie más entra salvo que compartas un informe específico. Para borradores.
- **Áreas de trabajo (compartidas):** donde vive la colaboración real (ej. "Finanzas", "RRHH", "Proyecto de Verano").

> **¿Por qué no usar solo "Mi área de trabajo"?** Si dejás la empresa o cambiás de departamento, tus informes se van con vos o quedan "huérfanos". Las áreas de trabajo garantizan la **continuidad del negocio**: el contenido pertenece al **equipo**, no a un individuo.

## 2. Anatomía de los roles (RBAC)
Power BI usa **RBAC** (*Role-Based Access Control*): en lugar de dar permisos archivo por archivo, asignás a cada persona un **rol** dentro del área. Hay **4 roles** (del más al menos poderoso):

| Rol | Qué puede hacer | Cuándo usarlo |
|-----|-----------------|---------------|
| **Administrador (Admin)** | **Todo**: agregar/quitar personas, cambiar roles, eliminar el área, actualizar contenido | Líderes del proyecto o TI. Máx. 2 por área |
| **Miembro (Member)** | Agregar personas de menor jerarquía, publicar y editar | Gestión intermedia. **No** puede eliminar el área ni quitar admins |
| **Colaborador (Contributor)** | Crear, editar y eliminar informes; publicar desde Desktop | **El rol ideal del Analista de Datos**. No agrega personas |
| **Espectador (Viewer)** | Ver e interactuar (filtros, segmentadores). No ve el modelo ni edita | Directivos y gerentes que solo consultan |

> ⚖️ **Regla de oro — Principio de menor privilegio:** otorgá siempre el permiso **mínimo necesario**. Si alguien solo lee reportes, dale "Espectador", no "Colaborador" "para ahorrar tiempo". Un permiso de más es una puerta abierta a errores o fugas de datos.

## 3. Guía paso a paso
1. **Crear el workspace:** panel izquierdo → *Áreas de trabajo > Crear área de trabajo*. Usá una estructura clara: `[Departamento] - [Proyecto]` (ej. `Ventas - Reporte Trimestral 2026`). Poné el logo del departamento para navegar visualmente más rápido.
2. **Agregar usuarios** (*Administrar acceso*):
   - **Individuales:** escribís el correo de "Laura" y le das rol. Fácil para equipos de 3-4.
   - **Grupos de seguridad (recomendado):** en empresas grandes, usá grupos creados por IT. Si entra un vendedor nuevo y IT lo mete al grupo "Ventas_Nacional", **automáticamente** tendrá acceso sin que muevas un dedo. Eso es **escalabilidad**.

## 4. Caso real: sector retail
Cadena de supermercados con 50 sucursales:
- **Vos (Analista de BI):** Administrador o Colaborador.
- **Jefe de Operaciones Nacional:** Miembro (supervisa y a veces comparte con un consultor externo).
- **Gerentes de Sucursal (50):** **Espectadores** (no tocan DAX ni colores; solo ven si cumplieron su meta).

> Este modelo asegura que el gerente de la Sucursal A no "rompa" accidentalmente el reporte que usan otros 49.

## 5. Errores comunes
- **"Todos como administradores para no tener problemas":** cualquiera puede eliminar el dataset por error o quitarle el acceso al jefe. **Máximo 2 administradores** por área.
- **Olvidar el tiempo de refresco de permisos:** un cambio no siempre es instantáneo; a veces el usuario debe cerrar sesión o esperar unos minutos. Si dice "sigo sin ver el botón de editar", pedile que refresque (F5).
- **Confundir "compartir un informe" con "dar acceso al workspace":** compartir un informe es como pasar un documento por debajo de la puerta; el acceso al workspace es dar la **llave de la oficina**.

## Síntesis
- El **área de trabajo** es el entorno de colaboración seguro.
- Los **roles** (Admin, Miembro, Colaborador, Espectador) definen el poder de cada usuario.
- El **principio de menor privilegio** es tu guía ética y de seguridad.

> **¿Qué sigue?** ¿Y si querés que un gerente vea **solo** los datos de su propia sucursal, aunque todos miren el mismo informe? Eso lo resuelve la **Seguridad a Nivel de Fila (RLS)**.

---
<p align="center">
<a href="./06-power-bi-service-y-publicacion.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./08-seguridad-nivel-de-fila-rls.md">Siguiente ➡️</a>
</p>
