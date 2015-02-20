<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Visualiza Cliente</title>
    </head>
    <body>
       <%@include file="/WEB-INF/layout/header.jspf" %>
        <h2>Datos Cliente</h2>
        ID: ${cliente.id}<br>
        Nombre: ${cliente.nombre}<br>
        DNI:${cliente.dni}<br>
        Socio: ${cliente.socio?"Sí":"No"}<br>
        <p><a href='${srvUrl}/edita?id=${cliente.id}'>Edita</a>&nbsp;
            <a href='${srvUrl}'>Volver</a></p>   
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>

