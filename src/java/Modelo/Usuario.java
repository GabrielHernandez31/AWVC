/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author boowe
 */
public class Usuario {
    private int id_usuario;
    private String nombre_usuario;
    private String app_usuario;
    private String apm_usuario;
    private String telefono_usuario;
    private String correo_usuario;
    private String password_usuario;
    private int id_rol;
    private boolean existe_usuario;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getApp_usuario() {
        return app_usuario;
    }

    public void setApp_usuario(String app_usuario) {
        this.app_usuario = app_usuario;
    }

    public String getApm_usuario() {
        return apm_usuario;
    }

    public void setApm_usuario(String apm_usuario) {
        this.apm_usuario = apm_usuario;
    }

    public String getTelefono_usuario() {
        return telefono_usuario;
    }

    public void setTelefono_usuario(String telefono_usuario) {
        this.telefono_usuario = telefono_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getPassword_usuario() {
        return password_usuario;
    }

    public void setPassword_usuario(String password_usuario) {
        this.password_usuario = password_usuario;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
    
    public boolean isExiste_usuario() {
        return existe_usuario;
    }

    public void setExiste_usuario(boolean existe_usuario) {
        this.existe_usuario = existe_usuario;
    }
    
    public Usuario(){
        
    }
    /*
    Utilizar el constructor con parametros para verificar si extiste un usuario o no.
    */
    public Usuario(String correo){
        try {
            final String sql = "Select * from usuario where correo_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement buscarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            buscarUsuario.setString(1, correo);
            ResultSet resulUsuario = buscarUsuario.executeQuery();
            while (resulUsuario.next()) {
                id_usuario = resulUsuario.getInt("id_usuario");
                nombre_usuario = resulUsuario.getString("nombre_usuario");
                app_usuario = resulUsuario.getString("app_usuario");
                apm_usuario = resulUsuario.getString("apm_usuario");
                telefono_usuario = resulUsuario.getString("telefono_usuario");
                correo_usuario = resulUsuario.getString("correo_usuario");
                password_usuario = resulUsuario.getString("password_usuario");
                existe_usuario = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }        
    }
    
    /*
    Utilizar este metodo para corroborar que el correo y la contraseña existan y coincidan
    */
    public boolean iniciarSesion(){
        try {
            final String sql = "Select * from usuario where correo_usuario = ? and password_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            validarCorreo.setString(2, getPassword_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if(validar.next()){
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
