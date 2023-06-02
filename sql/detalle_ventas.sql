CREATE TABLE IF NOT EXISTS detalle_ventas(
    id_detalle_venta integer PRIMARY KEY AUTOINCREMENT,
    id_venta integer REFERENCES ventas(id_venta),
    id_producto integer REFERENCES productos(id_producto),
    cantidad_producto integer,
    precio_unitario float,
    total_x_producto float
);
