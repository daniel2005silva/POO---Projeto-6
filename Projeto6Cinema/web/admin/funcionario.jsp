<%-- 
    Document   : funcionario
    Created on : 05/01/2020, 19:38:01
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("formEditUser")!=null){
        try{
            
        long id = Long.parseLong(request.getParameter("id"));
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                String nome= request.getParameter("nome");
                String cargo = request.getParameter("cargo");
                Admin.editAdmin(login, senha, nome, cargo, id);
                response.sendRedirect(request.getRequestURI());
           
            
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formDeleteUser")!=null){
        try{
            
                long id = Long.parseLong(request.getParameter("id"));
                Admin.removeAdmin(id);
                response.sendRedirect(request.getRequestURI());
           
            
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formNewAdmin")!=null){
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String nome = request.getParameter("nome");
        String cargo = request.getParameter("cargo");
        try{

            Admin.addAdmin(login, senha, nome, cargo);
           
                 
            
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
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
        <link rel="stylesheet" type="text/css" href="<../estilo/estilo.css">
        <title>JSP Page</title>
    </head>
    <body class="fundo">
        <%@include file="../WEB-INF/jspf/headeradm.jspf" %>
        <div class="container">
             <%
           if(request.getParameter("formEdit")!=null){
        try{
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            Admin u = Admin.getAdmin(login, senha);
            %>
            <h1>Editar administrador <%=u.getId()%></h1>
                <form>
                    <input type="hidden" name="id" value="<%=u.getId()%>"/> <br/><br/>
                    Login - CPF: <br/><input type="text" name="login" value="<%=u.getCpfadm()%>"/><br/><br/>
                    Senha:<br/> <input type="text" name="senha" value="<%=u.getSenhaadm()%>"/><br/><br/>
                    Nome:<br/><input type="text" name="nome" value="<%=u.getNomeadm()%>"/><br/><br/>
                    Cargo:<br/><input type="text" name="cargo" value="<%=u.getCargoadm()%>"/><br/><br/>
                    
 
                    <input type="submit" name="formEditUser" value="Salvar"/>
                </form>
                    <hr class="divisao">
            <%
             }catch(Exception e){
            error = e.getMessage();
        }
    }   
    %>
    
        <h1>Novo administrador</h1>
        
                <form>
                    Seu login será o seu CPF, portanto digite-o, apenas os números: <br/><input type="number" name="login"/><br/><br/>
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    Digite seu nome:<br/><input type="text" name="nome"/><br/><br/>
                    Digite seu cargo:<br/><input type="text" name="cargo"/><br/><br/>
                    
                    <input type="submit" name="formNewAdmin" value="Cadastrar"/>
                </form>
        <br/>
        <hr class="divisao">
        <br/>
        <table class="table" border="1">
                <tr style="background: black; color: white;">
                    <th>ID</th>
                    <th>CPF - Login</th>
                    <th>Senha</th>
                    <th>Nome</th>
                    <th>Cargo</th>
                    <th colspan="2">Comando</th>
                </tr>
                <%for(Admin u: Admin.getAdmins()){%>
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getCpfadm()%></td>
                    <td><%=u.getSenhaadm()%></td>
                    <td><%=u.getNomeadm()%></td>
                    <td><%=u.getCargoadm()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=u.getId()%>"/>
                            <input type="submit" name="formDeleteUser" value="Remover"/>
                        </form>
                    </td>
                    <td>
                        <form>
                            <input type="hidden" name="login" value="<%=u.getCpfadm()%>"/>
                            <input type="hidden" name="senha" value="<%=u.getSenhaadm()%>"/>
                            <input type="submit" name="formEdit" value="Editar"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
            <br/><br/>
           
        </div>
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
