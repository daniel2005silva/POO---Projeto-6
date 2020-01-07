<%-- 
    Document   : filme
    Created on : 06/01/2020, 11:24:38
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Filme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("formEditFilme")!=null){
        try{
            
        long id = Long.parseLong(request.getParameter("id"));
                String nome_filme = request.getParameter("nome");
                String url_trailer = request.getParameter("url");
                String sinopse= request.getParameter("sinopse");
                double valor_sessao = Double.parseDouble(request.getParameter("valor"));
                String sala = request.getParameter("sala");
                String horario= request.getParameter("horario");
                int total_poltrona = Integer.parseInt(request.getParameter("total"));
                 String urlcapa = request.getParameter("urlcapa");
                Filme.editFilme(nome_filme, url_trailer, sinopse, valor_sessao,sala,horario,total_poltrona, urlcapa, id);
                response.sendRedirect(request.getRequestURI());
           
            
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formDeleteFilme")!=null){
        try{
            
                long id = Long.parseLong(request.getParameter("id"));
                Filme.removeFilme(id);
                response.sendRedirect(request.getRequestURI());
           
            
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formNewFilme")!=null){
        
        try{
            String nome_filme = request.getParameter("nome");
            String url_trailer = request.getParameter("url");
            String sinopse= request.getParameter("sinopse");
            double valor_sessao = Double.parseDouble(request.getParameter("valor"));
            String sala = request.getParameter("sala");
            String horario= request.getParameter("horario");
            int total_poltrona = Integer.parseInt(request.getParameter("total"));
            String urlcapa = request.getParameter("urlcapa");
            Filme.addFilme(nome_filme, url_trailer, sinopse, valor_sessao, sala, horario, total_poltrona, urlcapa);
           
                 
            
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
                <legend>Novo Filme</legend>
                <form><br/>
                    Nome do filme: <br/><input type="text" name="nome"/><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse"/></textarea></<br/><br/>
                    Valor da sessao inteira:<br/><input type="number" name="valor"/><br/><br/>
                    Sala - 3D/2D: <br/><input type="text" name="sala"/><br/><br/>
                    Horario:<br/> <input type="time" name="horario"/><br/><br/>
                    Total de poltronas<br/> <input type="number" name="total"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa"/><br/><br/>
                    <input type="submit" name="formNewFilme" value="Cadastrar"/>
                </form>
            </fieldset>
           
                <%for(Filme f: Filme.getFilmes()){%>
               <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome do filme</th>
                    <th>URL do trailler</th>
                    <th colspan="2">Sinopse</th>
                    <th >Comando</th>
                </tr>
                    
                <tr>
                    <td><%=f.getId()%></td>
                    <td><%=f.getNome_filme()%></td>
                    <td><%=f.getUrl()%></td>
                    <td colspan="2"><%=f.getSinopse()%></td>
                     <td>
                        <form>
                            <input type="hidden" name="id" value="<%=f.getId()%>"/>
                            <input type="submit" name="formDeleteFilme" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>Valor da sessao</th>
                    <th>Sala</th>
                    <th>Horario</th>
                    <th>Total de poltrona</th>
                    <th>URL da capa</th>
                    <th >Comando</th>
                </tr>
                <tr>
                    <td><%=f.getValor_sessao()%></td>
                    <td><%=f.getSala()%></td>
                    <td><%=f.getHorario()%></td>
                    <td><%=f.getTotal_poltrona()%></td>
                    <td><%=f.getUrlcapa()%></td>
                   
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=f.getId()%>"/>
                            <input type="submit" name="formEdit" value="Editar"/>
                        </form>
                    </td>
                </tr>
              </table>
                            <hr>
                <%}%>
            
            
            <%
           if(request.getParameter("formEdit")!=null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            Filme f = Filme.getFilme(id);
            %>
            <fieldset>
                <legend>Editar filmes</legend>
                <form><br/>
                    <%=f.getId()%><input type="hidden" name="id" value="<%=f.getId()%>"/> <br/><br/>
                    Nome do filme: <br/><input type="text" name="nome" value="<%=f.getNome_filme()%>"/><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url" value="<%=f.getUrl()%>"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse" /><%=f.getSinopse()%></textarea></<br/><br/>
                    Valor da sessao inteira:<br/><input type="text" name="valor" value="<%=f.getValor_sessao()%>"/><br/><br/>
                    Sala - 3D/2D: <br/><input type="text" name="sala" value="<%=f.getSala()%>"/><br/><br/>
                    Horario:<br/> <input type="text" name="horario" value="<%=f.getHorario()%>"/><br/><br/>
                    Total de poltronas:<br/> <input type="text" name="total" value="<%=f.getTotal_poltrona()%>"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa" value="<%=f.getUrlcapa()%>"/><br/><br/>
                    <input type="submit" name="formEditFilme" value="Salvar"/>
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
