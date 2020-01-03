
package br.com.fatecpg.cinema;

import java.util.ArrayList;


public class Funcionario {
    private int id;
    private double cpf;
    private String nome;

    public Funcionario(int id, double cpf, String nome) {
        this.id = id;
        this.cpf = cpf;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCpf() {
        return cpf;
    }

    public void setCpf(double cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public static Funcionario getFunc(double cpf, String nome) throws Exception{
        String SQL = "SELECT * FROM FUNCIONARIO WHERE cpf = ? AND nome = ?";
        Object parameters[] = {cpf, nome};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Funcionario f = new Funcionario((int) row[0], (int) row[1], (String) row[2]);
            return f;
        }
    }
    
     public static ArrayList<Funcionario> getFuncionario() throws Exception{
        String SQL = "SELECT * FROM FUNCIONARIO";
        ArrayList<Funcionario> func = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Funcionario f = new Funcionario((int) row[0], (double) row[1], (String) row[2]);
            func.add(f);
        }
        return func;
    }
     
     public static void addFunc(long cpf, String nome) throws Exception{
        String SQL = "INSERT INTO FUNCIONARIO VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ")";
        Object parameters[] = {cpf, nome};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeFunc( int id) throws Exception{
        String SQL = "DELETE FROM FUNCIONARIO WHERE id = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
}
