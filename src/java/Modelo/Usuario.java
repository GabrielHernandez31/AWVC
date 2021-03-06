/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

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
    private String estatus_usuario;
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

    public String getEstatus_usuario() {
        return estatus_usuario;
    }

    public void setEstatus_usuario(String estatus_usuario) {
        this.estatus_usuario = estatus_usuario;
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
                estatus_usuario = resulUsuario.getString("estado_usuario");
                id_rol = resulUsuario.getInt("id_rol");
                existe_usuario = true;
            }
            resulUsuario.close();
            buscarUsuario.close();
            conex.obtenerConnexion().close();
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
            final String sql = "Insert into usuario values (default,?,?,?,?,?,PGP_SYM_ENCRYPT(?,'AES_KEY'),default,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_usuario());
            insertarUsuario.setString(2, getApp_usuario());
            insertarUsuario.setString(3, getApm_usuario());
            insertarUsuario.setString(4, getTelefono_usuario());
            insertarUsuario.setString(5, getCorreo_usuario());
            insertarUsuario.setString(6, generarPassword());
            insertarUsuario.setInt(7, getId_rol());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int obtenerIdUsuarioRegistro() {
        try {
            final String sql = "Select * from usuario where correo_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement existenCategorias = con.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setString(1, getCorreo_usuario());
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                int nombre = resulExistenCategorias.getInt("id_usuario");
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre;
            } else {
                int nombre2 = 0;
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        int nombre3 = 0;
        return nombre3;
    }
    
    public String obtenerIdAuto() {
        try {
            final String sql = "Select id_auto from automovil where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement existenCategorias = conex.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, getId_usuario());
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String nombre = resulExistenCategorias.getString("id_auto");
                existenCategorias.close();
                resulExistenCategorias.close();
                conex.obtenerConnexion().close();
                return nombre;
            } else {
                String nombre2 = "0";
                existenCategorias.close();
                resulExistenCategorias.close();
                conex.obtenerConnexion().close();
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String nombre3 = "0";
        return nombre3;
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
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
                return false;
            } else {
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
                return true;
            }
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
    public boolean validarTelefonoRegistro() {
        try {
            final String sql = "Select * from usuario where telefono_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
                return false;
            } else {
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
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
            final String sql = "Select * from usuario where correo_usuario = ? and pgp_sym_decrypt(password_usuario::bytea,'AES_KEY') = ? and estado_usuario = 'Activo'";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            validarCorreo.setString(2, getPassword_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
                return true;
            } else {
                validar.close();
                validarCorreo.close();
                con.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Actualiza un usuario con correo y con telefono
     */
    public boolean updateUsuarioCCCT() {
        try {
            final String sql = "Update usuario set telefono_usuario = ?, correo_usuario = ?, password_usuario = PGP_SYM_ENCRYPT(?,'AES_KEY'), estado_usuario = ?, id_rol = ? where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement actualizarUsuario = con.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, telefono_usuario);
            actualizarUsuario.setString(2, correo_usuario);
            actualizarUsuario.setString(3, password_usuario);
            actualizarUsuario.setString(4, estatus_usuario);
            actualizarUsuario.setInt(5, id_rol);
            actualizarUsuario.setInt(6, getId_usuario());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            con.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
    Actualiza un usuario con correo y sin telefono
     */
    public boolean updateUsuarioCCST() {
        try {
            final String sql = "Update usuario set correo_usuario = ?, password_usuario = PGP_SYM_ENCRYPT(?,'AES_KEY'), estado_usuario = ?, id_rol = ? where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement actualizarUsuario = con.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, correo_usuario);
            actualizarUsuario.setString(2, password_usuario);
            actualizarUsuario.setString(3, estatus_usuario);
            actualizarUsuario.setInt(4, id_rol);
            actualizarUsuario.setInt(5, getId_usuario());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            con.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /*
    Actualiza un usuario sin correo y sin telefono
     */
    public boolean updateUsuarioSCST() {
        try {
            final String sql = "Update usuario set password_usuario = PGP_SYM_ENCRYPT(?,'AES_KEY'), estado_usuario = ?, id_rol = ? where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement actualizarUsuario = con.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, password_usuario);
            actualizarUsuario.setString(2, estatus_usuario);
            actualizarUsuario.setInt(3, id_rol);
            actualizarUsuario.setInt(4, getId_usuario());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            con.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /*
    Actualiza un usuario sin correo y con telefono
     */
    public boolean updateUsuarioSCCT() {
        try {
            final String sql = "Update usuario set telefono_usuario = ?, password_usuario = PGP_SYM_ENCRYPT(?,'AES_KEY'), estado_usuario = ?, id_rol = ? where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement actualizarUsuario = con.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, telefono_usuario);
            actualizarUsuario.setString(2, password_usuario);
            actualizarUsuario.setString(3, estatus_usuario);
            actualizarUsuario.setInt(4, id_rol);
            actualizarUsuario.setInt(5, getId_usuario());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            con.obtenerConnexion().close();
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
            final String sql = "Update usuario set estado_usuario='Baja' where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement eliminarUsuario = con.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_usuario());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            con.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String obtenerNombreUsuario(String id) {
        try {
            final String sql = "Select * from usuario where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement existenCategorias = con.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, Integer.parseInt(id));
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String nombre = resulExistenCategorias.getString("nombre_usuario") + " " + resulExistenCategorias.getString("app_usuario") + " " + resulExistenCategorias.getString("apm_usuario").charAt(0) + ".";
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre;
            } else {
                String nombre2 = "Sin asignar aun.";
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String nombre3 = "Sin asignar aun.";
        return nombre3;
    }
    
    public int obtenerIdUsuario(int id) {
        try {
            final String sql = "Select * from usuario where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement existenCategorias = con.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, id);
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                int nombre = resulExistenCategorias.getInt("id_usuario");
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre;
            } else {
                int nombre2 = 0;
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        int nombre3 = 0;
        return nombre3;
    }
    
    public String[][] consultarUsuariosAdmGestionar() {
        try {
            final String sql = "Select * from usuario";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdmGestionar()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_rol"));
                arreglo_servicio[cuenta][7] = resulProducto.getString("estado_usuario");
            }
            consultarProducto.close();
            resulProducto.close();
            con.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }
    
    public int contarUsuariosAdmGestionar() {
        try {
            int resultado;
            final String sql = "Select count(*) from usuario";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return resultado;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenUsuariosAdmGestionar() {
        try {
            final String sql = "Select * from usuario";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String[][] consultarUsuariosAdm() {
        try {
            final String sql = "Select * from usuario where estado_usuario NOT LIKE '%Baja%' and id_rol=2";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_rol"));
                arreglo_servicio[cuenta][7] = resulProducto.getString("estado_usuario");
            }
            consultarProducto.close();
            resulProducto.close();
            con.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }
    
    public String[][] consultarUsuariosAdmModificar() {
        try {
            final String sql = "Select * from usuario where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, id_usuario);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][9];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_rol"));
                arreglo_servicio[cuenta][7] = desencriptarPasswordUsuario();
                arreglo_servicio[cuenta][8] = resulProducto.getString("estado_usuario");
            }
            consultarProducto.close();
            resulProducto.close();
            con.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }
    
        public String desencriptarPasswordUsuario(){
        try {
            final String sql = "Select pgp_sym_decrypt(password_usuario::bytea, 'AES_KEY') as password from usuario where id_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement existenCategorias = con.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, id_usuario);
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String password = resulExistenCategorias.getString("password");
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return password;
            } else {
                String error = "error";
                resulExistenCategorias.close();
                existenCategorias.close();
                con.obtenerConnexion().close();
                return error;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String er1 = "error";
        return er1;
    }

    public int contarUsuariosAdm() {
        try {
            int resultado;
            final String sql = "Select count(*) from usuario where estado_usuario NOT LIKE '%Baja%' and id_rol=2";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
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
            final String sql = "Select * from usuario where estado_usuario NOT LIKE '%Baja%' and id_rol=2";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
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
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
                arreglo_servicio[cuenta][4] = resulProducto.getString("telefono_usuario");
                arreglo_servicio[cuenta][5] = resulProducto.getString("correo_usuario");
                Rol_Usuario rol = new Rol_Usuario();
                arreglo_servicio[cuenta][6] = rol.obtenerNombreRol(resulProducto.getString("id_rol"));
                arreglo_servicio[cuenta][7] = resulProducto.getString("password_usuario");
            }
            consultarProducto.close();
            resulProducto.close();
            con.obtenerConnexion().close();
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
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
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
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarUsuariosAuto() {
        try {
            final String sql = "Select * from usuario as usu where estado_usuario NOT LIKE '%Baja%' and id_rol = 2 and not exists (select id_usuario from automovil as auto where usu.id_usuario=auto.id_usuario)";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarUsuariosAdm()][4];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_usuario");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("app_usuario");
                arreglo_servicio[cuenta][3] = resulProducto.getString("apm_usuario");
            }
            consultarProducto.close();
            resulProducto.close();
            con.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarUsuariosAuto() {
        try {
            int resultado;
            final String sql = "Select count(*) from usuario as usu where estado_usuario NOT LIKE '%Baja%' and id_rol = 2 and not exists (select id_usuario from automovil as auto where usu.id_usuario=auto.id_usuario)";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenUsuariosAuto() {
        try {
            final String sql = "Select * from usuario where estado_usuario NOT LIKE '%Baja%' and id_rol = 2";
            Conexion con = new Conexion();
            PreparedStatement consultarProducto = con.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                con.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String generarPassword(){
        String[] symbols = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};             
        int length = 10;
        Random random;
        try {
            random = SecureRandom.getInstanceStrong();
            StringBuilder sb = new StringBuilder(length);
            for (int i = 0; i < length; i++) {
                 int indexRandom = random.nextInt ( symbols.length );
                 sb.append( symbols[indexRandom] );
            }
            String password = sb.toString();
            return password;
          } catch (NoSuchAlgorithmException e){
              String error = "error";
              return error;
          }
    }
}
