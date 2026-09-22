# Esquemas — Semana 2: OLTP vs OLAP y Normalización

> Cada bloque se pega por separado en **Excalidraw → Más herramientas → Mermaid to Excalidraw**.
> Pensado para quien escucha estos conceptos por primera vez.

---

## 1. OLTP vs OLAP — la analogía

```mermaid
flowchart LR
    subgraph OLTP["OLTP: la caja del supermercado"]
        A1["Registra cada compra al instante"]
        A2["Muchas operaciones cortas por segundo"]
        A3["Pregunta típica: ¿cuánto cobro a este cliente?"]
    end

    subgraph OLAP["OLAP: la oficina del gerente"]
        B1["Analiza meses o años de ventas"]
        B2["Pocas consultas pero muy grandes"]
        B3["Pregunta típica: ¿qué región vendió menos este año?"]
    end

    OLTP -- "los datos viajan" --> OLAP
```

---

## 2. El viaje del dato: de la operación a la decisión

```mermaid
flowchart LR
    A["Un cliente compra una notebook"] --> B["OLTP: se guarda la venta en la base operativa"]
    B -- "ETL: extraer, limpiar y cargar" --> C["OLAP: Data Warehouse con el historial"]
    C --> D["Dashboard en Power BI"]
    D --> E["Decisión: reforzar ventas en el Norte"]
```

---

## 3. Cara a cara: OLTP vs OLAP

```mermaid
flowchart TB
    Q["¿Qué los diferencia?"]

    Q --> O1["Objetivo"]
    O1 --> O1a["OLTP: operar el negocio día a día"]
    O1 --> O1b["OLAP: analizar el negocio para decidir"]

    Q --> O2["Qué hace"]
    O2 --> O2a["OLTP: insertar y actualizar registros"]
    O2 --> O2b["OLAP: sumar, agrupar y comparar"]

    Q --> O3["Qué datos tiene"]
    O3 --> O3a["OLTP: datos actuales y detallados"]
    O3 --> O3b["OLAP: datos históricos y resumidos"]

    Q --> O4["Cómo se diseña"]
    O4 --> O4a["OLTP: normalizado, sin repetir datos"]
    O4 --> O4b["OLAP: esquema estrella o copo de nieve"]

    Q --> O5["Quién lo usa"]
    O5 --> O5a["OLTP: cajeros, vendedores, sistemas"]
    O5 --> O5b["OLAP: analistas, gerentes, dirección"]
```

---

## 4. ¿Dónde se usan?

```mermaid
flowchart LR
    subgraph OLTP["OLTP en la vida real"]
        T1["Banco: una transferencia"]
        T2["E-commerce: un carrito que se paga"]
        T3["Aerolínea: reservar un asiento"]
        T4["RetailPro: registrar una venta"]
    end

    subgraph OLAP["OLAP en la vida real"]
        P1["Banco: ¿qué clientes pueden dejar de pagar?"]
        P2["E-commerce: ¿qué productos se compran juntos?"]
        P3["Aerolínea: ¿qué rutas dejan más ganancia?"]
        P4["RetailPro: ¿por qué cayó el Norte?"]
    end

    T1 --> P1
    T2 --> P2
    T3 --> P3
    T4 --> P4
```

---

## 5. ¿Por qué es importante separarlos?

```mermaid
flowchart TB
    A["Si el gerente corre un reporte gigante sobre la base de la caja..."] --> B["La caja se vuelve lenta"]
    B --> C["Clientes esperando y ventas perdidas"]

    D["Por eso se separan"] --> E["OLTP rápido para operar"]
    D --> F["OLAP potente para analizar"]
    E --> G["El negocio funciona y además aprende de sus datos"]
    F --> G

    H["‍El analista de datos trabaja casi siempre del lado OLAP"]
    F --> H
```

---

## 6. Normalización — el problema: todo en una planilla

```mermaid
flowchart TB
    A["Planilla de Excel con todo mezclado"] --> B["Juan Pérez · juan@mail.com · Teclado"]
    A --> C["Juan Pérez · juan@mail.com · Monitor"]
    A --> D["Juan Pérez · juan@mail.com · Mouse"]

    B --> E["El mismo cliente está escrito 3 veces"]
    C --> E
    D --> E

    E --> F["Juan cambia su email"]
    F --> G["Hay que corregir 3 filas"]
    G --> H["Si te olvidás una: ¿cuál es el email correcto?"]
```

---

## 7. Las 3 anomalías: por qué normalizar

```mermaid
flowchart LR
    N["Datos sin normalizar"]

    N --> I["Anomalía de INSERCIÓN"]
    I --> I1["No puedo cargar un producto nuevo hasta que alguien lo compre"]

    N --> U["Anomalía de ACTUALIZACIÓN"]
    U --> U1["Cambio un dato en 50 filas y me olvido de una"]

    N --> D["Anomalía de BORRADO"]
    D --> D1["Borro la única venta de un cliente y pierdo los datos del cliente"]

    I1 --> S["Normalizar: cada dato vive en un solo lugar"]
    U1 --> S
    D1 --> S
```

---

## 8. La escalera de la normalización

```mermaid
flowchart LR
    X["Tabla desordenada"] --> F1["1NF: la clave"]
    F1 --> F2["2NF: TODA la clave"]
    F2 --> F3["3NF: NADA MÁS que la clave"]
    F3 --> OK["Base de datos ordenada"]

    F1 -.- F1a["Una celda, un solo valor"]
    F2 -.- F2a["Nada depende de una PARTE de la clave"]
    F3 -.- F3a["Nada depende de otra columna que no es clave"]
```

> **Regla de oro:** cada columna debe depender *de la clave, de toda la clave y de nada más que la clave*.

---

## 9. Primera Forma Normal (1NF): una celda, un valor

```mermaid
flowchart LR
    subgraph ANTES["Antes"]
        A1["101 · Carlos Ruiz · Yoga, Boxeo"]
    end

    subgraph DESPUES["Después"]
        B1["101 · Carlos Ruiz · Yoga"]
        B2["101 · Carlos Ruiz · Boxeo"]
    end

    ANTES -- "separar la lista en filas" --> DESPUES
    DESPUES --> C["Arreglamos las celdas, pero Carlos Ruiz se repite: vamos a 2NF"]
```

---

## 10. Segunda Forma Normal (2NF) — paso 1: ¿qué es una clave compuesta?

```mermaid
flowchart LR
    A["Tabla INSCRIPCIONES del gimnasio"] --> B["¿Qué identifica una fila?"]
    B --> C["SocioID solo NO alcanza: Carlos tiene varias clases"]
    B --> D["Clase sola NO alcanza: Yoga tiene varios socios"]
    C --> E["Clave compuesta: SocioID + Clase"]
    D --> E
    E --> F["La clave está formada por DOS partes"]
```

---

## 11. Segunda Forma Normal (2NF) — paso 2: la pregunta mágica

```mermaid
flowchart TB
    K["Clave: SocioID + Clase"]

    K --> Q1["¿Nombre depende de SocioID + Clase?"]
    Q1 --> R1["No: Carlos se llama igual en Yoga y en Boxeo"]
    R1 --> R1a["Depende SOLO de SocioID: es una dependencia PARCIAL"]

    K --> Q2["¿Horario_Inscripción depende de SocioID + Clase?"]
    Q2 --> R2["Sí: necesito saber quién y a qué clase"]
    R2 --> R2a["Depende de TODA la clave: se queda"]

    R1a --> S["Solución: Nombre se muda a su propia tabla"]
```

---

## 12. Segunda Forma Normal (2NF) — paso 3: dividir para vencer

```mermaid
flowchart LR
    subgraph ANTES["Tabla única"]
        A1["SocioID · Clase · Nombre"]
        A2["101 · Yoga · Carlos Ruiz"]
        A3["101 · Boxeo · Carlos Ruiz"]
    end

    subgraph SOCIOS["SOCIOS"]
        S1["SocioID PK · Nombre"]
        S2["101 · Carlos Ruiz"]
    end

    subgraph INSCRIPCIONES["INSCRIPCIONES"]
        I1["SocioID FK · Clase"]
        I2["101 · Yoga"]
        I3["101 · Boxeo"]
    end

    ANTES --> SOCIOS
    ANTES --> INSCRIPCIONES
    SOCIOS -- "1 socio tiene N inscripciones" --> INSCRIPCIONES
```

---

## 13. 2NF en RetailPro: el detalle de un pedido

```mermaid
flowchart TB
    K["Clave compuesta: id_pedido + id_producto"]

    K --> C1["cantidad"]
    C1 --> R1["Depende de los dos: cuántas unidades de ESE producto en ESE pedido"]

    K --> C2["nombre_producto"]
    C2 --> R2["Depende solo de id_producto"]
    R2 --> M2["Se muda a la tabla productos"]

    K --> C3["fecha_pedido"]
    C3 --> R3["Depende solo de id_pedido"]
    R3 --> M3["Se muda a la tabla pedidos"]
```

> Si la tabla tiene una **clave de una sola columna** (como `id_venta`), no puede haber dependencias parciales: ya cumple 2NF automáticamente.

---

## 14. Tercera Forma Normal (3NF) — el efecto dominó

```mermaid
flowchart LR
    A["SocioID"] -- "determina" --> B["ID_Entrenador"]
    B -- "determina" --> C["Nombre_Entrenador"]
    A -. "llega de forma indirecta: dependencia TRANSITIVA" .-> C
```

> El nombre del entrenador **no** depende del socio: depende del entrenador. El socio solo "llega" a ese dato pasando por otra columna.

---

## 15. Tercera Forma Normal (3NF) — la pregunta mágica

```mermaid
flowchart TB
    P["Mirá una columna que NO es clave"] --> Q["¿La puedo deducir a partir de OTRA columna que tampoco es clave?"]
    Q -- "Sí" --> S1["Dependencia transitiva"]
    S1 --> S2["Llevar esas columnas a una tabla nueva"]
    S2 --> S3["Dejar solo la FK en la tabla original"]
    Q -- "No" --> N1["La columna se queda donde está"]
```

---

## 16. Tercera Forma Normal (3NF) — la solución

```mermaid
flowchart LR
    subgraph ANTES["SOCIOS con efecto dominó"]
        A1["SocioID · Nombre · ID_Entrenador · Nombre_Entrenador"]
        A2["101 · Carlos Ruiz · E-40 · Marcos Paz"]
        A3["102 · Ana López · E-40 · Marcos Paz"]
    end

    subgraph SOCIOS["SOCIOS"]
        S1["SocioID PK · Nombre · ID_Entrenador FK"]
        S2["101 · Carlos Ruiz · E-40"]
        S3["102 · Ana López · E-40"]
    end

    subgraph ENTRENADORES["ENTRENADORES"]
        E1["ID_Entrenador PK · Nombre_Entrenador"]
        E2["E-40 · Marcos Paz"]
    end

    ANTES --> SOCIOS
    ANTES --> ENTRENADORES
    ENTRENADORES -- "1 entrenador tiene N socios" --> SOCIOS
```

> Si Marcos Paz corrige su nombre, se cambia en **una sola fila**.

---

## 17. 3NF en RetailPro: ciudad y provincia

```mermaid
flowchart LR
    A["id_cliente"] --> B["ciudad"]
    B --> C["provincia"]
    A -. "transitiva" .-> C

    C --> D["40 clientes de Rosario repiten Santa Fe"]
    D --> E["Tabla ciudades: id_ciudad PK · ciudad · provincia"]
    E --> F["clientes guarda solo id_ciudad FK"]
```

---

## 18. 2NF vs 3NF: ¿cómo no confundirlas?

```mermaid
flowchart TB
    P["Una columna que NO es clave depende de algo que no debería"] --> Q["¿De qué depende?"]

    Q --> A["De una PARTE de la clave"]
    A --> A1["Solo pasa con claves compuestas"]
    A1 --> A2["Rompe la 2NF"]
    A2 --> A3["Ej.: nombre depende solo de SocioID"]

    Q --> B["De OTRA columna que no es clave"]
    B --> B1["Puede pasar con cualquier clave"]
    B1 --> B2["Rompe la 3NF"]
    B2 --> B3["Ej.: Nombre_Entrenador depende de ID_Entrenador"]

    A3 --> S["En los dos casos: mover esas columnas a su propia tabla"]
    B3 --> S
```
