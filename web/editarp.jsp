<%-- 
    Document   : editarp
    Created on : 04-10-2020, 05:24:39 PM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.regprod"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    regprod item = (regprod) request.getAttribute("miCur");
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
        <h1>Registro de productos</h1>
    
        <form action="ControlProducto" method="post">
            <p>ID:    </p> <input type="number" name="id" value="<%=item.getId()%>" required><br>
            <p>Producto:    </p> <input type="text" name="producto" value="<%=item.getProducto()%>" required><br>
            <p>Categoria:     </p><select name="categoria" id="prod">
                 <option value="Productos de consumo basico">Productos de consumo basico</option>
                 <option value="Productos de trabajo">Productos de trabajo</option>
                 <option value="Productos de urgencia">Productos de urgencia</option>
            </select><br>
            <p>Existencia: </p><input type="number" name="existencia" value="<%=item.getExistencia()%>" required><br>
            <p>Precio: </p><input type="number" name="precio" value="<%=item.getPrecio()%>" required><br><br>
            <input type="hidden" name="nuevo" value="<%=nuevo%>">
            <input type="submit" value="Registrar"/>
        </form>
    </center>
    </body>
</html>
