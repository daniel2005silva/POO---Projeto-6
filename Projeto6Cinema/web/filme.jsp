<%-- 
    Document   : filme
    Created on : 06/01/2020, 11:24:38
    Author     : Daniel B. Silva
--%>

<%@page import="br.com.fatecpg.cinema.Filme"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<%
    String error = null;
    if(request.getParameter("formEditFilme")!=null){
        try{
            
        long id = Long.parseLong(request.getParameter("id"));
                String nome_filme = request.getParameter("nome");
                String urlcapa = request.getParameter("urlcapa");
                String sinopse= request.getParameter("sinopse");
                String descricao = request.getParameter("descricao");
                String dia_semana = request.getParameter("dia_semana");
                String horario= request.getParameter("horario");
                String url_trailer = request.getParameter("url");
                String estreia = request.getParameter("estreia");
                if(estreia.hashCode() == 83127){
                    estreia = "ESTREIA";
                }else{
                    estreia = "";
                }
                Filme.editFilme(nome_filme, urlcapa, sinopse, descricao, dia_semana, horario, url_trailer, estreia, id);
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
                String urlcapa = request.getParameter("urlcapa");
                String sinopse= request.getParameter("sinopse");
                String descricao = request.getParameter("descricao");
                String dia_semana = request.getParameter("dia_semana");
                String horario= request.getParameter("horario");
                String url_trailer = request.getParameter("url");
                String estreia = request.getParameter("estreia");
                if(estreia.hashCode() == 83127){
                    //estou usando o hashCode porque não estou conseguindo fazerm comparações com strings aqui
                    estreia = "ESTREIA";
                }else{
                    estreia = "";
                }
            Filme.addFilme(nome_filme, urlcapa, sinopse, descricao, dia_semana, horario, url_trailer, estreia);
           
                 
            
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/headeradm.jspf" %>
        <h1>Hello World!</h1>
        <fieldset>
                <legend>Novo Filme</legend>
                <form><br/>
                    É estreia?<br/><select name="estreia">
                                        <option>Não</option>
                                        <option>Sim</option>
                                   </select><br/><br/>
                    Nome do filme: <br/><input type="text" name="nome"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse" style="width: 500px; height: 400px"/></textarea></<br/><br/>
                    Descrição do filme:<br/><input type="text" name="descricao" /><br/>
                    <p>Ex.: animação - livre - 104min. - dublado</p><br/><br/>
                    Dias da semana: <br/><input type="text" name="dia_semana" placeholder=""/><br/>
                    <p>Ex.: Segunda - Terça - Quarta - Quinta - Sexta</p><br/><br/>
                    Horario:<br/> <input type="text" name="horario" /><br/>
                    <p>Ex.: 13:30 - 16:00 - 18:30 - 21:00</p><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url"/><br/><br/>
                    
                    
                    <input type="submit" name="formNewFilme" value="Cadastrar"/>
                </form>
            </fieldset>
           
                <%for(Filme f: Filme.getFilmes()){%>
               <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome do filme</th>
                    <th>URL da capa</th>
                    <th colspan="2" >Sinopse</th>
                    <th >Comando</th>
                </tr>
                    
                <tr>
                    <td><%=f.getId()%></td>
                    <td><%=f.getNome_filme()%></td>
                    <td><%=f.getUrlcapa()%></td>
                    <td colspan="2" ><%=f.getSinopse()%></td>
                     <td>
                        <form>
                            <input type="hidden" name="id" value="<%=f.getId()%>"/>
                            <input type="submit" name="formDeleteFilme" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>Estreia</th>
                    <th>Descrição</th>
                    <th>Dias da semana</th>
                    <th>Horarios</th>
                    <th>URL do trailer</th>
                    <th>Comando</th>
                </tr>
                <tr>
                    <td><%=f.getEstreia()%></td>
                    <td><%=f.getDescricao()%></td>
                    <td><%=f.getDia_semana()%></td>
                    <td><%=f.getHorario()%></td>
                    <td><%=f.getUrl_trailer()%></td>
                   
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
                    É estreia?<br/><select name="estreia">
                                        <option>Não</option>
                                        <option>Sim</option>
                                   </select><br/><br/>
                    Nome do filme: <br/><input type="text" name="nome" value="<%=f.getNome_filme()%>"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa" value="<%=f.getUrlcapa()%>"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse" /><%=f.getSinopse()%></textarea></<br/><br/>
                    Descrição do filme:<br/><input type="text" name="descricao" placeholder="animação - livre - 104min. - dublado" value="<%=f.getDescricao()%>"/>
                    Dias da semana: <br/><input type="text" name="dia_semana" placeholder="separe os dias por - ou | " value="<%=f.getDia_semana()%>"/><br/><br/>
                    Horario:<br/> <input type="text" name="horario" value="<%=f.getHorario()%>"/><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url" value="<%=f.getUrl_trailer()%>"/><br/><br/>
                    
                    
                
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
