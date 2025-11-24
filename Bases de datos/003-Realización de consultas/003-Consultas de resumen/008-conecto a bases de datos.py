import mysql.connector 

conexion = mysql.connector.connect(
  host="localhost",
  user="Gustavo",
  password="Hakaishin2.",
  database="clientes"
)                                      
  
cursor = conexion.cursor() 
cursor.execute('''
	SELECT
		FLOOR(AVG(edad))
	FROM clientes;
''')

filas = cursor.fetchall()

print(filas)
