
package br.com.fatecpg.cinema;


import java.util.ArrayList;

public class Filme {
    private long id;
    private String nome_filme;
    private String url;
    private String sinopse;
    private double valor_sessao;
    private String sala;
    private String horario;
    private int total_poltrona;
    private String urlcapa;

    public Filme(long id, String nome_filme, String url, String sinopse, double valor_sessao, String sala, String horario, int total_poltrona, String urlcapa) {
        this.id = id;
        this.nome_filme = nome_filme;
        this.url = url;
        this.sinopse = sinopse;
        this.valor_sessao = valor_sessao;
        this.sala = sala;
        this.horario = horario;
        this.total_poltrona = total_poltrona;
        this.urlcapa = urlcapa;
    }

    public int getTotal_poltrona() {
        return total_poltrona;
    }

    public void setTotal_poltrona(int total_poltrona) {
        this.total_poltrona = total_poltrona;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public double getValor_sessao() {
        return valor_sessao;
    }

    public void setValor_sessao(double valor_sessao) {
        this.valor_sessao = valor_sessao;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
    
     public String getUrlcapa() {
        return urlcapa;
    }

    public void setUrlcapa(String urlcapa) {
        this.urlcapa = urlcapa;
    }
    
    
    public static Filme getFilme(long id) throws Exception{
        String SQL = "SELECT * FROM sessaofilme WHERE id = ?";
        Object parameters[] = { id};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Filme f = new Filme((long) row[0], (String) row[1], (String) row[2], (String) row[3], (double) row[4], (String) row[5], (String) row[6], (int) row[7], (String) row[8]);
            return f;
        }
    }
    
    
    public static ArrayList<Filme> getFilmes() throws Exception{
        String SQL = "SELECT * FROM sessaofilme";
        ArrayList<Filme> filmes = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Filme f = new Filme((long) row[0], (String) row[1], (String) row[2], (String) row[3], (double) row[4], (String) row[5], (String) row[6], (int) row[7], (String) row[8]);
            filmes.add(f);
        }
        return filmes;
    }
    
    public static void addFilme(String nome_filme, String url_trailer, String sinopse, double valor_sessao, String sala, String horario, int total_poltrona, String urlcapa) throws Exception{
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
        Object parameters[] = {nome_filme, url_trailer, sinopse, valor_sessao, sala, horario, total_poltrona, urlcapa};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeFilme( long id) throws Exception{
        String SQL = "DELETE FROM sessaofilme WHERE id = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void editFilme(String nome_filme, String url_trailer, String sinopse, double valor_sessao, String sala, String horario, int total_poltrona, String urlcapa, long id) throws Exception{
        String SQL = "UPDATE sessaofilme SET nome_filme = ?, url_trailer = ?, sinopse = ?, valor_sessao = ?, sala = ?, horario = ?, total_poltrona = ?, urlcapa = ? WHERE id = ?";
        Object parameters[] = {nome_filme, url_trailer, sinopse, valor_sessao, sala, horario, total_poltrona, urlcapa, id};
        DatabaseConnector.execute(SQL, parameters);
        
    }
}
