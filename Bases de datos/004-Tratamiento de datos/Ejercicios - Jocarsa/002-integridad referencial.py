'''
Programa: Gestor Videojuegos v0.1

Gustavo Delnardo
Este programa permite gestionar una colección de videojuegos. Se puede insertar un nuevo juego y listar todos los juegos existentes.Se practica el concepto de integridad referencial y CRUD básico en Python con SQLite.
'''

import sqlite3

#conexión a la base de datos
conn = sqlite3.connect('videojuegos.db')
cursor = conn.cursor()

#crear tabla juegos si no existe
cursor.execute("""
CREATE TABLE IF NOT EXISTS juegos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    plataforma TEXT NOT NULL,
    ano_lanzamiento INT NOT NULL
);
""")
conn.commit()

#función para insertar un juego
def insertar_juego():
    nombre = input("Introduce el nombre del juego: ")
    plataforma = input("Introduce la plataforma: ")
    ano_lanzamiento = int(input("Introduce el año de lanzamiento: "))
    
    cursor.execute("INSERT INTO juegos (nombre, plataforma, ano_lanzamiento) VALUES (?, ?, ?)",
                   (nombre, plataforma, ano_lanzamiento))
    conn.commit()
    print(f"Juego '{nombre}' añadido correctamente.\n")

#función para listar juegos
def listar_juegos():
    cursor.execute("SELECT id, nombre, plataforma, ano_lanzamiento FROM juegos")
    juegos = cursor.fetchall()
    print("\nLista de Juegos:")
    for juego in juegos:
        print(f"ID: {juego[0]}, Nombre: {juego[1]}, Plataforma: {juego[2]}, Año: {juego[3]}")
    print()

#bucle principal
while True:
    print("Opciones:\n1. Insertar juego\n2. Listar juegos\n3. Salir")
    opcion = input("Elige una opción: ")
    
    if opcion == '1':
        insertar_juego()
    elif opcion == '2':
        listar_juegos()
    elif opcion == '3':
        print("Saliendo del programa...")
        break
    else:
        print("Opción no válida. Intenta de nuevo.\n")

#cerrar conexión al finalizar
conn.close()

#Este ejercicio practica la integridad referencial de manera básica, asegurando que cada juego insertado tenga un identificador único. Facilita la gestión de datos en aplicaciones de videojuegos o música, manteniendo la coherencia y seguridad de la información. La estructura con bucle while hace que el programa sea interactivo y apto para principiantes, reforzando el aprendizaje de CRUD.
