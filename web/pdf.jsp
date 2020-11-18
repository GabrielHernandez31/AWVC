<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Conexion" %>
<%@page import="java.util.io.*"%> 
<%@page import="java.util.*"%> 

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.*" %>
<%@include file="Vista.jsp" %>
<%@include file="Conexion.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestionar Servicios</title>
    </head>
    <body>
        <%
        File reporte = new File (application.getRealPath("Reporte.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
        
        //String valor = request.getParameter("txtparametro");
        //parameter.put("mar",new String(valor));
        byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parameter, con);
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
        outputstream.flush();
        outputstream.close();
        %>
    </body>
</html>