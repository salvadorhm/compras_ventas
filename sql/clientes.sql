CREATE TABLE IF NOT EXISTS clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);

CREATE UNIQUE INDEX IF NOT EXISTS index_clientes_email ON clientes(email);

