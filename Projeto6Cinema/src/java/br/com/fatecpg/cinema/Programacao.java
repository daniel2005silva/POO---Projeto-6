
package br.com.fatecpg.cinema;

import java.util.ArrayList;

public class Programacao {
    private long id;
    private String inicio;
    private String fim;

    public Programacao(long id, String inicio, String fim) {
        this.id = id;
        this.inicio = inicio;
        this.fim = fim;
    }

    public String getFim() {
        return fim;
    }

    public void setFim(String fim) {
        this.fim = fim;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }
    
    public static Programacao getProgramacao(long id) throws Exception{
        String SQL = "SELECT * FROM programacao WHERE id = ?";
        Object parameters[] = { id};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Programacao p = new Programacao((long) row[0], (String) row[1], (String) row[2]);
            return p;
        }
    }
    
    
    public static ArrayList<Programacao> getProgramacoes() throws Exception{
        String SQL = "SELECT * FROM programacao";
        ArrayList<Programacao> programacoes = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Programacao p = new Programacao((long) row[0], (String) row[1], (String) row[2]);
            programacoes.add(p);
        }
        return programacoes;
    }
    /*
    public static void addProgramacao(String inicio, String fim) throws Exception{
        String SQL = "INSERT INTO programacao VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ")";
        Object parameters[] = {inicio, fim};
        DatabaseConnector.execute(SQL, parameters);
    }
    */
    
    public static void editProgramacao(String inicio, String fim, long id) throws Exception{
        String SQL = "UPDATE programacao SET inicio = ?, fim = ? WHERE id = ?";
        Object parameters[] = {inicio, fim, id};
        DatabaseConnector.execute(SQL, parameters);
        
    }
    
   /* public static String getFilmes() throws Exception{
        String programacao = null;
        for(Filme f: Filme.getFilmes()){
            
            f.getUrl();
            f.getSinopse();
            f.getValor_sessao();
           
           
            f.getTotal_poltrona();
            
            String variavelhtml = "<fieldset>"
                    + f.getNome_filme()
                    + "<img src='"+ f.getUrlcapa() +"'>"
                    + f.getHorario()
                    + f.getSala()
                    + "</fieldset>";
            
            programacao = programacao +  variavelhtml;
            
        }
        
        
        return programacao;
    }*/
}
