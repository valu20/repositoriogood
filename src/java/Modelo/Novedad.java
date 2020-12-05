
package Modelo;


public class Novedad {
    
    int id;
    String ref;
    String fec;
    String canr;
    String usu;
    String cur;
    String des;
    String jor;
    String noe;
    
    public Novedad() {
        
    }

    public Novedad(int id, String ref, String fec, String canr, String usu, String cur, String des, String jor, String noe) {
        this.id = id;
        this.fec = fec;
        this.canr = canr;
        this.usu = usu;
        this.cur = cur;
        this.des = des;
        this.jor = jor;
        this.noe = noe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref= ref;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public String getCanr() {
        return canr;
    }

    public void setCanr(String canr) {
        this.canr = canr;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public String getCur() {
        return cur;
    }

    public void setCur(String cur) {
        this.cur = cur;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getJor() {
        return jor;
    }

    public void setJor(String jor) {
        this.jor = jor;
    }

    public String getNoe() {
        return noe;
    }

    public void setNoe(String noe) {
        this.noe = noe;
    }
   

}