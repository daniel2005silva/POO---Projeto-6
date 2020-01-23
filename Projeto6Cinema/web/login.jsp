<%-- 
    Document   : login
    Created on : 01/12/2019, 21:31:34
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Cliente"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String errorMessage = null;
     String opcao = null;
    if(request.getParameter("formLogin")!=null){
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
       opcao = request.getParameter("usuario");
        if(opcao.hashCode() == 146716317){
            Admin u = Admin.getAdmin(login, senha);
            if(u == null){
                errorMessage = "Usuário e/ou senha inválido(s)";
            }else{
                session.setAttribute("usuario", u);
                response.sendRedirect("admin/administrador.jsp");
            }
        }else if(opcao.hashCode() == -1769726502){
            Cliente u = Cliente.getCliente(login, senha);
            if(u == null){
                errorMessage = "Usuário e/ou senha inválido(s)";
            }else{
                session.setAttribute("usuario", u);
                response.sendRedirect("cliente/cliente.jsp");
            }
        }
        
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
        <center>
        <h1>Iniciar Sessão</h1>
<%if(errorMessage!=null){%>
<h3 style="color: red"><%= errorMessage %></h3>
<h3 style="color: red"><%= opcao.hashCode() %></h3>
<%}%>


                <form><br/>
                    <select name="usuario">
                        <option >Administrador</option>
                        <option selected="selected">Cliente</option>
                    </select><br/><br/>
                    Seu login é seu CPF cadastrado, portanto digite-o, apenas os números: <br/><input type="text" name="login"/><br/><br/>
                    
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    <input type="submit" name="formLogin" value="Logar"/>
                </form>
                <br/><br/>
            </center>
     </div>
           <%@include file="WEB-INF/jspf/footer.jspf" %> 
    </body>
</html>
