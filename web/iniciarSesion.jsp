<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- BARRA DE NAVEGACION -->
            <div class="row">
                <div class="col">
                    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #003B46">
                        <a class="navbar-brand" href="">AWCV</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Inicio</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="iniciarSesion.jsp">Iniciar sesión</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- // BARRA DE NAVEGACION -->

            <!-- FORMULARIO INICIAR SESION -->
            <div class="row" style="margin-left: 25%; margin-right: 25%; margin-top: 5%; margin-bottom: 5%; border-radius: 5%; background-color: #66A5AD">
                <div class="col">
                    <div class="form-group row" style="padding-left: 39%; padding-top: 5%; color: #FFFFFF">
                        <h1>Iniciar sesión.</h1>
                    </div>
                    <form action="iniciarSesion.jsp" method="POST" style="padding-top: 5%; padding-left: 20%;">
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label" style="color: #FFFFFF">Correo:</label>
                            <div class="col-6">
                                <input type="text" class="form-control" name="correo" required pattern="[a-zA-Z0-9]+@+(gmail|hotmail)+\.+(com|mx|org)" title="EJ: correo@dominio.terminacion (DOMINIO: gmail | hotmail y TERMINACIÓN: com | mx | org)">
                            </div>
                        </div>
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label" style="color: #FFFFFF">Password:</label>
                            <div class="col-6">
                                <input type="password" class="form-control" name="password" required>
                            </div>
                        </div>
                        <div class="form-group row" style="padding-left: 10%; padding-top: 5%">
                            <div class="col-4">
                                <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" name="accion" value="Iniciar Sesion"><!-- BOTON INICIAR SESION -->
                            </div>
                            <div class="col-4">
                                <a href="index.jsp" style="text-decoration: none"><button type="button" class="btn btn-danger" style="width: 100%; font-size: 20px;">Regresar</button></a><!-- BOTON REGRESAR -->
                            </div>
                        </div>
                        <div class="form-group row" style="padding-top: 5%; font-size: 15px; padding-left: 3%; margin-bottom: 10%;">
                            <p style="margin-right: 2%; color: #FFFFFF">¿No tienes una cuenta?</p>
                            <b><a href="registrarse.jsp" style="text-decoration: none; color: #003B46">¡Registrate ahora!</a></b>
                        </div>
                    </form>
                </div>
            </div>
            <!-- // FORMULARIO INICIAR SESION -->

            <!-- FOOTER REDES -->
            <footer class="page-footer font-small" style="min-height: 00; background-color: #003B46; color: white">
                <div class="footer-copyright text-center py-4">© 2020 Copyright:
                    <a> Derechos Reservados AWCV</a>
                </div>
            </footer>
            <!-- //FOOTER REDES -->
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>