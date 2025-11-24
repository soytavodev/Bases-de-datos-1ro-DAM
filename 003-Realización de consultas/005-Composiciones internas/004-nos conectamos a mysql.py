import mysql.connector 

conexion = mysql.connector.connect(
  host="localhost",
  user="Gustavo",
  password="Hakaishin2.",
  database="tiendaclase"
)                                      
  
cursor = conexion.cursor() 
cursor.execute("SELECT * FROM clientes;")  

filas = cursor.fetchall()

print(filas)
