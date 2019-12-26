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
CREATE TABLE admi (
  cd_administrador INT NOT NULL PRIMARY KEY,
  nm_login VARCHAR(30) NOT NULL,
  cd_senha VARCHAR(30) NOT NULL,
  nm_administrador VARCHAR(50) NOT NULL,
  nm_cargo VARCHAR(30),
  im_foto BLOB 
);


DROP TABLE sessaofilme;
CREATE TABLE sessaofilme(
  cd_sessaofilme INT NOT NULL PRIMARY KEY,
  nm_filme VARCHAR(50) NOT NULL,
  nm_urltrailler VARCHAR(100),
  ds_sinopse VARCHAR(500) NOT NULL,
  vl_sessaofilme NUMERIC(10,2) NOT NULL,
  nm_sala VARCHAR(30) NOT NULL,
  dt_horario DATE NOT NULL,
  qt_poltrona INT NOT NULL,
  cd_administrador INT NOT NULL,
  CONSTRAINT fk_sessaofilme_admi
    FOREIGN KEY (cd_administrador)
    REFERENCES admi (cd_administrador));


DROP TABLE cliente;
CREATE TABLE cliente (
  cd_cliente INT NOT NULL ,
  cd_cpf_login DECIMAL(10,0) NOT NULL,
  cd_senha VARCHAR(30) NOT NULL,
  nm_cliente VARCHAR(50) NOT NULL,
  dt_nascimento DATE NOT NULL,
  nm_email VARCHAR(30) ,
  PRIMARY KEY (cd_cliente));

CREATE TABLE bilhete (
  cd_bilhete INT NOT NULL PRIMARY KEY,
  qt_blihete_cliente VARCHAR(45) NOT NULL,
  cd_sessaofilme INT NOT NULL,
  cd_administrador INT NOT NULL,
  cd_cliente INT NOT NULL);

alter table bilhete 
  add CONSTRAINT fk_bilhete_cliente1
    FOREIGN KEY (cd_cliente)
    REFERENCES cliente (cd_cliente)

alter table bilhete 


add CONSTRAINT fk_bilhete_sessaofilme2
    FOREIGN KEY (cd_sessaofilme )
    REFERENCES sessaofilme (cd_sessaofilme)

alter table sessaofilme


add CONSTRAINT fk_bilhete_sessaofilme3
    FOREIGN KEY (cd_administrador )
    REFERENCES sessaofilme (cd_administrador)  
            
            -->
    </body>
</html>
