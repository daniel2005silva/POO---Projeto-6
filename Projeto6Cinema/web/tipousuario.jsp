<%-- 
    Document   : tipousuario
    Created on : 30/12/2019, 17:42:19
    Author     : Daniel B. Silva
--%>
<%@page import="br.com.fatecpg.cinema.Admin"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    String errorMessage = null;

    try{ 
    if(request.getParameter("formChecarAdmin") != null){
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        Admin a = Admin.getAdmin( cpf, senha);
        if(a == null){
            errorMessage = "Dado(s) inválido(s)";
        }else{
            session.setAttribute("administrador", a);
            response.sendRedirect("cadastroadmin.jsp");
        }
      
        
    }
    }catch(Exception e){
            error = e.getMessage();
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Novo Usuário</h1>
        <%if(errorMessage!=null){%>
        <h3 style="color: red"><%= errorMessage %></h3>
       
        <%} %>  
            <fieldset>
                <legend>Selecione o tipo de usuário a se cadastrado</legend>
                 <fieldset>
                <legend>Checagem para ver se você tem permissão para o cadastro como administrador</legend>
              
                <h5><a href="" >ADMINISTRADOR</a></h5>
                <form><br/>
                    Digite seu CPF, apenas os números: <br/><input type="text" name="cpf"/><br/><br/>
                    Digite sua senha de acesso:<br/> <input type="text" name="senha"/><br/><br/>
                    
                    <input type="submit" name="formChecarAdmin" value="Verificar"/>
                </form>
                </fieldset>
                <h5><a href="cadastrocliente.jsp">CLIENTE</a></h5>
            </fieldset>
    </body>
</html>
