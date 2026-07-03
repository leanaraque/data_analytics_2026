# 📦 M1 — Pre-entrega: Brief del proyecto RetailPro

> **Título:** Brief analítico — definiendo el problema de negocio.

## 🎯 En una frase
Antes de tocar una sola herramienta, vas a **definir el problema de negocio** de RetailPro, sus **fuentes de datos**, las **preguntas de análisis** y los **KPIs iniciales**, dejando lista la base estratégica del proyecto.

## ✅ ¿Qué entregás?
Un documento **PDF o DOCX** con **5 secciones**, subido directo en la plataforma.

> ⚠️ **Esta pre-entrega SÍ es evaluable** y es la **primera piedra del proyecto integrador RetailPro** que vas a construir durante todo el curso. Cada módulo suma al resultado final.
>
> No la confundas con el ejercicio práctico **CoffeeInsight**, que es práctica guiada **(no evaluable)**.

---

## 🏢 Contexto
Vas a trabajar durante todo el curso sobre un caso de negocio de una empresa distribuidora de tecnología llamada **RetailPro**. Tienen datos de **ventas, clientes y productos** pero nadie los ha analizado sistemáticamente.

Tu trabajo a lo largo del curso es **construir el sistema de análisis completo**, desde la base de datos hasta el dashboard ejecutivo. Todo lo que entregues en cada módulo se suma al proyecto final.

---

## 📝 Instrucciones (las 5 secciones)

### 1. Definición del problema de negocio
Formulá la pregunta estratégica que RetailPro quiere responder. Debe ser una pregunta **diagnóstica** concreta, **no** descriptiva.

| | Ejemplo |
|---|---|
| ❌ **Descriptiva** (no aporta valor) | *"¿Cuánto vendimos este año?"* |
| ✅ **Diagnóstica** (accionable) | *"¿Por qué las ventas de la región Norte cayeron un 15% en el último trimestre y qué categoría de producto lo explica?"* |

### 2. Fuentes de datos identificadas
Describí qué **tablas** va a necesitar el sistema y qué información contendrá cada una. Tu modelo debe contemplar **al menos**:

| Tabla | Contiene | Ejemplo de campos |
|-------|----------|-------------------|
| `clientes` | Quiénes compran | id_cliente, nombre, segmento, ciudad |
| `productos` | Qué se vende | id_producto, nombre, categoría, precio |
| `ventas` | Las transacciones | id_venta, fecha, id_cliente, id_producto, cantidad, total_venta |
| `territorios` | Dónde ocurren las ventas | id_territorio, región, país |

### 3. Preguntas de análisis
Listá entre **4 y 6 preguntas** de negocio concretas que tu dashboard final debería poder responder. Estas preguntas van a guiar todas las decisiones técnicas del curso.

> **Ejemplos:** ¿Qué región genera más ingresos? · ¿Cuáles son los 10 productos más vendidos? · ¿Cómo evolucionan las ventas mes a mes? · ¿Qué segmento de clientes tiene el ticket promedio más alto?

### 4. KPIs propuestos
Definí **al menos 4 indicadores clave** que vas a visualizar. Para cada uno indicá **nombre**, **descripción** y **fórmula conceptual**.

| KPI | Descripción | Fórmula conceptual |
|-----|-------------|--------------------|
| Total Ventas | Monto total facturado | `SUM(total_venta)` |
| Ticket Promedio | Gasto medio por transacción | `SUM(total_venta) / COUNT(id_venta)` |
| Unidades Vendidas | Cantidad total de productos | `SUM(cantidad)` |
| Nº de Clientes | Clientes únicos que compraron | `DISTINCT COUNT(id_cliente)` |
| ... | ... | ... |

### 5. Boceto del dashboard
Dibujá —a mano o con cualquier herramienta simple (PowerPoint, papel, Canva)— un **esquema** de cómo imaginás la pantalla principal de tu reporte. No tiene que ser perfecto visualmente; lo que importa es la **lógica de distribución** (dónde van los KPIs, los filtros, los gráficos).

> 📎 El boceto se incluye como **imagen dentro del documento**.

---

## ✔️ Checklist de entrega
- [ ] **1 archivo único** en PDF o DOCX.
- [ ] Incluye las **5 secciones**: (1) Problema de negocio, (2) Fuentes de datos, (3) Preguntas de análisis, (4) KPIs, (5) Boceto del dashboard.
- [ ] El **boceto** va como imagen dentro del documento.
- [ ] No requiere dataset externo: es un **brief conceptual**.
- [ ] Se sube **directo en la plataforma**.

---
<p align="center">
🏠 <a href="../README.md">Volver a la Semana 1</a> · <a href="../../README.md">Índice del curso</a>
</p>
