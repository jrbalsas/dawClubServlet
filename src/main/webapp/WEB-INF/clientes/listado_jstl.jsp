<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctrl_url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Clientes</title>
        <link rel="stylesheet"  type="text/css" href="<c:url value='/css/common.css'/>">        
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>
    </head> 
    <body class="container">
        <%@include file="/WEB-INF/layout/header.jspf" %>
        <main class="row">
            <nav class="col-md-2">
                <h2>Opciones</h2>
                
                <ul class=" nav nav-pills flex-column">
                    <li class="nav-item"><%@include file="/WEB-INF/layout/logoutBt.jspf" %></li>
                    <li class="nav-item"><a class="nav-link active" href='${srvUrl}/crea'>Nuevo Cliente</a></li>
                </ul>
            </nav>
            <section class="col-md-10">
                <h2>Listado de Clientes</h2>
                <c:if test="${empty clientes}">
                    NO HAY CLIENTES DISPONIBLES
                </c:if>
                <c:if test="${not empty clientes}">
                    <table class="table table-striped">
                        <tr><th>ID</th><th>Nombre</th><th>DNI</th><th>Socio</th>
                            <th>Medio Pago</th><th>Opciones</th></tr>
                                <c:forEach var="c" items="${clientes}">
                                    <c:set var="qry" value="?id=${c.id}"/>
                            <tr>
                                <td>${c.id}</td>
                                <td>${fn:escapeXml(c.nombre)}</td><td>${c.dni}</td>
                                <td>${c.socio?"Sí":"No"}</td>
                                <td>${medioPago.medios[c.medioPago]}</td>
                                <td><a class='btn btn-light' href='${srvUrl}/visualiza${qry}'>Ver</a>&nbsp;
                                    <a class='btn btn-light' href='${srvUrl}/edita${qry}'>Editar</a>&nbsp;
                                    <a class='btn btn-light' href='${srvUrl}/borra${qry}'>Borrar</a>&nbsp;
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </section>
        </main>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>