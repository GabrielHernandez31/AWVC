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

    public Usuario() {

    }

    /*
    Utilizar el constructor con parametros para verificar si extiste un usuario o no.
     */
    public Usuario(String correo) {
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
                id_rol = resulUsuario.getInt("id_rol");
                existe_usuario = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    Registra a un usuario en la base de datos.
    Devuelve True si el registro fue exitoso.
     */
    public boolean createUsuario() {
        try {
            final String sql = "Insert into usuario values (default,?,?,?,?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_usuario());
            insertarUsuario.setString(2, getApp_usuario());
            insertarUsuario.setString(3, getApm_usuario());
            insertarUsuario.setString(4, getTelefono_usuario());
            insertarUsuario.setString(5, getCorreo_usuario());
            insertarUsuario.setString(6, getPassword_usuario());
            insertarUsuario.setInt(7, getId_rol());
            insertarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Valida que el correo electronico no este en uso.
    Si no está en uso, devuelve True.
    Utilizar este metodo para validar el correo al registrar.
     */
    public boolean validarCorreoRegistro() {
        try {
            final String sql = "Select * from usuario where correo_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Utilizar este metodo para corroborar que el correo y la contraseña existan y coincidan
     */
    public boolean iniciarSesion() {
        try {
            final String sql = "Select * from usuario where correo_usuario = ? and password_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            validarCorreo.setString(2, getPassword_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Actualiza un usuario 
     */
    public boolean updateUsuario() {
        try {
            final String sql = "Update usuario set nombre_usuario = ?, app_usuario = ?, apm_usuario = ?, telefono_usuario = ?,"
                    + "correo_usuario = ?, password_usuario = ?, id_rol=? where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, nombre_usuario);
            actualizarUsuario.setString(2, app_usuario);
            actualizarUsuario.setString(3, apm_usuario);
            actualizarUsuario.setString(4, telefono_usuario);
            actualizarUsuario.setString(5, correo_usuario);
            actualizarUsuario.setString(6, password_usuario);
            actualizarUsuario.setInt(7, id_rol);
            actualizarUsuario.setInt(5, getId_usuario());
            actualizarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Elimina un usuario
     */
    public boolean deleteUsuario() {
        try {
            final String sql = "Delete from usuario where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_usuario());
            eliminarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String obtenerNombreUsuario(String id) {
        try {
            final String sql = "Select * from usuario where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement existenCategorias = conex.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, Integer.parseInt(id));
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String nombre = resulExistenCategorias.getString("nombre_usuario") + " " + resulExistenCategorias.getString("app_usuario");
                return nombre;
            } else {
                String nombre2 = "Sin asignar aun.";
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String nombre3 = "Sin asignar aun.";
        return nombre3;
    }

    public String[][] consultarUsuariosAdm() {
        try {
            final String sql = "Select * from usuario";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][7];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_usuario"));
            }
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarUsuariosAdm() {
        try {
            int resultado;
            final String sql = "Select count(*) from usuario";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                return resultado;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenUsuariosAdm() {
        try {
            final String sql = "Select * from usuaeio";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String[][] consultarUsuariosEmp() {
        try {
            final String sql = "Select * from usuario where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][7];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_usuario"));
            }
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarUsuariosEmp() {
        try {
            int resultado;
            final String sql = "Select count(*) from usuario where id_usuario=?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                return resultado;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenUsuariosEmp() {
        try {
            final String sql = "Select * from usuario where id_usuario";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
