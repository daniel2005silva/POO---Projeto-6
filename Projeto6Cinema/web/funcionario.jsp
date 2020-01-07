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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/headeradm.jspf" %>
        <h1>Hello World!</h1>
        <fieldset>
                <legend>Novo administrador</legend>
                <form><br/>
                    Seu login será o seu CPF, portanto digite-o, apenas os números: <br/><input type="number" name="login"/><br/><br/>
                    Digite uma senha:<br/> <input type="password" name="senha"/><br/><br/>
                    Digite seu nome:<br/><input type="text" name="nome"/><br/><br/>
                    Digite seu cargo:<br/><input type="text" name="cargo"/><br/><br/>
                    
                    <input type="submit" name="formNewAdmin" value="Cadastrar"/>
                </form>
            </fieldset>
            <table border="1">
                <tr>
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
            
            <%
           if(request.getParameter("formEdit")!=null){
        try{
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            Admin u = Admin.getAdmin(login, senha);
            %>
            <fieldset>
                <legend>Editar administrador</legend>
                <form><br/>
                    <%=u.getId()%><input type="hidden" name="id" value="<%=u.getId()%>"/> <br/><br/>
                    Login - CPF: <br/><input type="text" name="login" value="<%=u.getCpfadm()%>"/><br/><br/>
                    Senha:<br/> <input type="text" name="senha" value="<%=u.getSenhaadm()%>"/><br/><br/>
                    Nome:<br/><input type="text" name="nome" value="<%=u.getNomeadm()%>"/><br/><br/>
                    Cargo:<br/><input type="text" name="cargo" value="<%=u.getCargoadm()%>"/><br/><br/>
                    
 
                    <input type="submit" name="formEditUser" value="Salvar"/>
                </form>
            </fieldset>
            <%
             }catch(Exception e){
            error = e.getMessage();
        }
    }   
    %>
    </body>
</html>
