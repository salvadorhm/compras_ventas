.headers on
.mode box
PRAGMA foreign_keys = ON;

.read sql/clientes.sql
.read sql/productos.sql
.read sql/ventas.sql
.read sql/detalle_ventas.sql

.mode csv

.import --skip 1 csv/clientes.csv clientes
.import --skip 1 csv/productos.csv productos
.import --skip 1 csv/ventas.csv ventas 
.import --skip 1 csv/detalle_ventas.csv detalle_ventas

.mode box

SELECT v.id_venta,c.nombre, v.fecha, p.producto, dv.cantidad_producto, dv.precio_unitario, dv.total_x_producto
FROM detalle_ventas as dv
INNER JOIN ventas as v ON dv.id_venta = v.id_venta
INNER JOIN clientes as c ON v.id_cliente = c.id_cliente
INNER JOIN productos as p ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

