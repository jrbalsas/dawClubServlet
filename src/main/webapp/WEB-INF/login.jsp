<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title><fmt:message key="appName"/></title>
        <%@include file="/WEB-INF/layout/bootstrapheader.jspf"%>        
    </head>
    <body class="container">
        <header class="jumbotron">
            <h1>Club de Tenis</h1>
        </header>     
        <main class="row" >
        <nav class="col-md-3">
        <h2>Opciones</h2>
        <ul class="nav nav-pills flex-colum">
            <li class="nav-item"><a class="nav-link active" href="clientes" >Gestión clientes</a></li>
            <li class="nav-item"><a class="nav-link disabled" href="instalaciones" >Gestión instalaciones</a></li>
            <li class="nav-item"><a class="nav-link disabled" href="servicios" >Gestión servicios</a></li>
        </ul>
        </nav>
        <section class="col-md-9">
        <h2>Identificación de usuario</h2>
        <c:if test="${param.error}">
            <p class="alert alert-danger">Credenciales incorrectas</p>
        </c:if>
        <form action="j_security_check" method="POST">
            <label>Usuario</label><input class="form-control" type="text" name="j_username"/>
            <label>Clave</label><input class="form-control" type="password" name="j_password"/>
            <input class="btn btn-primary" type="submit" name="Identificarse"/>
        </form>            
        </section>
        </main>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>
