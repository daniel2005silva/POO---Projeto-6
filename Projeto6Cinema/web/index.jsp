<%-- 
    Document   : index
    Created on : 01/12/2019, 21:20:42
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
        <h1>Hello World!</h1>
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
    , url_trailer varchar(100) not null
    , sinopse varchar(500) not null
    , valor_sessao numeric(10,2) not null
    , sala varchar(30) not null
    , horario date not null
    , total_poltrona int not null
    , id_administrador int not null
    CONSTRAINT fk_sessaofilme_admi
	FOREIGN KEY (id_administrador)
	REFERENCES admi (id)
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
