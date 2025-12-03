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
