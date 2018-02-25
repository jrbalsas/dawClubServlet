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
            <nav class="col-md-3">
                <h2>Opciones</h2>
                <ul class=" nav nav-pills flex-column">
                    <li class="nav-item"><%@include file="/WEB-INF/layout/logoutBt.jspf" %></li>
                    <li class="nav-item"><a class="nav-link active" href="listado" >Volver</a></li>
                </ul>
            </nav>
            <section class="col-md-6">
                <h2>Editar Cliente</h2>
                <form method="POST" class="well">
                    <h3>Cliente nº: ${cliente.id}</h3>
                    <input name="id" type="hidden" value="${cliente.id}">
                    <label>Nombre:</label> <input name="nombre" value="${cliente.nombre}" class="form-control">
                    <div><span class='form-text text-danger'>${errNombre}</span></div>
                    <label>DNI:</label><input name="dni" value="${cliente.dni}" class="form-control">
                    <div><span class='form-text text-danger'>${errDni}</span></div>
                    <label>Socio:</label><input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""} class="form-control">
                    <label>Medio Pago:</label>
                    <select name="medioPago" class="form-control">
                        <c:forEach var="medio" items="${mediosPago}" varStatus="elemento">
                            <option value="${elemento.index}"  ${elemento.index==cliente.medioPago?'selected':''} >
                                ${medio}
                            </option>
                        </c:forEach>    
                    </select>

                    <p>
                        <input name="enviar" type="submit" value="Guardar" class="btn btn-primary">
                        <input name="enviar" type="reset" value="Restaurar" class="btn btn-light">
                    </p>
                </form>
            </section>
        </main>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>