sudo mysql -u root -p

USE CLIENTES;

SELECT
	nombre,
	apellidos,
	edad
FROM clientes
ORDER BY edad DESC
LIMIT 1;
