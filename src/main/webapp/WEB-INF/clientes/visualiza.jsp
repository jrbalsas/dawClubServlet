<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Visualiza Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
    </head>
    <body>
       <%@include file="/WEB-INF/layout/header.jspf" %>
        <h2>Datos Cliente</h2>
        ID: ${cliente.id}<br>
        Nombre: ${cliente.nombre}<br>
        DNI:${cliente.dni}<br>
        Socio: ${cliente.socio?"Sí":"No"}<br>
        Medio Pago: ${mediosPago.buscaId(cliente.medioPago)}<br>        
        <p><a href='${srvUrl}/edita?id=${cliente.id}'>Edita</a>&nbsp;
            <a href='${srvUrl}'>Volver</a></p>   
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>

