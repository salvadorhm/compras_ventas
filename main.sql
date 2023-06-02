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

SELECT ventas.id_venta,clientes.nombre, ventas.fecha, productos.producto, detalle_ventas.cantidad_producto, detalle_ventas.precio_unitario, detalle_ventas.total_x_producto
FROM detalle_ventas
INNER JOIN ventas ON detalle_ventas.id_venta = ventas.id_venta
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON detalle_ventas.id_producto = productos.id_producto
ORDER BY ventas.id_venta;

