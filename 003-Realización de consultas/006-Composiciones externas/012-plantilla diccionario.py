import mysql.connector 

conexion = mysql.connector.connect(
  host="localhost",
  user="Vader",
  password="Hakaishin2.",
  database="composiciones"
)                                      
  
cursor = conexion.cursor(dictionary=True)
cursor.execute("SELECT * FROM matriculas_join;")  

filas = cursor.fetchall()

print(filas)
