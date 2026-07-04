# 9. Gateways y actualizaciones programadas: el puente entre tu PC y la nube

> 📖 **Para profundizar** — Contenido avanzado. El reporte está publicado y seguro; el problema es que los datos se **desactualizan** si no hay una conexión activa con la fuente.

Diseñaste el dashboard perfecto conectado a tu base PostgreSQL, lo publicaste, y al día siguiente tu jefe pregunta: *"¿Por qué las ventas de ayer no aparecen?"*. Power BI Service (en la nube) **no puede entrar mágicamente** a tu computadora o al servidor de la oficina: hay una **pared digital de seguridad**. Para derribarla necesitás dos herramientas: **Gateways** y **Actualizaciones Programadas**.

## 1. El concepto de Gateway: tu mensajero digital
Un **Gateway** (puerta de enlace) es un software que actúa como **puente** para que Power BI Service (nube) acceda a datos almacenados de forma **local** (*on-premises*): un Excel en tu carpeta o una base SQL Server en el servidor de tu empresa.

> **La analogía del mensajero:** el Service es una oficina en el piso 50; tus datos están en una caja fuerte en el sótano de tu casa. El **Gateway es el mensajero autorizado**: tiene la llave de tu casa y el permiso de la oficina. Cada vez que la oficina necesita información, el mensajero baja al sótano, copia los datos y los sube. Sin mensajero, la oficina nunca sabrá qué hay en el sótano.

## 2. Tipos de Gateways
- **Modo Personal:** ideal para analistas individuales o principiantes.
  - Solo **vos** lo usás; se instala en tu propia computadora; muy sencillo de configurar.
  - **Desventaja:** si apagás la laptop o la desconectás, la actualización falla.
- **Modo Estándar (On-Premises Data Gateway):** para entornos corporativos.
  - **Múltiples usuarios** comparten el mismo gateway; se instala en un servidor **siempre encendido**; soporta conexiones complejas (DirectQuery) y administración centralizada por IT.
  - **Desventaja:** configuración más técnica y permisos administrativos.

## 3. Configuración del Gateway Personal (paso a paso)
1. **Descarga e instalación:** en el portal del Service, ícono de descarga → "Puerta de enlace de datos" → elegí **Modo Personal**.
2. **Registro:** iniciá sesión con las **mismas credenciales** que usás para Power BI Service (enlaza el programa con tu espacio en la nube).
3. **La Clave de Recuperación (¡crítico!):** se te pedirá crear una. Sirve para **restaurar las conexiones** si cambiás de computadora. Muchos la pierden y tienen que configurar todo de cero. Guardala en un gestor de contraseñas.

## 4. Actualización programada (*Scheduled Refresh*)
Con el puente construido, le decís al mensajero **cuándo** trabajar. En la configuración del **Modelo semántico (Dataset)** del Service:
- **Frecuencia:** diaria o semanal.
- **Zona horaria:** que coincida con tu ubicación.
- **Horas específicas:** ej. actualizar a las 6:00 AM para que a las 8:00 todo esté listo.

> **Credenciales de la fuente de datos** (donde más se confunden): una cosa es la **clave del Gateway** y otra las **credenciales de tus datos**. Si el reporte usa PostgreSQL, ingresás el **usuario y contraseña de esa base** dentro de la configuración del Gateway en la web. Si usa un Excel local, usás autenticación "Windows" con una ruta accesible.

## 5. Errores comunes y troubleshooting
- **Computadora apagada o en suspensión:** en Modo Personal, si cerrás la laptop a las 5 PM pero programaste la actualización a las 11 PM, **falla**. El equipo debe estar encendido y con internet.
- **Cambio de ubicación del archivo:** si movés el Excel de "Escritorio" a "Documentos", el Gateway no lo encuentra. Mantené las fuentes en **carpetas fijas**.
- **Credenciales expiradas:** si cambiás tu contraseña de Windows o SQL Server, **actualizala también** en la configuración del Gateway.
- **Software desactualizado:** Microsoft lanza actualizaciones mensuales; si el Gateway tiene más de 6 meses, podría dejar de funcionar. Actualizalo periódicamente.

## Síntesis
- El **Gateway** es la infraestructura (el puente).
- La **Actualización Programada** es la logística (el horario del viaje).
- Las **Credenciales** son los permisos (las llaves).

> Al dominar esto pasás de "hacer dibujos con datos" a entregar **soluciones automatizadas y robustas** para el negocio.

---
<p align="center">
<a href="./08-seguridad-nivel-de-fila-rls.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./10-dashboards-y-suscripciones.md">Siguiente ➡️</a>
</p>
