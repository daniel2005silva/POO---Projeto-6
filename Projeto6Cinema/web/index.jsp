<%-- 
    Document   : index
    Created on : 01/12/2019, 21:20:42
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Filme"%>
<%@page import="br.com.fatecpg.cinema.Programacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="estilo/estilo.css">
        <title>JSP Page</title>
    </head>
    <body class="fundo">
         <%@include file="WEB-INF/jspf/header.jspf" %>
        
    <center>
<div class="container">
    <br/><br/><br/>
    <div class="row">
        
     <div class="col-sm-12" style="height: 300px; background-image: url('https://2.bp.blogspot.com/-Cf4Yhnsxtpk/XNhY8VM9rUI/AAAAAAAAQio/YTRIyOpF7nQMzVPoVL-ZRKyp4B9mM-XPACLcBGAs/s1600/Itanha%25C3%25A9m-Cinemar.02.2017.jpg'); background-repeat: no-repeat; background-size: 100% 100%;">
 
        </div>
    
  
    <div class="col-sm-4">
        <h3></h3><br/><br/>
        <img src="https://2.bp.blogspot.com/--R3p2siv5HQ/WuoWGKrxgoI/AAAAAAAAAlA/tICzJqeUwjUFfgzi35EsXIcK_BiPK0y9QCK4BGAYYCw/s400/quarta%2Bmaluca.jpg" style="width: 300px"/>
      <p>EXCETO FILME em SEMANA de ESTREIA NACIONAL</p>
    </div>
    <div class="col-sm-4">
      <h3 >AGORA SOMOS 3D DIGITAL</h3>
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQP4nHDTbX2eh3GtcGeQbd0nPJvjDgPaQJqtXmjl6q762_kkQ9z" style="height: 200px"/>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-4">
        <h3 style="text-align: center">AGORA SOMOS 3D DIGITAL</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
  </div>

    
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
                    <hr class="divisao"/>
           <% } %>
    
</div>
           </center>
        <!--
        codigo para criar as tabelas no banco de dados, o nome do banco é cinemaita
         DROP TABLE admi;
CREATE TABLE admi(
    id BIGINT not null primary key 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , cpf_login varchar(20) not null
    , senha varchar(30) not null
    , nome varchar(50) not null
    , cargo varchar(30) not null
);


DROP TABLE sessaofilme;
CREATE TABLE sessaofilme(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , nome_filme varchar(50) not null
    , urlcapa varchar(300) not null
    , sinopse varchar(1000) not null
    , descricao varchar(50) not null
    , dia_semana varchar(120) not null
    , horario varchar(10) not null
    , url_trailer varchar(300) 
    , estreia varchar(15) 
    
    
    
);


DROP TABLE cliente;
CREATE TABLE cliente(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , cpf_login varchar(20) not null
    , senha varchar(30) not null
    , nome varchar(50) not null
    , nascimento varchar(30) not null
    , email varchar(30)
);

DROP TABLE bilhete;
CREATE TABLE bilhete(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , bilhete_cliente int not null
    , id_sessaofilme int not null
    , id_administrador int not null
    , id_cliente int not null
);

DROP TABLE funcionario;
CREATE TABLE funcionario(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , cpf numeric(15,0) not null
    , nome varchar(30) not null
);

CREATE TABLE programacao(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , inicio varchar(15) not null
    , fim varchar(15) not null
);
        
        
INSERT INTO admi VALUES
(default, '22222222222', '1234', 'Daniel', 'Chefe');

ALTER TABLE bilhete
	add CONSTRAINT fk_bilhete_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente(id);

ALTER TABLE bilhete
	add CONSTRAINT fk_bilhete_sessaofilme
	FOREIGN KEY (id_sessaofilme)
	REFERENCES sessaofilme (id);

ALTER TABLE bilhete
	add CONSTRAINT fk_bilhete_sessaofilme2
	FOREIGN KEY (id_administrador)
	REFERENCES sessaofilme (id);  
            
            -->
    </body>
</html>
