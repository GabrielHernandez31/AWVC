<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario" %>
<%
    Usuario usuario = new Usuario();
    String accion = "", correo = "", password = "";

    if (request.getParameter("accion") != null) {
        accion = request.getParameter("accion");
    }
    if (request.getParameter("correo") != null) {
        correo = request.getParameter("correo");
    }
    if (request.getParameter("password") != null) {
        password = request.getParameter("password");
    }

    switch (accion) {
        case "Iniciar Sesion":
            usuario.setCorreo_usuario(correo);
            usuario.setPassword_usuario(password);
            if (usuario.iniciarSesion()) {
                HttpSession sesion_act = request.getSession();
                sesion_act.setAttribute("email", correo);

                response.sendRedirect("home.jsp");
            } else {
                out.print("<script>alert('Correo y/o contraseña incorrectos')</script>");
            }
            break;
        case "Regresar":
            response.sendRedirect("index.jsp");
            break;
        default:

            break;
    }
%>
<!doctype html>
<html lang="es>"
      <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <title>Iniciar Sesión</title>
</head>
<body>
    <div class="container-fluid">
        <!-- HEADER DE LA PAGINA -->
        <div class="row justify-content-center align-content-center" style="min-height: 10vh; background-color: #003B46">
            <div class="col">
                <!-- INTRODUCE AQUI TODO LO DEL HEADER -->
                <nav class="navbar navbar-expand-lg navbar-dark">
                    <a class="navbar-brand" style="font-size: 4vh;">AWCV</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 3vh;">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="iniciarSesion.jsp">Iniciar sesión</a>
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
        <div class="row justify-content-center align-content-center" style="min-height: 80vh;">
            <!-- INTRODUCE AQUI TODO LO DEL CUERPO -->
            <div class="d-none d-md-block col-md-3" style="padding:  0;">
                <img src="img/login.jpg" class="img-fluid w-100 h-100">
            </div>
            <div class="col-12-block col-md-4 bg-info" style="color: white;">
                <div class="row justify-content-center align-content-center" style="min-height: 50vh;">
                    <div class="col-12">
                        <form action="iniciarSesion.jsp" method="POST">
                            <div class="form-group row justify-content-center align-content-center">
                                <div class="col-12-block">
                                    <h1 style="font-size: 5vh;">Iniciar Sesión.</h1>
                                </div>
                            </div>
                            <div class="form-group row justify-content-center align-content-center">
                                <script>
                                    function vemail(mail) {

                                        const input = mail;

                                        input.willValidate = false;

                                        const maximo = 50;

                                        const messagec = document.getElementById('messagec');

                                        var reg = /^(([^<>()[\]\\., ; :\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

                                        var regOficial = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
                                        if (input.value.length > maximo) {
                                            input.style.borderColor = 'red';
                                            messagec.hidden = false;
                                            document.getElementById("mySubmit").disabled = true;
                                        } else {
                                            if (reg.test(input.value) && regOficial.test(input.value)) {
                                                input.style.borderColor = 'green';
                                                messagec.hidden = true;
                                                document.getElementById("mySubmit").disabled = false;
                                            } else if (reg.test(input.value)) {
                                                input.style.borderColor = 'green';
                                                messagec.hidden = true;
                                                document.getElementById("mySubmit").disabled = false;
                                            } else {
                                                input.style.borderColor = 'red';
                                                messagec.hidden = false;
                                                document.getElementById("mySubmit").disabled = true;
                                            }
                                        }
                                    }
                                </script>


                                <label class="col-2 col-form-label" ><i class="fas fa-user-alt fa-2x"></i></label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input type="text" class="form-control" name="correo" placeholder="correo@ejemplo.dom" required="El correo es obligatorio para iniciar sesion" onblur="vemail(this)" >
                                </div>
                            </div>


                            <script>
                                function vpass(pass) {
                                    let isValid = false;
                                    const input = pass;
                                    input.willValidate = false;
                                    const messagep = document.getElementById('messagep');
                                    if (!input.value) {
                                        isValid = false;
                                    } else {
                                        if (input.value.length !== 15 && input.value.length <= 6) {
                                            isValid = false;
                                        } else {
                                            isValid = true;
                                        }
                                    }
                                    if (!isValid) {
                                        input.style.borderColor = 'red';
                                        messagep.hidden = false;
                                        document.getElementById("mySubmit").disabled = true;
                                    } else {
                                        input.style.borderColor = 'green';
                                        messagep.hidden = true;
                                        document.getElementById("mySubmit").disabled = false;
                                    }
                                }
                            </script>

                            <div class="form-group row justify-content-center align-content-center">
                                <label class="col-2 col-form-label" ><i class="fas fa-lock fa-2x"></i></label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input type="password" class="form-control" placeholder="***************" name="password" required onblur="vpass(this);">
                                </div>
                            </div>
                            <div class="form-group row justify-content-center align-content-center">
                                <div class="col-12 col-lg-4 col-form-label text-center">
                                    <input type="submit" class="btn btn-primary" style="border-radius: 5rem;" name="accion" id="mySubmit" value="Iniciar Sesion"><!-- BOTON INICIAR SESION -->
                                </div>
                                <div class="col-12 col-lg-4 col-form-label text-center">
                                    <a href="index.jsp"><button type="button" class="btn btn-dark" style="border-radius: 5rem;">Regresar</button></a><!-- BOTON REGRESAR -->
                                </div>
                            </div>
                            <div class="form-group row justify-content-center align-content-center" id="messagec" hidden>
                                <div class="col-12 col-form-label text-center">
                                    <span class="text-dark">El formato del correo no es valido verifique sus datos por favor.</span>
                                </div>
                            </div>
                            <div class="form-group row justify-content-center align-content-center" id="messagep" hidden>
                                <div class="col-12 col-form-label text-center">
                                    <span class="text-dark">Verifique que el campo contraseña no este vacio y tenga entre 6 - 15 caracteres.</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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