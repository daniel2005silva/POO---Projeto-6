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
            long id = Long.parseLong(request.getParameter("id"));
            Filme f = Filme.getFilme(id);
            %>
            <h1>Editando filme <%=f.getId()%></h1>
                <form>
                    <input type="hidden" name="id" value="<%=f.getId()%>" class="caixa"/> <br/><br/>
                    É estreia?<br/><select name="estreia">
                                        <option>Não</option>
                                        <option>Sim</option>
                                   </select><br/><br/>
                    Nome do filme: <br/><input type="text" name="nome" value="<%=f.getNome_filme()%>" class="caixa"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa" value="<%=f.getUrlcapa()%>" class="caixa"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse" class="caixa" style="height: 400px" /><%=f.getSinopse()%></textarea></<br/><br/>
                    Descrição do filme:<br/><input type="text" name="descricao" placeholder="animação - livre - 104min. - dublado" value="<%=f.getDescricao()%>" class="caixa"/>
                    Dias da semana: <br/><input type="text" name="dia_semana" placeholder="separe os dias por - ou | " value="<%=f.getDia_semana()%>" class="caixa"/><br/><br/>
                    Horario:<br/> <input type="text" name="horario" value="<%=f.getHorario()%>" class="caixa"/><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url" value="<%=f.getUrl_trailer()%>" class="caixa"/><br/><br/>
                    
                    
                
                    <input type="submit" name="formEditFilme" value="Salvar"/>
                </form>
                    <hr class="divisao">
            <%
             }catch(Exception e){
            error = e.getMessage();
        }
    }   
    %>
        <h1>Novo Filme</h1>
        
                <form><br/>
                    É estreia?<br/><select name="estreia">
                                        <option>Não</option>
                                        <option>Sim</option>
                                   </select><br/><br/>
                    Nome do filme: <br/><input type="text" name="nome" class="caixa"/><br/><br/>
                    URL da capa:<br/> <input type="text" name="urlcapa"  class="caixa"/><br/><br/>
                    Sinopse<br/><textarea  name="sinopse"  class="caixa" style=" height: 400px"/></textarea></<br/><br/>
                    Descrição do filme:<br/><input type="text" name="descricao"  class="caixa"/><br/>
                    <p>Ex.: animação - livre - 104min. - dublado</p><br/><br/>
                    Dias da semana: <br/><input type="text" name="dia_semana" placeholder=""  class="caixa"/><br/>
                    <p>Ex.: Segunda - Terça - Quarta - Quinta - Sexta</p><br/><br/>
                    Horario:<br/> <input type="text" name="horario"  class="caixa"/><br/>
                    <p>Ex.: 13:30 - 16:00 - 18:30 - 21:00</p><br/><br/>
                    URL do trailler:<br/> <input type="text" name="url"  class="caixa"/><br/><br/>
                    
                    
                    <input type="submit" name="formNewFilme" value="Cadastrar"/>
                    
                </form>
            <br/>
           </div>
                <%for(Filme f: Filme.getFilmes()){%>
                <div class="table-responsive" style="background: red">
                 <br/>   
               <table  class="table" style="background: white; ">
                    
                   <thead>
                       
               <tr style="background: black; color: white;">
                    <th>ID</th>
                    <th>Nome do filme</th>
                    <th colspan="2" >Sinopse</th>
                    <th >Comando</th>
                </tr>
                   </thead>  
                
                <tr>
                    <td><%=f.getId()%></td>
                    <td><%=f.getNome_filme()%></td>
                    <td colspan="2" ><%=f.getSinopse()%></td>
                     <td>
                        <form>
                            <input type="hidden" name="id" value="<%=f.getId()%>"/>
                            <input type="submit" name="formDeleteFilme" value="Remover"/>
                        </form>
                    </td>
                </tr>
                
                <tr style="background: black; color: white;">
                    <th>Estreia</th>
                    <th>Descrição</th>
                    <th>Dias da semana</th>
                    <th>Horarios</th>
                    <th>Comando</th>
                </tr>
                <tr>
                    <td><%=f.getEstreia()%></td>
                    <td><%=f.getDescricao()%></td>
                    <td><%=f.getDia_semana()%></td>
                    <td><%=f.getHorario()%></td>
                   
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=f.getId()%>"/>
                            <input type="submit" name="formEdit" value="Editar"/>
                        </form>
                    </td>
                </tr>
              </table>
                 </div>
                            
                <%}%>
            
            
           
    
     <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
