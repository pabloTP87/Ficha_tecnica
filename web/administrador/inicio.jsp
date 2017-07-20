<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("contectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-invitado")){
        response.sendRedirect("../index.jsp");
    }else{
        
    }
%>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../Resources/css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" type="text/css" href="../Resources/css/style.css">
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
                                    <img style="width: 250px" src="../img/logo.png">
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#!"><i class="material-icons">home</i>Inicio</a></li>
                        <li><a href="#!"><i class="material-icons">directions_car</i>Modulo Vehiculos</a></li>
                        <li><a href="#!"><i class="material-icons">directions_walk</i>Modulo Choferes</a></li>
                        <li><a href="usuario/usuario_index.jsp"><i class="material-icons">perm_identity</i>Modulo Usuarios</a></li>
                        <li><a href="#!"><i class="material-icons">power_settings_new</i>Log out</a></li>
                    </ul>        
                </nav>
            </div>
            <div class="section"></div>
            <!--PRIMER PANEL FICHA TECNICA-->
            <div class="row container">
                <div class="class col s12 m6">
                    <div>
                        <p class="flow-text">
                        <h2 class="light">Bienvenido!</h2>
                        <p>Al sistema de ingreso de flota y ficha tecnica
                            para sala de control GPS</p>
                        </p>
                    </div>
                </div>
                <div class="col s12 m6">
                    <div class="card grey darken-3">
                        <div class="card-content white-text">
                            <span class="card-title">Ficha Tecnica</span>
                            <p>En esta sección podra consultar la ficha técnica de cada vehiculo 
                                ingresado en el sistema con su respectiba imagen nde referencias y 
                                datos de utilidad</p>
                        </div>
                        <div class="card-action">
                            <a href="#">Consultar Ficha tecnica</a>              
                        </div>
                    </div>
                </div>
            </div>
            <!--SEGUNDO PANEL LISTAR EQUIPOS-->
            <div class="row container">
                <div class="col s12 m6 offset-l6">
                    <div class="card grey darken-3">
                        <div class="card-content white-text">
                            <span class="card-title">Listar Equipos</span>
                            <p>Consulte todos los equipos disponibles en el sistema, 
                                haciento filtros por patente, empresa o tipo de vehiculo</p>
                        </div>
                        <div class="card-action">
                            <a href="#">Consultar equipos</a>              
                        </div>
                    </div>
                </div>
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
<script type="text/javascript" src="../Resources/js/materialize.min.js"></script>
<!--Script que activa la barra lateral-->
<script>
    $(".sidenav-toggle").sideNav();
</script>
