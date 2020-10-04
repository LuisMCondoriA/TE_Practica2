<%-- 
    Document   : productos
    Created on : 04-10-2020, 11:40:18 AM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.regprod"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listprod") == null){
        ArrayList<regprod> listaux = new ArrayList<regprod>();
        session.setAttribute("listprod",listaux);
    }
    ArrayList<regprod> lista = (ArrayList<regprod>)session.getAttribute("listprod");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <center>
        <h1>Lista de productos</h1>
        <a href="ControlProducto?op=1">Registrar nuevos productos</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Categoria</th>
                <th>Existencia</th>
                <th>Precio</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for(regprod item: lista){
            %>
            
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getProducto()%></td>
                <td><%=item.getCategoria()%></td>
                <td><%=item.getExistencia()%></td>
                <td><%=item.getPrecio()%></td>
                <td>
                    <a href="ControlProducto?op=2&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="ControlProducto?op=3&id=<%=item.getId()%>" onclick="return confirm('esta seguro')">borrar</a>
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
