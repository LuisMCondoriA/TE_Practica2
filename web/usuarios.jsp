<%-- 
    Document   : usuarios
    Created on : 04-10-2020, 11:40:06 AM
    Author     : wwwsd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.regus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listus") == null){
        ArrayList<regus> listaux = new ArrayList<regus>();
        session.setAttribute("listus",listaux);
    }
    ArrayList<regus> lista = (ArrayList<regus>)session.getAttribute("listus");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Lista de Usuarios</h1>
        <a href="ControlUsuario?op=1">Registrar nuevos usuarios</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Correo</th>
                <th>Contraseña</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for(regus item: lista){
            %>
            
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getNombre()%></td>
                <td><%=item.getApellido()%></td>
                <td><%=item.getCorreo()%></td>
                <td><%=item.getContraseña()%></td>
                <td>
                    <a href="ControlUsuario?op=2&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="ControlUsuario?op=3&id=<%=item.getId()%>" onclick="return confirm('esta seguro')">borrar</a>
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
