'''
Práctica de claves ajenas

Gustavo Delnardo

Este ejercicio permite crear dos tablas relacionadas mediante claves ajenas (foreign keys) y realizar consultas cruzadas (JOIN) para combinar información entre tablas.
'''

-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS ejemploclaves;

USE ejemploclaves;

-- 2. Crear tabla personas con clave primaria
CREATE TABLE IF NOT EXISTS personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL
);

-- 3. Insertar un registro en personas
INSERT INTO personas (nombre, apellidos) 
VALUES(
'Gustavo', 
'Delnardo'
);

-- 4. Crear tabla emails
CREATE TABLE IF NOT EXISTS emails (
    id_email INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL    
);

-- 5. Agregar columna persona como clave ajena
ALTER TABLE emails
ADD COLUMN id_persona INT,
ADD CONSTRAINT fk_persona_email FOREIGN KEY (id_persona) REFERENCES personas(id_persona);

-- 6. Insertar registros en emails relacionados con personas existentes
INSERT INTO emails (email, id_persona) 
VALUES(
'gustavo.delnardo@gmail.com',
 1
 ),
(
'gustavo1@gmail.com', 
1
);

-- 7. Realizar una petición cruzada para combinar datos de personas y emails
SELECT p.id_persona, p.nombre, p.apellidos, e.email
FROM personas p
LEFT JOIN emails e ON p.id_persona = e.id_persona;

--Las claves ajenas permiten relacionar tablas de manera segura y mantener integridad de los datos. Usarlas correctamente evita inconsistencias, como emails asociados a personas inexistentes. Las consultas cruzadas (JOIN) muestran cómo combinar información de varias tablas, herramienta esencial en bases de datos relacionales.


