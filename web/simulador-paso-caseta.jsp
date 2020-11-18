
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.Servicio" %>
<%@page import="Modelo.Automovil" %>
<%@page import="Modelo.RFID" %>
<%@page import="Modelo.Caseta" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
     */
    HttpSession sesion = request.getSession();
    String email = (String) sesion.getAttribute("email");
    
    String id_servicio = (String) sesion.getAttribute("id_serv");
    String id_auto = (String) sesion.getAttribute("id_auto");
    String id_usuario = (String) sesion.getAttribute("id_usu");

    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos mÃ¡s adelante
     */
    Usuario usuario = new Usuario(email);
    int id_usu = usuario.getId_usuario();
    int id_rol = usuario.getId_rol();

    Servicio servicio = new Servicio();
    Automovil auto = new Automovil();
    RFID rfid = new RFID();
    Caseta caseta = new Caseta();

    /*
    Valida si hay una sesion activa.
    En caso de que no exista una sesion activa, se redirige al index
     */
    if (email == null) {
        response.sendRedirect("index.jsp");
    }
    
    String accion = "", id_auto = "",  id_servicio="";
    String caseta1="", fecha1="", hora1="";
    String caseta1="", fecha1="", hora1="";
    String caseta1="", fecha1="", hora1="";
    String caseta1="", fecha1="", hora1="";
    
    if (request.getParameter("accion") != null) {
        accion = request.getParameter("accion");
    }
    if (request.getParameter("caseta1") != null) {
        caseta1 = request.getParameter("caseta1");
    }

    switch (accion) {
        case "Registrar":
            caseta.setUbicacion_caseta(ubicacion);
            if (caseta.validarUbicacionRegistro()) {
                caseta.setNombre_caseta(nombre);
                caseta.setUbicacion_caseta(ubicacion);
                caseta.setCosto_caseta(costo);
                caseta.createCaseta();
                out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-casetas.jsp'; }else{ window.location.href='adm-gestionar-casetas.jsp'; }</script>");
            } else {
                out.print("<script>cancelar=confirm('El correo ya existe!'); if(cancelar){ window.location.href='adm-registrar-caseta.jsp'; }else{ window.location.href='adm-registrar-caseta.jsp'; }</script>");
            }
            break;
        default:

            break;
    }
%><!DOCTYPE html>
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
        <title>Simulador</title>
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
                        <div class="d-none d-md-block col-12 col-lg-5 register-bg">
                        </div>
                        <div class="col-12 col-lg-7 d-flex">
                            <div class="container align-self-center p-6">
                                <div class="form-row justify-content-center align-content-center"">
                                    <div class="col-md-12">
                                        <h1 class="font-weight-bold">Simulador de Paso Por Caseta</h1>
                                        <p class="text-dark mb-3">Ingresa la siguiente información de paso por caseta. </p>
                                    </div>
                                </div>
                                <%
                                    servicio.setId_servicio(Integer.parseInt(id_servicio));
                                    String[][] servicios = servicio.consultarDatosServicioSimulacion();
                                    auto.setId_auto(Integer.parseInt(id_auto));
                                    String[][] autos = auto.consultarDatosAutoSimulacion();
                                    
                                %>
                                <form action="simulador-paso-caseta.jsp" id="formulario" name="formulario" method="POST">
                                    <div class="form-row mb">
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">RFID:</label>
                                            <input name="rfid" type="text" class="form-control" value="<% out.print(rfid.obtenerNombreRFID(autos[0][2])); %>" disabled="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Placa(Auto):</label>
                                            <input name="placa" value="<% out.print(autos[0][1]); %>" type="text" class="form-control"disabled="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Servicio:</label>
                                            <input name="servicio" value="<% out.print(servicios[0][2]); %>" type="text" class="form-control" disabled="">
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Ubicación:</label>
                                        <textarea class="form-control" name='Ubicacion' rows="3" disabled ><% out.print(servicios[0][2]); %></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">¿Añadir un paso por caseta?</label>
                                        <input type="button" class="btn btn-secondary" value="Si" data-toggle="collapse" data-target="#collapseCas1" aria-expanded="false" aria-controls="collapseCas1">
                                    </div>
                                    <div id="collapseCas1" class="collapse">
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Casetas:</label>
                                            </div>
                                            <div class="form-group col-md-10">
                                                <select name="caseta1" class="form-control"> 
                                                    <%
                                                        String[][] caseta1 =  caseta.consultarCasetas();
                                                        for( int cuenta = 0; cuenta<caseta.contarCasetas(); cuenta++){
                                                    %>
                                                            <option value="<% out.print(caseta1[cuenta][0]); %>"><% out.print(caseta1[cuenta][1]); %></option>
                                                    <%  }   %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Fecha:</label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input name="fecha1" type="date" class="form-control" placeholder="16/11/2020">
                                            </div>
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Hora:</label>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="hora1" type="time" class="form-control" placeholder="15:05:52">
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-12">
                                                <label  class="font-weight-bold">¿Añadir otro paso por caseta?</label>
                                                <input type="button" class="btn btn-secondary" value="Si" data-toggle="collapse" data-target="#collapseCas2" aria-expanded="false" aria-controls="collapseCas2">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div id="collapseCas2" class="collapse">
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Casetas:</label>
                                            </div>
                                            <div class="form-group col-md-10">
                                                <select name="caseta2" class="form-control"> 
                                                    <%
                                                        String[][] caseta2 =  caseta.consultarCasetas();
                                                        for( int cuenta = 0; cuenta<caseta.contarCasetas(); cuenta++){
                                                    %>
                                                            <option value="<% out.print(caseta2[cuenta][0]); %>"><% out.print(caseta2[cuenta][1]); %></option>
                                                    <%  }   %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Fecha:</label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input name="fecha2" type="date" class="form-control" placeholder="16/11/2020">
                                            </div>
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Hora:</label>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="hora2" type="time" class="form-control" placeholder="15:05:52">
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-12">
                                                <label  class="font-weight-bold">¿Añadir otro paso por caseta?</label>
                                                <input type="button" class="btn btn-secondary" value="Si" data-toggle="collapse" data-target="#collapseCas3" aria-expanded="false" aria-controls="collapseCas3">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div id="collapseCas3" class="collapse">
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Casetas:</label>
                                            </div>
                                            <div class="form-group col-md-10">
                                                <select name="caseta3" class="form-control"> 
                                                    <%
                                                        String[][] caseta3 =  caseta.consultarCasetas();
                                                        for( int cuenta = 0; cuenta<caseta.contarCasetas(); cuenta++){
                                                    %>
                                                            <option value="<% out.print(caseta3[cuenta][0]); %>"><% out.print(caseta3[cuenta][1]); %></option>
                                                    <%  }   %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Fecha:</label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input name="fecha3" type="date" class="form-control" placeholder="16/11/2020">
                                            </div>
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Hora:</label>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="hora3" type="time" class="form-control" placeholder="15:05:52">
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-12">
                                                <label  class="font-weight-bold">¿Añadir otro paso por caseta?</label>
                                                <input type="button" class="btn btn-secondary" value="Si" data-toggle="collapse" data-target="#collapseCas4" aria-expanded="false" aria-controls="collapseCas4">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div id="collapseCas4" class="collapse">
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Casetas:</label>
                                            </div>
                                            <div class="form-group col-md-10">
                                                <select name="caseta4" class="form-control"> 
                                                    <%
                                                        String[][] caseta4 =  caseta.consultarCasetas();
                                                        for( int cuenta = 0; cuenta<caseta.contarCasetas(); cuenta++){
                                                    %>
                                                            <option value="<% out.print(caseta4[cuenta][0]); %>"><% out.print(caseta4[cuenta][1]); %></option>
                                                    <%  }   %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row mb">
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Fecha:</label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input name="fecha4" type="date" class="form-control" placeholder="16/11/2020">
                                            </div>
                                            <div class="form-group col-md-2 d-flex justify-content-end">
                                                <label class="font-weight-bold">Hora:</label>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="hora4" type="time" class="form-control" placeholder="15:05:52">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Registrar" onclick="Comprobar();">
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