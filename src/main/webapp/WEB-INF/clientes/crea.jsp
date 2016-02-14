<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alta Cliente</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
    </head>
    <body>
        <%@include file="/WEB-INF/layout/header.jspf" %>
        <h2>Alta Cliente</h2>
        <form method="POST">
        <label>Nombre: <input name="nombre" value="${cliente.nombre}"></label>${errNombre}<br/>
        <label>DNI:<input name="dni" value="${cliente.dni}"></label>${errDni}<br/>
        <label>Socio:<input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""}></label><br>
        <label>Medio Pago:
            <select name="medioPago" >
                <c:forEach var="medio" items="${mediosPago}" varStatus="elemento">
                    <option value="${elemento.index}"  ${elemento.index==cliente.medioPago?'selected':''} >
                        ${medio}
                    </option>
                </c:forEach>    
            </select>
        </label><br>        
        <input name="enviar" type="submit" value='Enviar'>
        <input name="enviar" type="reset" value='Limpiar'>
        <a href="listado">Volver</a>
        </form>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>