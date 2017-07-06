package Acceso;

import java.sql.*;

public class Conexion {
    private Connection con;
    private Statement stmt;
    private ResultSet rs;
    private String driver="com.mysql.jdbc.Driver";
    private String user="root";
    private String clave="";
    private String url="jdbc:mysql://localhost:3306/ficha_tecnica";
    
    public Conexion(){
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url,user,clave);
            System.out.println("Conexion Establecida");
        }
        catch (Exception ex){
            System.out.println("ERROR EN CONEXION"+ex.getMessage());
        }
    }    
}
