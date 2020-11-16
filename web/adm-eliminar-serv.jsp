<%@page import="Modelo.Servicio" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = 0;
    if(request.getParameter("id_servicio")!=null){
        id = Integer.parseInt(request.getParameter("id_servicio"));
    }
    
    if(id>0){
        Servicio s = new Servicio();
        s.setId_servicio(id);
        if(s.deleteServicios()){
            out.print("<script>cancelar=confirm('Se eliminó correctamente'); if(cancelar){ window.location.href='adm-gestionar-serv.jsp'; }else{ window.location.href='adm-gestionar-serv.jsp'; }</script>");
            response.sendRedirect("adm-gestionar-serv.jsp");
        }else{
            out.print("<script>cancelar=confirm('Error al eliminar'); if(cancelar){ window.location.href='adm-gestionar-serv.jsp'; }else{ window.location.href='adm-gestionar-serv.jsp'; }</script>");
        }
    }
%>
