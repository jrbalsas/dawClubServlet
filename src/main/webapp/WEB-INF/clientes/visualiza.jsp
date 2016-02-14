<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Visualiza Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>
    </head>
    <body class="container">
       <%@include file="/WEB-INF/layout/header.jspf" %>
        <main class="row">
            <nav class="col-md-2">
                <h2>Opciones</h2>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href='${srvUrl}/edita?id=${cliente.id}' class="btn btn-primary">Edita</a></li>
                    <li> <a href='${srvUrl}' class="btn btn-default">Volver</a></li>
                </ul>
            </nav>        
        <section class="col-md-10">
            <div class="panel panel-default">
            <h2 class="panel-heading">Datos Cliente</h2>
            <ul class="panel-body list-group">
                <li class="list-group-item"><strong>ID:</strong></span>
                    <span class="list-group-item-text">${cliente.id}</span></li>
                <li class="list-group-item"><strong>Nombre:</strong> ${cliente.nombre}</li>
                <li class="list-group-item"><strong>DNI:</strong>${cliente.dni}</li>
                <li class="list-group-item"><strong>Socio:</strong> ${cliente.socio?"Sí":"No"}</li>
                <li class="list-group-item"><strong>Medio Pago:</strong> ${mediosPago[cliente.medioPago]}</li>        
            </ul>
            </div>
        </section>
        </main>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>

