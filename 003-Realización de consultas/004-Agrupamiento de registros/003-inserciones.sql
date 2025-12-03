CREATE TABLE productos(
	nombre VARCHAR(255),
	precio DECIMAL(10,2),
	categoria VARCHAR(255),
	peso DECIMAL(10,2),
	stock INT,
	color VARCHAR(100)
);

INSERT INTO productos (nombre, precio, categoria, peso, stock, color) VALUES
('Teclado Mecánico HX', 79.99, 'Electrónica', 0.90, 10, 'Negro'),
('Ratón Gamer Ultra', 49.90, 'Electrónica', 0.20, 5, 'Negro'),
('Monitor FullHD 24"', 129.99, 'Electrónica', 3.50, 15, 'Negro'),
('Altavoz Bluetooth Pro', 39.99, 'Electrónica', 0.50, 10, 'Azul'),
('Auriculares Bass+', 29.99, 'Electrónica', 0.25, 10, 'Blanco'),

('Camiseta Oversize', 19.99, 'Ropa', 0.30, 20, 'Negro'),
('Sudadera Hoodie', 34.99, 'Ropa', 0.70, 10, 'Azul'),
('Pantalón Jogger', 24.90, 'Ropa', 0.60, 8, 'Gris'),
('Chaqueta Softshell', 59.99, 'Ropa', 0.90, 5, 'Negro'),
('Calcetines Pack x5', 9.99, 'Ropa', 0.10, 20, 'Blanco'),

('Galletas ChocoMax', 2.50, 'Alimentos', 0.30, 30, 'Marrón'),
('Café Premium 500g', 6.99, 'Alimentos', 0.50, 15, 'Marrón'),
('Té Verde Natural', 3.99, 'Alimentos', 0.20, 25, 'Verde'),
('Aceite de Oliva 1L', 4.99, 'Alimentos', 1.00, 10, 'Amarillo'),
('Pasta Integral 1kg', 1.70, 'Alimentos', 1.00, 40, 'Marrón'),

('Silla de Oficina Pro', 149.99, 'Muebles', 12.00, 5, 'Negro'),
('Mesa Gaming LED', 199.99, 'Muebles', 25.00, 3, 'Negro'),
('Estantería 5 Niveles', 59.99, 'Muebles', 10.00, 7, 'Blanco'),
('Lámpara Escritorio', 19.99, 'Muebles', 1.20, 15, 'Blanco'),
('Sillón Relax XL', 299.99, 'Muebles', 30.00, 2, 'Gris'),

('Pelota de Fútbol Pro', 19.99, 'Deporte', 0.45, 20, 'Blanco'),
('Mancuernas 5kg x2', 29.99, 'Deporte', 10.00, 10, 'Negro'),
('Cinta Elástica Pro', 12.99, 'Deporte', 0.20, 25, 'Azul'),
('Botella Deportiva 1L', 8.99, 'Deporte', 0.30, 50, 'Azul'),
('Guantes de Boxeo', 34.99, 'Deporte', 0.80, 5, 'Rojo'),

('Sofá 3 Plazas Lima', 499.99, 'Muebles', 40.00, 2, 'Gris'),
('Camiseta Deportiva DRY', 14.99, 'Ropa', 0.20, 20, 'Azul'),
('Teclado Office', 15.99, 'Electrónica', 0.60, 12, 'Blanco'),
('Ratón Óptico', 9.99, 'Electrónica', 0.15, 30, 'Blanco'),
('Auriculares Studio', 79.99, 'Electrónica', 0.40, 7, 'Negro'),

('Pan Multicereal', 1.50, 'Alimentos', 0.40, 20, 'Marrón'),
('Cereal Crunchy', 3.20, 'Alimentos', 0.35, 18, 'Amarillo'),
('Café Descafeinado', 5.50, 'Alimentos', 0.50, 12, 'Marrón'),
('Pantalón Cargo', 29.99, 'Ropa', 0.75, 6, 'Verde'),
('Botines Trekking', 69.99, 'Ropa', 1.20, 4, 'Marrón'),

('Mesa de Noche', 39.99, 'Muebles', 6.00, 9, 'Blanco'),
('Lámpara LED RGB', 24.99, 'Electrónica', 0.70, 10, 'Azul'),
('Reloj Deportivo X', 59.99, 'Electrónica', 0.25, 6, 'Negro'),
('Banda de Resistencia', 7.99, 'Deporte', 0.10, 30, 'Verde'),
('Rueda Abdominal', 14.99, 'Deporte', 0.50, 12, 'Negro');

