<%@page import="Modelo.Caseta" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = 0;
    if(request.getParameter("id_caseta")!=null){
        id = Integer.parseInt(request.getParameter("id_caseta"));
    }
    
    if(id>0){
        Caseta us = new Caseta();
        us.setId_caseta(id);
        if(us.deleteCaseta()){
            out.print("<script>cancelar=confirm('Se eliminó correctamente'); if(cancelar){ window.location.href='adm-gestionar-casetasa.jsp'; }else{ window.location.href='adm-gestionar-casetas.jsp'; }</script>");
            response.sendRedirect("adm-gestionar-casetas.jsp");
        }else{
            out.print("<script>cancelar=confirm('Error al eliminar'); if(cancelar){ window.location.href='adm-gestionar-casetas.jsp'; }else{ window.location.href='adm-gestionar-casetas.jsp'; }</script>");
        }
    }
%>
