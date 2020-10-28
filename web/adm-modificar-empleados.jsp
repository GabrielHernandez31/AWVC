<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
    */
    HttpSession sesion = request.getSession();
    String email=(String)sesion.getAttribute("email");
    String id_usuario=(String)sesion.getAttribute("id_usuario");
    int id_us = Integer.parseInt(id_usuario);
    
    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
    */
    Usuario usuario = new Usuario(email);
    int id_usu = usuario.getId_usuario();
    int id_rol = usuario.getId_rol();
    
    /*
    Valida si hay una sesion activa.
    En caso de que no exista una sesion activa, se redirige al index
    */
    if(email==null){
        response.sendRedirect("index.jsp");
    }
    
    /*
    MODIFICAR EMPLEADO
    */
    
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
    
    int id_usu2 = 0;
    if(request.getParameter("id_us")!=null){
        id_usu2 = Integer.parseInt(request.getParameter("id_us"));
    }
    Usuario usuario1 = new Usuario();    
    switch(accion){
        case "Guardar":
            
            usuario1.setId_usuario(id_us);
            String[][] datos = usuario1.consultarUsuariosEmp();
            
            
            if(tel.equals(datos[0][4])){
                if(correo.equals(datos[0][5])){
                    if(password.equals("")){
                        usuario1.setPassword_usuario(datos[0][7]);
                        usuario1.setId_rol(rol);
                        usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                        usuario1.updateUsuarioSCST();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                    }else{
                        usuario1.setPassword_usuario(password);
                        usuario1.setId_rol(rol);
                        usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                        usuario1.updateUsuarioSCST();
                        out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                    }
                }else{
                    usuario1.setCorreo_usuario(correo);
                    if(usuario1.validarCorreoRegistro()){
                        if(password.equals("")){
                            usuario1.setCorreo_usuario(correo);
                            usuario1.setPassword_usuario(datos[0][7]);
                            usuario1.setId_rol(rol);
                            usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                            usuario1.updateUsuarioCCST();
                            out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                        }else{
                            usuario1.setCorreo_usuario(correo);
                            usuario1.setPassword_usuario(password);
                            usuario1.setId_rol(rol);
                            usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                            usuario1.updateUsuarioCCST();
                            out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                        }
                    }else{
                        out.print("<script>cancelar=confirm('El correo ya está en uso'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                    }
                }
            }else{
                if(correo.equals(datos[0][5])){
                    usuario1.setTelefono_usuario(tel);
                    if(usuario1.validarTelefonoRegistro()){
                        if(password.equals("")){
                            usuario1.setTelefono_usuario(tel);
                            usuario1.setPassword_usuario(datos[0][7]);
                            usuario1.setId_rol(rol);
                            usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                            usuario1.updateUsuarioSCCT();
                            out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                        }else{
                            usuario1.setTelefono_usuario(tel);
                            usuario1.setPassword_usuario(password);
                            usuario1.setId_rol(rol);
                            usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                            usuario1.updateUsuarioSCCT();
                            out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                        }
                    }else{
                        out.print("<script>cancelar=confirm('El teléfono ya está en uso'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                    }
                }else{
                    usuario1.setTelefono_usuario(tel);
                    if(usuario1.validarTelefonoRegistro()){
                        usuario1.setCorreo_usuario(correo);
                        if(usuario1.validarCorreoRegistro()){
                            if(password.equals("")){
                                usuario1.setTelefono_usuario(tel);
                                usuario1.setCorreo_usuario(correo);
                                usuario1.setPassword_usuario(datos[0][7]);
                                usuario1.setId_rol(rol);
                                usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                                usuario1.updateUsuarioCCCT();
                                out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                            }else{
                                usuario1.setTelefono_usuario(tel);
                                usuario1.setCorreo_usuario(correo);
                                usuario1.setPassword_usuario(password);
                                usuario1.setId_rol(rol);
                                usuario1.setId_usuario(Integer.parseInt(datos[0][0]));
                                usuario1.updateUsuarioCCCT();
                                out.print("<script>cancelar=confirm('¡Registro Exitoso!'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                            }
                        }else{
                            out.print("<script>cancelar=confirm('El correo ya está en uso'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                        }
                    }else{
                        out.print("<script>cancelar=confirm('El teléfono ya está en uso'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
                    }
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

        <link href="css/are.css" rel="stylesheet">
        <title>Modificar Empleado</title>
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

                                <li class="nav-item dropleft show">
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
            <div class="row justify-content-center align-content-center" style="min-height: 80vh;padding-top: 2vh;padding-bottom: 2vh">



                <div class="container">
                    <div class="row  bg-info">
                        <div class="d-none d-md-block col-12 col-lg-5 register-bgge">

                        </div>
                        <div class="col-12 col-lg-7 d-flex">
                            <div class="container align-self-center p-6">

                                <div class="form-row justify-content-center align-content-center">
                                    <div class="col-md-12">
                                        <h1 class="font-weight-bold">Modificar Empleado</h1>
                                        <p class="text-dark mb-3">Modifique los campos, que desea cambiar. </p>
                                    </div>
                                </div>
                                <%  
                                    usuario1.setId_usuario(id_us);
                                    String[][] usuarios = usuario1.consultarUsuariosEmp();
                                %>
                                <form action="adm-modificar-empleados.jsp" id="" name="formulario" method="POST">
                                    <div class="form-row mb">
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">Nombre: <span class="text-danger">*</span></label>
                                            <input name="txtNombre" type="text" class="form-control" placeholder="Nombre" required value="<% out.print(usuarios[0][1]); %>">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">A. Paterno <span class="text-danger">*</span></label>
                                            <input name="txtAp_pat" type="text" class="form-control" placeholder="Apellido M" required value="<% out.print(usuarios[0][2]); %>">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="font-weight-bold">A. Materno <span class="text-danger">*</span></label>
                                            <input name="txtAp_mat" type="text" class="form-control" placeholder="Apellido M" required value="<% out.print(usuarios[0][3]); %>">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Rol<span class="text-danger">*</span></label>
                                        <select name="txtRol" class="form-control">
                                            <% if(usuarios[0][6].equals("Administrador")){ %>
                                            <option value="1" selected>Administrador</option>
                                            <option value="2">Empleado</option>
                                            <% }else { %>
                                            <option value="1">Administrador</option>
                                            <option value="2" selected>Empleado</option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Telefono<span class="text-danger">*</span></label>
                                        <input name="txtTel" type="text" class="form-control" placeholder="Telefono" required pattern="[0-9]{10}" title="Ingresa tu telefono" value="<% out.print(usuarios[0][4]); %>">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  class="font-weight-bold">Correo electrónico <span class="text-danger">*</span></label>
                                        <input name="txtCorreo" type="email" class="form-control" placeholder="Correo electrónico" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Ingresa tu correo electrónico Muestre un correo valido" value="<% out.print(usuarios[0][5]); %>">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Contraseña Nueva<span class="text-danger">*</span></label>
                                        <input name="txtContra" type="password" class="form-control" placeholder="Contraseña Nueva">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Confirmar Contraseña Nueva <span class="text-danger">*</span></label>
                                        <input name="txtVContra" type="password" class="form-control" placeholder="Confirmar Contraseña Nueva">
                                    </div>

                                    <div class="form-row mb justify-content-center">
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="submit" name="accion" class="btn btn-primary" value="Guardar">
                                        </div>
                                        <div class="col-12 col-lg-6 text-center">
                                            <input type="button" name="btnRegresar" class="btn btn-secondary" value="Regresar" onclick="location = 'adm-gestionar-empleado.jsp'" >
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