/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author Miki
 */
public class Hrana {
    
    private int idHrane;
    private int idKorisnika;
    private String naziv;
    private String opis;
    private int cena, cenaPopust;

    public Hrana() {
       
        naziv="";
        opis="";
        idHrane=0;
        idKorisnika=0;
        cena=0;
        cenaPopust=0;         
    }

    public Hrana(int idHrane, int idKorisnika, String naziv, int cena, int cenaPopust, String opis) {
        this.idHrane = idHrane;
        this.idKorisnika = idKorisnika;
        this.naziv = naziv;
        this.cena = cena;
        this.cenaPopust = cenaPopust;
        this.opis=opis;
    }

    public int getIdHrane() {
        return idHrane;
    }

    public void setIdHrane(int idHrane) {
        this.idHrane = idHrane;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public int getCenaPopust() {
        return cenaPopust;
    }

    public void setCenaPopust(int cenaPopust) {
        this.cenaPopust = cena-100;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
}
