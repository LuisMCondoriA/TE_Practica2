<%-- 
    Document   : editarc
    Created on : 04-10-2020, 12:25:35 PM
    Author     : wwwsd
--%>

<%@page import="com.emergentes.modelo.inscurso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    inscurso item = (inscurso) request.getAttribute("miCur");
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
        <h1>Inscripcion en curso</h1>
    
        <form action="ControlCurso" method="post">
            <p>ID:    </p> <input type="number" name="id" value="<%=item.getId()%>" required><br>
            <p>Nombre:    </p> <input type="text" name="nombre" value="<%=item.getNombre()%>" required><br>
            <p>Apellidos: </p><input type="text" name="apellido" value="<%=item.getApellido()%>" required><br>
            <p>Curso:     </p><select name="curso" id="cur">
                 <option value="Matematica">Matematica</option>
                 <option value="Fisica">Fisica</option>
                 <option value="Quimica">Quimica</option>
                 <option value="Filosofia">Filosofia</option>
                 <option value="Calculo">Calculo</option>
            </select><br><br>
            <input type="hidden" name="nuevo" value="<%=nuevo%>">
            <input type="submit" value="Inscribir"/>
        </form>
    </center>
    </body>
</html>


