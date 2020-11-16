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
public class Servicio {

    private int id_servicio;
    private String nombre_servicio;
    private String descripcion_servicio;
    private String ubicacion_servicio;
    private String estatus_servicio;
    private String fecha_servicio;
    private int id_usuario;

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getNombre_servicio() {
        return nombre_servicio;
    }

    public void setNombre_servicio(String nombre_servicio) {
        this.nombre_servicio = nombre_servicio;
    }

    public String getDescripcion_servicio() {
        return descripcion_servicio;
    }

    public void setDescripcion_servicio(String descripcion_servicio) {
        this.descripcion_servicio = descripcion_servicio;
    }

    public String getUbicacion_servicio() {
        return ubicacion_servicio;
    }

    public void setUbicacion_servicio(String ubicacion_servicio) {
        this.ubicacion_servicio = ubicacion_servicio;
    }

    public String getEstatus_servicio() {
        return estatus_servicio;
    }

    public void setEstatus_servicio(String estatus_servicio) {
        this.estatus_servicio = estatus_servicio;
    }

    public String getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(String fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public boolean createServiciosSinEmp() {
        try {
            final String sql = "Insert into servicio values (default,?,?,?,?,?,null)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_servicio());
            insertarUsuario.setString(2, getDescripcion_servicio());
            insertarUsuario.setString(3, getUbicacion_servicio());
            insertarUsuario.setString(4, getEstatus_servicio());
            insertarUsuario.setString(5, getFecha_servicio());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean createServiciosConEmp() {
        try {
            final String sql = "Insert into servicio values (default,?,?,?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_servicio());
            insertarUsuario.setString(2, getDescripcion_servicio());
            insertarUsuario.setString(3, getUbicacion_servicio());
            insertarUsuario.setString(4, getEstatus_servicio());
            insertarUsuario.setString(5, getFecha_servicio());
            insertarUsuario.setInt(6, getId_usuario());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateServiciosAdmConEmp() {
        try {
            final String sql = "Update servicio set nombre_servicio=?, descripcion_servicio=?, ubicacion_servicio=?, estatus_servicio=?, fecha_servicio=?, id_usuario=? where id_servicio= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, nombre_servicio);
            actualizarUsuario.setString(2, descripcion_servicio);
            actualizarUsuario.setString(3, ubicacion_servicio);
            actualizarUsuario.setString(4, estatus_servicio);
            actualizarUsuario.setString(5, fecha_servicio);
            actualizarUsuario.setInt(6, id_usuario);
            actualizarUsuario.setInt(7, id_servicio);
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateServiciosAdmSinEmp() {
        try {
            final String sql = "Update servicio set nombre_servicio=?, descripcion_servicio=?, ubicacion_servicio=?, estatus_servicio=?, fecha_servicio=?, id_usuario=null where id_servicio= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, nombre_servicio);
            actualizarUsuario.setString(2, descripcion_servicio);
            actualizarUsuario.setString(3, ubicacion_servicio);
            actualizarUsuario.setString(4, estatus_servicio);
            actualizarUsuario.setString(5, fecha_servicio);
            actualizarUsuario.setInt(6, id_servicio);
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateServiciosEmp() {
        try {
            final String sql = "Update servicio set estatus_servicio=?, fecha_servicio=? where id_servicio= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, nombre_servicio);
            actualizarUsuario.setString(2, fecha_servicio);
            actualizarUsuario.setInt(3, id_servicio);
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteServicios() {
        try {
            final String sql = "Delete from servicio where id_servicio= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_servicio());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarServiciosModificar() {
        try {
            final String sql = "Select * from servicio where id_servicio = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_servicio());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarServiciosAdm()][7];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_servicio");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_servicio");
                arreglo_servicio[cuenta][2] = resulProducto.getString("descripcion_servicio");
                arreglo_servicio[cuenta][3] = resulProducto.getString("ubicacion_servicio");
                arreglo_servicio[cuenta][4] = resulProducto.getString("estatus_servicio");
                arreglo_servicio[cuenta][5] = resulProducto.getString("fecha_servicio");
                if (resulProducto.getString("id_usuario") == null) {
                    arreglo_servicio[cuenta][6] = "Sin asignar aun.";
                } else {
                    Usuario usuario = new Usuario();
                    arreglo_servicio[cuenta][6] = usuario.obtenerNombreUsuario(resulProducto.getString("id_usuario"));
                }
            }
            consultarProducto.close();
            resulProducto.close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public String[][] consultarServiciosAdm() {
        try {
            final String sql = "Select * from servicio";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarServiciosAdm()][7];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_servicio");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_servicio");
                arreglo_servicio[cuenta][2] = resulProducto.getString("descripcion_servicio");
                arreglo_servicio[cuenta][3] = resulProducto.getString("ubicacion_servicio");
                arreglo_servicio[cuenta][4] = resulProducto.getString("estatus_servicio");
                arreglo_servicio[cuenta][5] = resulProducto.getString("fecha_servicio");
                if (resulProducto.getString("id_usuario") == null) {
                    arreglo_servicio[cuenta][6] = "Sin asignar aun.";
                } else {
                    Usuario usuario = new Usuario();
                    arreglo_servicio[cuenta][6] = usuario.obtenerNombreUsuario(resulProducto.getString("id_usuario"));
                }
            }
            consultarProducto.close();
            resulProducto.close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarServiciosAdm() {
        try {
            int resultado;
            final String sql = "Select count(*) from servicio";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenServiciosAdm() {
        try {
            final String sql = "Select * from servicio";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String[][] consultarServiciosEmp() {
        try {
            final String sql = "Select * from servicio where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarServiciosEmp()][7];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_servidio");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_servicio");
                arreglo_servicio[cuenta][2] = resulProducto.getString("descripcion_servicio");
                arreglo_servicio[cuenta][3] = resulProducto.getString("ubicacion_servicio");
                arreglo_servicio[cuenta][4] = resulProducto.getString("estatus_servicio");
                arreglo_servicio[cuenta][5] = resulProducto.getString("fecha_servicio");
            }
            consultarProducto.close();
            resulProducto.close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarServiciosEmp() {
        try {
            int resultado;
            final String sql = "Select count(*) from servicio where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenServiciosEmp() {
        try {
            final String sql = "Select * from servicio where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        Servicio s = new Servicio();
        s.updateServiciosAdmConEmp();
    }
}
