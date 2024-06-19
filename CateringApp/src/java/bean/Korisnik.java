/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author Miki
 */
public class Korisnik {
    
    private String  ime, prezime, korisnickoIme, lozinka, email, adresa, grad;
    private int idKorisnika, privilegije, poeni;   

    public Korisnik() {
        idKorisnika=0;
        ime = "";
        prezime = "";
        korisnickoIme = "";
        lozinka = "";
        email = "";
        adresa="";
        grad="";
        privilegije=0;
        poeni=0;

    }
     public Korisnik(int idKorisnik, String ime, String prezime, String korisnickoIme, String lozinka, String email, int privilegije, String adresa, String grad, int poeni) {
        this.idKorisnika = idKorisnik;
        this.ime = ime;
        this.prezime = prezime;
        this.korisnickoIme = korisnickoIme;
        this.lozinka = lozinka;
        this.email = email;
        this.privilegije = privilegije;
        this.adresa=adresa;
        this.grad=grad;
        this.poeni=poeni;
    }

    public int getIdKorisnik() {
        return idKorisnika;
    }

    public void setIdKorisnik(int idKorisnik) {
        this.idKorisnika = idKorisnik;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPrivilegije() {
        return privilegije;
    }

    public void setPrivilegije(int privilegije) {
        this.privilegije = privilegije;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public int getPoeni() {
        return poeni;
    }

    public void setPoeni(int poeni) {
        this.poeni = poeni;
    }
}
