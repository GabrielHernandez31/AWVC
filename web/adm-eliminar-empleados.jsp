<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = 0;
    if(request.getParameter("id_us")!=null){
        id = Integer.parseInt(request.getParameter("id_us"));
    }
    
    if(id>0){
        Usuario us = new Usuario();
        us.setId_usuario(id);
        if(us.deleteUsuario()){
            response.sendRedirect("adm-gestionar-empleados.jsp");
        }else{
            out.print("<script>cancelar=confirm('Error al eliminar'); if(cancelar){ window.location.href='adm-gestionar-empleados.jsp'; }else{ window.location.href='adm-gestionar-empleados.jsp'; }</script>");
        }
    }
%>
