# Manual de marca Coderhouse 4.0

Extracto operativo de **"PPT Base Clases 4.0"**, la guía interna que orienta el uso de las slides en la creación del material de clase. Está escrito para poder **reconstruir presentaciones desde cero**, sin depender del archivo original.

La implementación ejecutable de todo lo que sigue está en [`coderhouse-tema.js`](./coderhouse-tema.js).

---

## 1. Paleta cromática

Los seis colores oficiales, con el nombre que les da la guía:

| Nombre | HEX | RGB | Rol |
|--------|-----|-----|-----|
| Blanco Lienzo | `#F8F2E8` | 248, 242, 232 | Fondo claro y texto sobre fondos oscuros |
| Negro | `#171717` | 23, 23, 23 | Texto principal sobre fondo claro |
| Naranja oscuro | `#260700` | 38, 7, 0 | Fondo oscuro de portadas, divisores y cierres |
| Naranja horizonte | `#FF632B` | 255, 99, 43 | Acento principal: títulos, destacados, fondos plenos |
| Amarillo solar | `#FE872D` | 254, 135, 45 | Acento secundario: resaltados, numerales, subrayados |
| Rosa energía | `#FE64A3` | 254, 100, 163 | Acento terciario, de uso puntual |

**Jerarquía.** El naranja horizonte domina. El negro y el blanco lienzo sostienen la lectura. El amarillo solar y el rosa energía son toques, nunca protagonistas.

> **Una salvedad sobre el amarillo.** La ficha de la paleta declara `#FE872D`, pero en las slides del propio archivo el ámbar que se usa como acento es `#FDAB2E`: es el color de la banda de "Momentos de la Clase", de los numerales de sección y de los resaltados. Son dos tonos distintos. El tema expone los dos: `amarilloSolar` para el valor declarado y `amarillo` para el que efectivamente se usa en las plantillas.

---

## 2. Tipografía

**Plus Jakarta Sans** es la tipografía principal para los textos de lectura y presentaciones. Aporta legibilidad, claridad y una estética moderna. Puede usarse en **todas sus variables**. Es libre y gratuita, de Google Fonts.

Variables presentes en el archivo base: ExtraBold, Bold, Regular, Light, Italic y Light Italic.

Cuerpos medidos sobre las plantillas originales (lienzo de 720 × 405 pt):

| Elemento | Variable | Cuerpo |
|----------|----------|--------|
| Título de portada | ExtraBold | 96 pt |
| Numeral de sección y de tema | ExtraBold | 130 pt |
| Momentos de la clase | ExtraBold | 50 pt |
| Título de slide | ExtraBold | 48 pt |
| Cronograma y frases destacadas | ExtraBold | 37 a 39 pt |
| Título mediano (equipo, tarjetas) | ExtraBold | 28 pt |
| Subtítulo | Regular | 25 pt |
| Nombre en ficha | Bold | 13 pt |
| Texto de párrafo y lista de agenda | Light | 12 pt |
| Etiqueta de ficha, pie de foto | Regular | 8 pt |
| Nota al pie | Light Italic | 8 pt |
| Encabezado corrido | Regular | 5 pt |

> **Hay que instalarla.** Si Plus Jakarta Sans no está en el sistema, PowerPoint sustituye la fuente y la presentación pierde la identidad. Se descarga gratis desde Google Fonts. El tema define `FUENTE_RESPALDO` (Arial) para entornos donde no se pueda instalar.

---

## 3. Retícula y estructura de la slide

Medidas tomadas del archivo base y traducidas a pulgadas, que es la unidad con la que trabaja el generador.

| Elemento | Posición |
|----------|----------|
| Lienzo | 720 × 405 pt = **10 × 5,625 pulgadas** (16:9) |
| Margen izquierdo | 54 pt = 0,75" |
| Margen derecho | 25 pt = 0,35" |
| Título de slide | x 54 pt, y 55 pt |
| Encabezado corrido | y 17 pt, cuerpo 5 pt |
| Banda de tres fichas | y 168 a 334 pt, tres columnas de 166 pt con 14,6 pt de aire |

### Encabezado corrido

Todas las slides de contenido lo llevan, en 5 pt: `Coderhouse` a la izquierda, `2026` a continuación, `Internal Presentation` a la derecha y el número de slide en el extremo.

---

## 4. Fotografía

Dos líneas conviven, con una misma premisa: **gente real haciendo cosas reales**.

**Analógica y retro.** Tratamiento desde la edición fotográfica, donde **el flash toma protagonismo**. Prioriza la luz cálida de amaneceres y atardeceres, para conectar con la paleta.

**Espontánea y canchera.** El **naranja aparece de manera sutil en elementos de la escena** (una remera, una lámpara, un objeto), no como filtro sobre la foto. Misma luz cálida.

**Qué se retrata.** Momentos cotidianos: situaciones de estudio, trabajo colaborativo y networking.

---

## 5. Iconografía

Los íconos llevan **el mismo peso visual que la tipografía** y se usan siempre en su versión **Filled 2D**: silueta rellena, sin contornos ni degradados.

La guía aclara que la sección está en construcción y que la cartera completa llegará más adelante. Mientras tanto se usan íconos sueltos en naranja horizonte, blanco lienzo o negro, según el fondo.

---

## 6. Tono de voz, GIFs y memes

La voz de Coderhouse es **canchera, fresca y amigable, también seria y respetuosa**.

### Lo que sí

- Sumar humor, buenas intenciones, ser amables, hacer reír a la audiencia.
- Cuidar la calidad de los memes y los GIFs.
- Usar humor inteligente, con textos de la jerga. Ejemplo de jerga developer: *"Cada error en la consola nos acerca más a nuestro desarrollo"*.
- Usar memes y GIFs animados para relacionarse con el público joven de forma divertida. El humor es tranquilo y cuidado.
- Referirse a situaciones cotidianas: comunes a todos los públicos, relacionadas con cada carrera o profesión, y con Coderhouse y su metodología.
- Hablar siempre desde los valores de la marca y cuidarla.

### Lo que no

- No exponer problemáticas internas.
- No usar contenido político.
- No usar contenido con niños o menores de edad.
- No abrir polémicas, entrar en conflictos ni herir susceptibilidades.
- No usar memes que contengan marcas de otras empresas o contenido no autorizado para su uso.

---

## 7. Plantillas de diapositiva

Repertorio del archivo base. Cada nombre es el método que expone `coderhouse-tema.js`.

| Método | Qué resuelve | Fondo |
|--------|--------------|-------|
| `portada` | Título grande centrado, bajada y logo | Degradado cálido |
| `seccion` | Numeral grande arriba a la derecha, título del bloque abajo a la izquierda | Naranja oscuro |
| `agenda` | Título sangrado contra el borde superior y lista numerada | Blanco lienzo |
| `cronograma` | Línea de hitos del curso, con el hito actual resaltado | Blanco lienzo |
| `divisorTema` | Numeral y título del tema, sin más elementos | Naranja oscuro o naranja horizonte |
| `tituloTexto` | Título, subtítulo y párrafo | Blanco |
| `tituloTextoImagen` | Lo mismo, con la mitad derecha reservada para imagen | Blanco |
| `frase` | Frase a dos renglones con bajada breve, sobre foto o color | Foto de luz cálida |
| `equipo` | Profesor, coordinador y tutor en tres fichas, con número de comisión | Blanco |
| `vinetas` | Dos bloques redondeados arriba y uno ancho abajo | Blanco |
| `tarjetas` | Tres tarjetas con imagen y pie, con selector de mes | Blanco |
| `mapaConceptual` | Concepto principal en naranja, secundarios en negro, terciarios en contorno | Blanco lienzo |
| `frasePostits` | Frase destacada a dos renglones y tres notas de color con esquina doblada | Blanco |
| `momentos` | Los momentos de la clase en vertical, el activo en oscuro y el resto atenuados | Banda ámbar arriba |
| `valor` | Un valor de la compañía y tres personas destacadas con sus motivos | Naranja oscuro |
| `grabacion` | Aviso de clase grabada | Naranja horizonte o claro con degradado |
| `break` | Aviso de pausa | Rosa energía |
| `cierre` | Agradecimiento final con el texto legal | Naranja oscuro o blanco lienzo |

---

## 8. Los momentos de la clase

Las marcas que estructuran una clase. `momentos()` muestra la lista y resalta la activa.

| Momento | Para qué sirve |
|---------|----------------|
| **Ejemplo en Vivo** | Que el profesor muestre a los estudiantes, desde el uso de un programa hasta la confección de ciertos desafíos, con un ejemplo puntual en vivo |
| **Actividad colaborativa** | Se hacen con la función breakout rooms de Zoom (salas de reunión privadas). En su mayoría las guían los coordinadores o el profesor |
| **Para pensar** | Un concepto que se propone reflexionar en grupo o individualmente. Puede usarse la función Encuesta en Vivo de Zoom, o quizzes |
| **Para recordar** | Destacar un concepto o autor importante que se debe tener en cuenta. ¡Para que no se te olvide! |
| **Coder Tips** | Información puntual y concreta, de autoría de Coder, que da consejos y datos para aportar claridad en algún aspecto específico |
| **Material ampliado** | Bibliografía, links de interés, herramientas y recursos para ampliar conocimientos. Están en el Repositorio de contenidos |
| **Cuestionario de tarea** | Un Google Form con preguntas de opción múltiple, verdadero o falso o selección múltiple, para repasar la clase de manera asincrónica |
| **#FindTheBug** | Se pide analizar un código erróneo para hallar el problema que está causando un defecto |

---

## 9. El cronograma del curso

`cronograma()` reproduce la slide "Completa con **éxito** el cronograma", con estos hitos:

`Kick Off` → `Clase 0` → `Desafíos` → `Entrega intermedia` → `Desafíos` → `Proyecto final` → `Certificado`

Nota al pie obligatoria, en itálica de 8 pt:
*"(*) Recuerda que el primer requisito para finalizar con éxito es asistir a las clases."*

---

## 10. Assets

En [`assets/`](./assets/), extraídos del archivo base con canal alfa:

| Archivo | Uso |
|---------|-----|
| `degradado-portada.png` | Fondo de portada, del rosa al blanco lienzo pasando por naranja |
| `degradado-amanecer.png` | Arco de amanecer para cierres claros |
| `logotipo-coderhouse.png` | Logotipo horizontal oscuro |
| `logotipo-coderhouse-claro.png` | Logotipo horizontal claro, para fondos oscuros |
| `isotipo-coderhouse.png` | Isotipo del sol sobre el horizonte |

---

## 11. Texto legal de cierre

Las slides de cierre llevan el aviso de confidencialidad en inglés y la línea de copyright. Los dos están en `coderhouse-tema.js` como `LEGAL` y `COPYRIGHT`, para no transcribirlos a mano.

---

## 12. Cómo generar una presentación

```bash
node recursos/manual-de-marca/ejemplo-clase.js
```

El tema se importa y se encadenan las plantillas:

```js
const { Deck } = require("./coderhouse-tema");

const d = new Deck({ comision: "12345" });
d.portada("Semana 3", "Introducción a SQL y Sublenguajes");
d.agenda(["Qué es SQL", "DDL", "DML", "DCL", "TCL"]);
d.divisorTema(1, "Qué es SQL");
d.tituloTexto("Qué es SQL", "Structured Query Language", "El lenguaje con el que...");
d.momentos("Ejemplo en Vivo", "Vamos a crear la base juntos, en vivo.");
d.cierre();
d.guardar("clase-03.pptx");
```

Cada método devuelve el `Deck`, así que también se pueden encadenar. El encabezado corrido y la numeración se agregan solos.

---
<p align="center">
<a href="../">Recursos</a> · <a href="../../README.md">Índice del curso</a>
</p>
