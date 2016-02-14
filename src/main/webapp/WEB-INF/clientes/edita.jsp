<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edita Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>
    </head>
    <body class="container">
        <%@include file="/WEB-INF/layout/header.jspf" %>
        <main class="row">
        <nav class="col-md-2">
            <h2>Opciones</h2>
            <ul class=" nav nav-pills nav-stacked">
                <li ><a href="listado" class="btn btn-default">Volver</a></li>
            </ul>
        </nav>

        <h2>Editar Cliente</h2>
        <form method="POST" class="well  col-md-4">
        <h3>Cliente nº: ${cliente.id}</h3>
        <input name="id" type="hidden" value="${cliente.id}">
        <label>Nombre: <input name="nombre" value="${cliente.nombre}" class="form-control"></label>
            <span class='label label-warning'>${errNombre}</span><br/>
        <label>DNI:<input name="dni" value="${cliente.dni}" class="form-control"></label>
            <span class='label label-warning'>${errDni}</span><br/>
        <label>Socio:<input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""} class="form-control"></label><br>
        <label>Medio Pago:
            <select name="medioPago" class="form-control">
                <c:forEach var="medio" items="${mediosPago}" varStatus="elemento">
                    <option value="${elemento.index}"  ${elemento.index==cliente.medioPago?'selected':''} >
                        ${medio}
                    </option>
                </c:forEach>    
            </select>
        </label>
        <p>
            <input name="enviar" type="submit" value="Guardar" class="btn btn-primary">
            <input name="enviar" type="reset" value="Restaurar" class="btn btn-default">
        </p>
        </form>
        </main>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>