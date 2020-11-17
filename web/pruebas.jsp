<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- HEADER DE LA PAGINA -->
            <div class="row">
                <div class="col">
                    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #003B46">
                        <a class="navbar-brand"><h3>AWCV</h3></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.jsp"><h5>Inicio</h5></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="iniciarSesion.jsp"><h5>Iniciar sesión</h5></a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- // HEADER DE LA PAGINA -->

            <!-- CUERPO DE LA PAGINA -->
            <div class="row clearfix justify-content-center">
                <!--<script type="text/javascript">
                    function generar()
                    {
                        
                        var caracteres = "abcdefghijkmnpqrtuvwxyzABCDEFGHIJKLMNPQRTUVWXYZ012346789";
                        var contraseña = "";
                        for (i = 0; i < 13; i++)
                            contraseña += caracteres.charAt(Math.floor(Math.random() * caracteres.length));
                        document.getElementById("pass").value = contraseña;
                    }
                </script>
                <p ></p>
                <form id="Form" name="aleatorio" method="post" >
                    <input name="long" type="text" id="pass"  placeholder="contraseña">
                    <button type="button" onclick="generar();">Generar</button>
                </form>-->

                <div class="row row-cols-1 row-cols-md-3" style="margin-top: 10px">
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/empl.jpg" class="card-img-top">
                            <a href="adm-gestionar-empleados.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info ">
                                    <h5 class="card-title text-dark">Empleados</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/aut.jpg" class="card-img-top">
                            <a href="adm-gestionar-auto.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info">
                                    <h5 class="card-title text-dark">Automóviles</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/servt.jpg" class="card-img-top">
                            <a href="adm-gestionar-serv.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info">
                                    <h5 class="card-title text-dark">Servicios</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/cast.jpg" class="card-img-top">
                            <a href="adm-gestionar-casetas.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info">
                                    <h5 class="card-title text-dark">Casetas</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/erf.jpg" class="card-img-top">
                            <a href="adm-gestionar-rfid.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info">
                                    <h5 class="card-title text-dark">RFID's</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="img/ehistorial.jpg" class="card-img-top">
                            <a href="adm-historial-servicios.jsp" style="text-decoration: none;">
                                <div class="card-body bg-info">
                                    <h5 class="card-title text-dark">Consultar Historial</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- // CUERPO DE LA PAGINA -->

            <!-- FOOTER REDES -->
            <div class="row flex">
                <div class="col">
                    <footer class="page-footer font-small" style="background-color: #003B46; color: white">
                        <div class="footer-copyright text-center py-4">© 2020 Copyright:
                            <a> Derechos Reservados AWCV</a>
                        </div>
                    </footer>
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