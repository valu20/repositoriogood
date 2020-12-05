
package Modelo;

public class Usuario {
    int id;
    String nom;
    String ape;
    String cor;
    String cont;
    String est;
    String ing;
    String rol;

    public Usuario() {
    }

    public Usuario(int id, String nom, String ape, String cor, String con, String est, String ing, String rol) {
        this.id = id;
        this.nom = nom;
        this.ape = ape;
        this.cor = cor;
        this.cont = con;
        this.est = est;
        this.ing = ing;
        this.rol = rol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }


    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getCon() {
        return cont;
    }

    public void setCon(String con) {
        this.cont = con;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    
    public String getIng() {
        return ing;
    }

    public void setIng(String ing) {
        this.ing = ing;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    
}