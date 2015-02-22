<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edita Cliente</title>
    </head>
    <body>
        <%@include file="/WEB-INF/layout/header.jspf" %>
        <h2>Editar Cliente</h2>
        <form method="POST">
        Cliente nº: ${cliente.id}<br>
        <input name="id" type="hidden" value="${cliente.id}">
        <label>Nombre: <input name="nombre" value="${cliente.nombre}"></label>${errNombre}<br>
        <label>DNI:<input name="dni" value="${cliente.dni}"></label>${errDni}<br>
        <label>Socio:<input name="socio" type="checkbox" value="1" ${cliente.socio?"checked":""}></label><br>
        <input name="enviar" type="submit" value="Guardar">
        <input name="enviar" type="reset" value="Limpiar">
        <a href="listado">Volver</a>
        </form>
        <%@include file="/WEB-INF/layout/footer.jspf"%>
    </body>
</html>