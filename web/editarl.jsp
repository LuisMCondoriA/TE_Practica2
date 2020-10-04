<%-- 
    Document   : editarl
    Created on : 04-10-2020, 05:48:21 PM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.reglibros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    reglibros item = (reglibros) request.getAttribute("miCur");
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
        <h1>Registro de Libros</h1>
    
        <form action="ControlLibro" method="post">
            <p>ID:    </p> <input type="number" name="id" value="<%=item.getId()%>" required><br>
            <p>Titulo:    </p> <input type="text" name="titulo" value="<%=item.getTitulo()%>" required><br>
            <p>Autor: </p><input type="text" name="autor" value="<%=item.getAutor()%>" required><br>
            <p>Resumen: </p><textarea name="resumen" rows="10" cols="40" value="<%=item.getResumen()%>">Escribe aquí su resumen</textarea><br>
            <p>Medio: </p><input type="radio" name="medio" value="Fisico">Fisico <br>
            <input type="radio" name="medio" value="Magnetico">Magnetico<br>
            <input type="hidden" name="nuevo" value="<%=nuevo%>">
            <input type="submit" value="Registrar"/>
        </form>
    </center>
    </body>
</html>
