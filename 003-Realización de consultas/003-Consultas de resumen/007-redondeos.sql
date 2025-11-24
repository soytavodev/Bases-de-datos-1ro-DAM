--sudo mysql -u root -p

USE CLIENTES;

SELECT
	ROUND (AVG (edad))
FROM clientes;

SELECT
	FLOOR (AVG (edad))
FROM clientes;

SELECT
	CEIL (AVG (edad))
FROM clientes;

