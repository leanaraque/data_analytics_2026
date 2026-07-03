# 3. Conexión de Power BI a PostgreSQL y SQL Server

> El SQL que aprendiste en M3–M5 vivía en tu motor de base de datos. Esta unidad crea el **puente** hacia Power BI.

Imaginá que trabajás para una tienda minorista: las transacciones web están en **PostgreSQL**, pero la información de lealtad y direcciones de los clientes está en **SQL Server**. Tu misión es unir esos dos mundos para responder *"¿Qué clientes de qué ciudades compran más?"*. El primer paso no es analizar, sino **conectar**.

## El concepto de conexión: la dirección postal
Para leer datos de un servidor, Power BI necesita una **cadena de conexión**. Pensala como una dirección de correo:

- **Servidor (Host):** ¿en qué computadora están los datos? (ej. `192.168.1.10`, o `localhost` si es tu propia PC).
- **Puerto:** ¿por qué "puerta" entramos? (PostgreSQL usa el **5432**; SQL Server el **1433**).
- **Base de datos:** ya dentro del edificio, ¿en qué "habitación" están los archivos?
- **Credenciales:** el usuario y la contraseña para abrir la puerta.

## PostgreSQL vs. SQL Server en Power BI
Ambos son relacionales, pero Power BI los trata de forma ligeramente distinta:
- **SQL Server:** producto de Microsoft, integración **nativa** y fluida. Soporta **Windows Authentication** (tu usuario de la computadora) o **SQL Authentication**.
- **PostgreSQL:** de código abierto. Tiene un conector específico, pero a veces requiere instalar un pequeño componente intermediario llamado **Npgsql** para que ambos "hablen el mismo idioma".

## 🎥 Video — Conectar SQL Server con Power BI
Proceso paso a paso: seleccionar el conector de SQL Server, ingresar el **nombre del servidor** y la **base de datos**, elegir entre modo **Importación** y **DirectQuery**, y cargar las tablas necesarias. También qué hacer cuando la conexión falla y cómo verificar que los datos se importaron bien.

## Errores comunes de principiantes
- **Confundir el Servidor con la Base de Datos:** el **Servidor** es el motor (Postgres/SQL Server); la **Base de Datos** es el contenedor de tus tablas (ej. `ventas_2026`).
- **Firewalls:** a veces la conexión es correcta pero el "muro de seguridad" bloquea el puerto **5432** o **1433**. Si fallás al conectar, revisá si el puerto está abierto.
- **Credenciales incorrectas:** asegurate de que el usuario de base de datos tenga permisos de **LECTURA** (recordá el principio de menor privilegio de M3).

---
<p align="center">
<a href="./02-power-bi-y-transformacion-de-datos.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 6</a> · <a href="./04-limpieza-y-tipado-en-power-query.md">Siguiente ➡️</a>
</p>
