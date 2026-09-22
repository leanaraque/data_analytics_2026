/**
 * Ejemplo: una clase completa armada con el tema Coderhouse 4.0.
 * Ejercita todas las plantillas, asi sirve de demo y de prueba de regresion.
 *
 *   node recursos/manual-de-marca/ejemplo-clase.js [salida.pptx]
 */

const { Deck } = require("./coderhouse-tema");

const salida = process.argv[2] || "ejemplo-clase.pptx";
const d = new Deck({ comision: "12345" });

d.portada(
  "Data Analytics",
  "Semana 3\nIntroducción a SQL",
  "Del modelo en papel a la base que responde preguntas"
);

d.agenda([
  "Qué es SQL y para qué sirve",
  "Los sublenguajes: DDL, DML, DCL y TCL",
  "Diseño de esquemas y tipos de datos",
  "Restricciones de integridad: PK y FK",
  "Manipulación de datos",
  "Checkpoint de la semana",
]);

d.equipo([
  { titulo: "Profesor:", pie: "Lean Araque" },
  { titulo: "Coordinador:", pie: "A designar" },
  { titulo: "Tutor:", pie: "A designar" },
]);

d.cronograma(2);

d.seccion(1, "Fundamentos de SQL");

d.divisorTema(1, "Qué es SQL");

d.tituloTexto(
  "Qué es SQL",
  "Structured Query Language",
  "SQL es el lenguaje con el que se le habla a una base de datos relacional. No es un lenguaje de programación de propósito general: es declarativo. Vos describís qué datos querés y el motor decide cómo buscarlos.\n\nEso cambia la forma de pensar el problema. En vez de escribir el recorrido, escribís la pregunta.",
  { resaltarSubtitulo: true }
);

d.tituloTextoImagen(
  "Los cuatro sublenguajes",
  "Cada uno con su responsabilidad",
  [
    "DDL: crea y modifica estructuras (CREATE, ALTER, DROP)",
    "DML: manipula los datos (SELECT, INSERT, UPDATE, DELETE)",
    "DCL: gestiona permisos de acceso (GRANT, REVOKE)",
    "TCL: controla transacciones (COMMIT, ROLLBACK)",
  ]
);

d.momentos(
  "Ejemplo en Vivo",
  "Vamos a crear la base RetailPro_DB juntos: las cinco tablas, sus claves y las restricciones, paso a paso en SSMS."
);

d.momentos(
  "Para recordar",
  "Una clave primaria identifica de forma única cada fila. Si dos filas pueden tener el mismo valor, esa columna no sirve como PK."
);

d.mapaConceptual(
  "Base de datos",
  ["Tablas", "Consultas", "Índices", "Vistas", "Claves", "Restricciones"],
  ["Filas", "Columnas", "PK y FK"],
  "Cómo se organiza una base relacional"
);

d.vinetas("Viñetas", "Semana 3", [
  "Una tabla bien diseñada evita la mitad de los problemas que después se arreglan con consultas complicadas",
  "El tipo de dato no es un detalle: define qué se puede guardar y qué se puede calcular",
  "Las restricciones son documentación que el motor hace cumplir",
]);

d.tarjetas(
  "El recorrido del módulo",
  [
    { titulo: "Diseñar", pie: "El esquema con DDL" },
    { titulo: "Poblar", pie: "Los datos con DML" },
    { titulo: "Consultar", pie: "Las preguntas de negocio" },
  ],
  ["Semana 3", "Semana 4", "Semana 5"],
  0
);

d.frase(
  "Una consulta no es código:\nes una pregunta bien hecha",
  "Por eso el primer paso nunca es escribir SQL"
);

d.frasePostits(
  "Tres preguntas antes de escribir\nla primera consulta",
  [
    "¿Qué decisión voy a tomar con este resultado?",
    "¿En qué tabla vive cada dato que necesito?",
    "¿Cómo se relacionan esas tablas entre sí?",
  ]
);

d.grabacion();
d.break();

d.valor("Actuamos\ncon velocidad", [
  { nombre: "Nombre y apellido", motivos: ["Motivo 1", "Motivo 2", "Motivo 3"] },
  { nombre: "Nombre y apellido", motivos: ["Motivo 1", "Motivo 2", "Motivo 3"] },
  { nombre: "Nombre y apellido", motivos: ["Motivo 1", "Motivo 2", "Motivo 3"] },
]);

d.cierre();
d.cierre(null, "claro");

d.guardar(salida);
