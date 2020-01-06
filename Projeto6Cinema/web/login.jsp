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
                response.sendRedirect("administrador.jsp");
            }
        }else if(opcao.hashCode() == -1769726502){
            Cliente u = Cliente.getCliente(login, senha);
            if(u == null){
                errorMessage = "Usuário e/ou senha inválido(s)";
            }else{
                session.setAttribute("usuario", u);
                response.sendRedirect("cliente.jsp");
            }
        }
        
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Iniciar Sessão</h1>
<%if(errorMessage!=null){%>
<h3 style="color: red"><%= errorMessage %></h3>
<h3 style="color: red"><%= opcao.hashCode() %></h3>
<%}%>



        
            <fieldset>
                <legend>Login</legend>
                <form><br/>
                    <select name="usuario">
                        <option >Administrador</option>
                        <option >Cliente</option>
                    </select><br/><br/>
                    Seu login é seu CPF cadastrado, portanto digite-o, apenas os números: <br/><input type="text" name="login"/><br/><br/>
                    
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    <input type="submit" name="formLogin" value="Cadastrar"/>
                </form>
            </fieldset>
            
    </body>
</html>
