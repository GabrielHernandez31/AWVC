<%@page import="Modelo.RFID" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = 0;
    if(request.getParameter("id_rfid")!=null){
        id = Integer.parseInt(request.getParameter("id_rfid"));
    }
    
    if(id>0){
        RFID r = new RFID();
        r.setId_rfid(id);
        if(r.deleteRFID()){
            out.print("<script>cancelar=confirm('Se eliminó correctamente'); if(cancelar){ window.location.href='adm-gestionar-rfid.jsp'; }else{ window.location.href='adm-gestionar-rfid.jsp'; }</script>");
            response.sendRedirect("adm-gestionar-rfid.jsp");
        }else{
            out.print("<script>cancelar=confirm('Error al eliminar'); if(cancelar){ window.location.href='adm-gestionar-rfid.jsp'; }else{ window.location.href='adm-gestionar-rfid.jsp'; }</script>");
        }
    }
%>
