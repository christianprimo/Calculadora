<%-- 
    Document   : tratarErro
    Created on : 07/05/2021, 03:22:34
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Algo deu errado!</h1>
         Erro encontrado em: <%=exception%>
    </body>
</html>
