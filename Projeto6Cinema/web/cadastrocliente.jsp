<%-- 
    Document   : cadastrocliente
    Created on : 30/12/2019, 17:13:23
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Cliente"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String error = null;
    String mensagem = null;
    String senha = "";
    String senharep = "";
    try{
    if(request.getParameter("formNewCliente")!=null){
        String login = request.getParameter("login");
        String nome = request.getParameter("nome");
        String dtnascimento = request.getParameter("dtnascimento");
        String email = request.getParameter("email");
         senha = request.getParameter("senha");
         senharep = request.getParameter("senharep");
        if(senha.hashCode() != senharep.hashCode()){
                mensagem = "As senhas digitadas não são as mesmas!";
        }else{
                
                Cliente.addCliente(login, senha, nome, dtnascimento, email); 
                response.sendRedirect("login.jsp");
        }
            
        
    }
    }catch(Exception e){
            error = e.getMessage();
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Novo Usuário</h1>
          <%if(mensagem != null){%>
        <h3 style="color: red"><%= mensagem  %></h3>
        <h3 style="color: red"><%= senha  %></h3>
        <h3 style="color: red"><%=  senharep %></h3>

        <%} %> 
            <fieldset>
                <legend>Novo Cliente</legend>
                <form><br/>
                    Seu login será o seu CPF, portanto digite-o, apenas os números: <br/><input type="text" name="login"/><br/><br/>
                    Digite seu nome:<br/><input type="text" name="nome"/><br/><br/>
                    Digite sua data de nascimento:<br/><input type="date" name="dtnascimento"/><br/><br/>
                    Digite um email de contato caso tenha:<br/><input type="email" name="email"/><br/><br/>
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    Repita a senha digitada:<br/> <input type="password" name="senharep"/><br/><br/>
                    <input type="submit" name="formNewCliente" value="Cadastrar"/>
                </form>
            </fieldset>
            
            
    </body>
</html>
