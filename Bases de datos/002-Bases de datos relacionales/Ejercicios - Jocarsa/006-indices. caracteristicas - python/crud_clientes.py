"""
CRUD Clientes SQLite v0.1

Gustavo Delnardo

Este programa permite gestionar los clientes de una empresa mediante operaciones CRUD (Crear, Leer, Actualizar, Eliminar) en una base de datos SQLite.
Se incluye validación de emails y búsqueda por nombre, apellidos o correo electrónico.
"""

import sqlite3
from contextlib import closing
import re

# ----------------------
# Configuración inicial
# ----------------------

DB_FILE = "clientes.db"
EMAIL_RE = re.compile(r"[^@]+@[^@]+\.[^@]+")

def get_conn():
    return sqlite3.connect(DB_FILE)

def setup():
    """Crea la tabla clientes si no existe."""
    with closing(get_conn()) as conn:
        conn.execute("""
            CREATE TABLE IF NOT EXISTS clientes (
                Identificador INTEGER PRIMARY KEY AUTOINCREMENT,
                nombre TEXT NOT NULL,
                apellidos TEXT NOT NULL,
                email TEXT NOT NULL
            )
        """)

# ----------------------
# Funciones CRUD
# ----------------------

def crear_cliente():
    """Añade un nuevo cliente a la base de datos."""
    print("\n Crear cliente\n")
    nombre = input("Nombre: ")
    apellidos = input("Apellidos: ")
    while True:
        email = input("Email: ")
        if EMAIL_RE.match(email):
            break
        print("Email no válido. Intenta de nuevo.")
    with closing(get_conn()) as conn, conn:
        try:
            conn.execute(
                "INSERT INTO clientes (nombre, apellidos, email) VALUES (?,?,?)",
                (nombre, apellidos, email)
            )
            print("Cliente creado correctamente.\n")
        except sqlite3.IntegrityError as e:
            print(f"Error de integridad: {e}")

def listar_clientes():
    """Muestra todos los clientes."""
    print("\n Listado de clientes\n")
    with closing(get_conn()) as conn:
        rows = conn.execute(
            "SELECT Identificador, nombre, apellidos, email FROM clientes ORDER BY Identificador ASC"
        ).fetchall()
    for r in rows:
        print(r)
    print(f"\nTotal: {len(rows)}\n")

def actualizar_cliente():
    """Actualiza los datos de un cliente existente."""
    print("\n  Actualizar cliente\n")
    identificador = int(input("Introduce el ID a actualizar: "))
    with closing(get_conn()) as conn:
        row = conn.execute(
            "SELECT Identificador, nombre, apellidos, email FROM clientes WHERE Identificador=?",
            (identificador,)
        ).fetchone()
        if not row:
            print("No existe un cliente con ese ID.")
            return
        print(f"Valores actuales: {row}")
        nombre = input(f"Nombre [{row[1]}]: ") or row[1]
        apellidos = input(f"Apellidos [{row[2]}]: ") or row[2]
        while True:
            email_in = input(f"Email [{row[3]}]: ") or row[3]
            if EMAIL_RE.match(email_in):
                email = email_in
                break
            print("Email no válido. Intenta de nuevo.")
        try:
            conn.execute(
                "UPDATE clientes SET nombre=?, apellidos=?, email=? WHERE Identificador=?",
                (nombre, apellidos, email, identificador)
            )
            conn.commit()
            print("Cliente actualizado.\n")
        except sqlite3.IntegrityError as e:
            print(f"Error de integridad: {e}")

def eliminar_cliente():
    """Elimina un cliente de la base de datos."""
    print("\n  Eliminar cliente\n")
    identificador = int(input("Introduce el ID a eliminar: "))
    with closing(get_conn()) as conn:
        row = conn.execute(
            "SELECT Identificador, nombre, apellidos, email FROM clientes WHERE Identificador=?",
            (identificador,)
        ).fetchone()
        if not row:
            print("No existe un cliente con ese ID.")
            return
        print(f"Cliente a eliminar: {row}")
        conf = input("¿Seguro que quieres eliminar este cliente? (sí/no): ").lower()
        if conf not in ("si", "sí", "s", "yes", "y"):
            print("Operación cancelada.\n")
            return
        conn.execute(
            "DELETE FROM clientes WHERE Identificador=?",
            (identificador,)
        )
        conn.commit()
        print("Cliente eliminado.\n")

def buscar_clientes():
    """Busca clientes por nombre, apellidos o email."""
    print("\n Buscar clientes\n")
    q = input("Texto a buscar: ")
    like = f"%{q}%"
    with closing(get_conn()) as conn:
        rows = conn.execute(
            "SELECT Identificador, nombre, apellidos, email FROM clientes "
            "WHERE nombre LIKE ? OR apellidos LIKE ? OR email LIKE ? "
            "ORDER BY Identificador ASC",
            (like, like, like)
        ).fetchall()
    for r in rows:
        print(r)
    print(f"\nResultados: {len(rows)}\n")

# ----------------------
# Menú principal
# ----------------------

def menu():
    while True:
        print("\n--- Menú CRUD Clientes ---")
        print("1. Crear cliente")
        print("2. Listar clientes")
        print("3. Actualizar cliente")
        print("4. Eliminar cliente")
        print("5. Buscar clientes")
        print("6. Salir")
        opcion = input("Elige una opción: ")
        if opcion == "1":
            crear_cliente()
        elif opcion == "2":
            listar_clientes()
        elif opcion == "3":
            actualizar_cliente()
        elif opcion == "4":
            eliminar_cliente()
        elif opcion == "5":
            buscar_clientes()
        elif opcion == "6":
            print("Saliendo...")
            break
        else:
            print("Opción no válida.")

# ----------------------
# Ejecución
# ----------------------

if __name__ == "__main__":
    setup()
    menu()


#Este programa te permite practicar todas las operaciones CRUD en SQLite utilizando Python. Puedes crear, listar, actualizar, eliminar y buscar clientes. La validación de emails y el uso de PRIMARY KEY aseguran la integridad de los datos. Practicar este código te ayudará a manejar bases de datos de manera eficiente y segura.

