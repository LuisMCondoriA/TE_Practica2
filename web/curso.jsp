<%-- 
    Document   : curso
    Created on : 04-10-2020, 11:39:55 AM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.inscurso"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listcurso") == null){
        ArrayList<inscurso> listaux = new ArrayList<inscurso>();
        session.setAttribute("listcurso",listaux);
    }
    ArrayList<inscurso> lista = (ArrayList<inscurso>)session.getAttribute("listcurso");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Lista de Inscritos</h1>
        <a href="ControlCurso?op=1">Inscribir nuevos alumnos</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Curso</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for(inscurso item: lista){
            %>
            
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getNombre()%></td>
                <td><%=item.getApellido()%></td>
                <td><%=item.getCurso()%></td>
                <td>
                    <a href="ControlCurso?op=2&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="ControlCurso?op=3&id=<%=item.getId()%>" onclick="return confirm('esta seguro')">borrar</a>
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
