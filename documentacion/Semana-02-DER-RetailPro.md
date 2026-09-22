# DER — RetailPro (Entregable M2)

> **Este es el modelo tal como se diseña en M2:** cuatro tablas, con `categoria` y `subcategoria` como columnas de `productos`. La base implementada más adelante ([`RetailPro_DB`](../recursos/base-de-datos/)) va **un paso más allá** y normaliza `categorias` en su propia tabla — son cinco tablas. Si comparás los dos diagramas y no coinciden, es por eso: el DER de M2 es el diseño de la semana 2, el [`.dbml`](./der-retailpro.dbml) refleja la base real.

```mermaid
erDiagram
    clientes    ||--o{ ventas : "realiza"
    productos   ||--o{ ventas : "se vende en"
    territorios ||--o{ ventas : "ocurre en"

    clientes {
        INT      id_cliente PK
        NVARCHAR nombre
        NVARCHAR email
        NVARCHAR ciudad
        NVARCHAR segmento
        DATE     fecha_registro
    }

    productos {
        INT      id_producto PK
        NVARCHAR nombre_producto
        NVARCHAR categoria
        NVARCHAR subcategoria
        DECIMAL  precio
        DECIMAL  costo
    }

    territorios {
        INT      id_territorio PK
        NVARCHAR region
        NVARCHAR pais
        NVARCHAR zona
    }

    ventas {
        INT      id_venta PK
        DATE     fecha_venta
        INT      id_cliente FK
        INT      id_producto FK
        INT      id_territorio FK
        INT      cantidad
        DECIMAL  total_venta
        NVARCHAR canal
    }
```

---

## 2. Justificación de normalización (3NF)

```mermaid
flowchart LR
    A["Excel desorganizado: todo en una planilla con datos repetidos"] --> B["1NF: valores atómicos y cada tabla con su PK"]
    B --> C["2NF: sin dependencias parciales"]
    C --> D["3NF: sin dependencias transitivas"]
    D --> E["Sin redundancia: cada dato vive en una sola tabla y se referencia con FK"]

    C --- C1["PK simple id_venta: con PK id_cliente + id_producto, fecha_venta dependería solo de una parte"]

    D --- T1["email, ciudad, segmento dependen de id_cliente → clientes"]
    D --- T2["categoria, subcategoria, precio, costo dependen de id_producto → productos"]
    D --- T3["region, pais, zona dependen de id_territorio → territorios"]
```

---

## 3. Conexión con el brief de M1

```mermaid
flowchart LR
    CL["clientes"] --> CL1["segmento"] --> Q5["¿Qué segmento tiene el ticket promedio más alto?"]

    PR["productos"] --> PR1["categoria"] --> Q4["¿Qué categoría perdió más ventas en la región Norte?"]
    PR --> PR2["nombre_producto"] --> Q2["¿Cuáles son los 10 productos más vendidos?"]

    TE["territorios"] --> TE1["region"] --> Q1["¿Qué región genera más ingresos?"]

    VE["ventas"] --> VE1["fecha_venta"] --> Q3["¿Cómo evolucionan las ventas mes a mes?"]
    VE --> VE2["canal"] --> Q6["¿Qué canal rinde mejor en cada región?"]
    VE --> VE3["total_venta, cantidad"] --> KP["Base de los KPIs: Total Ventas, Ticket Promedio, Unidades"]
```
