.mode box
.headers ON

DROP TABLE temporal;

CREATE TABLE IF NOT EXISTS temporal(
    id_temporal integer PRIMARY KEY AUTOINCREMENT,
    valor1 float,
    valor2 float,
    total float as (valor1 * valor2)
);

insert into temporal (valor1,valor2)
values
(2,3),
(20,5),
(23,5),
(45,5);

SELECT id_temporal, valor1, valor2, total
FROM temporal;

SELECT id_temporal, valor1, valor2, total, (valor1 + valor2) AS suma
FROM temporal;

.schema

ALTER TABLE temporal ADD resta float AS (valor1 - valor2);

SELECT id_temporal,valor1, valor2, total, resta
FROM temporal;

.schema

BEGIN TRANSACTION;
    CREATE TEMPORARY TABLE temporal_backup(id_temporal,valor1,valor2);
    INSERT INTO temporal_backup SELECT id_temporal,valor1,valor2 FROM temporal;
    DROP TABLE temporal;
    CREATE TABLE IF NOT EXISTS temporal(
        id_temporal integer PRIMARY KEY AUTOINCREMENT,
        valor1 float,
        valor2 float
    );
    INSERT INTO temporal SELECT id_temporal,valor1,valor2 FROM temporal_backup;
    DROP TABLE temporal_backup;
COMMIT;

SELECT *
FROM temporal;

.schema

