# 5. Distribuciones de frecuencias y probabilidad básica

> 📖 **Para profundizar** — Contenido avanzado. Podés continuar sin leerla y volver cuando domines los conceptos anteriores.

Imaginá una tabla con las edades de 500 clientes de un banco. Leer fila por fila es imposible para extraer información. La **distribución de frecuencias** transforma esos datos "crudos" en una estructura ordenada que deja ver patrones, concentraciones y comportamientos.

## ¿Por qué es vital para un analista?
Antes de análisis complejos o dashboards, hay que entender **cómo se distribuyen** los datos. Una distribución responde preguntas inmediatas:
- ¿La mayoría de mis clientes son jóvenes o mayores?
- ¿Hay algún rango de edad inusual que requiera atención?
- ¿Qué proporción del total representa cada grupo?

## Conceptos clave para organizar tus datos
- **Clases (intervalos):** grupos en los que dividimos los datos (ej. rangos de edad: 18-25, 26-35).
- **Frecuencia Absoluta (fᵢ):** el conteo real de cuántas veces aparece un valor o cuántos datos caen en una clase.
- **Frecuencia Relativa (hᵢ):** la proporción que representa esa clase respecto al total (`fᵢ / total`). Es fundamental porque permite **comparar grupos** aunque el tamaño de las muestras sea distinto.
- **Frecuencia Acumulada (Fᵢ):** la suma progresiva de las frecuencias. Dice cuántos datos hay "hasta este punto".

## Del conteo a la probabilidad
Usamos la **frecuencia relativa** como nuestra mejor aproximación de la **probabilidad experimental**. Si en el pasado el **20%** de tus clientes (frecuencia relativa) compró un producto nuevo, podés usar ese valor para **estimar la probabilidad** de que un cliente futuro también lo haga.

## 🃏 Cómo estudiar este tema (tarjetas de repaso)
- **Recuerdo activo:** leé la pregunta e intentá responderla **antes** de ver la respuesta.
- **No te apresures:** si no recordás algo, leé la respuesta, reflexioná y volvé a intentarlo más tarde.
- **Aplicá el concepto:** pensá siempre cómo lo aplicarías a un dataset real (como los de SQL o Power BI).

---
<p align="center">
<a href="./04-analisis-univariado-y-outliers-con-sql.md">⬅️ Anterior</a> · 🏠 <a href="../README.md">Semana 10</a> · <a href="./06-power-bi-service-y-publicacion.md">Siguiente ➡️</a>
</p>
