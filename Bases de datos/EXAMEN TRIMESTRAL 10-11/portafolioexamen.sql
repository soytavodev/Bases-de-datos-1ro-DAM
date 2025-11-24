'''
Creacion de base de datos portafolioexamen
Gustavo Delnardo

Este ejercicio permite crear una base de datos blog2, con tablas de autores y entradas, relaciones mediante clave foránea, inserción de datos de prueba y la creación de una vista para consultas combinadas.
'''

--creamos la base de datos
CREATE DATABASE portafolioexamen;

--verificamos con un SHOW DATABASES
SHOW DATABASES;

--usamos la base de datos
USE portafolioexamen;

--crearemos dos tablas, la primera 'piezasportafolio'(Identificador,titulo,descripcion,fecha,id_categoria), y 'categoriasportafolio'(Identificador, nombre)

--primera tabla
CREATE TABLE piezasportafolio (
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    descripcion TEXT,
    fecha VARCHAR(100),
    id_categoria INT
);

--verificamos...
SHOW TABLES;

+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| piezasportafolio           |
+----------------------------+
1 row in set (0,00 sec)


--segunda tabla
CREATE TABLE categoriasportafolio (
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)   
);

--verificamos...
SHOW TABLES;

+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriasportafolio       |
| piezasportafolio           |
+----------------------------+
2 rows in set (0,00 sec)


--a continuacion crearemos la clave foranea
ALTER TABLE piezasportafolio
ADD CONSTRAINT pieza_a_categoria
FOREIGN KEY (id_categoria)
REFERENCES categoriasportafolio(identificador)
ON UPDATE CASCADE
ON DELETE CASCADE;

--verificamos...
DESCRIBE piezasportafolio;
Query OK, 0 rows affected (0,14 sec)
Records: 0  Duplicates: 0  Warnings: 0

--hacemos inserts...
INSERT INTO categoriasportafolio (identificador, nombre)
VALUES(
NULL, 
'Esculturas'
),
(
NULL, 
'Pinturas'
);

INSERT INTO piezasportafolio (identificador, titulo, descripcion, fecha, id_categoria)
VALUES(
NULL,
'Figura de dragón', 
'Escultura artesanal tallada en madera.',
'14-05-1980', 
1),
(
NULL,
'Paisaje al óleo', 
'Pintura de un bosque otoñal.',
'21-01-1725', 
2
);

--verificamos si las inserciones son correctas...
SELECT * FROM categoriasportafolio;
+---------------+------------+
| Identificador | nombre     |
+---------------+------------+
|             1 | Esculturas |
|             2 | Pinturas   |
+---------------+------------+
2 rows in set (0,00 sec)

SELECT * FROM piezasportafolio;
+---------------+-------------------+----------------------------------------+------------+--------------+
| Identificador | titulo            | descripcion                            | fecha      | id_categoria |
+---------------+-------------------+----------------------------------------+------------+--------------+
|             7 | Figura de dragón  | Escultura artesanal tallada en madera. | 14-05-1980 |            1 |
|             8 | Paisaje al óleo   | Pintura de un bosque otoñal.           | 21-01-1725 |            2 |
+---------------+-------------------+----------------------------------------+------------+--------------+
2 rows in set (0,00 sec)

--realizamos una actualizacion
UPDATE piezasportafolio
SET titulo = "Figura del mono"
WHERE titulo = "Figura de dragón";

--verificamos...
SELECT * FROM piezasportafolio;
+---------------+------------------+----------------------------------------+------------+--------------+
| Identificador | titulo           | descripcion                            | fecha      | id_categoria |
+---------------+------------------+----------------------------------------+------------+--------------+
|             7 | Figura del mono  | Escultura artesanal tallada en madera. | 14-05-1980 |            1 |
|             8 | Paisaje al óleo  | Pintura de un bosque otoñal.           | 21-01-1725 |            2 |
+---------------+------------------+----------------------------------------+------------+--------------+
2 rows in set (0,00 sec)

--realizamos una eliminacion...
DELETE FROM piezasportafolio
WHERE titulo = "Paisaje al óleo";

---verificamos...
+---------------+-----------------+----------------------------------------+------------+--------------+
| Identificador | titulo          | descripcion                            | fecha      | id_categoria |
+---------------+-----------------+----------------------------------------+------------+--------------+
|             7 | Figura del mono | Escultura artesanal tallada en madera. | 14-05-1980 |            1 |
+---------------+-----------------+----------------------------------------+------------+--------------+
1 row in set (0,00 sec)


--ahora peticion cruzada
SELECT 
    piezasportafolio.identificador AS id_piezasportafolio,
    piezasportafolio.titulo AS piezasportafolio,
    piezasportafolio.descripcion AS descripcion_piezasportafolio,
    piezasportafolio.fecha AS fecha_piezasportafolio,
    categoriasportafolio.identificador AS id_categoriasportafolio,
    categoriasportafolio.nombre AS categoriasportafolio
FROM piezasportafolio
JOIN categoriasportafolio
    ON piezasportafolio.id_categoria = categoriasportafolio.identificador;
    
+---------------------+------------------+----------------------------------------+------------------------+-------------------------+----------------------+
| id_piezasportafolio | piezasportafolio | descripcion_piezasportafolio           | fecha_piezasportafolio | id_categoriasportafolio | categoriasportafolio |
+---------------------+------------------+----------------------------------------+------------------------+-------------------------+----------------------+
|                   7 | Figura del mono  | Escultura artesanal tallada en madera. | 14-05-1980             |                       1 | Esculturas           |
+---------------------+------------------+----------------------------------------+------------------------+-------------------------+----------------------+
1 row in set (0,00 sec)

--la vista
CREATE VIEW vista_piezasportafolio_categoriasportafolio AS
SELECT 
    piezasportafolio.identificador AS id_piezasportafolio,
    piezasportafolio.titulo AS piezasportafolio,
    piezasportafolio.descripcion AS descripcion_piezasportafolio,
    categoriasportafolio.identificador AS id_categoriaportafolio,
    categoriasportafolio.nombre AS categoriasportafolio
FROM piezasportafolio
JOIN categoriasportafolio
    ON piezasportafolio.id_categoria = categoriasportafolio.identificador;

--verificamos
SELECT * FROM vista_piezasportafolio_categoriasportafolio;
+---------------------+------------------+----------------------------------------+------------------------+----------------------+
| id_piezasportafolio | piezasportafolio | descripcion_piezasportafolio           | id_categoriaportafolio | categoriasportafolio |
+---------------------+------------------+----------------------------------------+------------------------+----------------------+
|                   7 | Figura del mono  | Escultura artesanal tallada en madera. |                      1 | Esculturas           |
+---------------------+------------------+----------------------------------------+------------------------+----------------------+
1 row in set (0,00 sec)

--creamos el usuario y le damos acceso a la base de datos portafolioexamen
--Creamos un usuario en nuestra base de datos portafolio
CREATE USER
'gustavo'@'localhost'
IDENTIFIED BY 'Hakaishin2.';
--gustavo = usuario
--Hakaishin2. = contraseña
Query OK, 0 rows affected (0,03 sec)

--Permite el acceso a este usuario
GRANT USAGE ON *.* TO 'gustavo'@'localhost';
Query OK, 0 rows affected (0,02 sec)

--quitale todos los limites que tenga
ALTER USER 'gustavo'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;
Query OK, 0 rows affected (0,01 sec)

-- dale acceso a la base de datos portafolioexamen
GRANT ALL PRIVILEGES ON `portafolioexamen`.* 
TO 'gustavo'@'localhost';
Query OK, 0 rows affected (0,02 sec)

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;
Query OK, 0 rows affected (0,02 sec)

--verificamos que creamos el usuario:
SELECT user, host FROM mysql.user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| [soytavo]        | localhost |
| debian-sys-maint | localhost |
| empresadam       | localhost |
| gustavo          | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
| yosoytavo        | localhost |
+------------------+-----------+
9 rows in set (0,00 sec)

--Este ejercicio integra tablas, relaciones, inserciones, consultas cruzadas y vistas, consolidando el manejo de bases de datos relacionales. La clave foránea mantiene la integridad referencial, evitando entradas huérfanas. Las vistas simplifican consultas repetitivas y facilitan el acceso a información combinada de varias tablas.
