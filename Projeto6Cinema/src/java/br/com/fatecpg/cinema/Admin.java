
package br.com.fatecpg.cinema;

import java.util.ArrayList;

public class Admin {
    private long id;
    private String cpfadm;//login
    private String senhaadm;
    private String nomeadm;
    private String cargoadm;

    public Admin(long id, String cpfadm, String senhaadm, String nomeadm, String cargoadm) {
        this.id = id;
        this.cpfadm = cpfadm;
        this.senhaadm = senhaadm;
        this.nomeadm = nomeadm;
        this.cargoadm = cargoadm;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCpfadm() {
        return cpfadm;
    }

    public void setCpfadm(String cpfadm) {
        this.cpfadm = cpfadm;
    }

    public String getSenhaadm() {
        return senhaadm;
    }

    public void setSenhaadm(String senhaadm) {
        this.senhaadm = senhaadm;
    }

    public String getNomeadm() {
        return nomeadm;
    }

    public void setNomeadm(String nomeadm) {
        this.nomeadm = nomeadm;
    }

    public String getCargoadm() {
        return cargoadm;
    }

    public void setCargoadm(String cargoadm) {
        this.cargoadm = cargoadm;
    }
    
    public static Admin getAdmin(String logincpf, String senha) throws Exception{
        String SQL = "SELECT * FROM ADMI WHERE cpf_login = ? AND senha = ?";
        Object parameters[] = {logincpf, senha};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Admin u = new Admin((long) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4]);
            return u;
        }
    }
    
    
    public static ArrayList<Admin> getAdmins() throws Exception{
        String SQL = "SELECT * FROM ADMI";
        ArrayList<Admin> admins = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Admin u = new Admin((long) row[0], (String) row[1], (String) row[2], (String) row[3], (String) row[4]);
            admins.add(u);
        }
        return admins;
    }
    
    public static void addAdmin(String login, String senha, String nome, String cargo) throws Exception{
        String SQL = "INSERT INTO ADMI VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", ?"
               + ")";
        Object parameters[] = {login, senha, nome, cargo};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeAdmin( long id) throws Exception{
        String SQL = "DELETE FROM ADMI WHERE CD_ADMINISTRADOR = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
   
}
