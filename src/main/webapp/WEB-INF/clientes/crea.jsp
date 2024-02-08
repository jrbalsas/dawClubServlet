<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="club" tagdir="/WEB-INF/tags/club" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alta Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>
    </head>
    <body class="container">
    <club:cabecera-pagina/>
        <main class="row">
            <nav class="col-md-3">
                <h2>Opciones</h2>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item"><club:logout-button/></li>
                    <li class="nav-item"><a class="nav-link" href="listado" >Volver</a></li>
                </ul>
            </nav>
            <section class="col-md-6">
                <h2>Alta Cliente</h2>                
                <form method="POST" class="well">
                    <div><label >Nombre: </label><input name="nombre" value="${cliente.nombre}" class='form-control'>
                        <span class='form-text text-danger'>${errnombre} </span></div>
                    <label>DNI:</label><input name="dni" value="${cliente.dni}" class='form-control'>
                    <div><span class='form-text text-danger'>${errdni}</span></div>
                    <div class="form-group"> <label class="form-check-label">Socio:</label><input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""} class="form-check-inline"></div>
                    <label>Medio Pago:</label>
                    <select name="medioPago" class='form-control' >
                        <c:forEach var="medio" items="${medioPago.medios}" varStatus="elemento">
                            <option value="${elemento.index}"  ${elemento.index==cliente.medioPago?'selected':''} >
                                ${medio}
                            </option>
                        </c:forEach>    
                    </select>

                    <input name="enviar" type="submit" value='Enviar' class='btn btn-primary'>
                    <input name="enviar" type="reset" value='Restaurar' class='btn btn-light'>
                </form> 
            </section>
        </main>
        <club:pie-pagina/>
    </body>
</html>