
package br.com.fatecpg.cinema;


import java.sql.Date;
import java.util.ArrayList;


public class Cliente {
    private int id;
    private String cpfcliente; //login
    private String senhacliente;
    private String nomecliente;
    private String dtnasccliente;
    private String emailcliente;

    public Cliente(int id, String cpfcliente, String senhacliente, String nomecliente, String dtnasccliente, String emailcliente) {
        this.id = id;
        this.cpfcliente = cpfcliente;
        this.senhacliente = senhacliente;
        this.nomecliente = nomecliente;
        this.dtnasccliente = dtnasccliente;
        this.emailcliente = emailcliente;
    }

    public String getEmailcliente() {
        return emailcliente;
    }

    public void setEmailcliente(String emailcliente) {
        this.emailcliente = emailcliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpfcliente() {
        return cpfcliente;
    }

    public void setCpfcliente(String cpfcliente) {
        this.cpfcliente = cpfcliente;
    }

    public String getSenhacliente() {
        return senhacliente;
    }

    public void setSenhacliente(String senhacliente) {
        this.senhacliente = senhacliente;
    }

    public String getNomecliente() {
        return nomecliente;
    }

    public void setNomecliente(String nomecliente) {
        this.nomecliente = nomecliente;
    }

    public String getDtnasccliente() {
        return dtnasccliente;
    }

    public void setDtnasccliente(String dtnasccliente) {
        this.dtnasccliente = dtnasccliente;
    }
    
    public static Cliente getCliente(String logincpf, String senha) throws Exception{
        String SQL = "SELECT * FROM CLIENTE WHERE cd_cpf_login = ? AND cd_senha = ?";
        Object parameters[] = {logincpf, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Cliente u = new Cliente((int) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4], (String) row[4]);
            return u;
        }
    }
    
    public static ArrayList<Cliente> getClientes() throws Exception{
        String SQL = "SELECT * FROM CLIENTE";
        ArrayList<Cliente> clientes = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Cliente u = new Cliente((int) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4], (String) row[4]);
            clientes.add(u);
        }
        return clientes;
    }
    
    public static void addCliente(String login, String senha, String nome, String dtnascimento, String email) throws Exception{
        String SQL = "INSERT INTO CLIENTE VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ")";
        Object parameters[] = {login, senha, nome, dtnascimento, email};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeCliente( int id) throws Exception{
        String SQL = "DELETE FROM CLIENTE WHERE CD_CLIENTE = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
}
