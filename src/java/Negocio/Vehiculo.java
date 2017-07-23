package Negocio;

import Acceso.Conexion;

public class Vehiculo {
    private String vehiculo_id;
    private String codigo;
    private String patente;
    private String marca;
    private String modelo;
    private String imagen;
    private String estado;
    private String fecha_creacion;
    private String tipo_vehiculo_id;
    private String empresa_id;
    private String estado_id;
    private String obra_id;
    Conexion con;
    
    public Vehiculo(){
    con=new Conexion();
    }
    public void save(){
        String sql="insert into vehiculos(codigo,patente,marca,modelo,imagen,estado,fecha_creacion,tipo_vehiculo_id,empresa_id,estado_id,obra_id) values('"+this.getCodigo()+"','"+this.getPatente()+"','"+this.getMarca()+"','"+this.getModelo()+"','"+this.getImagen()+"','activo',now(),'"+this.getTipo_vehiculo_id()+"','"+this.getEmpresa_id()+"','"+this.getEstado_id()+"','"+this.getObra_id()+"')";
        con.runSql(sql);
    }

    public String getVehiculo_id() {
        return vehiculo_id;
    }

    public void setVehiculo_id(String vehiculo_id) {
        this.vehiculo_id = vehiculo_id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getTipo_vehiculo_id() {
        return tipo_vehiculo_id;
    }

    public void setTipo_vehiculo_id(String tipo_vehiculo_id) {
        this.tipo_vehiculo_id = tipo_vehiculo_id;
    }

    public String getEmpresa_id() {
        return empresa_id;
    }

    public void setEmpresa_id(String empresa_id) {
        this.empresa_id = empresa_id;
    }

    public String getEstado_id() {
        return estado_id;
    }

    public void setEstado_id(String estado_id) {
        this.estado_id = estado_id;
    }

    public String getObra_id() {
        return obra_id;
    }

    public void setObra_id(String obra_id) {
        this.obra_id = obra_id;
    }
}
