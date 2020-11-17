<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.Automovil" %>
<%@page import="Modelo.RFID" %>
<%
    Usuario usuario = new Usuario();
    Automovil auto = new Automovil();
    RFID Rfid = new RFID();
    
    String accion="", placa="", marca="", color="", modelo="", estatus="";
    int empleado=0, rfid=0;

    if (request.getParameter("accion") != null) {
        accion = request.getParameter("accion");
    }
    if (request.getParameter("placa") != null) {
        placa = request.getParameter("placa");
    }
    if (request.getParameter("marca") != null) {
        marca = request.getParameter("marca");
    }
    if (request.getParameter("color") != null) {
        color = request.getParameter("color");
    }
    if (request.getParameter("modelo") != null) {
        modelo = request.getParameter("modelo");
    }
    if (request.getParameter("estatus") != null) {
        estatus = request.getParameter("estatus");
    }
    if (request.getParameter("empleado") != null) {
        empleado = Integer.parseInt(request.getParameter("empleado"));
    }
    if (request.getParameter("rfid") != null) {
        rfid = Integer.parseInt(request.getParameter("rfid"));
    }

    switch (accion) {
        case "Registrar":
            
            auto.setPlaca_auto(placa);
            if (auto.validarPlacaRegistro()){
                auto.setPlaca_auto(placa);
                auto.setMarca_auto(marca);
                auto.setColor_auto(color);
                auto.setModelo_auto(modelo);
                auto.setEstatus_auto(estatus);
                if(empleado==0){
                    if(rfid==0){//Sin empleado y sin RFID / 0-0
                        auto.createAutomovilSinER();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                    }else{//Sin empleado y con RFID / 0-1
                        auto.setId_rfid(rfid);
                        auto.createAutomovilR();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                    }
                }else{
                    if(rfid==0){//Con empleado y sin RFID / 1-0
                        auto.setId_usuario(empleado);
                        auto.createAutomovilE();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                    }else{//Con empleado y con RFID / 1-1
                        auto.setId_usuario(empleado);
                        auto.setId_rfid(rfid);
                        auto.createAutomovilConER();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                    }
                }
            } else {
                out.print("<script>cancelar=confirm('La placa del automóvil ya existe!'); if(cancelar){ window.location.href='adm-registrar-auto.jsp'; }else{ window.location.href='adm-registrar-auto.jsp'; }</script>");
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

        <!--FontAwesome-->
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

        <link href="css/are.css" rel="stylesheet">
       <script src="script/validar.js"></script>
        <title>Registrar Automovil</title>
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
            <div class="row justify-content-center align-content-center" style="min-height: 80vh;padding-top: 2vh;padding-bottom: 2vh">
                <div class="container">
                    <div class="row  bg-info">
                        <div class="d-none d-md-block col-12 col-lg-5 register-bgau">
                        </div>
                        <div class="col-12 col-lg-7 d-flex">
                            <div class="container align-self-center p-6">
                                <div class="form-row justify-content-center align-content-center"">
                                    <div class="col-md-12">
                                        <h1 class="font-weight-bold">Registrar un Automóvil</h1>
                                        <p class="text-dark mb-3">Ingresa la siguiente información. </p>
                                    </div>
                                </div>
                                <form action="adm-registrar-auto.jsp" id="formulario" name="formulario" method="POST">
                                    <div class="form-row mb">
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">No. Placa: <span class="text-danger">*</span></label>
                                            <input name="placa" type="text" class="form-control" placeholder="PLACA" required onblur="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Marca: <span class="text-danger">*</span></label>
                                             <input name="marca" type="text" class="form-control" placeholder="MARCA" required onblur="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Color: <span class="text-danger">*</span></label>
                                            <input name="color" type="text" class="form-control" placeholder="COLOR" required onblur="">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Modelo: <span class="text-danger">*</span></label>
                                        <input name="modelo" type="text" class="form-control" placeholder="Ingresa el modelo del auto" required onblur="">
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Estado: <span class="text-danger">*</span></label>
                                        <select name="estatus" class="form-control">
                                            <option value="Activo" selected>Activo</option>
                                            <option value="Mantenimiento">Mantenimiento</option>
                                            <option value="Inactivo">Inactivo</option>
                                            <option value="Baja">Baja</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Empleado:</label>
                                        <select name="empleado" class="form-control">
                                            <%
                                                if(usuario.existenUsuariosAuto()){
                                                    String[][] emple = usuario.consultarUsuariosAuto();
                                                    for( int cuenta = 0; cuenta<usuario.contarUsuariosAuto(); cuenta++){
                                            %>
                                                        <option value="<% out.print(emple[cuenta][0]); %>"><% out.print(emple[cuenta][1] + " " + emple[cuenta][2] + " " + emple[cuenta][3].charAt(0)+"."); %></option>
                                            <%      } %>
                                                    <option value="0" selected="">Sin asignar aún.</option>
                                            <%  }else{ %>
                                                    <option disabled>No existen empleados</option>
                                                    <option value="0">Sin asignar aún.</option>
                                            <%  } %>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">RFID:</label>
                                        <select name="rfid" class="form-control">
                                            <%
                                                if(Rfid.existenRFID()){
                                                    String[][] rfids = Rfid.consultarRFID();
                                                    for( int cuenta = 0; cuenta<Rfid.contarRFID(); cuenta++){
                                            %>
                                                        <option value="<% out.print(rfids[cuenta][0]); %>"><% out.print(rfids[cuenta][1]); %></option>
                                            <%      } %>
                                                        <option value="0" selected>Sin asignar aún.</option>
                                            <%  }else{ %>
                                                    <option disabled>No existen Tarjetas RFID</option>
                                                    <option value="0">Sin asignar aún.</option>
                                            <%  } %>
                                        </select>
                                    </div>

                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Registrar" onclick="Comprobar();">
                                        </div>
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="button" name="btnRegresar" class="btn btn-secondary" value="Regresar" onclick="location = 'adm-gestionar-auto.jsp'" >
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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