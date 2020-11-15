<%@page import="Modelo.Automovil" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = 0;
    if(request.getParameter("id_auto")!=null){
        id = Integer.parseInt(request.getParameter("id_auto"));
    }
    
    if(id>0){
        Automovil auto = new Automovil();
        auto.setId_auto(id);
        if(auto.deleteAutomovil()){
            out.print("<script>cancelar=confirm('Se eliminó correctamente'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
            response.sendRedirect("adm-gestionar-auto.jsp");
        }else{
            out.print("<script>cancelar=confirm('Error al eliminar'); if(cancelar){ window.location.href='adm-gestionar-auto.jsp'; }else{ window.location.href='adm-gestionar-auto.jsp'; }</script>");
        }
    }
%>
