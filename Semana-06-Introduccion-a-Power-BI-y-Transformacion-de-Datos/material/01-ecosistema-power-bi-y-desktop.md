# 1. Ecosistema Power BI 2026 y Power BI Desktop

> Arranca el bloque ETL: ya sabés extraer datos con SQL; ahora conectás esos datos a la herramienta de análisis visual.

Tu trabajo como analista es transformar el "ruido" de miles de filas en una **historia visual** que permita tomar decisiones: *¿estamos perdiendo dinero en alguna región? ¿cuál es el producto estrella del mes?*. Para eso usamos la herramienta líder del mercado: **Power BI**.

## 1. ¿Qué es Power BI? Más que simples gráficos
No es una versión "mejorada" de los gráficos de Excel. Es una **plataforma de inteligencia de negocios (BI)** completa que permite **conectar, transformar, modelar y visualizar** datos de fuentes casi ilimitadas.

Su gran diferencia es la **interactividad**: si hacés clic en una barra de "Ventas de Calzado", todos los demás gráficos de la página se filtran automáticamente para mostrar solo calzado. No es una imagen estática; es un **entorno exploratorio**.

**El problema que resuelve:** antes, los analistas pasaban el 80% del tiempo copiando y pegando datos en hojas de cálculo que quedaban desactualizadas al día siguiente. Power BI crea **pipelines** (tuberías): conectás la herramienta a tu base de datos y, con un clic, el informe se actualiza con los datos más recientes.

## 2. El ecosistema Power BI 2026 (analogía: la cocina de un restaurante)
Power BI no es un solo programa, sino un conjunto de servicios que trabajan juntos:
- **Power BI Desktop (la cocina):** la herramienta **gratuita** que instalás en tu computadora. Acá "cocinás" los datos: los limpiás, cortás, mezclás y diseñás el informe. Es donde pasaremos la mayor parte del módulo.
- **Power BI Service (el comedor):** el servicio en la nube (`app.powerbi.com`). Cuando tu informe está listo, lo **publicás** para que otros lo vean y consuman. Acá ocurre la colaboración.
- **Microsoft Fabric (el edificio):** en 2026, Power BI vive dentro de un entorno mayor llamado **Fabric**, que contiene también los almacenes de datos (**OneLake**) y las fábricas de procesamiento a gran escala.

### El flujo de trabajo estándar
1. **Conexión:** traés datos de PostgreSQL, Excel o la web a Power BI Desktop.
2. **Transformación (ETL):** limpiás con el motor de **Power Query**.
3. **Modelado:** creás relaciones entre tablas (como los JOINs de SQL).
4. **Visualización:** arrastrás y soltás campos para crear gráficos.
5. **Publicación:** enviás el informe al Service para que jefes o clientes lo vean en el navegador o el celular.

## 3. Power BI Desktop: tu centro de operaciones
Componentes clave de la interfaz:
- **Vista de Informe (lienzo):** el espacio donde diseñás tus visualizaciones.
- **Vista de Tabla:** donde ves los datos crudos importados (similar a ver una tabla en SQL).
- **Vista de Modelo:** donde gestionás las relaciones entre tablas (verás visualmente tus PK y FK).
- **Panel de Visualizaciones:** la galería de gráficos (barras, líneas, mapas, velocímetros).
- **Panel de Datos:** todas tus tablas y columnas listas para usar.

> 🤖 **Novedad 2026 — Copilot:** la IA está integrada. Podés pedirle en lenguaje natural *"Creá un gráfico que compare las ventas de este año contra el anterior"* y genera una propuesta automáticamente. No sustituye al analista, pero acelera el diseño.

## 4. Diferencias cruciales: Informes vs. Dashboards

| Característica | Informe (Report) | Cuadro de Mando (Dashboard) |
|---------------|------------------|-----------------------------|
| **Ubicación** | Se crea en Desktop y Service | Solo existe en el Service (nube) |
| **Detalle** | Múltiples páginas y mucho detalle | Una sola página de resumen de alto nivel |
| **Fuentes** | Basado en un solo conjunto de datos | Puede combinar gráficos de muchos informes |
| **Propósito** | Explorar y filtrar datos a fondo | Monitorear KPIs de un vistazo |

> **Ejemplo:** un **informe** es un documento de 5 páginas con ventas por vendedor, producto y ciudad, con filtros de fecha. Un **dashboard** es una sola pantalla en el celular del Gerente General con 3 números: Venta Total, Margen y Clientes Nuevos.

## 5. Errores comunes que debés evitar
- **Intentar compartir el archivo `.pbix`:** enviarlo por correo falla, porque el otro necesita tener el programa instalado y acceso a las mismas bases. Lo profesional es **publicar en el Power BI Service**.
- **Ignorar la limpieza inicial:** si los datos están "sucios" (fechas como texto, nombres mal escritos), tus gráficos **mentirán**. *Garbage In, Garbage Out.*
- **Pensar que Power BI reemplaza a SQL:** SQL sigue siendo el rey para **extraer** datos eficientemente; Power BI se conecta a tus consultas para traer solo lo necesario.

## 6. Síntesis
Power BI es una plataforma **interactiva y colaborativa**. El flujo siempre inicia en el **Desktop** (creación) y termina en el **Service** (consumo). **Microsoft Fabric** es el ecosistema moderno donde Power BI se integra con otras herramientas de datos.

> **¿Qué sigue?** Conectar Power BI Desktop a una base de datos real y traer tus datos de SQL al entorno de Power BI.

---
<p align="center">
🏠 <a href="../README.md">Semana 6</a> · <a href="./02-power-bi-y-transformacion-de-datos.md">Siguiente: Power BI y transformación de datos ➡️</a>
</p>
