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
    
    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
    */
    Usuario usuario = new Usuario(email);
    String nombre_usu = usuario.getNombre_usuario();
    String app_usu = usuario.getApp_usuario();
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
    ACCIONES
    */
    String accion = "";
    if(request.getParameter("accion")!=null){
        accion = request.getParameter("accion");
    }
    switch(accion){
        case "eliminar":
            out.print("<script>alert('hola')</script>");
        break;
        default:
            
        break;
    }
%>
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
        <title>Gestionar Empleados</title>
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
                                        <a class="dropdown-item" href="adm-gestionar-casetas" style="font-size: 2vh">Casetas</a>
                                        <a class="dropdown-item" href="adm-gestionar-empleados.jsp" style="font-size: 2vh">Empleados</a>
                                        <a class="dropdown-item" href="adm-gestionar-rfid" style="font-size: 2vh">RFID</a>
                                        <a class="dropdown-item" href="adm-gestionar-serv" style="font-size: 2vh">Servicio</a>
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
            <div class="row justify-content-center" style="min-height: 80vh">

                <div class="container col-md-12 col-lg-10">
                    <div class="row col-12">
                        <div class="col-xl-12 text-center">
                            <h1 class="text-dark">Gestionar Empleado</h1>
                        </div>
                    </div>

                    <div class="row  bg-info justify-content-center">
                        <div class="col-12 col-md-8" style="padding-top: 1vh;padding-bottom: 1vh">
                            <label class="font-weight-bold col-12 col-md-2">Buscar:</label>
                            <input name="txtBusGE" type="password" class="form-con col-12 col-md-3" placeholder="Buscar..." required>
                            <label  class="font-weight-bold col-2 col-md-1">Por:</label>
                            <select name="selectge" class="form-con col-9 col-md-4">
                                <option value="0" disabled selected>Elegir</option> 
                                <option value="1">ID</option>
                                <option value="2">Correo</option>
                            </select>
                        </div>
                        <div class="col-12 col-md-4 text-center" style="padding-top: 1vh;padding-bottom: 1vh">
                            <a class="btn btn-success"><i class="fas fa-user-plus text-secondary-lg" style="width: 5vh"></i>Agregar </a>
                        </div>
                    </div>

                    <div class="row justify-content-center align-content-center" >
                        <div class="col-12-block table-responsive"  style="padding-top: 1vh;padding-bottom: 1vh; font-size: 2.5vh">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">A. Paterno</th>
                                        <th scope="col">A. Materno</th>
                                        <th scope="col">Telefono</th>
                                        <th scope="col">Correo</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col" class="text-center">Editar</th>
                                        <th scope="col" class="text-center">Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  
                                    usuario.setId_usuario(id_usu);
                                    if(usuario.existenUsuariosAdm()){
                                        usuario.setId_usuario(id_usu);
                                        String[][] usuarios = usuario.consultarUsuariosAdm();
                                        
                                        for( int cuenta = 0; cuenta<usuario.contarUsuariosAdm(); cuenta++){
                                    %>  
                                    <tr>
                                        <td><% out.print(usuarios[cuenta][0]); %></td>
                                        <td><% out.print(usuarios[cuenta][1]); %></td>
                                        <td><% out.print(usuarios[cuenta][2]); %></td>
                                        <td><% out.print(usuarios[cuenta][3]); %></td>
                                        <td><% out.print(usuarios[cuenta][4]); %></td>
                                        <td><% out.print(usuarios[cuenta][5]); %></td>
                                        <td><% out.print(usuarios[cuenta][6]); %></td>
                                         <td class="text-center"><a href="#" class="text-primary">
                                                <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                </svg>
                                            </a> 
                                        </td>
                                        <td class="text-center"><a href="adm-gestionar-empleados.jsp?accion='eliminar'" class="text-danger">
                                                <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }      
                                    %>
                                    <%   
                                     }else{  
                                    %>
                                    <tr>
                                        <th colspan="9" style="text-align: center;">No existen productos aún.</th>
                                    </tr>
                                    <%  } %>
                                </tbody>
                            </table>
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