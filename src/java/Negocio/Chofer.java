package Negocio;

import Acceso.Conexion;

public class Chofer {
    private String chofer_id;
    private String nombre_chofer;
    private String ap_paterno;
    private String ap_materno;
    private String rut;
    private String estado;
    private String fecha_creacion;
    private String vehiculo_id;
    private String empresa_id;
    private String obra_id;
    Conexion con;
    
    public Chofer(){
        con=new Conexion();
    }
    
    public void update(){
        con.runSql("update choferes set nombre_chofer='"+this.getNombre_chofer()+"', ap_paterno='"+this.getAp_paterno()+"', ap_materno='"+this.getAp_materno()+"', rut='"+this.getRut()+"', empresa_id='"+this.getEmpresa_id()+"', vehiculo_id='"+this.getVehiculo_id()+"', obra_id='"+this.getObra_id()+"' where chofer_id='"+this.getChofer_id()+"'");
    }
    
    public void delete(){
        con.runSql("delete from choferes where chofer_id='"+this.getChofer_id()+"'");
    }
    public void save(){
        String sql="insert into choferes(nombre_chofer,ap_paterno,ap_materno,rut,estado,fecha_creacion,empresa_id,vehiculo_id,obra_id) values('"+this.getNombre_chofer()+"','"+this.getAp_paterno()+"','"+this.getAp_materno()+"','"+this.getRut()+"','activo',now(),'"+this.getEmpresa_id()+"','"+this.getVehiculo_id()+"','"+this.getObra_id()+"')";
        con.runSql(sql);
    }

    public String getChofer_id() {
        return chofer_id;
    }

    public void setChofer_id(String chofer_id) {
        this.chofer_id = chofer_id;
    }

    public String getNombre_chofer() {
        return nombre_chofer;
    }

    public void setNombre_chofer(String nombre_chofer) {
        this.nombre_chofer = nombre_chofer;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
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

    public String getVehiculo_id() {
        return vehiculo_id;
    }

    public void setVehiculo_id(String vehiculo_id) {
        this.vehiculo_id = vehiculo_id;
    }

    public String getEmpresa_id() {
        return empresa_id;
    }

    public void setEmpresa_id(String empresa_id) {
        this.empresa_id = empresa_id;
    }

    public String getObra_id() {
        return obra_id;
    }

    public void setObra_id(String obra_id) {
        this.obra_id = obra_id;
    }
}