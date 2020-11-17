<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
     */
    HttpSession sesion = request.getSession();
    String email = (String) sesion.getAttribute("email");

    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
     */
    Usuario usuario = new Usuario(email);
    String nom_usu = usuario.getNombre_usuario();
    String app_usu = usuario.getApp_usuario();
    int id_usu = usuario.getId_usuario();
    int id_rol = usuario.getId_rol();

    /*
    Valida si hay una sesion activa.
    En caso de que no exista una sesion activa, se redirige al index
     */
    if (email == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Home AWCV</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- HEADER DE LA PAGINA -->
            <div class="row justify-content-center align-content-center" style="min-height: 10vh; background-color: #003B46">
                <div class="col">
                    <!-- INTRODUCE AQUI TODO LO DEL HEADER -->
                    <nav class="navbar navbar-expand-lg navbar-dark">
                        <a class="navbar-brand" style="font-size: 4vh">AWCV</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home.jsp" style="font-size: 3vh">Home</a>
                                </li>
                                <li class="nav-item dropleft show ">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 3vh">
                                        Menu</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="adm-gestionar-auto.jsp" style="font-size: 2vh">Automoviles</a>
                                        <a class="dropdown-item" href="adm-gestionar-casetas.jsp" style="font-size: 2vh">Casetas</a>
                                        <a class="dropdown-item" href="adm-gestionar-empleados.jsp" style="font-size: 2vh">Empleados</a>
                                        <a class="dropdown-item" href="adm-gestionar-rfid.jsp" style="font-size: 2vh">RFID</a>
                                        <a class="dropdown-item" href="adm-gestionar-serv.jsp" style="font-size: 2vh">Servicios</a>
                                        <a class="dropdown-item" href="adm-historial-servicios.jsp" style="font-size: 2vh">Historial de Servicios</a>
                                    </div>
                                </li>

                                <li class="nav-item dropleft">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 3vh">
                                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                                        <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                        <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                                        </svg>   
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <% if (id_rol == 1) { %>
                                        <a class="dropdown-item" href="adm-mi-cuenta.jsp" style="font-size: 2vh">Mi Cuenta</a>
                                        <% } else { %>
                                        <a class="dropdown-item" href="emp-mi-cuenta.jsp" style="font-size: 2vh">Mi Cuenta</a>                                        
                                        <% } %>
                                        <a class="dropdown-item" href="cerrarSesion.jsp" style="font-size: 2vh">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- // INTRODUCE AQUI TODO LO DEL HEADER -->
                </div>
            </div>
            <!-- // HEADER DE LA PAGINA -->
            <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
            <!-- CUERPO DE LA PAGINA -->
            <div class="row justify-content-center align-content-center" style="min-height: 80vh">
                <!-- INTRODUCE AQUI TODO LO DEL CUERPO -->
                <% if (id_rol == 1) { %>
                <!-- ESTO ES LO DE EMPLEADO -->
                <div class="col-12 col-sm-10 col-md-10 col-lg-10">
                    <div class="row row-cols-1 row-cols-md-3" style="margin-top: 10px">
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/empl.jpg" class="card-img-top">
                                <a href="adm-gestionar-empleados.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Empleados</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/aut.jpg" class="card-img-top">
                                <a href="adm-gestionar-auto.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Automóviles</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/servt.jpg" class="card-img-top">
                                <a href="adm-gestionar-serv.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Servicios</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/cast.jpg" class="card-img-top">
                                <a href="adm-gestionar-casetas.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Casetas</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/erf.jpg" class="card-img-top">
                                <a href="adm-gestionar-rfid.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">RFID's</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/ehistorial.jpg" class="card-img-top">
                                <a href="adm-historial-servicios.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Consultar Historial</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- // ESTO ES LO DE EMPLEADO-->
                <% } else { %>
                <!-- ESTO ES LO DE EMPLEADO -->
                <div class="col-12 col-sm-10 col-md-10 col-lg-10">
                    <div class="row row-cols-1 row-cols-md-3" style="margin-top: 10px">
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/aut.jpg" class="card-img-top">
                                <a href="emp-gestionar-auto.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Automóvil</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/servt.jpg" class="card-img-top">
                                <a href="emp-gestionar-serv.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Servicios</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card">
                                <img src="img/cast.jpg" class="card-img-top">
                                <a href="emp-gestionar-casetas.jsp" style="text-decoration: none;">
                                    <div class="card-body bg-info text-center">
                                        <h5 class="card-title text-dark">Casetas</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- // ESTO ES LO DE EMPLEADO-->
                <% }%>
                <!-- // INTRODUCE AQUI TODO LO DEL CUERPO -->
            </div>
            <!-- // CUERPO DE LA PAGINA -->
            <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
            <!-- FOOTER REDES -->
            <div class="row justify-content-center align-content-center" style="min-height: 10vh; background-color: #003B46; color: white">
                <div class="col">
                    <!-- INTRODUCE AQUI TODO LO DEL FOOTER -->
                    <footer class="page-footer font-small">
                        <div class="footer-copyright text-center">© 2020 Copyright:
                            <a> Derechos Reservados AWCV</a>
                        </div>
                    </footer>
                    <!-- // INTRODUCE AQUI TODO LO DEL FOOTER -->
                </div>
            </div>
            <!-- //FOOTER REDES -->
        </div>

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        -->
    </body>
</html>