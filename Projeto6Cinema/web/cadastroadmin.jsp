<%-- 
    Document   : cadastroadmin
    Created on : 30/12/2019, 17:13:42
    Author     : Daniel B. Silva
--%>

<%@page import="java.awt.Image"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("formDeleteAdmin")!=null){
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            Admin.removeAdmin(id);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formNewAdmin")!=null){
        long login = Long.parseLong(request.getParameter("login"));
        String senha = request.getParameter("senha");
        String nome = request.getParameter("nome");
        String cargo = request.getParameter("cargo");
        Image foto = ImageIO.read(new File(request.getParameter("foto")));
        try{
            Admin.addAdmin(login, senha, nome, cargo, foto);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
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
        <h1>Novo Usuário</h1>
        
            <fieldset>
                <legend>Novo administrador</legend>
                <form><br/>
                    Seu login será o seu CPF, portanto digite-o, apenas os números: <br/><input type="number" name="login"/><br/><br/>
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    Digite seu nome:<br/><input type="text" name="nome"/><br/><br/>
                    Digite seu cargo:<br/><input type="text" name="cargo"/><br/><br/>
                    Escolha uma imegem para te representar:<br/><input type="file" name="foto"/><br/><br/>
                    
                    <input type="submit" name="formNewAmin" value="Cadastrar"/>
                </form>
            </fieldset>
            
            
    </body>
</html>
