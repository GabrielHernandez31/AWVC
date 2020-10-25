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
                        <div class="col-2"></div>
                        <div class="col-7">
                            <h2 style="text-align: center; color: white;">Bienvenido Administrador</h2>
                        </div>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Inicio
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="miCuenta.jsp">Empleados</a>
                                        <a class="dropdown-item" href="cerrarSesion.jsp">Automóviles</a>
                                        <a class="dropdown-item" href="cerrarSesion.jsp">Servicios</a>
                                        <a class="dropdown-item" href="cerrarSesion.jsp">RFID</a>
                                        <a class="dropdown-item" href="cerrarSesion.jsp">Casetas</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Mi cuenta
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="miCuenta.jsp">Consultar</a>
                                        <a class="dropdown-item" href="cerrarSesion.jsp">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- // BARRA DE NAVEGACION -->

            <!-- FORMULARIO REGISTRARSE -->
            <div class="row" style="margin-left: 15%; margin-right: 15%; margin-top: 5%; margin-bottom: 5%; border-radius: 5%; background-color: #66A5AD">
                <div class="col">
                    <div class="form-group row" style="padding-left: 39%; padding-top: 5%;">
                        <h2>Registrar Usuario.</h2>
                    </div>
                    <form action="registrarse.jsp" method="POST" style="padding-top: 5%; padding-left: 10%; padding-right: 10%">
                        <h3>Datos personales.</h3>
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Nombre(s):</label>
                            <div class="col-2">
                                <input type="text" class="form-control" name="nombre" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                            </div>
                            <label for="inputPassword" class="col-sm-2 col-form-label">A. Paterno:</label>
                            <div class="col-2">
                                <input type="text" class="form-control" name="nombre" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                            </div>
                            <label for="inputPassword" class="col-sm-2 col-form-label">A. Paterno:</label>
                            <div class="col-2">
                                <input type="text" class="form-control" name="nombre" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                            </div>
                        </div>
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Teléfono:</label>
                            <div class="col-3">
                                <input type="text" class="form-control" name="app" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                            </div>
                            <label for="inputPassword" class="col-sm-1 col-form-label">Rol:</label>
                            <div class="col-3">
                                <select>
                                    <option disabled selected>Selecciona una..</option>
                                    <option>Administrador</option>
                                    <option>Empleado</option>
                                </select>
                            </div>
                        </div>
                        <h3>Datos de seguridad.</h3>
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Correo:</label>
                            <div class="col-5">
                                <input type="text" class="form-control" name="correo" required pattern="[a-zA-Z0-9]+@+(gmail|hotmail)+\.+(com|mx|org)" title="EJ: correo@dominio.terminacion (DOMINIO: gmail | hotmail y TERMINACIÓN: com | mx | org)">
                            </div>
                        </div>
                        <div class="form-group row" style="font-size: 20px;">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                            <div class="col-3">
                                <input type="password" class="form-control" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Min. 3 caracteres, Max. 15 caracteres. Debe incluir al menos: 1-Mayuscula, 1-Minuscula y 1-Numero">
                            </div>
                            <label for="inputPassword" class="col-sm-3 col-form-label">Confirm. Password:</label>
                            <div class="col-3">
                                <input type="password" class="form-control" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Min. 3 caracteres, Max. 15 caracteres. Debe incluir al menos: 1-Mayuscula, 1-Minuscula y 1-Numero">
                            </div>
                        </div>
                        <div class="form-group row" style="padding-left: 25%; padding-top: 5%">
                            <div class="col-4">
                                <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" name="accion" value="Registrarse"><!-- BOTON REGISTRARSE -->
                            </div>
                            <div class="col-4">
                                <a href="index.jsp" style="text-decoration: none"><button type="button" class="btn btn-danger" style="width: 100%; font-size: 20px;">Cancelar</button></a><!-- BOTON REGRESAR -->
                            </div>
                        </div>
                        <div class="form-group row" style="padding-top: 5%; font-size: 15px; padding-left: 25%; margin-bottom: 10%;">
                            <p style="margin-right: 2%; color: #343a40">¿Ya tienes una cuenta?</p>
                            <b><a href="iniciarSesion.jsp" style="text-decoration: none; color: black">¡Inicia sesión ahora!</a></b>
                        </div>
                    </form>
                </div>
            </div>
            <!-- // FORMULARIO REGISTRARSE -->

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
