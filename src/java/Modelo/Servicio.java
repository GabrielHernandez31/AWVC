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
}
