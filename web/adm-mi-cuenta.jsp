
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/are.css" rel="stylesheet">
        <title>Mi Cuenta Administrador</title>
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
                                        <a class="dropdown-item" href="adm-gestionar-serv.jsp" style="font-size: 2vh">Servicio</a>
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
                                        <a class="dropdown-item" href="adm-mi-cuenta.jsp" style="font-size: 2vh">Mi Cuenta</a>
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
            <div class="row justify-content-center" style="min-height: 80vh">

                <div class="container col-md-12 col-lg-10">
                    <div class="row col-12">
                        <div class="col-xl-12 text-center">
                            <h1 class="text-dark">Mi Cuenta (Administrador)</h1>
                        </div>
                    </div>

                    <div class="row justify-content-center align-content-center" >
                        <div class="col-12-block table-responsive"  style="padding-top: 1vh;padding-bottom: 1vh; font-size: 2.5vh">
                            <table class="table text-center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">A. Paterno</th>
                                        <th scope="col">A. Materno</th>
                                        <th scope="col">Telefono</th>
                                        <th scope="col">Correo</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center"><a class="text-primary" data-toggle="collapse" href="#collapseMod" role="button" aria-expanded="false" aria-controls="collapseMod">
                                                <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                </svg>
                                            </a> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                        </div>
                    </div>

                    <div class="container collapse" id="collapseMod">
                        <div class="row  bg-info">
                            <div class="d-none d-md-block col-12 col-lg-5 register-bgge">

                            </div>
                            <div class="col-12 col-lg-7 d-flex">
                                <div class="container align-self-center p-6">

                                    <div class="form-row justify-content-center align-content-center">
                                        <div class="col-md-12">
                                            <h1 class="font-weight-bold">Editar Cuenta</h1>
                                            <p class="text-dark mb-3">Modifique los campos, que desea cambiar.</p>
                                        </div>
                                    </div>
                                    <form action="adm-mi-cuenta.jsp" id="" name="formulario" method="POST">
                                        <div class="form-row mb">
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Nombre:</label>
                                                <input name="txtNombre" type="text" class="form-control" placeholder="Nombre" required value="">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">A. Paterno</label>
                                                <input name="txtAp_pat" type="text" class="form-control" placeholder="Apellido P" required value="">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">A. Materno</label>
                                                <input name="txtAp_mat" type="text" class="form-control" placeholder="Apellido M" required value="">
                                            </div>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label  class="font-weight-bold">Rol</label>
                                            <input name="txtRol" type="text" class="form-control" placeholder="Rol" disabled=""/>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label  class="font-weight-bold">Telefono:</label>
                                            <input name="txtTel" type="text" class="form-control" placeholder="Telefono" required pattern="[0-9]{10}" title="Ingresa tu telefono" value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label  class="font-weight-bold">Correo electrónico:</label>
                                            <input name="txtCorreo" type="email" class="form-control" placeholder="Correo electrónico" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Ingresa tu correo electrónico Muestre un correo valido" value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label  class="font-weight-bold">¿Cambiar contraseña?</label>
                                            <input type="Radio" data-toggle="collapse" data-target="#collapsePass" aria-expanded="false" aria-controls="collapsePass"> Si

                                        </div>
                                        <div class="form-group mb-3 collapse" id="collapsePass">
                                            <label class="font-weight-bold">Contraseña Nueva</label>
                                            <input name="txtContra" type="password" class="form-control" placeholder="Contraseña Nueva">
                                            <label class="font-weight-bold">Confirmar Contraseña Nueva</label>
                                            <input name="txtVContra" type="password" class="form-control" placeholder="Confirmar Contraseña Nueva">
                                        </div>

                                        <div class="form-row mb justify-content-center">
                                            <div class="col-12 col-lg-6 text-center">
                                                <input type="submit" name="accion" class="btn btn-primary" value="Guardar">
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>

                </div>



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



        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>