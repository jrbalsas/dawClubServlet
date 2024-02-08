<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="club" tagdir="/WEB-INF/tags/club" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Visualiza Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>
    </head>
    <body class="container">
       <club:cabecera-pagina/>
        <main class="row">
            <nav class="col-md-3">
                <h2>Opciones</h2>
                <ul class="nav flex-column nav-pills ">
                    <li class="nav-item"><club:logout-button/></li>
                    <li class="nav-item"><a class="nav-link active" href='<c:url value="/clientes/edita?id=${cliente.id}"/>'>Edita</a></li>
                    <li class="nav-item"> <a class="nav-link" href='<c:url value="/clientes/"/>'>Volver</a></li>
                </ul>
            </nav>        
        <section class="col-md-9">
            <div class="panel panel-default">
            <h2 class="panel-heading">Datos Cliente</h2>
            <ul class="panel-body list-group">
                <li class="list-group-item"><strong>ID:</strong>
                    <span class="list-group-item-text">${cliente.id}</span></li>
                <li class="list-group-item"><strong>Nombre:</strong> ${fn:escapeXml(cliente.nombre)}</li>
                <li class="list-group-item"><strong>DNI:</strong>${cliente.dni}</li>
                <li class="list-group-item"><strong>Socio:</strong> ${cliente.socio?"Sí":"No"}</li>
                <li class="list-group-item"><strong>Medio Pago:</strong> ${medioPago.medios[cliente.medioPago]}</li>        
            </ul>
            </div>
        </section>
        </main>
       <club:pie-pagina/>
    </body>
</html>

