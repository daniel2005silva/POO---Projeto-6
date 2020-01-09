<%-- 
    Document   : administrador
    Created on : 05/01/2020, 18:19:20
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Filme"%>
<%@page import="br.com.fatecpg.cinema.Programacao"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@include file="WEB-INF/jspf/headeradm.jspf" %>

 <%   Programacao p = Programacao.getProgramacao(1);  %>
 
        <h1>Filmes de <%= p.getInicio()%> até <%= p.getFim()%></h1>
         <%  for(Filme f: Filme.getFilmes()){ 
            
            %> <fieldset><%= f.getEstreia()%>
                <legend style="font-size: 30px"><%= f.getNome_filme() %></legend>
                    <img src="<%= f.getUrlcapa() %>" style="height:500px" >
                    <br/>
                    <br/>
                    <%= f.getSinopse() %>
                    <br/>
                    <br/>
                    <%= f.getDescricao() %>
                    <br/>
                    <br/>
                    <%= f.getDia_semana() %>
                    <br/>
                    <br/>
                    <%= f.getHorario() %>
                    <br/>
                    <br/> <iframe  width="700" height="344" src="<%= f.getUrl_trailer()%>" frameborder="0" allowfullscreen>
    
                    </iframe>
                    </fieldset>
           <% } %>
    </body>
</html>
