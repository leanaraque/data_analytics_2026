# 7. Introducción al Data Warehousing: esquemas en Estrella y Copo de Nieve

> 📖 **Para profundizar** — Esta unidad amplía el tema con contenido avanzado. Podés continuar sin leerla y volver cuando quieras ir más lejos o cuando ya domines los conceptos anteriores.

Aprendé a diferenciar el **Esquema Estrella** del **Copo de Nieve**, comprendiendo cómo organizar tus datos para optimizar el análisis y la velocidad en herramientas como **Power BI**.

Cuando trabajamos con bases de datos para análisis (**Data Warehousing**), el objetivo cambia: ya no se trata de procesar transacciones individuales rápidamente (como una venta en el momento), sino de **consultar grandes volúmenes de datos** para tomar decisiones estratégicas. Para eso no usamos el mismo diseño "normalizado" que aprendiste para evitar duplicidad; en su lugar usamos el **Modelado Dimensional**.

## Los dos pilares del modelado
- **Tabla de Hechos (Fact Table):** la tabla **central**. Contiene las **métricas numéricas** (cantidades, precios, totales) y las claves foráneas que la conectan con el contexto.
- **Tablas de Dimensiones (Dimension Tables):** las tablas **descriptivas** que dan contexto (¿quién?, ¿dónde?, ¿qué producto?, ¿en qué fecha?).

## Esquema en Estrella (Star Schema)
La estructura más popular y sencilla. Imaginá una estrella: una **tabla de hechos en el centro** conectada directamente a varias **tablas de dimensiones desnormalizadas**.
- **Por qué importa:** es la estructura **preferida en Power BI** por su altísima velocidad de consulta y su simplicidad para el usuario.
- **Dato clave:** al estar "desnormalizadas", las dimensiones pueden guardar información redundante (ej. el nombre del producto y su categoría en la misma tabla) para **evitar demasiados JOINs**.

## Esquema Copo de Nieve (Snowflake Schema)
Una evolución técnica del estrella. Aquí las **dimensiones están normalizadas** en múltiples tablas relacionadas entre sí.
- **Por qué importa:** reduce la redundancia al máximo. Pero requiere **más JOINs** en cada consulta, lo que puede **ralentizar** los reportes.
- **Uso típico:** cuando el volumen de datos es inmenso y el ahorro de espacio es crítico, o cuando las jerarquías de datos son muy complejas.

## 🃏 Cómo estudiar este tema (tarjetas de repaso)
- Leé la pregunta e intentá responderla en voz alta **antes** de ver la respuesta.
- Si fallás, no te preocupes: leé la respuesta y reflexioná sobre por qué tu mente tomó el otro camino.
- El activo más valioso es la **revisión espaciada**: volvé a repasar dentro de un par de días para que los conceptos se asienten en tu memoria a largo plazo.

---
<p align="center">
<a href="./06-permisos-y-roles-dcl.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 3</a> · <a href="../entregable/README.md">Ir al entregable (Checkpoint M3) ➡️</a>
</p>
