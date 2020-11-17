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
public class Automovil {

    private int id_auto;
    private String placa_auto;
    private String marca_auto;
    private String modelo_auto;
    private String color_auto;
    private String estatus_auto;
    private int id_usuario;
    private int id_rfid;

    public int getId_auto() {
        return id_auto;
    }

    public void setId_auto(int id_auto) {
        this.id_auto = id_auto;
    }

    public String getPlaca_auto() {
        return placa_auto;
    }

    public void setPlaca_auto(String placa_auto) {
        this.placa_auto = placa_auto;
    }

    public String getMarca_auto() {
        return marca_auto;
    }

    public void setMarca_auto(String marca_auto) {
        this.marca_auto = marca_auto;
    }

    public String getModelo_auto() {
        return modelo_auto;
    }

    public void setModelo_auto(String modelo_auto) {
        this.modelo_auto = modelo_auto;
    }

    public String getColor_auto() {
        return color_auto;
    }

    public void setColor_auto(String color_auto) {
        this.color_auto = color_auto;
    }

    public String getEstatus_auto() {
        return estatus_auto;
    }

    public void setEstatus_auto(String estatus_auto) {
        this.estatus_auto = estatus_auto;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_rfid() {
        return id_rfid;
    }

    public void setId_rfid(int id_rfid) {
        this.id_rfid = id_rfid;
    }

    public Automovil() {

    }

    public boolean createAutomovilConER() {
        try {
            final String sql = "Insert into automovil values (default,?,?,?,?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getPlaca_auto());
            insertarUsuario.setString(2, getMarca_auto());
            insertarUsuario.setString(3, getModelo_auto());
            insertarUsuario.setString(4, getColor_auto());
            insertarUsuario.setString(5, getEstatus_auto());
            insertarUsuario.setInt(6, getId_usuario());
            insertarUsuario.setInt(7, getId_rfid());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean createAutomovilE() {
        try {
            final String sql = "Insert into automovil values (default,?,?,?,?,?,?,null)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getPlaca_auto());
            insertarUsuario.setString(2, getMarca_auto());
            insertarUsuario.setString(3, getModelo_auto());
            insertarUsuario.setString(4, getColor_auto());
            insertarUsuario.setString(5, getEstatus_auto());
            insertarUsuario.setInt(6, getId_usuario());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean createAutomovilR() {
        try {
            final String sql = "Insert into automovil values (default,?,?,?,?,?,null,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getPlaca_auto());
            insertarUsuario.setString(2, getMarca_auto());
            insertarUsuario.setString(3, getModelo_auto());
            insertarUsuario.setString(4, getColor_auto());
            insertarUsuario.setString(5, getEstatus_auto());
            insertarUsuario.setInt(6, getId_rfid());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean createAutomovilSinER() {
        try {
            final String sql = "Insert into automovil values (default,?,?,?,?,?,null,null)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getPlaca_auto());
            insertarUsuario.setString(2, getMarca_auto());
            insertarUsuario.setString(3, getModelo_auto());
            insertarUsuario.setString(4, getColor_auto());
            insertarUsuario.setString(5, getEstatus_auto());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validarPlacaRegistro() {
        try {
            final String sql = "Select * from automovil where placa_auto = ?";
            Conexion conex = new Conexion();
            PreparedStatement validarCorreo = conex.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getPlaca_auto());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                validarCorreo.close();
                validar.close();
                conex.obtenerConnexion().close();
                return false;
            } else {
                validarCorreo.close();
                validar.close();
                conex.obtenerConnexion().close();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAutomovilConER() {
        try {
            final String sql = "Update automovil set estado_auto=?, id_usuario=?, id_rfid=? where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, estatus_auto);
            actualizarUsuario.setInt(2, id_usuario);
            actualizarUsuario.setInt(3, id_rfid);
            actualizarUsuario.setInt(4, getId_auto());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateAutomovilSinER() {
        try {
            final String sql = "Update automovil set estado_auto=?, id_usuario=null, id_rfid=null where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, estatus_auto);
            actualizarUsuario.setInt(2, getId_auto());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateAutomovilE() {
        try {
            final String sql = "Update automovil set estado_auto=?, id_usuario=?, id_rfid=null where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, estatus_auto);
            actualizarUsuario.setInt(2, id_usuario);
            actualizarUsuario.setInt(3, getId_auto());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateAutomovilR() {
        try {
            final String sql = "Update automovil set estado_auto=?, id_usuario=null, id_rfid=? where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, estatus_auto);
            actualizarUsuario.setInt(2, id_rfid);
            actualizarUsuario.setInt(3, getId_auto());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteAutomovil() {
        try {
            final String sql = "Update automovil set estado_auto='Baja' where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_auto());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteRFIDAutomovil() {
        try {
            final String sql = "Update automovil set id_rfid=null where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_auto());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteUsuarioAutomovil() {
        try {
            final String sql = "Update automovil set id_usuario=null where id_auto= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_auto());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarAutomovilesModificar() {
        try {
            final String sql = "Select * from automovil where id_auto = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_auto());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarAutomovilesAdm()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_auto");
                arreglo_servicio[cuenta][1] = resulProducto.getString("placa_auto");
                arreglo_servicio[cuenta][2] = resulProducto.getString("marca_auto");
                arreglo_servicio[cuenta][3] = resulProducto.getString("modelo_auto");
                arreglo_servicio[cuenta][4] = resulProducto.getString("color_auto");
                arreglo_servicio[cuenta][5] = resulProducto.getString("estado_auto");
                if (resulProducto.getString("id_usuario") == null) {
                    arreglo_servicio[cuenta][6] = "Sin asignar aun.";
                    if (resulProducto.getString("id_rfid") == null) {
                        arreglo_servicio[cuenta][7] = "Sin asignar aun.";
                    } else {
                        arreglo_servicio[cuenta][7] = resulProducto.getString("id_rfid");
                    }
                } else {
                    arreglo_servicio[cuenta][6] = resulProducto.getString("id_usuario");
                    
                    if (resulProducto.getString("id_rfid") == null) {
                        arreglo_servicio[cuenta][7] = "Sin asignar aun.";
                    } else {
                        arreglo_servicio[cuenta][7] = resulProducto.getString("id_rfid");
                    }
                }
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public String[][] consultarAutomovilesAdm() {
        try {
            final String sql = "Select * from automovil";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarAutomovilesAdm()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_auto");
                arreglo_servicio[cuenta][1] = resulProducto.getString("placa_auto");
                arreglo_servicio[cuenta][2] = resulProducto.getString("marca_auto");
                arreglo_servicio[cuenta][3] = resulProducto.getString("modelo_auto");
                arreglo_servicio[cuenta][4] = resulProducto.getString("color_auto");
                arreglo_servicio[cuenta][5] = resulProducto.getString("estado_auto");
                if (resulProducto.getString("id_usuario") == null) {
                    arreglo_servicio[cuenta][6] = "Sin asignar aun.";
                    if (resulProducto.getString("id_rfid") == null) {
                        arreglo_servicio[cuenta][7] = "Sin asignar aun.";
                    } else {
                        RFID rfid = new RFID();
                        arreglo_servicio[cuenta][7] = rfid.obtenerNombreRFID(resulProducto.getString("id_rfid"));
                    }
                } else {
                    Usuario usuario = new Usuario();
                    arreglo_servicio[cuenta][6] = usuario.obtenerNombreUsuario(resulProducto.getString("id_usuario"));
                    
                    if (resulProducto.getString("id_rfid") == null) {
                        arreglo_servicio[cuenta][7] = "Sin asignar aun.";
                    } else {
                        RFID rfid = new RFID();
                        arreglo_servicio[cuenta][7] = rfid.obtenerNombreRFID(resulProducto.getString("id_rfid"));
                    }
                }
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarAutomovilesAdm() {
        try {
            int resultado;
            final String sql = "Select count(*) from automovil";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenAutomovilesAdm() {
        try {
            final String sql = "Select * from automovil";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String[][] consultarAutomovilesEmp() {
        try {
            final String sql = "Select * from automovil where id_usuario = ? and estado_auto NOT LIKE 'Baja'";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarAutomovilesEmp()][8];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_auto");
                arreglo_servicio[cuenta][1] = resulProducto.getString("placa_auto");
                arreglo_servicio[cuenta][2] = resulProducto.getString("marca_auto");
                arreglo_servicio[cuenta][3] = resulProducto.getString("modelo_auto");
                arreglo_servicio[cuenta][4] = resulProducto.getString("color_auto");
                arreglo_servicio[cuenta][5] = resulProducto.getString("estado_auto");
                Usuario usuario = new Usuario();
                arreglo_servicio[cuenta][6] = usuario.obtenerNombreUsuario(resulProducto.getString("id_usuario"));
                arreglo_servicio[cuenta][7] = resulProducto.getString("rfid_auto");
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarAutomovilesEmp() {
        try {
            int resultado;
            final String sql = "Select count(*) from automovil where id_usuario=? and estado_auto NOT LIKE 'Baja'";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenAutomovilesEmp() {
        try {
            final String sql = "Select * from automovil where id_usuario and estado_auto NOT LIKE 'Baja'";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_usuario());
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
