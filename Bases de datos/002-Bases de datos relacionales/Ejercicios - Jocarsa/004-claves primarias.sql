'''
Claves primarias en la tabla de jugadores

Gustavo Delnardo

Este ejercicio tiene como objetivo practicar la creación de una clave primaria en una tabla SQL.
Se añadirá un identificador único a la tabla de jugadores para asegurar la integridad de los datos y facilitar la gestión de jugadores en un sistema de videojuegos. 
'''

-- 1. Crear la tabla jugadores con clave primaria autoincremental
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    email VARCHAR(100),
    puntos INT
);

-- para alterar una tabla
ALTER TABLE jugadores
ADD COLUMN id_jugador INT AUTO_INCREMENT PRIMARY KEY FIRST;

--FIRST coloca la columna al inicio de la tabla, pero puedes omitirlo si no importa el orden. Si la tabla ya tiene datos, MySQL llenará automáticamente id_jugador con números secuenciales empezando en 1. Si la tabla ya tiene una clave primaria, primero debes eliminarla antes de añadir otra.


-- 2. Insertar algunos jugadores
INSERT INTO jugadores (nombre, apellidos, edad, email, numero_jugador)
VALUES 
(
    'Gustavo',
    'Delnardo',
    35,
    'gustavo1@gmail.com',
    1
),
(
    'Betza',
    'Matheus',
    36,
    NULL,
    2
);


-- 3. Consultar todos los jugadores para ver su identificador único
SELECT * FROM jugadores;


-- La clave primaria "id_jugador" garantiza que cada jugador tenga un identificador único. Esto asegura la integridad de la base de datos y facilita actualizaciones o búsquedas precisas. En el contexto de videojuegos, nos permite gestionar jugadores de manera eficiente y sin errores de duplicidad.

