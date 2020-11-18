package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Rol_Usuario {

    private int id_rol;
    private String nombre_rol;
    private String descripcion_rol;

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre_rol() {
        return nombre_rol;
    }

    public void setNombre_rol(String nombre_rol) {
        this.nombre_rol = nombre_rol;
    }

    public String getDescripcion_rol() {
        return descripcion_rol;
    }

    public void setDescripcion_rol(String descripcion_rol) {
        this.descripcion_rol = descripcion_rol;
    }
    
    public Rol_Usuario(){
    }

    public Rol_Usuario(int id_rol) {
        try {
            final String sql = "Select * from rol_usuario where id_rol = ?";
            Conexion conex = new Conexion();
            PreparedStatement buscarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            buscarUsuario.setInt(1, id_rol);
            ResultSet resulUsuario = buscarUsuario.executeQuery();
            while (resulUsuario.next()) {
                id_rol = resulUsuario.getInt("id_rol");
                nombre_rol = resulUsuario.getString("nombre_rol");
                descripcion_rol = resulUsuario.getString("descripcion_rol");
            }
            buscarUsuario.close();
            resulUsuario.close();
            conex.obtenerConnexion().close();
            closeDB();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        

    public String obtenerNombreRol(String id) {
        try {
            final String sql = "Select * from rol_usuario where id_rol = ?";
            Conexion conex = new Conexion();
            PreparedStatement existenCategorias = conex.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, Integer.parseInt(id));
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String nombre = resulExistenCategorias.getString("nombre_rol");
                existenCategorias.close();
                resulExistenCategorias.close();
                conex.obtenerConnexion().close();
                closeDB();
                return nombre;
            } else {
                String nombre2 = "Sin asignar aun.";
                existenCategorias.close();
                resulExistenCategorias.close();
                conex.obtenerConnexion().close();
                closeDB();
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String nombre3 = "Sin asignar aun.";
        return nombre3;
    }
    
    public void closeDB(){
        try {
            final String sql = "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='awcv'";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
