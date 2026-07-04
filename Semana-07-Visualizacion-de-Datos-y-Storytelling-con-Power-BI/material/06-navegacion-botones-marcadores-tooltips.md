# 6. Navegación avanzada: botones, marcadores y tooltips

> Con la interactividad básica dominada (filtros, segmentadores), esta unidad agrega la capa de **navegación** que convierte un reporte en una experiencia guiada.

Un dashboard con datos correctos pero navegación deficiente es como un libro sin índice: la información está, pero nadie sabe cómo llegar. La diferencia entre un reporte que el gerente abre una vez y uno que usa a diario no está en la cantidad de gráficos, sino en la **experiencia de uso**. Al combinar **botones, marcadores y tooltips**, dejás de entregar reportes y empezás a entregar **aplicaciones de análisis**.

## 1. Botones y navegadores: las señales de tránsito
Objetos interactivos que ejecutan una acción al hacer clic. La más usada: **Navegación de Páginas**.

> Cuando un reporte tiene más de tres páginas, el usuario **no** debería depender de las pestañas inferiores (una interfaz técnica para el desarrollador). En reportes profesionales, las pestañas se **ocultan** y se navega con botones en el lienzo.

**El Navegador de Páginas automático:** *Insertar > Botones > Navegador > Navegador de páginas*. Se **sincroniza automáticamente** con la estructura del informe: si agregás una página "Inventario", crea su botón solo. Podés ocultar páginas técnicas (tooltips, auxiliares).

**Botones individuales con acción personalizada:** Navegación de páginas · **Marcador** · **URL web** (enlace externo) · **Drill-through** (navega a una página de detalle pasando el contexto del dato — muy usado en SSR).

> **Tip:** diseñá tus botones con **estados visuales** diferenciados (inactivo, hover, seleccionado). Le da retroalimentación inmediata al usuario y hace que el reporte se sienta como una **aplicación real**.

## 2. Marcadores: el "guardar partida" del dashboard
Una **fotografía del estado completo** del informe. Captura: los **filtros y segmentadores** activos, la **visibilidad** de cada objeto, la **página**, y opcionalmente posición/tamaño (para animaciones).

**Casos de uso SSR:**
- **Vista ejecutiva vs. operativa:** un botón "Vista Ejecutiva" oculta tablas y muestra solo KPIs; otro "Vista Operativa" muestra todo el detalle. El usuario alterna con un clic sin cambiar de página.
- **Filtros preconfigurados:** botón "Ver solo Outliers" aplica un filtro y oculta gráficos irrelevantes.
- **Resetear el dashboard:** botón "Limpiar filtros" con todos los segmentadores en estado inicial (de lo más valorado por los usuarios).

> ⚠️ **Error crítico:** el marcador guarda los filtros activos **en el momento de su creación**. Si lo creás con una región seleccionada, cada uso filtrará por esa región sin que el usuario lo sepa. **Verificá siempre** el estado de todos los filtros antes de crear un marcador.

## 3. Tooltips personalizados: el zoom inteligente
El **tooltip** es la ventanita que aparece al pasar el cursor. Por defecto muestra solo categoría y valor. Un **tooltip personalizado** lo reemplaza por una **página completa** de Power BI diseñada para enriquecer el dato sin saturar la pantalla.

**¿Cómo funciona?**
1. Creás una página nueva y en sus propiedades la marcás como **Página de información sobre herramientas (Tooltip)**.
2. La diseñás como un mini-dashboard (gráficos, KPIs, tablas).
3. En el gráfico principal, indicás que use esa página como tooltip.
4. Al pasar el cursor sobre una barra, la página aparece **contextualizada** al dato señalado.

**Casos de uso:** desglose inmediato (ranking de vendedores del mes señalado) · contexto histórico (evolución de esa región en 6 meses) · alertas condicionales (indicador que cambia de color según la meta).

> **Limitación:** los tooltips personalizados **no** funcionan en móvil (dependen del *hover*). Si tu reporte tiene versión móvil, asegurate de que la info crítica esté disponible de otra forma.

## 4. Combinando las tres herramientas

| Herramienta | Rol en la experiencia | Analogía |
|-------------|----------------------|----------|
| **Botones** | Mueven al usuario entre contextos | Las señales de tránsito |
| **Marcadores** | Configuran la vista del destino | El GPS que prepara el camino |
| **Tooltips** | Enriquecen el dato sin cambiar de vista | El zoom de una cámara |

> **Ejemplo integrado:** el gerente abre el resumen ejecutivo (botón) → hace clic en "Ver solo Outliers" (marcador) → pasa el cursor sobre el outlier más alto (tooltip con el desglose por vendedor). Todo sin salir de la página ni pedir ayuda al analista.

## 5. Errores comunes
- **Dejar las pestañas de página visibles:** en reportes para usuarios finales, ocultalas y navegá con botones.
- **Marcadores con filtros no intencionados:** revisá el estado completo antes de guardar.
- **Páginas de tooltip demasiado cargadas:** si necesitás más de 3-4 elementos, esa info merece una página de detalle con **drill-through**.
- **No testear como usuario:** recorré el reporte completo (clic en todos los botones, activá todos los marcadores, pasá el cursor por todos los gráficos) antes de entregar.

## Bonus: parámetros y Copilot
- **Parámetros y filtros dinámicos:** entradas que permiten ajustar el contenido en tiempo real (escenarios *what-if*). *(Ver detalle en la [unidad 3](./03-segmentadores-filtros-e-interacciones.md).)*
- 🤖 **Copilot en Power BI:** la IA que asiste en la creación de visualizaciones y narrativas: genera ideas de diseño según tus datos, crea narrativas automáticas para explicar visuales y sugiere configuraciones óptimas. Al cargar un dataset, puede proponer un dashboard inicial con gráficos relevantes.

---
<p align="center">
<a href="./05-graficos-avanzados.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 7</a> · <a href="./07-q-and-a-y-optimizacion.md">Siguiente ➡️</a>
</p>
