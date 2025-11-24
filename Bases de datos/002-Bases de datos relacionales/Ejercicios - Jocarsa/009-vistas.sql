'''
Creación de vistas en bases de datos relacionales

Gustavo Delnardo

Este ejercicio enseña cómo crear una vista llamada personas_correos que combina información
de las tablas personas y emails. La vista actúa como una tabla virtual, facilitando el acceso a datos combinados.
'''

-- 1. Usar la base de datos existente
USE ejemploclaves;

-- 2. Crear la vista personas_correos
CREATE OR REPLACE VIEW personas_correos AS
SELECT 
    p.id_persona,
    p.nombre,
    p.apellidos,
    e.email
FROM personas p
LEFT JOIN emails e ON p.id_persona = e.id_persona;

-- 3. Consultar la vista para verificar su contenido
SELECT * FROM personas_correos;


--Las vistas simplifican el acceso a datos complejos y mejoran la legibilidad de consultas frecuentes. Nos permiten reutilizar consultas sin reescribir código SQL cada vez. Practicar vistas ayuda a organizar información de múltiples tablas y facilita reportes o análisis.

