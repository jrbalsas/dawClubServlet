<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" type="daw.club.model.Cliente" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edita Cliente</title>
    </head>
    <body>
        <h1>Editar Cliente</h1>
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
    </body>
</html>