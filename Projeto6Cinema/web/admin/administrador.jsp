<%-- 
    Document   : administrador
    Created on : 05/01/2020, 18:19:20
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Filme"%>
<%@page import="br.com.fatecpg.cinema.Programacao"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        
        <title>Cinemar Itanhaém</title>
    </head>
    <body class="fundo">
<%@include file="../WEB-INF/jspf/headeradm.jspf" %>
    <center>
<div class="container">
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
                    <br/> <iframe   height="344" src="<%= f.getUrl_trailer()%>" style="width: 100%;" frameborder="0" allowfullscreen>
    
                    </iframe>
                    </fieldset>
                    <hr class="divisao"/>
           <% } %>
</div>
    </center>
<%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
