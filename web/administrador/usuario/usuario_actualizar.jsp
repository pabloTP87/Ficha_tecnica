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

<%
    String id=request.getParameter("edit");
    Conexion conexion=new Conexion();
    conexion.setSQL("select * from usuarios where usuario_id='"+id+"'");
    while(conexion.getRs().next()){
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
            <!--FORMULARIO-->
            <div class="row container">
                <h5>Actualizar datos del usuario:</h5>
                <form class="col s12" method="post" action="../../ServletUsuario?accion=actualizar">
                    <div class="row">
                        <div class="col s12 l6">
                            <div class="card z-depth-4">
                                <div class="class card-content">
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">perm_identity</i>
                                            <% 
                                                if(id.isEmpty()){
                                                    
                                            %>
                                                <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+id); %>" name="usuario_id">
                                            <% }else{ %>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+id); %>" name="usuario_id" readonly>
                                            <% } %>    
                                            <label for="icon_prefix">Id</label>
                                        </div>
                                    </div>	
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">perm_identity</i>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+conexion.getRs().getString("nombre_usuario")); %>" name="nombre_usuario">
                                            <label for="icon_prefix">Nombre</label>
                                        </div>
                                    </div>	
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">library_books</i>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+conexion.getRs().getString("ap_paterno")); %>" name="ap_paterno">
                                            <label for="icon_prefix">1er Apellido</label>
                                        </div>
                                    </div>
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">library_books</i>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+conexion.getRs().getString("ap_materno")); %>" name="ap_materno">
                                            <label for="icon_prefix">2do Apellido</label>
                                        </div>
                                    </div>
                                </div>		
                            </div>
                        </div>
                        <div class="col s12 l6">
                            <div class="card z-depth-4">
                                <div class="class card-content">
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">tab</i>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+conexion.getRs().getString("rut")); %>" name="rut">
                                            <label for="icon_prefix">Rut</label>
                                        </div>
                                            
                                    </div>	
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="icon_prefix" type="text" class="validate" value="<% out.println(""+conexion.getRs().getString("username")); %>" name="username">
                                            <label for="icon_prefix">Username</label>
                                        </div>
                                    </div>
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">vpn_key</i>
                                            <input id="icon_prefix" type="password" class="validate" value="<% out.println(""+conexion.getRs().getString("clave")); %>" name="clave">
                                            <label for="icon_prefix">Password</label>
                                        </div>
                                            
                                    </div>
                                </div>		
                            </div>
                        </div>
                    </div>
                                            
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="empresa_id">
                                <% conexion.setSQL("select * from empresas");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("empresa_id")); %>"><% out.println(conexion.getRs().getString("nombre_empresa")); %></option>
                                <% } %>
                            </select>
                            <label>Empresa</label>
                        </div>
                        <div class="input-field col s6">
                            <select name="privilegio_id">
                                <% conexion.setSQL("select * from privilegios");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("privilegio_id")); %>"><% out.println(conexion.getRs().getString("tipo_privilegio")); %></option>
                                <% } %>
                            </select>
                            <label>Privilegio de usuario</label>
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Actualizar usuario
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
        </main>
        <!--PIE DE PAGINA-->
        <div class="section"></div>
        <footer class="page-footer blue-grey darken-4">
            <div class="footer-copyright">
                <div class="container">
                    © 2017 Desarrollado por Pablo Tomey, Galmier mancilla				
                </div>
            </div>
        </footer>
    </body>
</html>
<% } %>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../../Resources/js/materialize.min.js"></script>
<!--Script que activa los Select-->
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<!--Script que activa el sidebar-->
<script>
    $(".sidenav-toggle").sideNav();
</script>

