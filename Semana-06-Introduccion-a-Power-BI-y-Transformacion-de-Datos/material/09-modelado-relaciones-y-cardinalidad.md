# 9. Fundamentos del modelado de datos: relaciones y cardinalidad 1:N

> Los datos están limpios y cargados. Ahora los organizás en un **modelo** que Power BI pueda usar para calcular correctamente. Es el **esquema en estrella** de M2, ahora aplicado de forma práctica.

Si intentáramos guardar toda la información (miles de productos, cientos de clientes, montañas de pedidos) en **una sola tabla**, tendríamos un caos: el nombre del cliente se repetiría en cada pedido y actualizar un precio implicaría modificar miles de filas. El **modelado de datos** resuelve esto: en Power BI trabajamos con un **sistema de tablas conectadas**. Entender cómo se conectan —la **cardinalidad**— es la diferencia entre un reporte que funciona y uno que entrega resultados erróneos.

## 1. ¿Qué es un modelo de datos?
La información se organiza en **entidades** (Clientes, Productos, Ventas, Sucursales). El **modelo de datos** es el **mapa** que describe cómo se relacionan esas entidades. Es el "motor" que permite que, al hacer clic en un gráfico de Países, tus métricas de Ventas se filtren automáticamente. Sin un modelo bien definido, Power BI ve tablas aisladas y no sabe combinarlas.

## 2. El concepto de cardinalidad
Responde una pregunta simple: *"¿Cuántos de ESTO pueden conectarse con cuántos de AQUELLO?"*

- **1 : 1 (Uno a Uno):** un ciudadano tiene un único número de seguridad social, y ese número pertenece a un solo ciudadano.
- **1 : N (Uno a Varios):** un Cliente puede hacer muchos Pedidos, pero cada Pedido pertenece a un único Cliente.
- **N : N (Varios a Varios):** un Estudiante se inscribe en muchas Materias, y una Materia tiene muchos Estudiantes.

> 📌 **Regla de oro para analistas:** el **90%** de tus modelos exitosos se basan en relaciones **1:N**. Las N:N suelen evitarse o transformarse porque generan **ambigüedad** y resultados duplicados.

## 3. Profundizando en la relación 1:N
Hay que identificar dos roles: el lado del **"Uno"** (tabla de **dimensiones**) y el lado del **"Varios"** (tabla de **hechos**). Ejemplo: un Departamento tiene muchos empleados, pero un empleado trabaja en un solo departamento.

> 🔑 **Regla de implementación:** la clave del lado **UNO** siempre viaja a la tabla del lado **VARIOS** como **Foreign Key**. Así, `ID_Cliente` aparece en la tabla de `Pedidos`, y Power BI sabe que el pedido #500 lo hizo "Juan Pérez" sin repetir su nombre en cada fila.

## 4. Cardinalidad mínima y máxima
No basta saber si es "uno a muchos"; también si la relación es **obligatoria u opcional**. Se representa como (mínimo, máximo):

| Notación | Significado | Ejemplo en Power BI |
|----------|-------------|---------------------|
| **(1, N)** | Obligatorio y Muchos | Un departamento **debe** tener al menos un empleado para aparecer en la nómina |
| **(0, N)** | Opcional y Muchos | Un cliente puede estar registrado pero aún **no** haber comprado |
| **(0, 1)** | Opcional y Uno | Un empleado puede **no** estar asignado a ningún proyecto activo |

> ⚠️ **¿Por qué importa?** Si diseñás un modelo asumiendo que siempre habrá pedidos por cliente `(1,N)` y luego querés analizar *"clientes que no compraron nada"*, tus cálculos podrían fallar o excluir datos importantes. La cardinalidad mínima guía el tipo de relación a usar.

## 5. Errores comunes de principiantes
- **🔀 Confundir la dirección del flujo:** ¿la clave va en Clientes o en Pedidos? La FK siempre va en la tabla del lado **N**. La info descriptiva (Clientes) filtra la cuantitativa (Pedidos).
- **🗂️ Crear tablas intermedias innecesarias:** en Power BI buscamos equilibrio, no normalización extrema. Si es 1:1, a menudo conviene tener todo en una sola tabla.
- **⚠️ Conectar tablas N:N directamente:** relacionar "Vendedores" con "Países" sin una **tabla puente** produce resultados duplicados en todas tus sumas y medidas DAX. Siempre usá una tabla intermedia para resolver N:N.

## 6. Contexto real · Por qué importa en el trabajo diario
Un modelo mal diseñado es la **causa número uno** de métricas incorrectas en dashboards ejecutivos. Un analista que entiende la cardinalidad sabe por qué un `SUM(Ventas)` puede duplicarse si hay una N:N sin resolver, cómo el **flujo de filtros** entre tablas afecta cada visual, y por qué Power BI muestra **líneas punteadas** de advertencia en el modelo.

## 7. Síntesis: tu cheat sheet analítica

| | Lado 1 · Dimensión | Lado N · Hechos |
|---|--------------------|-----------------|
| **Datos** | Descriptivos, no se repiten | Transaccionales, se repiten |
| **Ejemplos** | Catálogo de Productos, Lista de Clientes, Tabla de Fechas | Ventas, Logs, Movimientos |
| **Clave** | Contiene la **Primary Key (PK)** | Contiene la **Foreign Key (FK)** |

> **El vínculo:** el ID de la tabla **1** viaja como columna extra a la tabla **N**. Ese campo compartido es el que Power BI usa para trazar la relación y **propagar filtros**.

---
<p align="center">
<a href="./08-maestria-del-etl.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="../entregable/README.md">Ir al entregable (M6) ➡️</a>
</p>
