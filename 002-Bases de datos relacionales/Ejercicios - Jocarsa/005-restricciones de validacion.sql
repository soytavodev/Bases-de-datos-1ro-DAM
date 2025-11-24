'''
Restricciones de Validación en Base de Datos - Clientes y Productos

Gustavo Delnardo

Se practica DESCRIBE, ALTER TABLE, creación de columnas, renombrado de columnas y creación de restricciones CHECK complejas.
'''

-- 0. Crear y usar la base de datos nueva
CREATE DATABASE IF NOT EXISTS empresadam;
USE empresadam;

-- 1. Crear la tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni VARCHAR(20),
    email VARCHAR(100)
);

-- 2. Revisar la estructura de la tabla
DESCRIBE clientes;

-- 3. Añadir una nueva columna "direccion" y luego eliminarla
ALTER TABLE clientes ADD COLUMN direccion VARCHAR(255);
DESCRIBE clientes;
ALTER TABLE clientes DROP COLUMN direccion;
DESCRIBE clientes;

-- 4. Renombrar columna dni a dninie
ALTER TABLE clientes CHANGE dni dninie VARCHAR(20);

-- 5. Crear restricción que valide DNI y NIE
ALTER TABLE clientes
  ADD CONSTRAINT comprobar_dni_nie_letra
  CHECK (
    (
      -- DNI: 8 dígitos + letra
      dninie REGEXP '^[0-9]{8}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dninie, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (CAST(SUBSTRING(dninie, 1, 8) AS UNSIGNED) MOD 23) + 1,
                1)
    )
    OR
    (
      -- NIE: X/Y/Z + 7 dígitos + letra
      dninie REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$'
      AND
      UPPER(SUBSTRING(dninie, 9, 1)) =
      SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
                (
                  CAST(CONCAT(
                        CASE UPPER(SUBSTRING(dninie, 1, 1))
                          WHEN 'X' THEN '0'
                          WHEN 'Y' THEN '1'
                          WHEN 'Z' THEN '2'
                        END,
                        SUBSTRING(dninie, 2, 7)
                  ) AS UNSIGNED) MOD 23
                ) + 1,
                1)
    )
  );

-- 6. Crear tabla productos con restricciones
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(7,2) NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT chk_nombre_longitud CHECK (CHAR_LENGTH(nombre) >= 5),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0),
    CONSTRAINT chk_precio_maximo CHECK (precio <= 5000),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0)
);

-- 7. Insertar registros de ejemplo en productos
INSERT INTO productos (nombre, descripcion, precio, stock) 
VALUES(
'Patito Clásico', 
'El patito de goma amarillo tradicional.',
 3.50,
  120
),
(
'Espada de Madera', 
'Espada básica para principiantes.',
 15.00, 
 50
),
(
'Poción Curativa',
'Recupera 50 puntos de vida.',
 7.25, 
 200
);

-- 8. Consultar productos
SELECT * FROM productos;

-- 9. Consultar clientes (para ver la tabla vacía antes de insertar)
SELECT * FROM clientes;


-- Este ejercicio permitió practicar DESCRIBE, ALTER TABLE, creación de columnas, renombrado de columnas y la implementación de restricciones CHECK complejas. También creamos una tabla de productos con restricciones de longitud, precio y stock, demostrando la aplicación práctica de validaciones en bases de datos relacionales. Practicar estos pasos asegura la integridad y consistencia de los datos en cualquier sistema de gestión de información.

