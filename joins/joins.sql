.headers ON
.mode box

CREATE TABLE IF NOT EXISTS clientes(
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre text,
    email text
);

CREATE TABLE IF NOT EXISTS ventas(
    id_venta integer PRIMARY KEY AUTOINCREMENT,
    id_cliente integet REFERENCES clientes(id_cliente),
    fecha text
);


INSERT INTO clientes(nombre,email)
VALUES
('Dejah','dejah@email.com'),
('John','john@email.com'),
('Carthoris','carthoris@email.com');

INSERT INTO ventas(id_cliente,fecha)
VALUES
(2,"6/6/2023"),
(2,"7/6/2023"),
(1,"8/6/2023"),
(1,"9/6/2023"),
(1,"9/6/2023");

SELECT clientes.id_cliente,clientes.nombre,ventas.id_venta,ventas.fecha
FROM clientes, ventas
WHERE clientes.id_cliente = ventas.id_cliente;


SELECT clientes.id_cliente,clientes.nombre,ventas.id_venta,ventas.fecha
FROM clientes
JOIN ventas ON clientes.id_cliente = ventas.id_cliente;
