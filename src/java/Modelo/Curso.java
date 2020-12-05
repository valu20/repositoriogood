/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Curso {
    int id;
    String num;
    String jor;
    String can;
    String est;
    String aul;

    public Curso() {
    }

    public Curso(int id, String num, String jor, String can, String est, String aul) {
        this.id = id;
        this.num = num;
        this.jor = jor;
        this.can = can;
        this.est = est;
        this.aul = aul;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
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

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public String getAul() {
        return aul;
    }

    public void setAul(String aul) {
        this.aul = aul;
    }
 
}

