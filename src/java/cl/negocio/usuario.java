package cl.negocio;

import Acceso.Conexion;
import java.sql.SQLException;

public class usuario {
   private String usuario_id;
   private String nombre_usuario;
   private String ap_paterno;
   private String ap_materno;
   private String rut;
   private String username;
   private String clave;
   private String fecha_creacion;
   private String estado;
   private String empresa_id;
   private String privilegio_id;
   Conexion con;
    
   public usuario(){
        con=new Conexion();
    }
    public int validar(){
        String sql="select * from usuarios where username='"+this.getUsername()+"'";
        con.setSQL(sql);
        try {
            while(con.getRs().next()){
                if(con.getRs().getString("clave").equals(this.getClave())){
                    return 1;
                }else{
                    return 0;
                }
            }
        } catch (SQLException ex) {
           System.out.println("ERROR");
        }
        return 0;
       
    }

    public String getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(String usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEmpresa_id() {
        return empresa_id;
    }

    public void setEmpresa_id(String empresa_id) {
        this.empresa_id = empresa_id;
    }

    public String getPrivilegio_id() {
        return privilegio_id;
    }

    public void setPrivilegio_id(String privilegio_id) {
        this.privilegio_id = privilegio_id;
    }
   
    
}
