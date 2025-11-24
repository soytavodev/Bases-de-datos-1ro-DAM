Creación de tablas, relaciones y vistas en MySQL
'''
Gustavo Delnardo

Este ejercicio permite crear una base de datos blog2, con tablas de autores y entradas, relaciones mediante clave foránea, inserción de datos de prueba y la creación de una vista para consultas combinadas.
'''

-- 1. Crear la base de datos y usarla
CREATE DATABASE IF NOT EXISTS blog2;
USE blog2;

-- 2. Crear tabla autores
CREATE TABLE IF NOT EXISTS autores (
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- 3. Verificar la creación de la tabla autores
SHOW TABLES;
DESCRIBE autores;

-- 4. Insertar un autor de prueba
INSERT INTO autores VALUES (
NULL, 
'Gustavo', 
'Delnardo', 
'gustavo1@gmail.com'
);

-- 5. Verificar la inserción
SELECT * FROM autores;

-- 6. Crear tabla entradas
CREATE TABLE IF NOT EXISTS entradas (
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    imagen VARCHAR(255),
    id_autor INT,
    contenido TEXT,
    FOREIGN KEY (id_autor) REFERENCES autores(Identificador)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Verificar la creación de la tabla entradas
SHOW TABLES;
DESCRIBE entradas;

-- 8. Insertar una entrada de prueba
INSERT INTO entradas VALUES (
    NULL,
    'Titulo de la primera entrada',
    '2025-11-03',
    'imagen.jpg',
    1,
    'Este es el contenido de la primera entrada'
);

-- 9. Verificar la inserción
SELECT * FROM entradas;

-- 10. Realizar una petición cruzada entre entradas y autores
SELECT 
    entradas.titulo,
    entradas.fecha,
    entradas.imagen,
    entradas.contenido,
    autores.nombre,
    autores.apellidos
FROM entradas
LEFT JOIN autores ON entradas.id_autor = autores.Identificador;

-- 11. Crear una vista que combine entradas y autores
CREATE OR REPLACE VIEW vista_entradas AS
SELECT 
    entradas.titulo,
    entradas.fecha,
    entradas.imagen,
    entradas.contenido,
    autores.nombre,
    autores.apellidos
FROM entradas
LEFT JOIN autores ON entradas.id_autor = autores.Identificador;

-- 12. Verificar la vista
SELECT * FROM vista_entradas;


--Este ejercicio integra tablas, relaciones, inserciones, consultas cruzadas y vistas, consolidando el manejo de bases de datos relacionales. La clave foránea mantiene la integridad referencial, evitando entradas huérfanas. Las vistas simplifican consultas repetitivas y facilitan el acceso a información combinada de varias tablas.
