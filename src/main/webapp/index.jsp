<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title><fmt:message key="appName"/></title>
    </head>
    <body>
        <%@include file="/WEB-INF/layout/header.jspf" %>
        <h2>Opciones</h2>
        <ul>
            <li><a href="clientes">Gestión clientes</a></li>
        </ul>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>
