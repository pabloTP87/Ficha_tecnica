<%-- 
    Document   : usuario_editar
    Created on : 18-jul-2017, 23:39:29
    Author     : Pablo
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
                            <li><a href="#!">Empresas</a></li>
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
                        <li><a href="usuario_crear.jsp"><i class="material-icons">person</i>Ingresar Usuario</a></li>
                        <li><a href="usuario_editar.jsp"><i class="material-icons">settings</i>Editar Usuario</a></li>
                        <li><a href="../../ServletUsuario?accion=cerrar"><i class="material-icons">power_settings_new</i>Log out</a></li>
                    </ul>        
                </nav>
            </div>
            <div class="section"></div>
            <div class="container">
                <h5>Usuarios ingresados en el sistema:</h5>
                <table class="responsive-table bordered highlight">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>1er Apellido</th>
                            <th>Username</th>
                            <th>Empresa</th>
                            <th>Privilegio</th>
                            <th>Editar</th>
                            <th>Elimnar</th>
                        </tr>
                    </thead>

                    <tbody>
                         <% Conexion conexion=new Conexion();
                            conexion.setSQL("SELECT usuarios.usuario_id,usuarios.nombre_usuario,usuarios.ap_paterno,usuarios.username,empresas.nombre_empresa,privilegios.tipo_privilegio from usuarios,empresas,privilegios WHERE  usuarios.empresa_id=empresas.empresa_id and usuarios.privilegio_id=privilegios.privilegio_id and estado='activo'");
                            while(conexion.getRs().next()){
                                out.println("<tr>");
                                out.println("<td>"+conexion.getRs().getString("usuario_id")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("nombre_usuario")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("ap_paterno")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("username")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("nombre_empresa")+"</td>");
                                out.println("<td>"+conexion.getRs().getString("tipo_privilegio")+"</td>");
                                out.println("<td><a href=usuario_actualizar.jsp?edit="+conexion.getRs().getString("usuario_id")+">Editar</a></td>");
                                out.println("<td><a href=../../ServletUsuario?eliminar="+conexion.getRs().getString("usuario_id")+">Eliminar</a></td>");
                                out.println("</tr>");
                            }
                         %> 
                        
                    </tbody>
                </table>
                    <form action="usuario_crear.jsp">
                        <div class="input-field col s12">    
                            <button class="btn waves-effect waves-light" type="submit" name="action">Crear nuevo usuario
                                <i class="material-icons right">send</i>
                            </button>      
                        </div>
                    </form>    
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