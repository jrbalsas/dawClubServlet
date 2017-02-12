package com.daw.club.model;

public class Cliente {
    private int id;
    private String nombre;
    private String dni;
    private boolean socio;
    private int medioPago;


    public Cliente () {
        id=0;
        nombre="Desconocido";
        socio=false;
        medioPago=0;
    }
    
    public Cliente(int id, String nombre, String dni, boolean socio,int medioPago) {
        this.id=id;
        this.nombre=nombre;
        this.dni=dni;
        this.socio=socio;
        this.medioPago=medioPago;
    }

    /**Copy constructor*/
    public Cliente(Cliente c) {
        this.id=c.id;
        this.nombre=c.nombre;
        this.dni=c.dni;
        this.socio=c.socio;
        this.medioPago=c.medioPago;
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the dni
     */
    public String getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(String dni) {
        this.dni = dni;
    }

    /**
     * @return the socio
     */
    public boolean isSocio() {
        return socio;
    }

    /**
     * @param socio the socio to set
     */
    public void setSocio(boolean socio) {
        this.socio = socio;
    }

    public int getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(int medioPago) {
        this.medioPago = medioPago;
    }
    
}
