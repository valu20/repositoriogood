<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File Reporte = new File(application.getRealPath("reporte.jasper"));
            Map<String, Object> parametros = new HashMap<String, Object>();
                    Connection conexion = null;
                    Conexion conBD = new Conexion();
                    conexion = conBD.Conexion();
byte[] bytes = JasperRunManager.runReportToPdf(Reporte.getPath(), parametros,conexion);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream salida = response.getOutputStream();
salida.write(bytes, 0, bytes.length);

salida.flush();
salida.close();



            %>
    </body>
</html>
