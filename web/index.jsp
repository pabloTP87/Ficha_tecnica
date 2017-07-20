<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Acceso.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="Resources/css/materialize.min.css"  media="screen,projection"/> 
        <link rel="stylesheet" href="Resources/css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Index</title>
    </head>
    <body>
        <div id="login" class="blue-grey lighten-2 valign-wrapper">
            <div class="row">			
                <div class="card-panel z-depth-5">			
                    <form method="post" action="ServletUsuario?accion=ingresar">
                        <div class="row">
                            <div class="input-field col s12 center">
                                <img src="img/logo.png" alt="" class="responsive-img valign profile-image-login">
                                <p class="center">Sala de control GPS</p>
                            </div>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <label>Usuario</label>
                            <input type="text" name="username">
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">lock</i>
                            <label>Clave</label>
                            <input type="password" name="clave" class="validate">
                        </div>
                        <div class="center">
                            <button type="submit" class="waves-effect waves-light btn z-depth-5">Ingresar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="Resources/js/materialize.min.js"></script>
    </body>
</html>
