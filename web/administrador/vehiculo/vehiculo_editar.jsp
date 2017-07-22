<%-- 
    Document   : vehiculo_editar
    Created on : 22-07-2017, 2:46:41
    Author     : Galmier
--%>
<%@page import="Acceso.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-invitado")){
        response.sendRedirect("../../index.jsp");
    }
    else{
        
    }
%>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../../Resources/css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" type="text/css" href="../../Resources/css/style.css">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Inicio</title>
    </head>
    <body>
        <main>
            <!--Barra Superior-->
            <div class="nav-wrapper">    
                <nav class="teal">
                    <div class="navbar-fixed">					
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Consultar<i class="material-icons right">arrow_drop_down</i><i class="material-icons left">search</i></a></li>
                        </ul>
                        <!--Componentes menu Consultar-->
                        <ul id="dropdown1" class="dropdown-content">
                            <li><a href="#!">Gerencia</a></li>
                            <li class="divider"></li>
                            <li><a href="#!">Choferes</a></li>
                            <li class="divider"></li>
                            <li><a href="#!">Obras</a></li>
                        </ul>
                        <button type="button" id="w11" class="sidenav-toggle btn teal lighten-1" data-activates="slide-out" style="margin-left: 50px">Menu</button>
                    </div>  
                    <!--Barra Lateral con los Menus-->
                    <ul id="slide-out" class="side-nav">
                        <li>
                            <div class="user-view">
                                <div>
                                    <img style="width: 250px" src="../../img/logo.png">
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../inicio.jsp"><i class="material-icons">home</i>Inicio</a></li>
                        <li><a href="vehiculo_crear.jsp"><i class="material-icons">person</i>Ingresar Vehiculo</a></li>
                        <li><a href="vehiculo_editar.jsp"><i class="material-icons">settings</i>Editar Vehiculo</a></li>
                        <li><a href="#!"><i class="material-icons">cancel</i>Eliminar Vehiculo</a></li>
                        <li><a href="#!"><i class="material-icons">power_settings_new</i>Log out</a></li>
                    </ul>        
                </nav>
            </div>
            <div class="section"></div>
            <div class="">
                <table class="responsive-table bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Codigo</th>
                            <th>Patente</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Tipo Vehiculo</th>
                            <th>Empresa</th>
                            <th>Estado</th>
                            <th>Obra</th>
                        </tr>
                    </thead>

                    <tbody>
                         <% Conexion conexion=new Conexion();
                            conexion.setSQL("SELECT vehiculos.vehiculo_id,vehiculos.codigo,vehiculos.patente,vehiculos.marca,vehiculos.modelo,tipo_vehiculos.tipo,empresas.nombre_empresa,estado_vehiculos.estado,obras.nombre_obra from vehiculos,tipo_vehiculos,empresas,estado_vehiculos,obras WHERE vehiculos.vehiculo_id=tipo_vehiculos.tipo_vehiculo_id and vehiculos.vehiculo_id=empresas.empresa_id and vehiculos.vehiculo_id=estado_vehiculos.estado_id and choferes.chofer_id=obras.obra_id and estado='activo'");
                            while(conexion.getRs().next()){
                                out.println("<tr>");
                                out.println("<td>"+conexion.getRs().getString("vehiculo_id")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("codigo")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("patente")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("marca")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("modelo")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("tipo")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("nombre_empresa")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("estdo")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("nombre_obra")+"</td>");
                                out.println("</tr>");
                            }
                         %> 
                        
                    </tbody>
                </table>
            </div>  
        </main>
        <!--PIE DE PAGINA-->
        <footer class="page-footer blue-grey darken-4">
            <div class="footer-copyright">
                <div class="container">
                    © 2017 Desarrollado por Pablo Tomey, Galmier mancilla				
                </div>
            </div>
        </footer>
    </body>
</html>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../../Resources/js/materialize.min.js"></script>

<!--Script que activa el sidebar-->
<script>
    $(".sidenav-toggle").sideNav();
</script>
