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
public class Caseta {
    private int id_caseta;
    private String nombre_caseta;
    private String ubicacion_caseta;
    private String costo_caseta;

    public int getId_caseta() {
        return id_caseta;
    }

    public void setId_caseta(int id_caseta) {
        this.id_caseta = id_caseta;
    }

    public String getNombre_caseta() {
        return nombre_caseta;
    }

    public void setNombre_caseta(String nombre_caseta) {
        this.nombre_caseta = nombre_caseta;
    }

    public String getUbicacion_caseta() {
        return ubicacion_caseta;
    }

    public void setUbicacion_caseta(String ubicacion_caseta) {
        this.ubicacion_caseta = ubicacion_caseta;
    }

    public String getCosto_caseta() {
        return costo_caseta;
    }

    public void setCosto_caseta(String costo_caseta) {
        this.costo_caseta = costo_caseta;
    }
}
