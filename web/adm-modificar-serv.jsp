<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.Servicio" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
     */
    HttpSession sesion = request.getSession();
    String email = (String) sesion.getAttribute("email");
    String id_servicio1 = (String) sesion.getAttribute("id_servicio");
    int id_servicio = Integer.parseInt(id_servicio1);

    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
     */
    Usuario usuario = new Usuario(email);
    int id_usu = usuario.getId_usuario();
    int id_rol = usuario.getId_rol();

    Servicio servicio = new Servicio();

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
    String accion = "", nombre = "", descripcion = "", ubicacion = "", estatus = "", fecha = "", empleado = "";

    if (request.getParameter("accion") != null) {
        accion = request.getParameter("accion");
    }
    if (request.getParameter("nom-serv") != null) {
        nombre = request.getParameter("nom-serv");
    }
    if (request.getParameter("descripcion") != null) {
        descripcion = request.getParameter("descripcion");
    }
    if (request.getParameter("ubicacion") != null) {
        ubicacion = request.getParameter("ubicacion");
    }
    if (request.getParameter("estatusserv") != null) {
        estatus = request.getParameter("estatusserv");
    }
    if (request.getParameter("fecha") != null) {
        fecha = request.getParameter("fecha");
    }
    if (request.getParameter("empleado") != null) {
        empleado = request.getParameter("empleado");
    }

    switch (accion) {
        case "Guardar":

            servicio.setId_servicio(id_servicio);
            servicio.setNombre_servicio(nombre);
            servicio.setDescripcion_servicio(descripcion);
            servicio.setUbicacion_servicio(ubicacion);
            servicio.setEstatus_servicio(estatus);
            servicio.setFecha_servicio(fecha);

            String[][] servi = servicio.consultarServiciosModificar();

            if (empleado.equals("0")) { // Sin Empleado
                if (servicio.updateServiciosAdmSinEmp()) {
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-serv.jsp'; }else{ window.location.href='adm-gestionar-serv.jsp'; }</script>");
                } else {
                    out.print("<script>cancelar=confirm('Error al registrar!'); if(cancelar){ window.location.href='adm-modificar-serv.jsp'; }else{ window.location.href='adm-modificar-serv.jsp'; }</script>");
                }
            } else { // Con Empleado
                servicio.setId_usuario(Integer.parseInt(empleado));
                if (servicio.updateServiciosAdmConEmp()) {
                    out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-serv.jsp'; }else{ window.location.href='adm-gestionar-serv.jsp'; }</script>");
                } else {
                    out.print("<script>cancelar=confirm('Error al registrar!'); if(cancelar){ window.location.href='adm-modificar-serv.jsp'; }else{ window.location.href='adm-modificar-serv.jsp'; }</script>");
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
        <title>Modificar Servicio</title>
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
                                        <a class="dropdown-item" href="adm-gestionar-auto.jsp" style="font-size: 2vh">Automóviles</a>
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
                        <div class="d-none d-md-block col-12 col-lg-5 register-bgserv">
                        </div>
                        <div class="col-12 col-lg-7 d-flex">
                            <div class="container align-self-center p-6">
                                <div class="form-row justify-content-center align-content-center"">
                                    <div class="col-md-12">
                                        <h1 class="font-weight-bold">Modificar un Servicio</h1>
                                        <p class="text-dark mb-3">Se puede modificar la siguiente información.</p>
                                    </div>
                                </div>
                                <%
                                    servicio.setId_servicio(id_servicio);
                                    String[][] servicios = servicio.consultarServiciosModificar();
                                %>
                                <form action="adm-modificar-serv.jsp" id="formulario" name="formulario" method="POST">

                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Nombre: <span class="text-danger">*</span></label>
                                        <input name="nom-serv" type="text" class="form-control" placeholder="Ingresa el nombre del servicio" required onblur="" value="<% out.print(servicios[0][1]); %>">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Descripción: <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name='descripcion' rows="3" required="Ingre la descripción del servicio por favor"><% out.print(servicios[0][2]); %></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Ubicación: <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name='ubicacion' rows="3" required="Ingre la ubicación del servicio por favor"><% out.print(servicios[0][3]); %></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Estatus: <span class="text-danger">*</span></label>
                                        <select name="estatusserv" class="form-control">
                                            <option value="Activo" selected>Activo</option>
                                            <option value="En proceso">En proceso</option>
                                            <option value="Finalizado">Finalizado</option>
                                            <option value="Cancelado">Cancelado</option>
                                        </select>
                                    </div>
                                    <!-- OBTENEMOS LA FECHA ACTUAL -->
                                    <%
                                        java.util.Date fecha_actual = new Date();
                                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                    %>
                                    <!-- //OBTENEMOS LA FECHA ACTUAL -->
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Fecha: <span class="text-danger">*</span></label>
                                        <input name="fecha" type="date" min="<% out.print(formato.format(fecha_actual)); %>" value="<% out.print(servicios[0][5]); %>" class="form-control" placeholder="Ingresa la fecha para realizar el servicio" required onblur="">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Empleado:</label>
                                        <select name="empleado" class="form-control">
                                            <%
                                                if (usuario.existenUsuariosAdm()) {
                                                    String[][] emple = usuario.consultarUsuariosAdm();
                                                    for (int cuenta = 0; cuenta < usuario.contarUsuariosAdm(); cuenta++) {
                                            %>
                                            <option value="<% out.print(emple[cuenta][0]); %>"><% out.print(emple[cuenta][1] + " " + emple[cuenta][2] + " " + emple[cuenta][3].charAt(0) + "."); %></option>
                                            <%      }
                                                if (usuario.obtenerNombreUsuario(servicios[0][6]).equals("Sin asignar aun.")) { %>
                                            <option value="0" selected="">Sin asignar aún.</option>
                                            <%  } else { %>
                                            <option value="<% out.print(servicios[0][6]); %>" selected=""><% out.print(usuario.obtenerNombreUsuario(servicios[0][6])); %></option>
                                            <option value="0">Sin asignar aún.</option>
                                            <%  } %>          
                                            <%  } else { %>
                                            <option disabled>No existen empleados</option>
                                            <option value="0">Sin asignar aún.</option>
                                            <%  }%>
                                        </select>
                                    </div>

                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Guardar" onclick="Comprobar();">
                                        </div>
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="button" name="btnRegresar" class="btn btn-secondary" value="Regresar" onclick="location = 'adm-gestionar-serv.jsp'" >
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