CREATE TABLE IF NOT EXISTS temporal(
    id_temporal integer PRIMARY KEY AUTOINCREMENT,
    valor1 float,
    valor2 float,
    total float GENERATED ALWAYS AS (valor1 * valor2) STORED
);

.import --csv datos.csv t

INSERT INTO temporal(valor1, valor2)
SELECT valor1,valor2
FROM t;

DROP TABLE t;
