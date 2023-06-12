# Columnas Generadas y Columnas Calculadas

Introducción a las Columnas Generadas y Columnas Calculadas en SQL

En SQL, tanto las columnas generadas como las columnas calculadas son herramientas poderosas que nos permiten trabajar con datos de manera más eficiente y flexible en nuestras bases de datos. Estas columnas adicionales nos brindan la capacidad de obtener información adicional o transformada a partir de los datos existentes en nuestras tablas.

Las columnas generadas son aquellas que se definen en la estructura de la tabla y cuyos valores se generan automáticamente por el motor de la base de datos. Estas columnas se crean utilizando una expresión o una regla, y se almacenan físicamente en la tabla. Los valores de las columnas generadas se actualizan automáticamente cuando se insertan, actualizan o eliminan registros en la tabla, lo que proporciona datos actualizados y coherentes en todo momento.

Por otro lado, las columnas calculadas son columnas virtuales que se generan dinámicamente durante la ejecución de una consulta. A diferencia de las columnas generadas, las columnas calculadas no se almacenan físicamente en la base de datos. En cambio, los valores se calculan en tiempo real utilizando expresiones o funciones definidas en la consulta. Estas columnas nos permiten realizar cálculos complejos, combinar datos de diferentes columnas o aplicar transformaciones lógicas o matemáticas a los datos para obtener resultados significativos.

Tanto las columnas generadas como las columnas calculadas nos brindan ventajas en términos de flexibilidad y eficiencia. Nos permiten agregar columnas adicionales a nuestras tablas para obtener información adicional o transformada sin tener que modificar directamente la estructura de la tabla. Esto facilita la adaptación de nuestras consultas a diferentes necesidades de análisis o presentación de datos.

En resumen, las columnas generadas y las columnas calculadas son herramientas poderosas en SQL que nos permiten trabajar con datos de manera más eficiente y flexible. Ya sea generando automáticamente valores en función de expresiones o reglas en la estructura de la tabla, o calculando dinámicamente valores en tiempo real durante la ejecución de una consulta, estas columnas adicionales nos brindan mayor control y capacidad de análisis en nuestras bases de datos.

CREATE TABLE IF NOT EXISTS temporal(
    id_temporal integer PRIMARY KEY AUTOINCREMENT,
    valor1 float,
    valor2 float,
    total float as (valor1 * valor2)
);