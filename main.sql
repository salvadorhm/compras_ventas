-- Configura SQLite para mostrar cabeceras y trabajar con llaves foraneas
.headers on
.mode box
PRAGMA foreign_keys = ON;

-- Elimina las tablas para reiniciar el script
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS detalle_ventas;
DROP VIEW IF EXISTS vista1;

-- Lee los scripts para la creación de las tablas
.read sql/clientes.sql
.read sql/productos.sql
.read sql/ventas.sql
--.read sql/detalle_ventas.sql
.read sql/detalle_ventas_calculado.sql


-- Configura el modo de visulización en CSV para importar datos
.mode csv

-- Importar archivos CSV para poblar las tablas
.import --skip 1 csv/clientes.csv clientes
.import --skip 1 csv/productos.csv productos
.import --skip 1 csv/ventas.csv ventas
--.import --skip 1 csv/detalle_ventas.csv detalle_ventas
.import csv/detalle_ventas_calculado.csv detalle_ventas_temporal

-- Selecciona los datos de detalle_ventas_temporal y los inserta en detalle_ventas
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario)
SELECT id_venta,id_producto,cantidad_producto,precio_unitario
FROM detalle_ventas_temporal;

-- Elimina la tabla detalle_ventas_temporal
DROP TABLE detalle_ventas_temporal;

-- Configura el modo de visualización en BOX para facilitar la lectura
.mode box

-- Realiza consultas de ventas,clientes,detalle_ventas y productos
.read sql/practica.sql
