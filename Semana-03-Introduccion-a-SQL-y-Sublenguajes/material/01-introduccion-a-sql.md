# 1. SQL para analistas

> Arranca el bloque SQL — el lenguaje que te da acceso a cualquier base de datos empresarial.

Imaginá que tenés una gran cantidad de datos almacenados en diferentes sistemas y necesitás extraer información valiosa para tomar decisiones de negocio. ¿Cómo lo harías? Aquí entra en juego **SQL (Structured Query Language)**, el lenguaje estándar para consultar y manipular bases de datos relacionales.

> 💡 Un concepto que vas a usar durante todo el módulo es el de **esquema**: el "plano" que organiza las tablas, columnas y relaciones de una base de datos. Definirlo bien desde el principio es lo que evita el desorden más adelante (lo vemos en detalle en la unidad de DDL).

## ¿Qué es SQL?
SQL es un lenguaje estándar diseñado para **gestionar y manipular bases de datos relacionales**. Fue desarrollado en la **década de 1970** y desde entonces es la herramienta principal para interactuar con datos estructurados.

> 🖥️ En este módulo usamos el SGBD **SQL Server** para la parte práctica (seguí el instructivo de instalación compartido en la plataforma).

### Concepto: el modelo relacional
Las bases de datos relacionales se basan en el **modelo relacional** y usan un conjunto de **tablas** para representar tanto los datos como las relaciones entre ellos.

El modelo relacional significa que las **estructuras lógicas** (tablas, vistas, índices) están separadas de las **estructuras físicas** de almacenamiento. Gracias a esta separación, los administradores pueden gestionar el almacenamiento físico sin afectar el acceso lógico a los datos (por ejemplo, cambiar el nombre de un archivo de base de datos no cambia el nombre de las tablas que contiene).

Para garantizar que los datos sean siempre precisos y accesibles, las bases relacionales siguen **reglas de integridad** (por ejemplo, no permitir filas duplicadas en una tabla).

En el análisis de datos, SQL permite:
- **Consultar** grandes volúmenes de datos de forma rápida y precisa.
- **Insertar, actualizar y eliminar** información.
- **Definir y modificar** la estructura de las bases de datos.

> **Dato clave:** aunque existen distintos motores (PostgreSQL, SQL Server, BigQuery…), todos usan SQL como base, con algunas variaciones de sintaxis y funcionalidades.

## Herramientas y ecosistema SQL

| Motor / Herramienta | Descripción | Uso común |
|---------------------|-------------|-----------|
| **PostgreSQL** | Motor relacional de código abierto, muy usado en análisis y desarrollo | Consultas complejas, análisis avanzado |
| **SQL Server** | Motor de Microsoft, con extensiones propias y soporte para datos geográficos y JSON | Empresas con ecosistema Microsoft |
| **Google BigQuery** | Plataforma en la nube para análisis de grandes volúmenes con SQL estándar | Big Data y análisis en la nube |
| **DBeaver** | Herramienta gráfica para gestionar múltiples motores | Administración y consultas visuales |
| **SSMS** (SQL Server Management Studio) | Entorno oficial para administrar SQL Server | Gestión y desarrollo en SQL Server |
| **Archivos XLSX** | No es una base de datos, pero Excel es común para preparar/exportar datos | Preparación y análisis preliminar |

## Sublenguajes de SQL
SQL se divide en varios sublenguajes, cada uno con funciones específicas:

| Sublenguaje | Función principal | Ejemplo de uso |
|-------------|-------------------|----------------|
| **DDL** (Data Definition Language) | Definir y modificar la estructura de la base | Crear tablas, definir esquemas |
| **DML** (Data Manipulation Language) | Manipular los datos dentro de las tablas | Insertar, actualizar, eliminar registros |
| **DCL** (Data Control Language) | Controlar permisos y accesos | Conceder o revocar permisos a usuarios |
| **TCL** (Transaction Control Language) | Gestionar transacciones para asegurar integridad | Confirmar o revertir cambios realizados |

> **Ejemplo práctico:** para **crear** una tabla de clientes se usa **DDL**; para **agregar** un cliente, **DML**; para **dar acceso** a un analista, **DCL**; y para asegurar que varias operaciones se completen juntas, **TCL**.

## SQL en el día a día del analista
Un analista usa SQL para consultar ventas por región y periodo, actualizar registros de clientes, crear tablas para datos procesados y controlar quién accede a información sensible. Herramientas como **DBeaver** o **SSMS** ofrecen interfaces amigables para ejecutar estas tareas, aunque conocer los fundamentos de SQL es esencial para un análisis efectivo.

## 🎥 Video — Conocé la herramienta: SQL Server (SSMS)
Primeros pasos dentro de **SQL Server Management Studio (SSMS)**: cómo abrir la herramienta, conectarte a un servidor y familiarizarte con los paneles y secciones que vas a usar durante toda la cursada. Al finalizar vas a moverte con confianza en el entorno y estar listo para escribir tus primeras consultas.

---
<p align="center">
🏠 <a href="../README.md">Semana 3</a> · <a href="./02-diseno-de-esquemas-con-ddl-y-tipos-de-datos.md">Siguiente: Diseño de esquemas con DDL ➡️</a>
</p>
