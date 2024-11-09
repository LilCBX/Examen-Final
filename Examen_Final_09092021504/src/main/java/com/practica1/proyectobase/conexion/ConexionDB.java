package com.practica1.proyectobase.conexion; // Asegúrate de usar el nombre de tu paquete

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    // URL de conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/proyecto_adaptable";
    
    // Credenciales de la base de datos (reemplázalas con tus valores)
    private static final String USER = "tu_usuario"; // Cambia "tu_usuario" por tu usuario de MySQL
    private static final String PASSWORD = "tu_contraseña"; // Cambia "tu_contraseña" por tu contraseña de MySQL

    // Método para establecer la conexión
    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
