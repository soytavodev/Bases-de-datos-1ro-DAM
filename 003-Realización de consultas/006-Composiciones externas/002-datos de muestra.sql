sudo mysql -u root -p

CREATE DATABASE composiciones;

Use composiciones;

CREATE TABLE alumnos(
	identificador INT PRIMARY KEY,
	nombre VARCHAR(100),
	apellidos VARCHAR(100)
);

CREATE TABLE profsores(
	identificador INT PRIMARY KEY,
	nombre VARCHAR(100),
	apellidos VARCHAR(100)
);

CREATE TABLE asignaturas(
	identificador INT PRIMARY KEY,
	nombre VARCHAR(100),
	id_profesor INT
);

CREATE TABLE matriculas(
	identificador INT PRIMARY KEY,
	id_asignatura INT,
	id_alumno INT
);

USE composiciones;

-- ======================
-- ALUMNOS
-- ======================
INSERT INTO alumnos (identificador, nombre, apellidos) VALUES
(1, 'Lord', 'Valdomero Gaunt'),
(2, 'Gustavo', 'Delnardo Vallejo'),
(3, 'María', 'Torres García'),
(4, 'Javier', 'Santos Rubio'),
(5, 'Rosa', 'Mesa Cabeza'),
(6, 'Carlos', 'Jiménez Prieto'),
(7, 'Tomao', 'Tuyu Kota'),
(8, 'Adrián', 'Morales Suárez'),
(9, 'Paula', 'Herrera Martín'),
(10, 'Rubén', 'Castro Delgado'),
(11, 'Sofía', 'Gómez Serrano'),
(12, 'Bruno', 'Rivas Ortega'),
(13, 'Irene', 'Salas Domínguez'),
(14, 'Armando', 'Cabezas Duran'),
(15, 'Marta', 'Benítez Ramos');

-- ======================
-- PROFESORES
-- ======================
INSERT INTO profsores (identificador, nombre, apellidos) VALUES
(1, 'Antonio', 'López Márquez'),
(2, 'Beatriz', 'Sánchez del Río'),
(3, 'Fernando', 'Romero Aguilar'),
(4, 'Patricia', 'Muñoz Herrera'),
(5, 'Joaquín', 'Navarro Ruiz');

-- ======================
-- ASIGNATURAS
-- ======================
INSERT INTO asignaturas (identificador, nombre, id_profesor) VALUES
(1, 'Matemáticas', 1),
(2, 'Lengua Castellana', 2),
(3, 'Historia de España', 3),
(4, 'Física y Química', 1),
(5, 'Biología', 4),
(6, 'Tecnología', 5),
(7, 'Música', 2),
(8, 'Educación Física', 3),
(9, 'Dibujo Técnico', 5),
(10, 'Inglés', 4);

-- ======================
-- MATRICULAS
-- ======================
INSERT INTO matriculas (identificador, id_asignatura, id_alumno) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 6),
(7, 3, 7),
(8, 4, 8),
(9, 4, 9),
(10, 5, 10),
(11, 5, 11),
(12, 6, 12),
(13, 6, 13),
(14, 7, 14),
(15, 7, 15),
(16, 8, 1),
(17, 8, 3),
(18, 9, 5),
(19, 9, 7),
(20, 10, 2),
(21, 10, 4),
(22, 3, 10),
(23, 4, 11),
(24, 2, 12),
(25, 6, 13),
(26, 8, 14),
(27, 9, 15),
(28, 1, 9),
(29, 5, 8),
(30, 7, 6);

