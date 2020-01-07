<%-- 
    Document   : administrador
    Created on : 05/01/2020, 18:19:20
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Programacao"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@include file="WEB-INF/jspf/headeradm.jspf" %>

 <%
           
            
            Programacao p = Programacao.getProgramacao(1);
            %>
        <h1>Filmes de <%= p.getInicio()%> até <%= p.getFim()%></h1>
         
    </body>
</html>
