-- Configura SQLite para mostrar cabeceras y trabajar con llaves foraneas
.headers on
.mode box
PRAGMA foreign_keys = ON;

-- Lee los scripts para la creación de las tablas
.read sql/clientes.sql
.read sql/productos.sql
.read sql/ventas.sql
.read sql/detalle_ventas.sql

-- Configura el modo de visulización en CSV para importar datos
.mode csv

-- Importar archivos CSV para poblar las tablas
.import --skip 1 csv/clientes.csv clientes
.import --skip 1 csv/productos.csv productos
.import --skip 1 csv/ventas.csv ventas
.import --skip 1 csv/detalle_ventas.csv detalle_ventas

-- Configura el modo de visualización en BOX para facilitar la lectura
.mode box

-- Forma 1: Une las tablas de clientes, ventas, detalle_ventas y productos
SELECT ventas.id_venta, clientes.nombre, ventas.fecha, productos.producto, detalle_ventas.cantidad_producto,detalle_ventas.precio_unitario,detalle_ventas.total_x_producto 
FROM clientes,ventas,detalle_ventas, productos
WHERE clientes.id_cliente = ventas.id_cliente
AND ventas.id_venta = detalle_ventas.id_venta
AND detalle_ventas.id_producto = productos.id_producto
ORDER BY ventas.id_venta;

-- Forma 2: Alias Une las tablas de clientes, ventas, detalle_ventas y productos
SELECT v.id_venta, c.nombre, v.fecha, p.producto, dv.cantidad_producto,dv.precio_unitario,dv.total_x_producto 
FROM clientes as c,ventas as v,detalle_ventas as dv, productos as p
WHERE c.id_cliente = v.id_cliente
AND v.id_venta = dv.id_venta
AND dv.id_producto = p.id_producto
ORDER BY v.id_venta;

-- Forma 3: Une las tablas de clientes, ventas, detalle_ventas y productos
SELECT ventas.id_venta, clientes.nombre, ventas.fecha, productos.producto, detalle_ventas.cantidad_producto,detalle_ventas.precio_unitario,detalle_ventas.total_x_producto 
FROM detalle_ventas
INNER JOIN ventas ON detalle_ventas.id_venta = ventas.id_venta
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON detalle_ventas.id_producto = productos.id_producto
ORDER BY ventas.id_venta;

-- Forma 4: Une las tablas de clientes, ventas, detalle_ventas y productos
SELECT v.id_venta,c.nombre, v.fecha, p.producto, dv.cantidad_producto, dv.precio_unitario, dv.total_x_producto
FROM detalle_ventas as dv
INNER JOIN ventas as v ON dv.id_venta = v.id_venta
INNER JOIN clientes as c ON v.id_cliente = c.id_cliente
INNER JOIN productos as p ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

-- Forma 5: Creación en una vista
CREATE VIEW IF NOT EXISTS vista1 AS
SELECT v.id_venta,c.nombre, v.fecha, p.producto, dv.cantidad_producto, dv.precio_unitario, dv.total_x_producto
FROM detalle_ventas as dv
INNER JOIN ventas as v ON dv.id_venta = v.id_venta
INNER JOIN clientes as c ON v.id_cliente = c.id_cliente
INNER JOIN productos as p ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

-- Muestra las 3 primeras ventas
SELECT * FROM vista1 LIMIT 3;

-- Muestra las 10 primeras ventas con un mayor total_x_producto
SELECT * FROM vista1 ORDER BY total_x_producto DESC LIMIT 10;
