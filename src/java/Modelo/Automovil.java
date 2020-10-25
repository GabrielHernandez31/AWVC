/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

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
    
}
