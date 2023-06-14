SELECT "Creación en una vista" AS descripcion;
-- Forma 5: Creación en una vista
CREATE VIEW IF NOT EXISTS vista1 AS
SELECT v.id_venta,c.id_cliente,c.nombre, v.fecha, p.id_producto,p.producto, dv.cantidad_producto, dv.precio_unitario, dv.total_x_producto
FROM detalle_ventas as dv
INNER JOIN ventas as v ON dv.id_venta = v.id_venta
INNER JOIN clientes as c ON v.id_cliente = c.id_cliente
INNER JOIN productos as p ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

SELECT * FROM vista1 LIMIT 3;

SELECT "3.1 ¿Cuales son los 3 productos más vendidos?" AS descripcion;

SELECT id_producto,producto, precio_unitario, SUM(cantidad_producto) AS cantidad_vendida, SUM(total_x_producto) AS total
FROM vista1
GROUP BY id_producto,producto
ORDER BY cantidad_vendida DESC;


SELECT "3.2 ¿Cuales son los 3 productos qué más dinero han generado?" AS descripcion;

SELECT id_producto,producto, precio_unitario, SUM(cantidad_producto) AS cantidad, SUM(total_x_producto) AS total
FROM vista1
GROUP BY id_producto,producto
ORDER BY total DESC;

SELECT "3.3 ¿Quienes son los 3 clientes qué más dinero han gastado?" AS descripcion;

SELECT id_cliente,nombre, SUM(total_x_producto) AS total
FROM vista1
GROUP BY id_cliente,nombre
ORDER BY total DESC;

SELECT "3.4 ¿Quienes son los 3 clientes qué más productos han comprado?" AS descripcion;

SELECT id_cliente,nombre, SUM(cantidad_producto) AS cantidad
FROM vista1
GROUP BY id_cliente,nombre
ORDER BY cantidad DESC;
