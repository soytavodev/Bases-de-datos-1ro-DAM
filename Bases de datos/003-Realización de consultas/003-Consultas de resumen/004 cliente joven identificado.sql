sudo mysql -u root -p

USE CLIENTES;

SELECT
	nombre,
	apellidos,
	edad
FROM clientes
ORDER BY edad ASC
LIMIT 1;
