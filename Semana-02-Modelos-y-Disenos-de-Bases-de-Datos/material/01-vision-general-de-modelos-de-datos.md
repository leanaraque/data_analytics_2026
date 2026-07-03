# 1. Visión general de modelos de datos

> Primera unidad del bloque de Fundamentos. Antes de escribir una línea de SQL, necesitás entender cómo se organiza la información.

Imaginá que trabajás en una empresa que maneja grandes volúmenes de información: registros de clientes, transacciones financieras, datos de sensores IoT. ¿Cómo organizarías esos datos para que sean accesibles, consistentes y útiles para diferentes aplicaciones? La respuesta está en elegir el **modelo de datos adecuado**.

En esta unidad exploramos tres paradigmas fundamentales: el **modelo relacional**, el **modelo Entidad-Relación (ER)** y los **modelos NoSQL**. Este conocimiento es clave para diseñar sistemas eficientes y escalables, y será la base para aprender a normalizar y traducir esquemas más adelante.

## ¿Qué es un esquema? (concepto base)
Un **esquema** es el "plano" de una base de datos: define cómo se organiza la información —qué tablas existen, qué columnas tiene cada una, de qué tipo son y cómo se relacionan— **sin contener todavía los datos reales**. Es como los planos de un edificio: muestran dónde van las habitaciones y las conexiones, pero no los muebles.

Vas a ver "esquema" en varios contextos (conceptual, relacional, dimensional), pero la idea de base es siempre la misma: **la estructura que define cómo viven los datos**.

## Modelo Relacional
Paradigma basado en **tablas**, donde los datos se organizan en **relaciones** (tablas) compuestas por **tuplas** (filas) y **atributos** (columnas). Introducido por **E. F. Codd en 1970**, es la base de la mayoría de los SGBD tradicionales como PostgreSQL, MySQL y SQL Server.

**Características principales:**
- **Estructura tabular:** datos organizados en tablas con filas y columnas.
- **Integridad referencial:** uso de claves primarias y foráneas para mantener relaciones y consistencia.
- **Normalización:** proceso para reducir redundancia y evitar anomalías mediante reglas formales.
- **Transaccionalidad (OLTP):** ideal para sistemas que requieren operaciones rápidas y consistentes.

> **Ejemplo industrial:** sistemas bancarios y ERP que requieren alta consistencia y transacciones seguras.

## Modelo Entidad-Relación (ER)
Representación **gráfica y conceptual** que describe entidades, sus atributos y las relaciones entre ellas. Es una herramienta fundamental para diseñar esquemas conceptuales **antes** de implementarlos en un SGBD.

**Componentes:**
- **Entidades:** objetos o conceptos del mundo real (ej. *Cliente*, *Producto*).
- **Atributos:** propiedades de las entidades (ej. nombre, fecha de nacimiento).
- **Relaciones:** asociaciones entre entidades (ej. *Cliente* realiza *Pedido*).

> **Uso:** facilita la comunicación entre analistas y desarrolladores, y sirve como base para crear esquemas relacionales.

## Modelos NoSQL
Agrupan diversas familias de bases de datos diseñadas para manejar grandes volúmenes con **esquemas flexibles** y **alta escalabilidad**. Útiles en aplicaciones web, big data y sistemas distribuidos.

**Tipos principales:**
- **Documento:** almacenan datos en documentos JSON o BSON (ej. MongoDB).
- **Clave-Valor:** pares clave-valor simples (ej. Redis).
- **Columna:** organizan datos en columnas para consultas analíticas (ej. Cassandra).
- **Grafo:** modelan relaciones complejas entre nodos (ej. Neo4j).

**Características:**
- **Escalabilidad horizontal:** fácil distribución en múltiples servidores.
- **Esquema flexible:** no requieren estructura fija.
- **Optimización para casos específicos:** lecturas rápidas, consultas por grafos, etc.

> **Ejemplo industrial:** redes sociales, comercio electrónico, análisis de logs.

## Comparativa y selección

| Modelo | Ventajas | Desventajas | Casos de uso típicos |
|--------|----------|-------------|----------------------|
| **Relacional** | Consistencia, integridad, madurez | Escalabilidad limitada | Sistemas transaccionales, ERP, finanzas |
| **ER (conceptual)** | Claridad en diseño, comunicación | No es un modelo físico | Diseño de bases de datos relacionales |
| **NoSQL** | Escalabilidad, flexibilidad | Consistencia eventual en algunos casos | Big data, aplicaciones web, IoT |

> La elección depende de requisitos de **consistencia, volumen, velocidad y tipo de consultas**.

## Aplicación práctica
Seleccionar el modelo correcto es crucial para el éxito de un proyecto. Una plataforma de comercio electrónico puede usar un **modelo relacional** para gestionar inventarios y transacciones (garantizando integridad), y a la vez una base **NoSQL de documentos** para almacenar perfiles de usuario con datos flexibles y cambiantes.

El **modelo ER** se utiliza en la fase de diseño para visualizar y validar la estructura de datos con *stakeholders* antes de implementarla. Herramientas como **dbdiagram.io** o **Lucidchart** facilitan crear diagramas claros y colaborativos.

Esta unidad sienta las bases para profundizar en **normalización**, diseño de esquemas y uso de herramientas modernas en las siguientes unidades.

---
<p align="center">
🏠 <a href="../README.md">Semana 2</a> · <a href="./02-oltp-vs-olap-y-modelado-analitico.md">Siguiente: OLTP vs OLAP ➡️</a>
</p>
