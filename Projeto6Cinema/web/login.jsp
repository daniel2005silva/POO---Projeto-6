<%-- 
    Document   : login
    Created on : 01/12/2019, 21:31:34
    Author     : Daniel B. Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String path = request.getContextPath();
    String errorMessage = null;
    if(request.getParameter("formLogin")!=null){
        String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        User u = User.getUser(login, pass);
        if(u==null){
            errorMessage = "Usuário e/ou senha inválido(s)";
        }else{
            session.setAttribute("user", u);
            response.sendRedirect(request.getRequestURI());
        }
    }
    if(request.getParameter("formLogoff")!=null){
        session.removeAttribute("user"); 
        response.sendRedirect(request.getRequestURI());
    }
%>
<h1>Parking WebApp</h1>
<%if(errorMessage!=null){%>
<h3 style="color: red"><%= errorMessage %></h3>
<%}%>
<%if(session.getAttribute("user")==null){%>
<form method="post">
    Login:<input type="text" name="login"/>
    Pass:<input type="password" name="pass"/>
    <input type="submit" name="formLogin" value="Entrar"/>
</form>
<%}else{%>
<form>
    <% User user = (User) session.getAttribute("user"); %>
    Bem vindo, <%= user.getName()%> [<%= user.getRole() %>]
    <input type="submit" name="formLogoff" value="Sair"/>
</form>
<h2>
    <a href="<%=path%>/home.jsp"> HOME</a>
    || <a href="<%=path%>/operation/prices.jsp"> PREÇOS</a>
    <%if(user.getRole().equals("ADMIN")){%>
    || [<a href="<%=path%>/admin/users.jsp">USUÁRIO</a>]
    <%}%>
</h2>

<%}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Hello World!</h1>
    </body>
</html>
