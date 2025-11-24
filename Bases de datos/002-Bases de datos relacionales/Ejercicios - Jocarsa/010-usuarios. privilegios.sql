'''
Gestión de usuarios y privilegios en MySQL

Autor: Gustavo Delnardo

Este ejercicio enseña cómo mostrar los usuarios existentes, crear un nuevo usuario, asignarle privilegios y verificar que los cambios se aplicaron correctamente.
'''

-- 1. Mostrar usuarios existentes en el sistema
SELECT User, Host FROM mysql.user;

-- 2. Crear un nuevo usuario
-- Reemplaza 'usuario_nuevo', 'localhost' y 'tu_contraseña' por los valores que desees
CREATE USER 'tavo'@'localhost' IDENTIFIED BY 'Hakaishin2.';

-- 3. Dar acceso general básico al usuario (sin permisos especiales)
GRANT USAGE ON *.* TO 'tavo'@'localhost';

-- 4. Quitar límites de uso que pueda tener el usuario
ALTER USER 'tavo'@'localhost'
REQUIRE NONE
WITH MAX_QUERIES_PER_HOUR 0
MAX_CONNECTIONS_PER_HOUR 0
MAX_UPDATES_PER_HOUR 0
MAX_USER_CONNECTIONS 0;

-- 5. Asignar privilegios completos sobre la base de datos empresadam
GRANT ALL PRIVILEGES ON empresadam.* TO 'tavo'@'localhost';

-- 6. Recargar la tabla de privilegios para aplicar cambios
FLUSH PRIVILEGES;

-- 7. Verificar que el usuario se creó correctamente
SELECT User, Host FROM mysql.user;


--Entender cómo crear usuarios y otorgar privilegios es crucial para la seguridad y gestión de bases de datos. La práctica de estos comandos te permite gestionar quién puede acceder a qué información y con qué nivel de permisos. Esta habilidad es fundamental en proyectos reales donde la integridad y seguridad de los datos deben ser garantizadas.
