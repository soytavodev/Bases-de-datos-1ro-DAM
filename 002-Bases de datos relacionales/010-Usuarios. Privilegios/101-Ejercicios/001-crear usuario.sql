-- crea usuario nuevo con contraseña
-- creamos el nombre de usuario que queramos
CREATE USER 
'Gustavo'@'localhost' 
IDENTIFIED  BY 'Hakaishin2.';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO 'Gustavo'@'localhost';
--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, numeros, caracteres, min len

-- quitale todos los limites que tenga
ALTER USER 'Gustavo'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos empresadam
GRANT ALL PRIVILEGES ON [tubasededatos].* 
TO 'Gustavo'@'localhost';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;
