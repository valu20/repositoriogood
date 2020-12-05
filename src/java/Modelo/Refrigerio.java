/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


public class Refrigerio {
    
    int id;
    String jor;
    String can;
    String fec;
    String est;
    String usu;
    String cur;

    public Refrigerio() {
    }

    public Refrigerio(int id, String jor, String can, String fec, String est, String usu, String cur) {
        this.id = id;
        this.jor = jor;
        this.can = can;
        this.fec = fec;
        this.est = est;
        this.usu = usu;
        this.cur = cur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJor() {
        return jor;
    }

    public void setJor(String jor) {
        this.jor = jor;
    }

    public String getCan() {
        return can;
    }

    public void setCan(String can) {
        this.can = can;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
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

    
}

