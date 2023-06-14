# Practica
Con base en la siguiente vista, crea una consulta por cada una de las siguiente preguntas:
1. ¿Cuales son los 3 productos más vendidos?
2. ¿Cuales son los 3 productos qué más dinero han generado?
3. ¿Quienes son los 3 clientes qué más dinero han gastado?
4. ¿Quienes son los 3 clientes qué más productos han comprado?:

CREATE VIEW IF NOT EXISTS vista1 AS
SELECT v.id_venta,c.nombre, v.fecha, p.id_producto,p.producto, dv.cantidad_producto, dv.precio_unitario, dv.total_x_producto
FROM detalle_ventas as dv
INNER JOIN ventas as v ON dv.id_venta = v.id_venta
INNER JOIN clientes as c ON v.id_cliente = c.id_cliente
INNER JOIN productos as p ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

a