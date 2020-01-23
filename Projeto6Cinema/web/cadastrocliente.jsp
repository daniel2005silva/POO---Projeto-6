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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body class="fundo">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container">
        <h1>Novo Cliente</h1>
          <%if(mensagem != null){%>
        <h3 style="color: red"><%= mensagem  %></h3>
        <h3 style="color: red"><%= senha  %></h3>
        <h3 style="color: red"><%=  senharep %></h3>

        <%} %> 
           
                <form><br/>
                    Seu login será o seu CPF, portanto digite-o, apenas os números: <br/><input type="text" name="login"/><br/><br/>
                    Digite seu nome:<br/><input type="text" name="nome"/><br/><br/>
                    Digite sua data de nascimento:<br/><input type="date" name="dtnascimento"/><br/><br/>
                    Digite um email de contato caso tenha:<br/><input type="email" name="email"/><br/><br/>
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    Repita a senha digitada:<br/> <input type="password" name="senharep"/><br/><br/>
                    <input type="submit" name="formNewCliente" value="Cadastrar"/>
                </form>
            <br/><br/>
    </div>  
         <%@include file="WEB-INF/jspf/footer.jspf" %>   
    </body>
</html>
