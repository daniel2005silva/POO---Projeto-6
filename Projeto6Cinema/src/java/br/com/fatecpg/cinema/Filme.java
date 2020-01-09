
package br.com.fatecpg.cinema;


import java.util.ArrayList;

public class Filme {
    private long id;
    private String nome_filme;
    private String urlcapa;
    private String sinopse;
    private String descricao;
    private String dia_semana;
    private String horario; 
    private String url_trailer;
    private String estreia;

    public Filme(long id, String nome_filme, String urlcapa, String sinopse, String descricao, String dia_semana, String horario, String url_trailer, String estreia) {
        this.id = id;
        this.nome_filme = nome_filme;
        this.urlcapa = urlcapa;
        this.sinopse = sinopse;
        this.descricao = descricao;
        this.dia_semana = dia_semana;
        this.horario = horario;
        this.url_trailer = url_trailer;
        this.estreia = estreia;
    }
    
   public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome_filme() {
        return nome_filme;
    }

    public void setNome_filme(String nome_filme) {
        this.nome_filme = nome_filme;
    }

    public String getUrlcapa() {
        return urlcapa;
    }

    public void setUrlcapa(String urlcapa) {
        this.urlcapa = urlcapa;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDia_semana() {
        return dia_semana;
    }

    public void setDia_semana(String dia_semana) {
        this.dia_semana = dia_semana;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getUrl_trailer() {
        return url_trailer;
    }

    public void setUrl_trailer(String url_trailer) {
        this.url_trailer = url_trailer;
    }
    
    public String getEstreia() {
        return estreia;
    }

    public void setEstreia(String estreia) {
        this.estreia = estreia;
    }
    
    
    
    public static Filme getFilme(long id) throws Exception{
        String SQL = "SELECT * FROM sessaofilme WHERE id = ?";
        Object parameters[] = { id};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Filme f = new Filme((long) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4], (String) row[5], (String) row[6], (String) row[7], (String) row[8]);
            return f;
        }
    }
    
    
    public static ArrayList<Filme> getFilmes() throws Exception{
        String SQL = "SELECT * FROM sessaofilme";
        ArrayList<Filme> filmes = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Filme f = new Filme((long) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4], (String) row[5], (String) row[6], (String) row[7], (String) row[8]);
            filmes.add(f);
        }
        return filmes;
    }
    
    public static void addFilme(String nome_filme, String urlcapa, String sinopse, String descricao, String dia_semana, String horario, String url_trailer, String estreia) throws Exception{
        String SQL = "INSERT INTO sessaofilme VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ")";
        Object parameters[] = {nome_filme, urlcapa, sinopse, descricao, dia_semana, horario, url_trailer, estreia};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeFilme( long id) throws Exception{
        String SQL = "DELETE FROM sessaofilme WHERE id = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void editFilme(String nome_filme, String urlcapa, String sinopse, String descricao, String dia_semana, String horario, String url_trailer, String estreia,long id) throws Exception{
        String SQL = "UPDATE sessaofilme SET nome_filme = ?, urlcapa = ?, sinopse = ?, descricao = ?, dia_semana = ?, horario = ?, url_trailer = ?, estreia = ? WHERE id = ?";
        Object parameters[] = {nome_filme, urlcapa, sinopse, descricao, dia_semana, horario, url_trailer, estreia, id};
        DatabaseConnector.execute(SQL, parameters);
        
    }

    
}
