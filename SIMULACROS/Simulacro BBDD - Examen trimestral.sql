--En este ejercicio trabajamos con dos tablas relacionadas dentro de una base de datos: categoria y pieza. Primero definimos su estructura y luego establecimos la clave foránea para vincularlas correctamente. Después insertamos datos respetando la relación padre-hijo, realizamos una consulta con JOIN para visualizar la información combinada y finalmente creamos una vista para reutilizar esa consulta de forma sencilla.

--Crearemos una base de datos llamada portafolio, para ello abrimos MySQL con el comando:
-- sudo mysql -u root -p

--Al ingresar, creamos la base de datos:
CREATE DATABASE portafolio;
Query OK, 1 row affected (0,02 sec) --Aqui nos avisa que todo esta OK, para asegurarnos revisamos con un SHOW:

SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Empresadam         |
| QuackAttack        |
| biblioteca25       |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |		--Efectivamente se ha creado la base de datos
| sys                |
+--------------------+
9 rows in set (0,01 sec)

--Usamos la base de datos:
USE portafolio;

--Creamos un usuario en nuestra base de datos portafolio
CREATE USER
'yosoytavo'@'localhost'
IDENTIFIED BY 'Hakaishin2.';
--yosoytavo = usuario
--Hakaishin2. = contraseña
Query OK, 0 rows affected (0,03 sec)

--Permite el acceso a este usuario
GRANT USAGE ON *.* TO 'yosoytavo'@'localhost';
Query OK, 0 rows affected (0,02 sec)

--quitale todos los limites que tenga
ALTER USER 'yosoytavo'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;
Query OK, 0 rows affected (0,01 sec)

-- dale acceso a la base de datos portafolio
GRANT ALL PRIVILEGES ON `portafolio`.* 
TO 'yosoytavo'@'localhost';
Query OK, 0 rows affected (0,02 sec)

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;
Query OK, 0 rows affected (0,02 sec)

--verificamos que creamos el usuario:
SELECT user, host FROM mysql.user;

--Creamos una tabla en la que habrá dos entidades:
--Primera entidad: pieza

CREATE TABLE pieza (
	identificador INT AUTO_INCREMENT PRIMARY KEY,
	título VARCHAR(100),
	descripción TEXT,
	imagen VARCHAR(100),
	url VARCHAR(255),
	id_categoria INT
);
Query OK, 0 rows affected (0,07 sec)
--Verificamos con un SHOW:

mysql> SHOW TABLES;
+----------------------+
| Tables_in_portafolio |
+----------------------+
| pieza                | --Se ha creado satisfactoriamente.
+----------------------+
1 row in set (0,00 sec)

--Ahora creamos la clave foránea:
ALTER TABLE pieza
ADD CONSTRAINT fk_pieza_categoria
FOREIGN KEY (id_categoria)
REFERENCES categoria(identificador)
ON UPDATE CASCADE
ON DELETE CASCADE;
Query OK, 0 rows affected (0,09 sec)
Records: 0  Duplicates: 0  Warnings: 0

--hacemos un INSERT para probar:
INSERT INTO pieza (título, descripción, imagen, url, id_categoria)
VALUES
('Figura de dragón', 'Escultura artesanal tallada en madera.', 'dragon.jpg', 'https://ejemplo.com/dragon', 1),
('Paisaje al óleo', 'Pintura de un bosque otoñal.', 'bosque.jpg', 'https://ejemplo.com/bosque', 2),
('Retrato urbano', 'Fotografía tomada en una ciudad de noche.', 'ciudad.jpg', 'https://ejemplo.com/ciudad', 3),
('Personaje fantasy', 'Ilustración digital de un mago en batalla.', 'mago.png', 'https://ejemplo.com/mago', 4);
--Verificamos:
mysql> select * from pieza;
+---------------+-------------------+---------------------------------------------+------------+----------------------------+--------------+
| identificador | título            | descripción                                 | imagen     | url                        | id_categoria |
+---------------+-------------------+---------------------------------------------+------------+----------------------------+--------------+
|             2 | Figura de dragón  | Escultura artesanal tallada en madera.      | dragon.jpg | https://ejemplo.com/dragon |            1 |
|             3 | Paisaje al óleo   | Pintura de un bosque otoñal.                | bosque.jpg | https://ejemplo.com/bosque |            2 |
|             4 | Retrato urbano    | Fotografía tomada en una ciudad de noche.   | ciudad.jpg | https://ejemplo.com/ciudad |            3 |
|             5 | Personaje fantasy | Ilustración digital de un mago en batalla.  | mago.png   | https://ejemplo.com/mago   |            4 |
+---------------+-------------------+---------------------------------------------+------------+----------------------------+--------------+
4 rows in set (0,00 sec)

--Segunda entidad: categoria

CREATE TABLE categoria (
	identificador INT AUTO_INCREMENT PRIMARY KEY,
	título VARCHAR(100),
	descripción TEXT
);
Query OK, 0 rows affected (0,05 sec)

--Verificamos con un SHOW:
mysql> show tables;
+----------------------+
| Tables_in_portafolio |
+----------------------+
| categoria            |
| pieza                |
+----------------------+
2 rows in set (0,00 sec)

--Insertamos:
INSERT INTO categoria (título, descripción)
VALUES
('Esculturas', 'Obras tridimensionales realizadas en diversos materiales.'),
('Pinturas', 'Cuadros realizados en óleo, acrílico u otras técnicas.'),
('Fotografía', 'Imágenes artísticas capturadas con cámara.'),
('Ilustración', 'Dibujos digitales o tradicionales.');
--Verificamos con un SELECT * FROM
mysql> select * from categoria;
+---------------+--------------+-----------------------------------------------------------+
| identificador | título       | descripción                                               |
+---------------+--------------+-----------------------------------------------------------+
|             1 | Esculturas   | Obras tridimensionales realizadas en diversos materiales. |
|             2 | Pinturas     | Cuadros realizados en óleo, acrílico u otras técnicas.    |
|             3 | Fotografía   | Imágenes artísticas capturadas con cámara.                |
|             4 | Ilustración  | Dibujos digitales o tradicionales.                        |
+---------------+--------------+-----------------------------------------------------------+

--ahora, petición cruzada:
SELECT 
    pieza.identificador AS id_pieza,
    pieza.título AS pieza,
    pieza.descripción AS descripción_pieza,
    categoria.identificador AS id_categoria,
    categoria.título AS categoria,
    categoria.descripción AS descripción_categoria
FROM pieza
JOIN categoria
    ON pieza.id_categoria = categoria.identificador;
    
    +----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
| id_pieza | pieza             | descripción_pieza                           | id_categoria | categoria    | descripción_categoria                                     |
+----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
|        2 | Figura de dragón  | Escultura artesanal tallada en madera.      |            1 | Esculturas   | Obras tridimensionales realizadas en diversos materiales. |
|        3 | Paisaje al óleo   | Pintura de un bosque otoñal.                |            2 | Pinturas     | Cuadros realizados en óleo, acrílico u otras técnicas.    |
|        4 | Retrato urbano    | Fotografía tomada en una ciudad de noche.   |            3 | Fotografía   | Imágenes artísticas capturadas con cámara.                |
|        5 | Personaje fantasy | Ilustración digital de un mago en batalla.  |            4 | Ilustración  | Dibujos digitales o tradicionales.                        |
+----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
4 rows in set (0,00 sec)

--ahora la vista:
CREATE VIEW vista_piezas_categorias AS
SELECT 
    pieza.identificador AS id_pieza,
    pieza.título AS pieza,
    pieza.descripción AS descripción_pieza,
    categoria.identificador AS id_categoria,
    categoria.título AS categoria,
    categoria.descripción AS descripción_categoria
FROM pieza
JOIN categoria
    ON pieza.id_categoria = categoria.identificador;

--verificamos con un SELECT * FROM:
mysql> SELECT * FROM vista_piezas_categorias;
+----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
| id_pieza | pieza             | descripción_pieza                           | id_categoria | categoria    | descripción_categoria                                     |
+----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
|        2 | Figura de dragón  | Escultura artesanal tallada en madera.      |            1 | Esculturas   | Obras tridimensionales realizadas en diversos materiales. |
|        3 | Paisaje al óleo   | Pintura de un bosque otoñal.                |            2 | Pinturas     | Cuadros realizados en óleo, acrílico u otras técnicas.    |
|        4 | Retrato urbano    | Fotografía tomada en una ciudad de noche.   |            3 | Fotografía   | Imágenes artísticas capturadas con cámara.                |
|        5 | Personaje fantasy | Ilustración digital de un mago en batalla.  |            4 | Ilustración  | Dibujos digitales o tradicionales.                        |
+----------+-------------------+---------------------------------------------+--------------+--------------+-----------------------------------------------------------+
4 rows in set (0,01 sec)

--Con todo esto, logramos representar una relación real entre categorías y piezas dentro de la base de datos, garantizando integridad referencial con la clave foránea y facilitando futuras consultas gracias a la vista creada. En resumen: tablas conectadas, datos insertados correctamente y relación funcional comprobada con el JOIN.




	
	
	

)
