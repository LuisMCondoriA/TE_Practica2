<%-- 
    Document   : editaru
    Created on : 04-10-2020, 03:33:56 PM
    Author     : wwwsd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.emergentes.modelo.regus"%>
<%
    regus item = (regus) request.getAttribute("miCur");
    boolean nuevo = true;
    if(item.getId()>0){
        nuevo = false;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <center>
        <h1>Registro de usuarios</h1>
    
        <form action="ControlUsuario" method="post">
            <p>ID:    </p> <input type="number" name="id" value="<%=item.getId()%>" required><br>
            <p>Nombre:    </p> <input type="text" name="nombre" value="<%=item.getNombre()%>" required><br>
            <p>Apellidos: </p><input type="text" name="apellido" value="<%=item.getApellido()%>" required><br>
            <p>Correo electronico:     </p><input type="email" name="correo" value="<%=item.getCorreo()%>">
            <p>Contraseña:     </p><input type="password" name="contraseña" value="<%=item.getContraseña()%>">
            <input type="hidden" name="nuevo" value="<%=nuevo%>">
            <input type="submit" value="Registrar"/>
        </form>
    </center>
    </body>
</html>
