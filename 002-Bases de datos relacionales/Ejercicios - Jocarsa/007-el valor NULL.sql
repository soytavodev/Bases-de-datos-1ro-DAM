'''
Práctica del valor NULL en la tabla pedidos

Gustavo Delnardo

Este ejercicio permite practicar cómo insertar y consultar valores NULL en una tabla de pedidos. Se demostrará cómo los campos pueden aceptar ausencia de datos y cómo se almacenan en MySQL.
'''

-- 1. Conectar a MySQL (en terminal, sudo mysql -u root -p

-- 2. Mostrar bases de datos
SHOW DATABASES;

-- 3. Usar la base de datos empresadam
USE empresadam;

-- 4. Verificar las tablas existentes
SHOW TABLES;

-- 5. Crear la tabla pedidos si no existe
CREATE TABLE IF NOT EXISTS pedidos (
    numerodepedido VARCHAR(10) PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    producto VARCHAR(100),
    fecha DATE
);

-- 6. Insertar pedidos con valores NULL
INSERT INTO pedidos (numerodepedido, cliente, producto, fecha) 
VALUES(
'P001', 
'Cliente A', 
NULL, 
NULL
),
(
'P002', 
'Cliente B', 
'Producto X', 
NULL
),
('P003', 
'Cliente C', 
NULL, 
'2025-11-10'
);

-- 7. Consultar la tabla para verificar los NULLs
SELECT * FROM pedidos;

-- 8. Insertar más pedidos con distintos campos nulos para práctica
INSERT INTO pedidos (numerodepedido, cliente, producto, fecha) 
VALUES(
'P004', 
'Cliente D', 
NULL, 
'2025-11-12'
),
(
'P005', 
'Cliente E', 
'Producto Y', 
NULL
);

-- 9. Consultar nuevamente la tabla
SELECT * FROM pedidos;


--Los valores NULL permiten almacenar datos no definidos o ausentes. Saber manejar NULL es fundamental para consultas correctas y evitar errores en operaciones como JOIN, WHERE o funciones agregadas. Practicar con distintas combinaciones de campos NULL  ayudará a comprender cómo MySQL maneja estos casos.
