# 6. Introducción a Power BI Service y publicación de informes

> Los dashboards que construiste en Power BI Desktop hasta ahora solo los podés ver vos. Esta unidad los lleva a la **nube** para que otros puedan acceder.

Hasta acá te convertiste en un experto **constructor**: extraés con SQL, limpiás con Power Query, calculás con DAX y diseñás visualizaciones. Pero todo ese trabajo vive en **tu computadora**. En el mundo real, **un informe que nadie ve es un informe que no existe**. El valor surge cuando se comparte, se discute y se usa para decidir en equipo. Ahí entra **Power BI Service**.

## 1. Desktop vs. Service
- **Power BI Desktop — la fábrica de informes:** tu "taller de carpintería" con las herramientas pesadas (conectores SQL, Power Query, motor DAX). Se instala en Windows; su propósito es **crear y diseñar**.
- **Power BI Service (Power BI Web) — la sala de exhibición:** una plataforma en la **nube (SaaS)**. Si Desktop es el taller, el Service es la galería o la sala de juntas: los informes cobran vida para los usuarios finales.
  - **Acceso:** mediante navegador web.
  - **Propósito:** publicación, consumo, colaboración y distribución.
  - **Interactividad:** los usuarios filtran y exploran, pero (generalmente) **no** cambian el modelo ni las fórmulas DAX.

> **Analogía:** Desktop es como escribir una carta en tu escritorio (privado); Service es enviarla por correo certificado a una oficina donde **solo quien tiene la llave** puede leerla.

## 2. El proceso de publicación, paso a paso
1. **Preparación y limpieza:** revisá los **nombres** de las pestañas ("Resumen Ejecutivo", no "Página 1"), eliminá visualizaciones de prueba y verificá que los **filtros** estén en una posición neutral.
2. **Inicio de sesión:** debés estar autenticado en Desktop con tu **cuenta organizacional**.
3. **El botón Publicar:** en la pestaña **Inicio** de la cinta. Te pedirá guardar los cambios locales.
4. **Selección del destino (workspace):**
   - **Mi área de trabajo:** tu espacio personal; nadie más lo ve salvo que compartas.
   - **Áreas de trabajo colaborativas:** espacios de equipo (ej. "Ventas Latam").
5. **Confirmación y enlace:** aparece "Operación correcta" con un enlace directo para abrir el informe en el navegador.

## 3. ¿Qué sucede técnicamente al publicar?
Se crean **dos elementos separados** en el Service:
- **El Informe (Report):** las visualizaciones, el diseño y la configuración de filtros. Es lo que el usuario **ve**.
- **El Conjunto de Datos (Semantic Model / Dataset):** el "alma" del informe. Contiene la conexión a SQL, las transformaciones de Power Query y las medidas DAX.
> **¿Por qué importa?** Podés crear un **segundo informe** distinto usando el **mismo dataset** ya subido, sin volver a cargar los datos desde SQL.

## 4. Publicar en Web: el gran peligro de seguridad
- **Publicar en el Service (seguro):** requiere que el espectador tenga una **cuenta** de Power BI y **permisos** otorgados por vos. Los datos están protegidos por el inicio de sesión.
- **Publicar en la Web (público):** genera un enlace o código HTML que se puede pegar en cualquier sitio.
  - ⚠️ **Riesgo:** el informe se vuelve **públicamente accesible** en internet. Cualquiera que encuentre el enlace ve tus datos **sin contraseña**.
  - **Uso correcto:** solo para datos que ya son públicos (estadísticas de salud pública, resultados deportivos).
  - **Uso incorrecto:** **NUNCA** para datos corporativos, salarios, listas de clientes o estrategias internas.

> ⚖️ **Regla de oro:** si usás "Publicar en la Web", asumí que **el mundo entero** está viendo tus datos.

## 5. Errores comunes de principiantes
- **Pensar que el informe se actualiza solo:** al publicar subís una "foto" de los datos. Para que se actualicen automáticamente desde SQL necesitás un **Gateway** (unidad 9).
- **Publicar con filtros aplicados:** si dejás el informe filtrado por "2024", todos lo verán así. **Limpiá los filtros** antes de subir.
- **Ignorar el peso del archivo:** subir 500 MB sin filtrar en Power Query hace el informe lento para el usuario final.

## 🛠️ Práctica — Tu primer reporte en la nube
Simula el proceso de publicar un reporte de ventas para el equipo directivo:
1. **Auditoría de datos sensibles:** verificá que no haya datos reales protegidos (DNIs, correos). Si los hay, reemplazalos por ficticios.
2. **Limpieza de interfaz:** nombres de páginas profesionales; eliminá páginas de "Prueba".
3. **Publicación directa:** *Publicar* → destino **"Mi área de trabajo"**.
4. **Verificación:** abrí el enlace; observá que la URL empieza por `app.powerbi.com`.
5. **Exploración:** en el panel izquierdo, identificá el ícono **azul (Informe)** y el **naranja (Conjunto de datos)**.
6. **Simulación de seguridad:** buscá "Publicar en la web (público)" en *Archivo > Insertar informe* → **NO generes el código**, solo observá la advertencia.

> **Éxito si:** el informe es navegable desde el navegador y podés identificar la separación entre "Informe" y "Conjunto de datos" en el workspace.

---
<p align="center">
<a href="./05-distribuciones-de-frecuencias-y-probabilidad.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./07-areas-de-trabajo-y-permisos.md">Siguiente ➡️</a>
</p>
