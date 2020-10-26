package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private String url;
    private String user;
    private String password;
    private Connection connection;

    public Conexion() {
        url = "jdbc:postgresql://localhost:5432/awcv";
        user = "postgres";
        password = "db";
    }

    public Connection obtenerConnexion() {
        try {
            Class.forName("org.postgresql.Driver");
            return connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public static void main(String[] args) {
        Conexion con = new Conexion();
        con.obtenerConnexion();
    }
}
