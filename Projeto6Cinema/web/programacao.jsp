<%-- 
    Document   : administrador
    Created on : 05/01/2020, 18:19:20
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Programacao"%>
<%@page import="br.com.fatecpg.cinema.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("formEditProgramacao")!=null){
        try{
            
        long id = Long.parseLong(request.getParameter("id"));
                String inicio = request.getParameter("inicio");
                String fim = request.getParameter("fim");
               
                Programacao.editProgramacao(inicio, fim, id);
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


        <h1>Filmes de </h1>
         
             <table border="1">
                <%for(Programacao p: Programacao.getProgramacoes()){%>
              
                <tr>
                    <th>ID</th>
                    <th>Data de início</th>
                    <th>Data de fim</th>
                    <th colspan="2">Comando</th>
                </tr>
                    
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getInicio()%></td>
                    <td><%=p.getFim()%></td>
                     
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=p.getId()%>"/>
                            <input type="submit" name="formEdit" value="Editar"/>
                        </form>
                    </td>
               
                   </tr>
                           
                <%}%>
             </table>
            
            <%
           if(request.getParameter("formEdit")!=null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            Programacao p = Programacao.getProgramacao(id);
            
            %>
            <fieldset>
                <legend>Editar programação</legend>
                <form><br/>
                    <%=p.getId()%><input type="hidden" name="id" value="<%=p.getId()%>"/> <br/><br/>
                    Data de início da programação: <br/><input type="date" name="inicio" /><br/><br/>
                    Data de fim da programação:<br/> <input type="date" name="fim" /><br/><br/>
                    
                    <input type="submit" name="formEditProgramacao" value="Salvar"/>
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
