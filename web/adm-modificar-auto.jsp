<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.Automovil" %>
<%@page import="Modelo.RFID" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
     */
    HttpSession sesion = request.getSession();
    String email = (String) sesion.getAttribute("email");
    String id_automovil = (String) sesion.getAttribute("id_automovil");
    int id_auto = Integer.parseInt(id_automovil);
    
    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
     */
    Usuario usuario = new Usuario(email);
    int id_usu = usuario.getId_usuario();
    int id_rol = usuario.getId_rol();
    
    Automovil auto = new Automovil();
    RFID Rfid = new RFID();

    /*
    Valida si hay una sesion activa.
    En caso de que no exista una sesion activa, se redirige al index
     */
    if (email == null) {
        response.sendRedirect("index.jsp");
    }

    /*
    MODIFICAR AUTO
     */
    String accion="", placa="", marca="", color="", modelo="", estatus="", empleado="", rfid="";

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
        empleado = request.getParameter("empleado");
    }
    if (request.getParameter("rfid") != null) {
        rfid = request.getParameter("rfid");
    }
    
    switch (accion) {
        case "Guardar":
            auto.setId_auto(id_auto);
            String[][] autos1 = auto.consultarAutomovilesModificar();
            auto.setEstatus_auto(estatus);
            if(empleado.equals("0")){ // SIN EMPLEADO
                if(rfid.equals("0")){ // SIN RFID
                    auto.updateAutomovilSinER();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else if(rfid.equals(autos1[0][7])){ // SIN RFID
                    auto.updateAutomovilSinER();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else{ // CON RFID
                    auto.setId_rfid(Integer.parseInt(rfid));
                    auto.updateAutomovilR();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }
            }else if(empleado.equals(autos1[0][6])){ // SIN EMPLEADO
                if(rfid.equals("0")){ // SIN RFID
                    auto.updateAutomovilSinER();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else if(rfid.equals(autos1[0][7])){ // SIN RFID
                    auto.updateAutomovilSinER();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else{ // CON RFID
                    auto.setId_rfid(Integer.parseInt(rfid));
                    auto.updateAutomovilR();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }
            }else{ // CON EMPLEADO
                if(rfid.equals("0")){ // SIN RFID
                    auto.setId_usuario(Integer.parseInt(empleado));
                    auto.updateAutomovilE();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else if(rfid.equals(autos1[0][7])){ // SIN RFID
                    auto.setId_usuario(Integer.parseInt(empleado));
                    auto.updateAutomovilE();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }else{ // CON RFID
                    auto.setId_usuario(Integer.parseInt(empleado));
                    auto.setId_rfid(Integer.parseInt(rfid));
                    auto.updateAutomovilConER();
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
                }
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
        <title>Modificar Automóvil</title>
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
                                        <h1 class="font-weight-bold">Modificar un Automovil</h1>
                                        <p class="text-dark mb-3">Ingresa la siguiente información. </p>
                                    </div>
                                </div>
                                <%
                                    auto.setId_auto(id_auto);
                                    String[][] autos = auto.consultarAutomovilesModificar();
                                %>
                                <form action="adm-modificar-auto.jsp" id="formulario" name="formulario" method="POST">
                                    <div class="form-row mb">
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">No. Placa: <span class="text-danger">*</span></label>
                                            <input name="placa" type="text" class="form-control" placeholder="PLACA" required onblur="" value="<% out.print(autos[0][1]); %>" disabled="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Marca: <span class="text-danger">*</span></label>
                                             <input name="marca" type="text" class="form-control" placeholder="MARCA" required onblur="" value="<% out.print(autos[0][2]); %>" disabled="">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Color: <span class="text-danger">*</span></label>
                                            <input name="color" type="text" class="form-control" placeholder="COLOR" required onblur="" value="<% out.print(autos[0][3]); %>" disabled="">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Modelo: <span class="text-danger">*</span></label>
                                        <input name="modelo" type="text" class="form-control" placeholder="Ingresa el modelo del auto" required onblur="" value="<% out.print(autos[0][4]); %>" disabled="">
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Estado: <span class="text-danger">*</span></label>
                                        <select name="estatus" class="form-control">
                                            <%  switch(autos[0][5]) { 
                                                case "Activo": %>
                                                    <option value="Activo" selected>Activo</option>
                                                    <option value="Mantenimiento">Mantenimiento</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                    <option value="Baja">Baja</option>
                                                <% break;
                                                case "Mantenimiento": %>
                                                    <option value="Activo" >Activo</option>
                                                    <option value="Mantenimiento"selected>Mantenimiento</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                    <option value="Baja">Baja</option>
                                                <% break;
                                                case "Inactivo": %>
                                                    <option value="Activo">Activo</option>
                                                    <option value="Mantenimiento">Mantenimiento</option>
                                                    <option value="Inactivo"selected>Inactivo</option>
                                                    <option value="Baja">Baja</option>
                                                <% break;
                                                case "Baja": %>
                                                    <option value="Activo">Activo</option>
                                                    <option value="Mantenimiento">Mantenimiento</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                    <option value="Baja" selected>Baja</option>
                                                <% break;  }   %>
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
                                            <%      } 
                                                    if(autos[0][6]=="Sin asignar aun."){ %>
                                                        <option value="0" selected="">Sin asignar aún.</option>
                                                <%  }else{ %>
                                                        <option value="<% out.print(autos[0][6]); %>" selected=""><% out.print(autos[0][6]); %></option>
                                                        <option value="0">Sin asignar aún.</option>
                                                <%  } %>          
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
                                                if(Rfid.existenRFIDAutos()){
                                                    String[][] rfids = Rfid.consultarRFIDAutos();
                                                    for( int cuenta = 0; cuenta<Rfid.contarRFIDAutos(); cuenta++){
                                            %>
                                                        <option value="<% out.print(rfids[cuenta][0]); %>"><% out.print(rfids[cuenta][1]); %></option>
                                            <%      } 
                                                    if(autos[0][7]=="Sin asignar aun."){ %>
                                                        <option value="0" selected="">Sin asignar aún.</option>
                                                <%  }else{ %>
                                                        <option value="<% out.print(autos[0][7]); %>" selected="" ><% out.print(autos[0][7]); %></option>
                                                        <option value="0">Sin asignar aún.</option>
                                                <%  } %> 
                                            <%  }else{ %>
                                                    <option disabled>No existen Tarjetas RFID</option>
                                                    <option value="0">Sin asignar aún.</option>
                                            <%  } %>
                                        </select>
                                    </div>

                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Guardar" onclick="Comprobar();">
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