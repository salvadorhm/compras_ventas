CREATE TABLE IF NOT EXISTS temporal(
    id_temporal integer PRIMARY KEY AUTOINCREMENT,
    valor1 float,
    valor2 float,
    total float as (valor1 * valor2) VIRTUAL
);

.import --csv datos.csv t

INSERT INTO temporal(valor1, valor2)
SELECT valor1,valor2
FROM t;

DROP TABLE t;