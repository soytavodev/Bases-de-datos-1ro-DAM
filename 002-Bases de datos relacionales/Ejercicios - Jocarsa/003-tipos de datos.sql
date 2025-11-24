'''
Ejercicio: Gestión de jugadores de videojuegos

Gustavo Delnardo

En este ejercicio vamos a crear una tabla para gestionar jugadores de un club de videojuegos. Aprenderemos a elegir tipos de datos adecuados para cada campo, usando VARCHAR para texto y INT para números. Esto nos ayudará a organizar y recuperar datos correctamente en una base de datos relacional.
'''

-- Antes que nada, tener la base de datos creada, para lo cual
CREATE DATABASE jugadores;

-- luego usamos dicha base de datos
USE jugadores;

-- 1. Crear la tabla de jugadores
CREATE TABLE jugadores (
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    email VARCHAR(100),
    numero_jugador INT
);

-- 2. Insertar un jugador
INSERT INTO jugadores (nombre, apellidos, email)
VALUES (
'Fredo Godofredo',
'García Jimenez',
'fg@gmail.com.com'
);

-- 3. modificar elementos de la tabla
UPDATE jugadores
SET email = 'fg@gmail.com'
WHERE nombre = 'Fredo Godofredo' AND apellidos = 'García Jimenez';


-- 4. Consultar el jugador
SELECT * FROM jugadores;

--Hemos aprendido a usar VARCHAR para almacenar texto y INT para números enteros en SQL. Crear, insertar y consultar datos con tipos apropiados nos asegura consistencia y eficiencia. Este ejercicio refuerza la importancia de elegir correctamente los tipos de datos en bases de datos relacionales.


