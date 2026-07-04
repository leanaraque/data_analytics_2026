# Semana 10 — Medidas de Tendencia Central, Estadística y Publicación de Dashboard

> Dos bloques en una semana: los **fundamentos de estadística** para interpretar datos con rigor, y la **publicación en Power BI Service** para que tus dashboards lleguen a quienes deciden.

## 🎯 Objetivos de aprendizaje
Al finalizar esta semana serás capaz de:
- Clasificar **variables** (cualitativas/cuantitativas, nominales/ordinales, discretas/continuas).
- Calcular **medidas de tendencia central** (media, mediana, moda) con SQL.
- Calcular **medidas de dispersión** (rango, varianza, desviación estándar).
- Detectar **outliers** con el método **IQR** en SQL.
- **Publicar** informes en Power BI Service y gestionar **áreas de trabajo y permisos**.
- Aplicar **Seguridad a Nivel de Fila (RLS)** y automatizar la actualización con **gateways**.
- Construir **dashboards** y **suscripciones** para la capa ejecutiva.

## 📚 Temario y material

### 📊 Bloque Estadística
| # | Unidad | Material |
|---|--------|----------|
| 1 | Variables cualitativas y cuantitativas | [📄 Leer](./material/01-variables-cualitativas-y-cuantitativas.md) |
| 2 | Medidas de tendencia central con SQL (media, mediana, moda) | [📄 Leer](./material/02-medidas-de-tendencia-central-con-sql.md) |
| 3 | Medidas de dispersión (rango, varianza, desviación estándar) | [📄 Leer](./material/03-medidas-de-dispersion.md) |
| 4 | Análisis univariado y detección de outliers con SQL (IQR) | [📄 Leer](./material/04-analisis-univariado-y-outliers-con-sql.md) |
| 5 | 📖 *Avanzado:* Distribuciones de frecuencias y probabilidad | [📄 Leer](./material/05-distribuciones-de-frecuencias-y-probabilidad.md) |

### ☁️ Bloque Publicación (Power BI Service)
| # | Unidad | Material |
|---|--------|----------|
| 6 | Power BI Service y publicación de informes | [📄 Leer](./material/06-power-bi-service-y-publicacion.md) |
| 7 | Áreas de trabajo y gestión de permisos (roles) | [📄 Leer](./material/07-areas-de-trabajo-y-permisos.md) |
| 8 | Seguridad a Nivel de Fila (RLS) | [📄 Leer](./material/08-seguridad-nivel-de-fila-rls.md) |
| 9 | 📖 *Avanzado:* Gateways y actualizaciones programadas | [📄 Leer](./material/09-gateways-y-actualizaciones-programadas.md) |
| 10 | Dashboards y suscripciones en Power BI Service | [📄 Leer](./material/10-dashboards-y-suscripciones.md) |

> 🔗 **Puente:** los outliers que detectás acá son los que inflaban un promedio DAX (M8) o distorsionaban una tendencia visual (M7). La publicación lleva a la nube los dashboards que diseñaste desde M6.

---

## 📦 Entregable de la semana (¡esto cuenta para la nota!)

> **M10 — Pre-entrega: Validación estadística del proyecto** · [Ver consigna completa →](./entregable/README.md)

**¿En qué consiste, en una frase?** En dos partes: primero aplicás **tendencia central y dispersión** sobre un caso guiado; después usás esos mismos conceptos sobre los datos reales de **RetailPro** para validar que los KPIs de tu dashboard son **estadísticamente confiables**.

| Parte | Qué hacés | Ejemplo |
|-------|-----------|---------|
| 1 · Caso guiado | Media, rango y desviación estándar de dos sucursales; ¿cuál es más estable? | Norte (consistente) vs. Sur (volátil) |
| 2 · RetailPro | Media vs. mediana del ticket; outliers con IQR; ajustar KPIs/títulos del dashboard | ¿El "Ticket Promedio" está inflado por ventas extremas? |

**¿Qué entregás?** Un documento **`.docx` o `.pdf`** con ambas partes y los cálculos en tabla.

> 💡 Si la **media** y la **mediana** de tus ventas son muy distintas, el promedio puede estar inflado por outliers → considerá mostrar ambas en el dashboard o agregar una nota aclaratoria.

---

## 📂 Contenido de la carpeta
```
Semana-10-.../
├── README.md            → esta guía
├── material/            → las 10 unidades teóricas
└── entregable/          → consigna de la Validación estadística (M10)
```

---
<p align="center">
<a href="../Semana-09-IA-Aplicada-al-Trabajo-del-Analista-de-Datos/">⬅️ Semana 9</a> · 🏠 <a href="../README.md">Índice del curso</a> · <a href="../Semana-11-Proyecto-Final/">Semana 11 ➡️</a>
</p>
