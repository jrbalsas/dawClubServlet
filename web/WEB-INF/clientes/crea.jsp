<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="cliente" type="daw.club.model.Cliente" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alta Cliente</title>
    </head>
    <body>
        <h1>Alta Cliente</h1>
        <form method="POST">
        <label>Nombre: <input name="nombre" value="${cliente.nombre}"></label>${errNombre}<br/>
        <label>DNI:<input name="dni" value="${cliente.dni}"></label>${errDni}<br/>
        <label>Socio:<input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""}></label><br>
        <input name="enviar" type="submit" value='Enviar'>
        <input name="enviar" type="reset" value='Limpiar'>
        <a href="listado">Volver</a>
        </form>
    </body>
</html>