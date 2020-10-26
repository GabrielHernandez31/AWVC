<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%
    Usuario usuario = new Usuario();    
    String accion="", nombre="", app="", apm="", tel="", correo="", password="";
    int rol=0;
    
    if(request.getParameter("accion")!=null){
        accion = request.getParameter("accion");
    }
    if(request.getParameter("txtNombre")!=null){
        nombre = request.getParameter("txtNombre");
    }
    if(request.getParameter("txtAp_pat")!=null){
        app = request.getParameter("txtAp_pat");
    }
    if(request.getParameter("txtAp_mat")!=null){
        apm = request.getParameter("txtAp_mat");
    }
    if(request.getParameter("txtTel")!=null){
        tel = request.getParameter("txtTel");
    }
    if(request.getParameter("txtCorreo")!=null){
        correo = request.getParameter("txtCorreo");
    }
    if(request.getParameter("txtContra")!=null){
        password = request.getParameter("txtContra");
    }
    if(request.getParameter("txtRol")!=null){
        rol = Integer.parseInt(request.getParameter("txtRol"));
    }
    
    switch(accion){
        case "Registrar":
            usuario.setCorreo_usuario(correo);
            if(usuario.validarCorreoRegistro()){
                usuario.setNombre_usuario(nombre);
                usuario.setApp_usuario(app);
                usuario.setApm_usuario(apm);
                usuario.setTelefono_usuario(tel);
                usuario.setCorreo_usuario(correo);
                usuario.setPassword_usuario(password);
                usuario.setId_rol(rol);
                
                usuario.createUsuario();
                
                out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-registrar-empleados.jsp'; }else{ window.location.href='adm-registrar-empleados.jsp'; }</script>");
            }else{
                out.print("<script>cancelar=confirm('El correo ya existe!'); if(cancelar){ window.location.href='adm-registrar-empleados.jsp'; }else{ window.location.href='adm-registrar-empleados.jsp'; }</script>");
            }
        break;
        default:
            
        break;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <link href="css/are.css" rel="stylesheet">
        <title>Registrar Empleado</title>
    </head>
    <body>

        <div class="container-fluid">
            <!-- HEADER DE LA PAGINA -->
            <div class="row justify-content-center align-content-center" style="min-height: 10vh; background-color: #003B46">
                <div class="col">
                    <!-- INTRODUCE AQUI TODO LO DEL HEADER -->
                    <nav class="navbar navbar-expand-lg navbar-dark">
                        <a class="navbar-brand"><h3>AWCV</h3></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home.jsp" style="font-size: 3vh">Inicio</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 3vh">
                                        Mi cuenta</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="miCuenta.jsp" style="font-size: 2vh">Consultar</a>
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
                <section class="contact-box">
                    <div class="row  bg-info align-content-center justify-content-center">
                        <div class="d-none d-md-block col-xl-5 col-lg-12 register-bg">
                        </div>
                        <div class="col-xl-7 col-lg-10 d-flex">
                            <div class="container align-self-center p-6">
                                <div class="form-row justify-content-center align-content-center"">
                                    <div class="col-md-12">
                                        <h1 class="font-weight-bold">Registrar un Empleado</h1>
                                        <p class="text-dark mb-3">Ingresa la siguiente información. </p>
                                    </div>
                                </div>
                                <form action="adm-registrar-empleados.jsp" id="" name="formulario" method="POST">
                                    <div class="form-row mb">
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Nombre: <span class="text-danger">*</span></label>
                                            <input name="txtNombre" type="text" class="form-control" placeholder="Tu nombre" required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">A. Paterno <span class="text-danger">*</span></label>
                                            <input name="txtAp_pat" type="text" class="form-control" placeholder="Tu apellido" required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">A. Materno <span class="text-danger">*</span></label>
                                            <input name="txtAp_mat" type="text" class="form-control" placeholder="Tu apellido" required>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Rol<span class="text-danger">*</span></label>
                                        <select name="txtRol" class="form-control">
                                            <option value="0" disabled selected>Elegir</option> 
                                            <option value="1">Administrador</option>
                                            <option value="2">Empleado</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Telefono<span class="text-danger">*</span></label>
                                        <input name="txtTel" type="text" class="form-control" placeholder="Ingresa tu telefono" required pattern="[0-9]{10}" title="Debe contener 10 dígitos">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Correo electrónico <span class="text-danger">*</span></label>
                                        <input name="txtCorreo" type="email" class="form-control" placeholder="Ingresa tu correo electrónico" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Muestre un correo valido">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Contraseña <span class="text-danger">*</span></label>
                                        <input name="txtContra" type="password" class="form-control" placeholder="Ingresa una Contraseña" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Confirmar Contraseña <span class="text-danger">*</span></label>
                                        <input name="txtVContra" type="password" class="form-control" placeholder="Confirmar Contraseña" required>
                                    </div>

                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Registrar">
                                        </div>
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="button" name="btnRegresar" class="btn btn-secondary" value="Regresar" onclick="location = 'home.jsp'" >
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
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