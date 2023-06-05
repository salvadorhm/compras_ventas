.mode box
.headers ON

DROP TABLE temporal;

CREATE TABLE IF NOT EXISTS temporal(
    id_temporal integer PRIMARY KEY AUTOINCREMENT,
    valor1 float,
    valor2 float,
    total flaot as (valor1 * valor2)
);

insert into temporal (valor1,valor2)
values
(2,3),
(20,5);

SELECT id_temporal, valor1, valor2, total
FROM temporal;

SELECT id_temporal, valor1, valor2, total, (valor1 + valor2) AS valor1_mas_valor2
FROM temporal;