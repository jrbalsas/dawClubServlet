<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Clientes</title>
    </head> 
    <body>
        <h1>Listado de Clientes (JSTL)</h1>
        <c:if test="${empty clientes}">
            NO HAY CLIENTES DISPONIBLES
        </c:if>
        <c:if test="${not empty clientes}">
        <table>
            <tr><th>ID</th><th>Nombre</th><th>DNI</th><th>Socio</th></tr>
            <c:forEach var="c" items="${clientes}">
                <c:set var="qry" value="?id=${c.id}"/>
                <tr>
                    <td>${c.id}</td>
                    <td>${c.nombre}</td><td>${c.dni}</td>
                    <td>${c.socio?"Sí":"No"}</td>
                    <td><a href='${srvUrl}/visualiza${qry}'>Ver</a>&nbsp;
                        <a href='${srvUrl}/edita${qry}'>Editar</a>&nbsp;
                        <a href='${srvUrl}/borra${qry}'>Borrar</a>&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>
        </c:if>
         <p><a href='${srvUrl}/crea'>Nuevo Cliente</a></p>
         <c:import url="/WEB-INF/layout/footer.jsp"/>
         <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>