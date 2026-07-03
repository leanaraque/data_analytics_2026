# 8. La maestría del ETL: consolidando el flujo de datos en Power BI

> 📖 **Para profundizar** — Unidad de consolidación con contenido avanzado. Podés continuar sin leerla y volver cuando quieras ver "el bosque completo".

Sos el chef principal de un restaurante de alta cocina. Antes de presentar un plato espectacular a tus comensales (los *stakeholders*), necesitás ingredientes frescos, limpios y bien cortados. **Power Query es tu cocina profesional**, y la transformación de datos es la *mise en place* que garantiza que el resultado sea nutritivo para la toma de decisiones.

## 1. El ciclo de vida del dato: el modelo del reloj de arena
- **Parte superior ancha (Extract):** Power BI se conecta a casi cualquier cosa: SQL, Excel en SharePoint, APIs, páginas web. El volumen es masivo y desorganizado.
- **El cuello estrecho (Transform):** acá ocurre la magia de Power Query. Refinamos, filtramos y moldeamos. **Solo lo útil y limpio pasa** por el cuello.
- **La base ancha (Load & Visualize):** el dato limpio se carga en el modelo para crear reportes interactivos que se distribuyen a toda la organización.

> Cargar datos sucios es como construir un edificio sobre **arena movediza**: tarde o temprano los reportes muestran errores, los cálculos DAX fallan y el rendimiento se vuelve tan lento que nadie querrá usar tus dashboards.

## 2. La "limpieza" no es solo estética
**El tipado de datos importa por dos razones técnicas:**
- **Ahorro de memoria:** Power BI usa el motor tabular **VertiPaq**, que comprime los datos. Una columna de fechas bien tipada ocupa mucho menos que como texto. En millones de filas, es la diferencia entre un archivo de 10 MB y uno de 200 MB.
- **Habilitación de funciones:** no podés sumar "manzanas" con "10". Si tu columna de ventas es texto, no podrás calcular el Total.

> **Inmutabilidad de la fuente:** Power Query es **no-destructivo**. Funciona como una capa de lectura: lee el dato original, aplica pasos y muestra el resultado. Podés experimentar sin miedo a corromper la base de datos de la empresa.

## 3. Casos de estudio del mundo real
- **Consolidación bancaria:** el Banco A usa fechas `DD/MM/YYYY` y el Banco B `MM/DD/YYYY`; una base usa punto decimal y otra coma. Con Power Query (función *"Usar configuración regional"*) se estandarizan sin editar millones de registros a mano.
- **Retail y el problema de los nulos:** cuando un producto es nuevo, el "Precio de Costo" llega `null` y rompe los cálculos de margen. La solución es una lógica de **reemplazar valores** (por el costo promedio de la categoría o un valor por defecto).

## 4. Errores comunes y mejores prácticas
- **Error 1 — Cargar todo "por si acaso":** conectar 100 columnas y 50 millones de filas y cargar todo. Power BI trabaja en **RAM**; cargar de más ralentiza y encarece. **Correcto:** seleccioná columnas y filtrá filas **antes** de cargar (si solo usás 5 de 100 columnas, eliminá las otras 95).
- **Error 2 — Confundir Merge con Append:** **Append** = poner una hoja debajo de otra (mismos campos, distintos períodos). **Merge** = traer información lateralmente por una columna común (ID).
- **Error 3 — No nombrar los pasos:** dejar `"Columnas quitadas 1"`, `"Columnas quitadas 2"`. Meses después no sabrás qué hiciste. **Correcto:** renombrá los pasos significativos (`"Filtrar por año 2024"`, `"Estandarizar nombres de ciudades"`).

## 5. El lenguaje M: el motor bajo el capó
Cada clic genera código M. Pensalo como el **guion** de una película: la interfaz visual es el director, pero M es el documento que registra exactamente qué debe pasar, en qué orden y con qué condiciones. Preocupate por M cuando necesites **lógica condicional compleja** o **funciones personalizadas**.

## 6. Síntesis: preparando el terreno para DAX
Al cerrar el Editor de Power Query y hacer **"Cerrar y Aplicar"**, los datos aterrizan en el **Modelo de Datos**. Ahí termina la responsabilidad de Power Query y empieza la de **DAX**.

> **La regla de oro:** siempre que puedas resolver un problema en **Power Query** (transformación), hacelo ahí. **No** uses DAX para limpiar datos o cambiar tipos. **DAX** es para cálculos analíticos (comparar ventas de este año vs. el anterior); **Power Query** es para la **arquitectura del dato**.

### Resumen de puntos clave
- **ETL:** Extracción, Transformación y Carga. Es el corazón de Power BI.
- **Power Query:** herramienta **no-destructiva** que documenta pasos de transformación.
- **Tipado de datos:** vital para el rendimiento y la capacidad de calcular.
- **Optimización:** cargá solo lo que necesites (pocos datos, gran valor).
- **Lenguaje M:** el lenguaje detrás de la interfaz, ideal para automatizaciones avanzadas.

> 🤔 **Reflexión:** si tuvieras que explicarle a tu jefe por qué tardaste 3 días preparando los datos y solo 3 horas haciendo los gráficos, ¿cómo usarías la analogía del "reloj de arena" para justificar el valor de tu trabajo?

---
<p align="center">
<a href="./07-automatizacion-con-funciones-de-power-query.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./09-modelado-relaciones-y-cardinalidad.md">Siguiente ➡️</a>
</p>
