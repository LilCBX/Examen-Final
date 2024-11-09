package com.practica1.proyectobase.conexion; // Asegúrate de usar el nombre de tu paquete

import java.sql.Connection;
import java.sql.SQLException;

public class PruebaConexion {
    @SuppressWarnings("ConvertToTryWithResources")
    public static void main(String[] args) {
        try {
            Connection conexion = ConexionDB.conectar();
            System.out.println("¡Conexión exitosa a la base de datos!");
            conexion.close(); // Cerramos la conexión después de probarla
        } catch (SQLException e) {
            System.out.println("Error al conectar: " + e.getMessage());
        }
    }
}

