# 3. Normalización de datos: el arte de organizar el caos

> Ya sabés qué modelos existen y cómo se clasifican los sistemas. La normalización es la técnica concreta para diseñar tablas sin inconsistencias ni duplicados.

Imaginá que entrás a la cocina de un restaurante en hora punta. El chef necesita sal, pero al abrir el cajón etiquetado "Especias" se encuentra con sal, pimienta, harina, tornillos de repuesto y hasta los recibos de la luz. No solo tarda el triple en encontrar lo que busca, sino que corre el riesgo de confundir sal con azúcar en un plato estrella.

Una base de datos **sin normalizar** es exactamente ese cajón: datos mezclados, repetidos, y cualquier cambio se convierte en un campo minado de errores. En esta unidad aprenderás a aplicar las **Formas Normales (1NF, 2NF y 3NF)**.

## 1. ¿Qué es la normalización y por qué importa?
La **normalización** es el proceso de organizar los datos en una base relacional para **reducir la redundancia** (datos repetidos) y **mejorar la integridad**.

Si venís de Excel, estás acostumbrado a tener todo en una sola gran hoja. En SQL eso es una receta para el desastre. Sin normalización aparecen las tres **anomalías de datos**:

- **Anomalía de inserción:** no podés añadir un dato porque te falta otro (ej. no podés registrar un curso nuevo hasta que no haya al menos un estudiante inscrito).
- **Anomalía de actualización:** si un cliente cambia de dirección y su nombre aparece en 50 filas, debés cambiar las 50. Si olvidás una, tendrás datos contradictorios.
- **Anomalía de borrado:** al borrar un registro (ej. cancelar una venta), borrás sin querer información que querías conservar (ej. los datos del cliente).

> Normalizar no es "hacer más tablas porque sí"; es asegurar que cada pieza de información **viva en un solo lugar lógico**.

## 2. Primera Forma Normal (1NF): el fin de las listas y el desorden
Una tabla está en **1NF** si cumple tres reglas de oro:
1. **Atomicidad:** cada celda contiene un único valor. Nada de listas separadas por comas (ej. "Rojo, Azul, Verde").
2. **Entradas únicas:** no puede haber columnas que repitan el mismo tipo de información (ej. `Telefono1, Telefono2, Telefono3` es un error de diseño).
3. **Clave primaria:** cada fila debe ser identificable de forma única.

### Ejemplo práctico: el sistema de un gimnasio
Tabla inicial que recibe el analista:

| SocioID | Nombre | Telefono | Clases_Inscritas |
|---------|--------|----------|------------------|
| 101 | Carlos Ruiz | 555-123, 555-789 | Yoga, Boxeo |
| 102 | Ana López | 555-444 | Pilates |

**¿Por qué NO está en 1NF?** El teléfono de Carlos tiene dos números en la misma celda y sus clases también son una lista. Contar cuántos socios hacen "Boxeo" con SQL sería una pesadilla porque el dato está "atrapado" con otros.

**Solución 1NF:**

| SocioID | Nombre | Telefono | Clase |
|---------|--------|----------|-------|
| 101 | Carlos Ruiz | 555-123 | Yoga |
| 101 | Carlos Ruiz | 555-123 | Boxeo |
| 101 | Carlos Ruiz | 555-789 | Yoga |
| 101 | Carlos Ruiz | 555-789 | Boxeo |
| 102 | Ana López | 555-444 | Pilates |

Ahora cada celda es "atómica". Pero fijate cómo "Carlos Ruiz" se repite mucho: arreglamos el desorden de las celdas, pero ahora hay **redundancia**. Ahí entra la 2NF.

## 3. Segunda Forma Normal (2NF): eliminando dependencias parciales
Para estar en **2NF**, la tabla debe:
1. Estar ya en **1NF**.
2. **Dependencia funcional completa:** todos los atributos que no son parte de la clave primaria deben depender de la **clave primaria completa**, no solo de una parte.

Si tenés una **clave compuesta** (dos columnas), todos los demás datos deben referirse a esa combinación específica, no solo a uno de los dos IDs.

### Ejemplo (gimnasio)
En la tabla 1NF anterior, la clave primaria sería la combinación de `SocioID` + `Clase` (un socio puede estar en muchas clases y una clase tener muchos socios).

**Preguntate:** ¿el nombre "Carlos Ruiz" depende de la `Clase`? **No.** Depende únicamente del `SocioID`. Como el nombre depende solo de **parte** de la clave, violamos la 2NF.

**Solución 2NF — dividir para vencer:**

**Tabla `SOCIOS`** (cada socio aparece una sola vez)

| SocioID (PK) | Nombre | Telefono |
|--------------|--------|----------|
| 101 | Carlos Ruiz | 555-123 |
| 102 | Ana López | 555-444 |

**Tabla `INSCRIPCIONES`** (relaciona socios con clases)

| SocioID (FK) | Clase |
|--------------|-------|
| 101 | Yoga |
| 101 | Boxeo |
| 102 | Pilates |

Si Carlos cambia su teléfono, solo lo editamos en **una** fila de `SOCIOS`.

## 4. Tercera Forma Normal (3NF): eliminando el "efecto dominó"
Para estar en **3NF**, la tabla debe:
1. Estar en **2NF**.
2. **No tener dependencias transitivas:** ninguna columna que no sea clave debe depender de otra columna que tampoco sea clave.

> En palabras simples: los datos deben depender *"de la clave, de toda la clave y de nada más que la clave"*.

### Ejemplo: el error clásico del entrenador
Supongamos que la tabla `SOCIOS` creció así:

| SocioID (PK) | Nombre | ID_Entrenador | Nombre_Entrenador |
|--------------|--------|---------------|-------------------|
| 101 | Carlos Ruiz | E-40 | Marcos Paz |
| 102 | Ana López | E-40 | Marcos Paz |

**El problema:** `Nombre_Entrenador` depende de `ID_Entrenador`, y `ID_Entrenador` depende de `SocioID`. Eso es una **dependencia transitiva**. Si Marcos Paz corrige su nombre, habría que actualizarlo en cada socio que lo tenga asignado.

**Solución 3NF:**

**Tabla `SOCIOS`**

| SocioID (PK) | Nombre | ID_Entrenador (FK) |
|--------------|--------|--------------------|
| 101 | Carlos Ruiz | E-40 |
| 102 | Ana López | E-40 |

**Tabla `ENTRENADORES`**

| ID_Entrenador (PK) | Nombre_Entrenador |
|--------------------|-------------------|
| E-40 | Marcos Paz |

Ahora la información del entrenador vive en su propio lugar. El esquema es robusto, eficiente y elegante.

## 5. Resumen visual: la regla de oro
> *"Cada columna debe depender de la llave (1NF), de toda la llave (2NF) y de nada más que la llave (3NF)."*

- **1NF:** ¿celdas con un solo valor y sin grupos repetidos?
- **2NF:** ¿las columnas dependen de la clave primaria **completa**? (Si no, creá una tabla nueva para esos datos.)
- **3NF:** ¿hay columnas que dependen de otras columnas que **no** son llaves? (Si es así, separá esa relación a su propia tabla.)

## 6. Errores comunes de principiantes
- **Miedo a los JOINs:** muchos evitan normalizar por miedo a consultas largas con muchos JOINs. **La realidad:** es preferible un JOIN largo que datos corruptos porque alguien olvidó actualizar una de las 50 filas repetidas.
- **Atomicidad extrema:** no te obsesiones. "Nombre Completo" puede ser un solo campo si tu negocio nunca necesitará separar por apellido. Pero si vas a enviar correos que digan "Hola, [Nombre]", separalos. **La atomicidad depende del contexto de uso.**
- **Olvidar la 1NF:** es imposible llegar a la 3NF si tus celdas todavía tienen listas de valores. La normalización es una escalera; no podés saltarte peldaños.

## 7. Conexión con el análisis de datos
Como analista te vas a encontrar con fuentes muy "sucias" (sobre todo CSV o Excel de departamentos administrativos). Antes de cargar esos datos en Power BI o procesarlos con SQL:
- Debés **identificar** las redundancias.
- Debés **proponer o ejecutar** la limpieza para llevarlos al menos a **3NF**.
- Un dato repetido puede hacer que un `SUM` dé el doble o el triple de lo real, **arruinando tus reportes**.

> Al dominar la normalización dejás de ser un "copiador de datos" para convertirte en un **Arquitecto de Información**.

## 🎥 Video práctico — De tabla plana a modelo estrella (en Excel)
En el video vas a transformar una **tabla plana desordenada** en un modelo bien estructurado, separando la información en una **tabla de hechos** y **tres tablas de dimensiones** directamente en Excel: cómo identificar qué datos van en cada tabla, cómo definir claves primarias y foráneas, y por qué esta separación es el paso previo indispensable antes de llevar los datos a Power BI. Al terminar entenderás de forma práctica la lógica detrás del **esquema estrella**.

---
<p align="center">
<a href="./02-oltp-vs-olap-y-modelado-analitico.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 2</a> · <a href="./04-plataformas-cloud-snowflake-bigquery-synapse.md">Siguiente ➡️</a>
</p>
