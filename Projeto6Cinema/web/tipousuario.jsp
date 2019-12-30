<%-- 
    Document   : tipousuario
    Created on : 30/12/2019, 17:42:19
    Author     : Daniel B. Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Novo Usuário</h1>
        
            
            <fieldset>
                <legend>Selecione o tipo de usuário a se cadastrado</legend>
                <h5><a href="cadastroadmin.jsp">ADMINISTRADOR</a></h5>
                <h5><a href="cadastrocliente.jsp">CLIENTE</a></h5>
            </fieldset>
    </body>
</html>
