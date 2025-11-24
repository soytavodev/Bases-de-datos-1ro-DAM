'''
Inserción, actualización y eliminación de registros en MySQL

Gustavo Delnardo

Este ejercicio enseña cómo insertar, modificar y eliminar registros en una tabla clientes,
así como realizar una copia de seguridad de la base de datos.
'''

-- 1. Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS empresadam;
USE empresadam;

-- 2. Crear la tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    localidad VARCHAR(50)
);

-- 3. Insertar un nuevo cliente
INSERT INTO clientes (nombre, apellidos, telefono, email, localidad)
VALUES 
('Gustavo', 
'Delnardo', 
'123456789', 
'gustavo1@gmail.com', 
'Valencia'
);

-- 4. Verificar la inserción
SELECT * FROM clientes;

-- 5. Actualizar el nombre del cliente insertado
UPDATE clientes
SET nombre = 'Gustavo Alejandro'
WHERE id = 1;

-- 6. Verificar la actualización
SELECT * FROM clientes;

-- 7. Eliminar el cliente actualizado
DELETE FROM clientes
WHERE id = 1;

-- 8. Verificar la eliminación
SELECT * FROM clientes;

-- 9. Copia de seguridad de la base de datos (ejecutar en terminal, mysqldump -u root -p empresadam > /home/tavo/Escritorio/DAM/1roDAM/Bases de datos/004-Tratamiento de datos/Ejercicios - Jocarsa/001-insercion, borrado y modificacion de registros - sql/

--La inserción, actualización y eliminación de registros son operaciones fundamentales en cualquier aplicación de base de datos, incluyendo aplicaciones de videojuegos o música. Practicar estas operaciones garantiza poder mantener y gestionar los datos de manera correcta y segura. La copia de seguridad protege la información y es una práctica esencial antes de realizar cambios importantes en producción.

