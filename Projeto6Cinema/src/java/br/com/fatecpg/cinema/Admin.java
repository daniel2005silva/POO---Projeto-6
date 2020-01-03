
package br.com.fatecpg.cinema;

import java.util.ArrayList;

public class Admin {
    private int id;
    private long cpfadm;//login
    private String senhaadm;
    private String nomeadm;
    private String cargoadm;

    public Admin(int id, long cpfadm, String senhaadm, String nomeadm, String cargoadm) {
        this.id = id;
        this.cpfadm = cpfadm;
        this.senhaadm = senhaadm;
        this.nomeadm = nomeadm;
        this.cargoadm = cargoadm;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getCpfadm() {
        return cpfadm;
    }

    public void setCpfadm(long cpfadm) {
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
    
    public static Admin getAmin(long logincpf, String senha) throws Exception{
        String SQL = "SELECT * FROM ADMI WHERE nm_login = ? AND cd_senha = ?";
        Object parameters[] = {logincpf, senha};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Admin u = new Admin((int) row[0], (long) row[1], (String) row[2], (String) row[3], (String) row[4]);
            return u;
        }
    }
    
    
    public static ArrayList<Admin> getAdmins() throws Exception{
        String SQL = "SELECT * FROM ADMI";
        ArrayList<Admin> admins = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Admin u = new Admin((int) row[0], (long) row[1], (String) row[2], (String) row[3], (String) row[4]);
            admins.add(u);
        }
        return admins;
    }
    
    public static void addAdmin(long login, String senha, String nome, String cargo) throws Exception{
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
    
    public static void removeAdmin( int id) throws Exception{
        String SQL = "DELETE FROM ADMI WHERE CD_ADMINISTRADOR = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
   
}
