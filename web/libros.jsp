<%-- 
    Document   : libros
    Created on : 04-10-2020, 11:40:31 AM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.reglibros"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listlib") == null){
        ArrayList<reglibros> listaux = new ArrayList<reglibros>();
        session.setAttribute("listlib",listaux);
    }
    ArrayList<reglibros> lista = (ArrayList<reglibros>)session.getAttribute("listlib");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                    <center>
        <h1>Lista de libros registrados</h1>
        <a href="ControlLibro?op=1">Registrar nuevos libros</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for(reglibros item: lista){
            %>
            
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getTitulo()%></td>
                <td><%=item.getAutor()%></td>
                <td><%=item.getResumen()%></td>
                <td><%=item.getMedio()%></td>
                <td>
                    <a href="ControlLibro?op=2&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="ControlLibro?op=3&id=<%=item.getId()%>" onclick="return confirm('esta seguro')">borrar</a>
                </td>
            </tr>
            <%
                }
            }
            %>          
        </table>
        <a href="index.jsp">Volver a index</a>
        </center>
    </body>
</html>
