/**
 * Tema Coderhouse 4.0 para pptxgenjs.
 *
 * Implementa la paleta, la tipografia y las plantillas descritas en README.md.
 * Las medidas salen del archivo base "PPT Base Clases 4.0", cuyo lienzo es de
 * 720 x 405 pt; aca se trabaja en pulgadas (720 pt = 10", 405 pt = 5,625").
 *
 * Uso:
 *   const { Deck } = require("./coderhouse-tema");
 *   const d = new Deck({ comision: "12345" });
 *   d.portada("Semana 3", "Introduccion a SQL");
 *   d.guardar("clase-03.pptx");
 */

const path = require("path");
const PptxGenJS = require("pptxgenjs");

// --- Paleta -----------------------------------------------------------------
// Sin almohadilla: pptxgenjs corrompe el archivo si el hex la lleva.
const COLOR = {
  blancoLienzo: "F8F2E8",
  negro: "171717",
  naranjaOscuro: "260700",
  naranja: "FF632B",   // Naranja horizonte, acento principal
  amarilloSolar: "FE872D", // valor declarado en la ficha de paleta
  amarillo: "FDAB2E",  // ambar que usan de hecho las plantillas
  rosa: "FE64A3",
  blanco: "FFFFFF",
};

// Sombras de la esquina doblada de los post-its, medidas del original.
const COLOR_DOBLEZ = { [COLOR.naranja]: "CB4F22", [COLOR.rosa]: "CB4F82", [COLOR.amarillo]: "CA8824" };

// --- Tipografia -------------------------------------------------------------
const FUENTE = "Plus Jakarta Sans";
const FUENTE_RESPALDO = "Arial";

const PESO = {
  extraBold: { fontFace: FUENTE + " ExtraBold", bold: true },
  bold: { fontFace: FUENTE, bold: true },
  regular: { fontFace: FUENTE },
  light: { fontFace: FUENTE + " Light" },
};

// --- Reticula (pulgadas) ----------------------------------------------------
const G = {
  ancho: 10,
  alto: 5.625,
  margen: 0.75,        // 54 pt
  margenDer: 0.35,
  anchoUtil: 10 - 0.75 - 0.35,
  yTitulo: 0.7,        // 50 pt
  yEncabezado: 0.2,
  fichaY: 2.33,        // 168 pt
  fichaAlto: 2.31,     // 166 pt
  fichaAncho: 2.3,
  fichaGap: 0.2,
};

const LEGAL =
  "We have provided this presentation to you for informational and illustrative purposes on a confidential basis. " +
  "We reserve the right to use of non-disclosure agreements (NDAs) to protect our privacy and intellectual property rights. " +
  "The information contained in this document is highly sensitive, confidential and/or proprietary and is intended for the " +
  "express use of the intended recipient, as denoted on the title page of this document. The recipient of this presentation " +
  "agrees by its receipt not to reproduce, duplicate, or reveal, in whole or in part, information presented herein without " +
  "written permission of Coderhouse. No representation or warranty, expressed or implied, is made as to the accuracy or " +
  "completeness of the information contained in this presentation.";

const COPYRIGHT =
  "Copyright © 2026 Coderhouse. All rights reserved. Coderhouse and the Coderhouse logo are trademarks or registered " +
  "trademarks of Coderhouse. in the U.S. and/or other countries. All other trademarks are the property of their respective owners.";

const MOMENTOS = [
  "Ejemplo en Vivo",
  "Actividad colaborativa",
  "Para pensar",
  "Para recordar",
  "Coder Tips",
  "Material ampliado",
  "Cuestionario de tarea",
  "#FindTheBug",
];

const HITOS = ["Kick Off", "Clase 0", "Desafíos", "Entrega\nintermedia", "Desafíos", "Proyecto\nfinal", "Certificado"];

const ASSETS = path.join(__dirname, "assets");
const asset = (n) => path.join(ASSETS, n);

// ---------------------------------------------------------------------------

class Deck {
  /**
   * @param {object} opts
   * @param {string} [opts.comision]  numero de comision, para la slide de equipo
   * @param {string} [opts.anio]      anio del encabezado corrido
   * @param {boolean} [opts.fuenteSegura]  usa Arial en vez de Plus Jakarta Sans
   */
  constructor(opts = {}) {
    this.pres = new PptxGenJS();
    this.pres.layout = "LAYOUT_16x9"; // 10" x 5.625", el del archivo base
    this.pres.author = "Coderhouse";
    this.pres.company = "Coderhouse";
    this.comision = opts.comision || "";
    this.anio = opts.anio || "2026";
    this.segura = !!opts.fuenteSegura;
    this.n = 0;
  }

  // Devuelve una copia del peso, con la fuente de respaldo si hace falta.
  _f(peso, extra = {}) {
    const base = PESO[peso];
    const face = this.segura ? FUENTE_RESPALDO : base.fontFace;
    return Object.assign({}, base, { fontFace: face }, extra);
  }

  _slide(fondo) {
    const s = this.pres.addSlide();
    if (fondo) s.background = { color: fondo };
    this.n += 1;
    return s;
  }

  // Encabezado corrido de 5 pt que llevan todas las slides de contenido.
  _encabezado(s, colorTexto) {
    const c = colorTexto || COLOR.negro;
    const com = [
      { t: "Coderhouse", x: G.margen - 0.14 },
      { t: this.anio, x: 2.4 },
      { t: "Internal Presentation", x: 8.08 },
      { t: String(this.n), x: 9.3 },
    ];
    com.forEach((it) => {
      s.addText(it.t, Object.assign(this._f("regular"), {
        x: it.x, y: G.yEncabezado, w: 1.6, h: 0.16,
        fontSize: 5, color: c, isTextBox: true, margin: 0,
        align: it.t === String(this.n) ? "right" : "left",
      }));
    });
    return s;
  }

  // Dibuja el titulo de una slide de contenido y devuelve la Y libre debajo.
  // El alto se calcula segun cuantos renglones ocupa, asi un titulo largo
  // empuja el contenido en vez de pisarlo.
  _tituloSlide(s, titulo, opts = {}) {
    const fs = opts.fontSize || 34;
    const ancho = opts.ancho || G.anchoUtil;
    const porRenglon = Math.floor((ancho / fs) * 108); // medido sobre el original
    const renglones = Math.max(1, Math.ceil(titulo.length / porRenglon), titulo.split("\n").length);
    const alto = (fs / 58) * renglones;
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: G.margen, y: G.yTitulo, w: ancho, h: alto,
      fontSize: fs, color: opts.color || COLOR.negro,
      isTextBox: true, margin: 0, valign: "top", lineSpacingMultiple: 1.05,
    }));
    return G.yTitulo + alto + 0.1;
  }

  // --- Plantillas -----------------------------------------------------------

  /** Portada con degradado calido, titulo grande y logo. */
  portada(kicker, titulo, bajada) {
    const s = this._slide(COLOR.blancoLienzo);
    s.addImage({ path: asset("degradado-portada.png"), x: 0, y: 0, w: G.ancho, h: G.alto });
    if (kicker) {
      s.addText(kicker, Object.assign(this._f("light"), {
        x: 0, y: 1.42, w: G.ancho, h: 0.24,
        fontSize: 10, color: COLOR.blancoLienzo, align: "center", isTextBox: true, margin: 0,
      }));
    }
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: 0.5, y: 1.72, w: G.ancho - 1, h: 1.5,
      fontSize: 54, color: COLOR.blancoLienzo, align: "center", isTextBox: true, margin: 0,
    }));
    if (bajada) {
      s.addText(bajada, Object.assign(this._f("light"), {
        x: 1.5, y: 3.3, w: G.ancho - 3, h: 0.5,
        fontSize: 10, color: COLOR.blancoLienzo, align: "center", isTextBox: true, margin: 0,
      }));
    }
    s.addImage({ path: asset("logotipo-coderhouse.png"), x: 4.3, y: 4.35, w: 1.4, h: 0.41 });
    return this;
  }

  /** Divisor de bloque: numeral grande arriba a la derecha. */
  seccion(numero, titulo) {
    const s = this._slide(COLOR.naranjaOscuro);
    s.addText(String(numero).padStart(2, "0"), Object.assign(this._f("extraBold"), {
      x: 6.9, y: 0.16, w: 2.75, h: 1.9,
      fontSize: 130, color: COLOR.naranja, align: "right", isTextBox: true, margin: 0,
    }));
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: G.margen, y: 3.05, w: 7.5, h: 1.4,
      fontSize: 40, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, valign: "bottom",
    }));
    return this;
  }

  /** Divisor de tema. variante "oscuro" (por defecto) o "naranja". */
  divisorTema(numero, titulo, variante = "oscuro") {
    const naranja = variante === "naranja";
    const s = this._slide(naranja ? COLOR.naranja : COLOR.naranjaOscuro);
    s.addText(String(numero).padStart(2, "0"), Object.assign(this._f("extraBold"), {
      x: 6.9, y: 0.16, w: 2.75, h: 1.9,
      fontSize: 130, color: naranja ? COLOR.amarillo : COLOR.naranja,
      align: "right", isTextBox: true, margin: 0,
    }));
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: G.margen, y: 3.35, w: 8, h: 0.95,
      fontSize: 40, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, valign: "bottom",
    }));
    return this;
  }

  /** Agenda: titulo sangrado contra el borde y lista numerada. */
  agenda(items, titulo = "Agenda") {
    const s = this._slide(COLOR.blancoLienzo);
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: 3.4, y: -0.42, w: 6.25, h: 1.5,
      fontSize: 90, color: COLOR.naranja, align: "right", isTextBox: true, margin: 0,
    }));
    const paso = 0.23;
    const y0 = Math.max(1.9, (G.alto - items.length * paso) / 2);
    items.forEach((it, i) => {
      s.addText(`${i + 1}.`, Object.assign(this._f("light"), {
        x: 0.75, y: y0 + i * paso, w: 0.45, h: paso,
        fontSize: 12, color: COLOR.negro, align: "right", isTextBox: true, margin: 0,
      }));
      s.addText(it, Object.assign(this._f("light"), {
        x: 1.3, y: y0 + i * paso, w: 8, h: paso,
        fontSize: 12, color: COLOR.negro, isTextBox: true, margin: 0,
      }));
    });
    return this;
  }

  /** Cronograma del curso. `actual` es el indice del hito resaltado. */
  cronograma(actual = 3, hitos = HITOS) {
    const s = this._slide(COLOR.blancoLienzo);
    this._encabezado(s);
    s.addText(
      [
        { text: "Completa con ", options: Object.assign(this._f("extraBold"), { fontSize: 36, color: COLOR.negro }) },
        { text: "éxito", options: Object.assign(this._f("extraBold"), { fontSize: 36, color: COLOR.naranja }) },
        { text: "\nel cronograma", options: Object.assign(this._f("extraBold"), { fontSize: 36, color: COLOR.negro }) },
      ],
      { x: 1.2, y: 0.62, w: 7.6, h: 1.3, align: "center", isTextBox: true, margin: 0, lineSpacingMultiple: 1.1 }
    );

    const x0 = 1.33, x1 = 8.02;
    const paso = (x1 - x0) / (hitos.length - 1);
    s.addShape(this.pres.ShapeType.line, {
      x: x0, y: 4.14, w: x1 - x0, h: 0,
      line: { color: COLOR.naranja, width: 1 },
    });
    hitos.forEach((h, i) => {
      const cx = x0 + i * paso;
      const esActual = i === actual;
      s.addShape(this.pres.ShapeType.ellipse, {
        x: cx - 0.097, y: 4.043, w: 0.194, h: 0.194,
        fill: { color: esActual ? COLOR.blancoLienzo : COLOR.naranja },
        line: { color: COLOR.naranja, width: esActual ? 1.75 : 0 },
      });
      s.addText(h, Object.assign(this._f("regular"), {
        x: cx - 0.62, y: 2.86, w: 1.24, h: 1.02,
        fontSize: 9, color: COLOR.naranjaOscuro, align: "center",
        valign: "bottom", isTextBox: true, margin: 0, lineSpacingMultiple: 1.25,
      }));
    });
    s.addText("(*) Recuerda que el primer requisito para finalizar con éxito es asistir a las clases.",
      Object.assign(this._f("light"), {
        x: 1.5, y: 4.62, w: 7, h: 0.22,
        fontSize: 8, italic: true, color: COLOR.naranjaOscuro,
        align: "center", isTextBox: true, margin: 0,
      }));
    return this;
  }

  /** Titulo, subtitulo y parrafo. `opts.resaltarSubtitulo` lo pone sobre ambar. */
  tituloTexto(titulo, subtitulo, texto, opts = {}) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    this._cuerpoTitulo(s, titulo, subtitulo, texto, G.anchoUtil, opts);
    return this;
  }

  /** Igual que tituloTexto, con la mitad derecha reservada para una imagen. */
  tituloTextoImagen(titulo, subtitulo, texto, imagen, opts = {}) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    this._cuerpoTitulo(s, titulo, subtitulo, texto, 4.55, opts);
    if (imagen) {
      s.addImage({ path: imagen, x: 5.45, y: 0, w: 4.55, h: G.alto, sizing: { type: "cover", w: 4.55, h: G.alto } });
    } else {
      s.addShape(this.pres.ShapeType.rect, { x: 5.45, y: 0, w: 4.55, h: G.alto, fill: { color: "EDEDED" } });
      s.addText("ESPACIO PARA IMAGEN", Object.assign(this._f("regular"), {
        x: 5.45, y: 2.6, w: 4.55, h: 0.35,
        fontSize: 12, color: "8A8A8A", align: "center", isTextBox: true, margin: 0,
      }));
    }
    return this;
  }

  _cuerpoTitulo(s, titulo, subtitulo, texto, ancho, opts) {
    const ySub = this._tituloSlide(s, titulo, {
      fontSize: 40, ancho,
      color: opts.tituloNaranja ? COLOR.naranja : COLOR.negro,
    }) + 0.08;
    const subPorRenglon = ancho > 6 ? 46 : 28;
    const renglonesSub = subtitulo ? Math.max(1, Math.ceil(subtitulo.length / subPorRenglon)) : 0;
    const yTexto = ySub + (subtitulo ? 0.36 * renglonesSub + 0.28 : 0.2);

    if (subtitulo) {
      const o = Object.assign(this._f("regular"), {
        x: G.margen + 0.15, y: ySub, w: ancho - 0.15, h: 0.36 * renglonesSub,
        fontSize: ancho > 6 ? 22 : 19, color: COLOR.negro, isTextBox: true, margin: 0,
        valign: "top", lineSpacingMultiple: 1.05,
      });
      if (opts.resaltarSubtitulo) o.highlight = COLOR.amarillo;
      s.addText(subtitulo, o);
    }
    if (texto) {
      const lista = Array.isArray(texto);
      s.addText(
        lista
          ? texto.map((t, i) => ({ text: t, options: { bullet: true, breakLine: i < texto.length - 1 } }))
          : texto,
        Object.assign(this._f("light"), {
          x: G.margen + 0.15, y: yTexto, w: ancho - 0.15, h: G.alto - yTexto - 0.45,
          fontSize: 12, color: COLOR.negro, isTextBox: true, margin: 0,
          paraSpaceAfter: lista ? 8 : 0, lineSpacingMultiple: 1.35, valign: "top",
        })
      );
    }
  }

  /**
   * Bloque de codigo sobre fondo oscuro, con explicacion opcional al costado.
   * `resaltar` es una lista de fragmentos que se pintan en ambar dentro del codigo.
   */
  codigo(titulo, lineas, opts = {}) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    const yLibre = this._tituloSlide(s, titulo);
    if (opts.bajada) {
      s.addText(opts.bajada, Object.assign(this._f("regular"), {
        x: G.margen + 0.02, y: yLibre, w: G.anchoUtil - 0.02, h: 0.3,
        fontSize: 14, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0,
      }));
    }
    const yCod = yLibre + (opts.bajada ? 0.44 : 0.12);
    const anchoCod = opts.nota ? 5.85 : G.anchoUtil;
    const altoCod = G.alto - yCod - 0.4;
    s.addShape(this.pres.ShapeType.roundRect, {
      x: G.margen, y: yCod, w: anchoCod, h: altoCod,
      rectRadius: 0.1, fill: { color: COLOR.naranjaOscuro }, line: { type: "none" },
    });

    const src = Array.isArray(lineas) ? lineas : String(lineas).split("\n");
    const resaltar = opts.resaltar || [];
    const runs = [];
    src.forEach((linea, i) => {
      const ultima = i === src.length - 1;
      const comentario = linea.trim().startsWith("--");
      if (comentario || !resaltar.length) {
        runs.push({
          text: linea || " ",
          options: { fontFace: "Consolas", fontSize: opts.cuerpo || 13,
            color: comentario ? "C9A491" : COLOR.blancoLienzo, breakLine: !ultima },
        });
        return;
      }
      // Parte la linea en los fragmentos a resaltar, conservando el orden.
      const re = new RegExp("(" + resaltar.map((r) => r.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")).join("|") + ")");
      const trozos = linea.split(re).filter((t) => t !== "");
      trozos.forEach((t, j) => {
        runs.push({
          text: t,
          options: { fontFace: "Consolas", fontSize: opts.cuerpo || 13,
            color: resaltar.includes(t) ? COLOR.amarillo : COLOR.blancoLienzo,
            bold: resaltar.includes(t),
            breakLine: !ultima && j === trozos.length - 1 },
        });
      });
    });
    s.addText(runs, {
      x: G.margen + 0.24, y: yCod + 0.2, w: anchoCod - 0.48, h: altoCod - 0.4,
      isTextBox: true, margin: 0, lineSpacingMultiple: 1.22, valign: "top",
    });

    if (opts.nota) {
      const items = Array.isArray(opts.nota) ? opts.nota : [opts.nota];
      s.addText(
        items.map((t, i) => ({ text: t, options: { bullet: true, breakLine: i < items.length - 1 } })),
        Object.assign(this._f("light"), {
          x: 6.82, y: yCod + 0.06, w: 2.83, h: altoCod,
          fontSize: 11, color: COLOR.negro, isTextBox: true, margin: 0,
          paraSpaceAfter: 9, lineSpacingMultiple: 1.3, valign: "top",
        })
      );
    }
    return this;
  }

  /** Dos columnas enfrentadas. Para PK vs FK, DELETE vs DROP, DDL vs DML. */
  comparacion(titulo, izq, der, opts = {}) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    const y = this._tituloSlide(s, titulo) + 0.1;
    const w = 4.15, h = G.alto - y - 0.4;

    // Autoajuste: con columnas cargadas, achicar el cuerpo antes que desbordar.
    const carga = Math.max(
      izq.items.join(" ").length + izq.items.length * 34,
      der.items.join(" ").length + der.items.length * 34
    );
    const espacio = (h - (izq.lema || der.lema ? 1.2 : 0.85) - 0.18) * 96; // px utiles
    let cuerpo = 11.5, entre = 8;
    if (carga * 4.6 > espacio * 3.0) { cuerpo = 10.5; entre = 6; }
    if (carga * 4.6 > espacio * 3.6) { cuerpo = 9.8; entre = 4; }
    [[izq, G.margen, opts.colorIzq || COLOR.naranjaOscuro],
     [der, G.margen + w + 0.4, opts.colorDer || COLOR.naranja]].forEach(([col, x, c]) => {
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y, w, h, rectRadius: 0.1,
        fill: { color: COLOR.blancoLienzo }, line: { type: "none" },
      });
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y, w, h: 0.62, rectRadius: 0.1, fill: { color: c }, line: { type: "none" },
      });
      s.addText(col.titulo, Object.assign(this._f("extraBold"), {
        x: x + 0.28, y, w: w - 0.5, h: 0.62,
        fontSize: 18, color: COLOR.blancoLienzo, valign: "middle", isTextBox: true, margin: 0,
      }));
      if (col.lema) {
        s.addText(col.lema, Object.assign(this._f("bold"), {
          x: x + 0.28, y: y + 0.78, w: w - 0.5, h: 0.32,
          fontSize: 13, color: c, isTextBox: true, margin: 0,
        }));
      }
      const yl = y + (col.lema ? 1.2 : 0.85);
      s.addText(
        col.items.map((t, i) => ({ text: t, options: { bullet: true, breakLine: i < col.items.length - 1 } })),
        Object.assign(this._f("light"), {
          x: x + 0.34, y: yl, w: w - 0.62, h: h - (yl - y) - 0.18,
          fontSize: cuerpo, color: COLOR.negro, isTextBox: true, margin: 0,
          paraSpaceAfter: entre, lineSpacingMultiple: 1.28, valign: "top",
        })
      );
    });
    return this;
  }

  /** Pasos numerados en fila, para procesos de 3 a 5 etapas. */
  pasos(titulo, items, opts = {}) {
    const s = this._slide(COLOR.blancoLienzo);
    this._encabezado(s);
    const yLibre = this._tituloSlide(s, titulo);
    if (opts.bajada) {
      s.addText(opts.bajada, Object.assign(this._f("regular"), {
        x: G.margen + 0.02, y: yLibre, w: G.anchoUtil - 0.02, h: 0.3,
        fontSize: 14, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0,
      }));
    }
    const n = Math.min(items.length, 5);
    const gap = 0.22;
    const w = (G.anchoUtil - gap * (n - 1)) / n;
    const y = yLibre + (opts.bajada ? 0.56 : 0.16);
    const h = G.alto - y - 0.4;
    items.slice(0, n).forEach((it, i) => {
      const x = G.margen + i * (w + gap);
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y, w, h, rectRadius: 0.1,
        fill: { color: COLOR.blanco }, line: { color: "E0D7C9", width: 0.75 },
      });
      s.addText(String(i + 1), Object.assign(this._f("extraBold"), {
        x: x + 0.26, y: y + 0.18, w: 0.7, h: 0.52,
        fontSize: 30, color: COLOR.naranja, isTextBox: true, margin: 0,
      }));
      s.addText(it.titulo, Object.assign(this._f("bold"), {
        x: x + 0.26, y: y + 0.78, w: w - 0.5, h: 0.5,
        fontSize: 14, color: COLOR.negro, isTextBox: true, margin: 0, lineSpacingMultiple: 1.05,
      }));
      s.addText(it.texto, Object.assign(this._f("light"), {
        x: x + 0.26, y: y + 1.34, w: w - 0.5, h: h - 1.5,
        fontSize: 10.5, color: COLOR.negro, isTextBox: true, margin: 0,
        lineSpacingMultiple: 1.28, valign: "top",
      }));
    });
    return this;
  }

  /** Regla o advertencia a pantalla completa, sobre naranja. */
  regla(texto, detalle, opts = {}) {
    const s = this._slide(opts.fondo || COLOR.naranja);
    this._encabezado(s, COLOR.blancoLienzo);
    if (opts.etiqueta) {
      s.addText(opts.etiqueta.toUpperCase(), Object.assign(this._f("light"), {
        x: G.margen, y: 1.18, w: 8, h: 0.26,
        fontSize: 11, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, charSpacing: 1.5,
      }));
    }
    s.addText(texto, Object.assign(this._f("extraBold"), {
      x: G.margen, y: 1.55, w: 8.6, h: 1.65,
      fontSize: 34, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, lineSpacingMultiple: 1.12,
    }));
    if (detalle) {
      s.addText(detalle, Object.assign(this._f("light"), {
        x: G.margen + 0.02, y: 3.45, w: 7.4, h: 1.4,
        fontSize: 13, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, lineSpacingMultiple: 1.35,
      }));
    }
    return this;
  }

  /** Frase a dos renglones sobre color o imagen de fondo. */
  frase(texto, bajada, opts = {}) {
    const s = this._slide(opts.fondo || COLOR.naranjaOscuro);
    this._encabezado(s, COLOR.blancoLienzo);
    if (opts.imagen) s.addImage({ path: opts.imagen, x: 0, y: 0, w: G.ancho, h: G.alto });
    s.addText(texto, Object.assign(this._f("extraBold"), {
      x: 1, y: 1.85, w: 8, h: 1.25,
      fontSize: 36, color: COLOR.blancoLienzo, align: "center", isTextBox: true, margin: 0,
    }));
    if (bajada) {
      s.addText(bajada, Object.assign(this._f("light"), {
        x: 1.5, y: 3.18, w: 7, h: 0.3,
        fontSize: 10, color: COLOR.blancoLienzo, align: "center", isTextBox: true, margin: 0,
      }));
    }
    return this;
  }

  /** Tres fichas con foto y pie. Base de `equipo` y `tarjetas`. */
  _fichas(s, items, colorPie, colorTexto) {
    const x0 = 1.35;
    items.slice(0, 3).forEach((it, i) => {
      const x = x0 + i * (G.fichaAncho + G.fichaGap);
      if (it.imagen) {
        s.addImage({ path: it.imagen, x, y: G.fichaY, w: G.fichaAncho, h: G.fichaAlto,
          sizing: { type: "cover", w: G.fichaAncho, h: G.fichaAlto }, rounding: false });
      } else {
        s.addShape(this.pres.ShapeType.roundRect, {
          x, y: G.fichaY, w: G.fichaAncho, h: G.fichaAlto,
          rectRadius: 0.1, fill: { color: "E4E1DA" }, line: { type: "none" },
        });
      }
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y: G.fichaY + 1.51, w: G.fichaAncho, h: 0.8,
        rectRadius: 0.1, fill: { color: colorPie }, line: { type: "none" },
      });
      s.addText(it.titulo, Object.assign(this._f("bold"), {
        x: x + 0.35, y: G.fichaY + 1.65, w: G.fichaAncho - 0.5, h: 0.24,
        fontSize: 12, color: colorTexto, isTextBox: true, margin: 0,
      }));
      if (it.pie) {
        s.addText(it.pie, Object.assign(this._f("regular"), {
          x: x + 0.35, y: G.fichaY + 1.91, w: G.fichaAncho - 0.5, h: 0.22,
          fontSize: 8, color: colorTexto, isTextBox: true, margin: 0,
        }));
      }
    });
  }

  /** Presentacion del equipo: profesor, coordinador y tutor. */
  equipo(personas, opts = {}) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    s.addText(
      [
        { text: "Presentación", options: Object.assign(this._f("extraBold"), { fontSize: 26, color: COLOR.naranjaOscuro, breakLine: true }) },
        { text: "del ", options: Object.assign(this._f("extraBold"), { fontSize: 26, color: COLOR.naranjaOscuro }) },
        { text: "equipo", options: Object.assign(this._f("extraBold"), { fontSize: 26, color: COLOR.naranjaOscuro, highlight: COLOR.amarillo }) },
        { text: " :", options: Object.assign(this._f("extraBold"), { fontSize: 26, color: COLOR.naranjaOscuro }) },
      ],
      { x: 0.9, y: 0.7, w: 8.2, h: 1, align: "center", isTextBox: true, margin: 0, lineSpacingMultiple: 1.15 }
    );
    const com = opts.comision || this.comision;
    if (com) {
      s.addShape(this.pres.ShapeType.roundRect, {
        x: 7.4, y: 1.25, w: 1.4, h: 0.3,
        rectRadius: 0.06, fill: { color: COLOR.naranja }, line: { type: "none" },
      });
      s.addText(`COMISIÓN N° ${com}`, Object.assign(this._f("regular"), {
        x: 7.4, y: 1.25, w: 1.4, h: 0.3,
        fontSize: 7, color: COLOR.blancoLienzo, align: "center", valign: "middle", isTextBox: true, margin: 0,
      }));
    }
    this._fichas(s, personas, COLOR.naranja, COLOR.blancoLienzo);
    return this;
  }

  /** Tres tarjetas con imagen y pie, con selector de meses arriba. */
  tarjetas(titulo, items, meses, mesActivo = 0) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    s.addText(titulo, Object.assign(this._f("extraBold"), {
      x: 1.5, y: 0.7, w: 7, h: 0.5,
      fontSize: 26, color: COLOR.naranjaOscuro, align: "center", isTextBox: true, margin: 0,
    }));
    if (meses && meses.length) {
      const w = 1.08, gap = 0.046;
      const total = meses.length * w + (meses.length - 1) * gap;
      let x = (G.ancho - total) / 2;
      meses.forEach((m, i) => {
        const on = i === mesActivo;
        s.addShape(this.pres.ShapeType.roundRect, {
          x, y: 1.49, w, h: 0.2, rectRadius: 0.1,
          fill: { color: on ? COLOR.negro : COLOR.blancoLienzo }, line: { type: "none" },
        });
        s.addText(m.toUpperCase(), Object.assign(this._f("light"), {
          x, y: 1.49, w, h: 0.2,
          fontSize: 8, color: on ? COLOR.blancoLienzo : COLOR.negro,
          align: "center", valign: "middle", isTextBox: true, margin: 0,
        }));
        x += w + gap;
      });
    }
    this._fichas(s, items, COLOR.naranjaOscuro, COLOR.blancoLienzo);
    return this;
  }

  /** Dos bloques redondeados arriba y uno ancho abajo. */
  vinetas(titulo, subtitulo, bloques) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    s.addText(
      [
        { text: titulo + "/ ", options: Object.assign(this._f("extraBold"), { fontSize: 40, color: COLOR.naranja }) },
        { text: subtitulo || "", options: Object.assign(this._f("regular"), { fontSize: 22, color: COLOR.naranjaOscuro }) },
      ],
      { x: G.margen, y: G.yTitulo, w: G.anchoUtil, h: 0.8, isTextBox: true, margin: 0 }
    );
    const caja = (x, y, w, h, texto) => {
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y, w, h, rectRadius: 0.18,
        fill: { color: COLOR.blancoLienzo }, line: { color: COLOR.negro, width: 0.75 },
      });
      s.addText(texto, Object.assign(this._f("regular"), {
        x: x + 0.2, y, w: w - 0.4, h,
        fontSize: 13, color: COLOR.negro, align: "center", valign: "middle", isTextBox: true, margin: 0,
      }));
    };
    const [a, b, c] = bloques;
    caja(0.73, 1.79, 4.31, 2.28, a);
    if (b) caja(5.21, 1.79, 4.31, 2.28, b);
    if (c) caja(0.73, 4.23, 8.79, 0.92, c);
    return this;
  }

  /**
   * Mapa conceptual: principal en naranja al centro, hasta seis secundarios en
   * negro alrededor y hasta tres terciarios en contorno colgando de los de abajo.
   */
  mapaConceptual(principal, secundarios, terciarios = [], titulo) {
    const s = this._slide(COLOR.blancoLienzo);
    this._encabezado(s);
    if (titulo) {
      s.addText(titulo, Object.assign(this._f("extraBold"), {
        x: G.margen, y: 0.6, w: G.anchoUtil, h: 0.5,
        fontSize: 26, color: COLOR.naranjaOscuro, align: "center", isTextBox: true, margin: 0,
      }));
    }

    const AC = 1.62, ALTO = 0.52;      // caja secundaria
    const cxCentro = 5, cyCentro = 2.95;
    const APC = 2.0, ALTOC = 0.66;     // caja principal

    const caja = (x, y, w, h, texto, relleno, colorTexto, contorno) => {
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y, w, h, rectRadius: 0.14,
        fill: { color: relleno || COLOR.blancoLienzo },
        line: contorno ? { color: COLOR.negro, width: 0.75 } : { type: "none" },
      });
      s.addText(texto, Object.assign(this._f("regular"), {
        x: x + 0.07, y, w: w - 0.14, h,
        fontSize: 9.5, color: colorTexto, align: "center", valign: "middle",
        isTextBox: true, margin: 0,
      }));
    };
    const linea = (x1, y1, x2, y2) => {
      s.addShape(this.pres.ShapeType.line, {
        x: Math.min(x1, x2), y: Math.min(y1, y2),
        w: Math.abs(x2 - x1), h: Math.abs(y2 - y1),
        line: { color: COLOR.negro, width: 0.5 },
        flipH: x2 < x1, flipV: y2 < y1,
      });
    };

    // Tres columnas: izquierda, centro, derecha. Arriba y abajo del centro.
    const ranuras = [
      { x: 1.18, y: 1.72, lado: "izq" },
      { x: 1.18, y: 3.95, lado: "izq" },
      { x: cxCentro - AC / 2, y: 1.30, lado: "arriba" },
      { x: cxCentro - AC / 2, y: 4.30, lado: "abajo" },
      { x: 7.2, y: 1.72, lado: "der" },
      { x: 7.2, y: 3.95, lado: "der" },
    ];
    const orden = [2, 0, 4, 3, 1, 5]; // arriba, izq, der, abajo, izq, der

    secundarios.slice(0, 6).forEach((t, i) => {
      const r = ranuras[orden[i]];
      const mx = r.x + AC / 2, my = r.y + ALTO / 2;
      if (r.lado === "arriba" || r.lado === "abajo") {
        linea(mx, r.lado === "arriba" ? r.y + ALTO : r.y, mx, cyCentro + (r.lado === "arriba" ? -ALTOC / 2 : ALTOC / 2));
      } else {
        const bordeX = r.lado === "izq" ? r.x + AC : r.x;
        const centroX = r.lado === "izq" ? cxCentro - APC / 2 : cxCentro + APC / 2;
        linea(bordeX, my, (bordeX + centroX) / 2, my);
        linea((bordeX + centroX) / 2, my, (bordeX + centroX) / 2, cyCentro);
        linea((bordeX + centroX) / 2, cyCentro, centroX, cyCentro);
      }
      caja(r.x, r.y, AC, ALTO, t, COLOR.negro, COLOR.blancoLienzo, false);
    });

    caja(cxCentro - APC / 2, cyCentro - ALTOC / 2, APC, ALTOC, principal, COLOR.naranja, COLOR.negro, false);

    // Terciarios: cuelgan de las cajas laterales inferiores y de la de abajo.
    const anclas = [
      { x: 1.18, y: 3.95 + ALTO },
      { x: 7.2, y: 3.95 + ALTO },
      { x: cxCentro - AC / 2, y: 4.30 + ALTO },
    ];
    terciarios.slice(0, 3).forEach((t, i) => {
      const a = anclas[i];
      if (a.y + 0.14 + ALTO > G.alto - 0.12) return; // no lo dibujo si no entra
      linea(a.x + AC / 2, a.y, a.x + AC / 2, a.y + 0.14);
      caja(a.x, a.y + 0.14, AC, ALTO, t, null, COLOR.negro, true);
    });
    return this;
  }

  /** Frase destacada a dos renglones y tres post-its con esquina doblada. */
  frasePostits(frase, notas) {
    const s = this._slide(COLOR.blanco);
    this._encabezado(s);
    s.addText(frase, Object.assign(this._f("extraBold"), {
      x: G.margen, y: 0.72, w: G.anchoUtil, h: 1.0,
      fontSize: 30, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0, lineSpacingMultiple: 1.15,
    }));
    const colores = [COLOR.naranja, COLOR.rosa, COLOR.amarillo];
    const w = 2.55, gap = 0.14, dobla = 0.42;
    let x = 0.82;
    notas.slice(0, 3).forEach((t, i) => {
      const c = colores[i];
      s.addShape(this.pres.ShapeType.rect, {
        x, y: 2.38, w, h: 2.55, fill: { color: c }, line: { type: "none" },
      });
      // Esquina doblada abajo a la izquierda.
      s.addShape(this.pres.ShapeType.rtTriangle, {
        x, y: 4.93 - dobla, w: dobla, h: dobla,
        fill: { color: COLOR_DOBLEZ[c] || c }, line: { type: "none" }, flipV: true,
      });
      s.addText(t, Object.assign(this._f("regular"), {
        x: x + 0.4, y: 2.38, w: w - 0.8, h: 2.1,
        fontSize: 12, color: COLOR.blancoLienzo, align: "center", valign: "middle", isTextBox: true, margin: 0,
      }));
      x += w + gap;
    });
    return this;
  }

  /** Momentos de la clase: banda ambar, lista vertical y descripcion del activo. */
  momentos(activo, descripcion, lista = MOMENTOS) {
    const s = this._slide(COLOR.blanco);
    s.addShape(this.pres.ShapeType.rect, {
      x: 0, y: 0, w: G.ancho, h: 2.13, fill: { color: COLOR.amarillo }, line: { type: "none" },
    });
    this._encabezado(s);
    s.addText("Momentos de la Clase:", Object.assign(this._f("extraBold"), {
      x: G.margen, y: 0.67, w: 9, h: 0.9,
      fontSize: 42, color: COLOR.blancoLienzo, isTextBox: true, margin: 0,
    }));

    // Ventana de cuatro momentos centrada en el activo.
    const idx = Math.max(0, lista.indexOf(activo));
    let desde = Math.min(Math.max(0, idx - 1), Math.max(0, lista.length - 4));
    const ventana = lista.slice(desde, desde + 4);
    ventana.forEach((m, i) => {
      const on = m === activo;
      s.addText(m, Object.assign(this._f("extraBold"), {
        x: 0.84, y: 2.02 + i * 0.83, w: 6.1, h: 0.8,
        fontSize: 34, color: on ? COLOR.naranjaOscuro : COLOR.blancoLienzo,
        isTextBox: true, margin: 0, valign: "middle",
      }));
    });
    if (descripcion) {
      s.addText(descripcion, Object.assign(this._f("light"), {
        x: 6.96, y: 2.6, w: 2.4, h: 2.5,
        fontSize: 11, color: COLOR.negro, isTextBox: true, margin: 0,
        lineSpacingMultiple: 1.35, valign: "top",
      }));
    }
    return this;
  }

  /** Un valor de la compania y hasta tres personas destacadas. */
  valor(nombreValor, personas = []) {
    const s = this._slide(COLOR.naranjaOscuro);
    s.addText("VALOR:", Object.assign(this._f("light"), {
      x: G.margen, y: 0.62, w: 3, h: 0.25,
      fontSize: 11, color: COLOR.blancoLienzo, isTextBox: true, margin: 0,
    }));
    s.addText(nombreValor, Object.assign(this._f("extraBold"), {
      x: G.margen, y: 0.9, w: 6.5, h: 1.2,
      fontSize: 40, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, lineSpacingMultiple: 1.05,
    }));
    const x0 = 0.8, w = 2.3, gap = 0.17;
    personas.slice(0, 3).forEach((p, i) => {
      const x = x0 + i * (w + gap);
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y: 2.66, w, h: 2.31, rectRadius: 0.1,
        fill: { color: "E4E1DA" }, line: { type: "none" },
      });
      s.addShape(this.pres.ShapeType.roundRect, {
        x, y: 4.16, w, h: 0.81, rectRadius: 0.1,
        fill: { color: COLOR.blancoLienzo }, line: { type: "none" },
      });
      s.addText(p.nombre, Object.assign(this._f("bold"), {
        x: x + 0.35, y: 4.15, w: w - 0.45, h: 0.22,
        fontSize: 10, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0,
      }));
      s.addText(
        (p.motivos || []).map((m, j, a) => ({ text: m, options: { bullet: true, breakLine: j < a.length - 1 } })),
        Object.assign(this._f("regular"), {
          x: x + 0.42, y: 4.37, w: w - 0.5, h: 0.55,
          fontSize: 7, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0,
        })
      );
    });
    return this;
  }

  /** Aviso de clase grabada. variante "naranja" (por defecto) o "claro". */
  grabacion(variante = "naranja") {
    const claro = variante === "claro";
    const s = this._slide(claro ? COLOR.blancoLienzo : COLOR.naranja);
    if (claro) s.addImage({ path: asset("degradado-amanecer.png"), x: 0, y: 2.4, w: G.ancho, h: 3.22 });
    s.addText("¡Esta clase\nva a ser\ngrabada!", Object.assign(this._f("extraBold"), {
      x: G.margen, y: 1.26, w: 5, h: 2.1,
      fontSize: 40, color: claro ? COLOR.naranjaOscuro : COLOR.blancoLienzo,
      isTextBox: true, margin: 0, lineSpacingMultiple: 1.2,
    }));
    s.addShape(this.pres.ShapeType.ellipse, {
      x: claro ? 4.54 : 3.94, y: claro ? 1.34 : 3.47, w: 0.25, h: 0.25,
      fill: { color: COLOR.amarillo }, line: { type: "none" },
    });
    return this;
  }

  /** Aviso de pausa. */
  break(texto = "andá por un cafecito\no mate, ¡y volvemos!") {
    const s = this._slide(COLOR.rosa);
    s.addText("Break,", Object.assign(this._f("extraBold"), {
      x: G.margen, y: 1.55, w: 5, h: 0.85,
      fontSize: 40, color: COLOR.blancoLienzo, isTextBox: true, margin: 0,
    }));
    s.addText(texto, Object.assign(this._f("light"), {
      x: G.margen + 0.02, y: 2.75, w: 4.5, h: 0.7,
      fontSize: 15, color: COLOR.blancoLienzo, isTextBox: true, margin: 0, lineSpacingMultiple: 1.3,
    }));
    return this;
  }

  /** Cierre con texto legal. variante "oscuro" (por defecto) o "claro". */
  cierre(titulo, variante = "oscuro") {
    const claro = variante === "claro";
    const s = this._slide(claro ? COLOR.blancoLienzo : COLOR.naranjaOscuro);
    if (claro) s.addImage({ path: asset("degradado-amanecer.png"), x: 0, y: 2.1, w: G.ancho, h: 3.52 });

    if (claro) {
      s.addImage({ path: asset("logotipo-coderhouse.png"), x: 8.1, y: 0.5, w: 1.1, h: 0.32 });
      s.addText(titulo || "¡Muchas\ngracias!", Object.assign(this._f("extraBold"), {
        x: G.margen, y: 2.4, w: 5, h: 1.4,
        fontSize: 40, color: COLOR.naranjaOscuro, isTextBox: true, margin: 0, lineSpacingMultiple: 1.1,
      }));
    } else {
      s.addImage({ path: asset("isotipo-coderhouse.png"), x: 7.8, y: 0.85, w: 0.65, h: 0.65 });
      s.addText(
        [
          { text: "¡Gracias por ", options: Object.assign(this._f("extraBold"), { fontSize: 40, color: COLOR.blancoLienzo }) },
          { text: "estudiar", options: Object.assign(this._f("extraBold"), { fontSize: 40, color: COLOR.amarillo }) },
          { text: "\ncon nosotros!", options: Object.assign(this._f("extraBold"), { fontSize: 40, color: COLOR.blancoLienzo }) },
        ],
        { x: G.margen, y: 2.5, w: 7, h: 1.3, isTextBox: true, margin: 0, lineSpacingMultiple: 1.1 }
      );
    }

    const col = claro ? COLOR.naranjaOscuro : COLOR.blancoLienzo;
    s.addText(LEGAL, Object.assign(this._f("light"), {
      x: G.margen - 0.15, y: 4.27, w: 8.6, h: 0.5,
      fontSize: 4.5, color: col, isTextBox: true, margin: 0, lineSpacingMultiple: 1.2,
    }));
    s.addText(COPYRIGHT, Object.assign(this._f("light"), {
      x: G.margen - 0.15, y: 4.87, w: 8.6, h: 0.3,
      fontSize: 4.5, color: col, isTextBox: true, margin: 0, lineSpacingMultiple: 1.2,
    }));
    return this;
  }

  /** Notas del orador para la ultima slide agregada. */
  notas(texto) {
    const slides = this.pres.slides;
    if (slides.length) slides[slides.length - 1].addNotes(texto);
    return this;
  }

  guardar(nombre) {
    return this.pres.writeFile({ fileName: nombre }).then((f) => {
      console.log("Generado:", f);
      return f;
    });
  }
}

module.exports = { Deck, COLOR, FUENTE, FUENTE_RESPALDO, MOMENTOS, HITOS, LEGAL, COPYRIGHT, G };
