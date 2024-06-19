/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author Miki
 */
public class Rezervacija {
    
    private int idRezervacije, idKorisnik, idUsluge, cena;
    private String poruka, datum, korisnickoIme, naziv, adresa, grad;

    public Rezervacija() {
        
        idRezervacije=0;
        idKorisnik=0;
        idUsluge=0;
        poruka="";
        datum="";
        korisnickoIme="";
        naziv="";
        adresa="";
        grad="";
        
    }

    public Rezervacija(int idRezervacije, int idKorisnik, int idUsluge, int cena, String poruka, String datum, String korisnickoIme, String naziv, String adresa, String grad) {
        this.idRezervacije = idRezervacije;
        this.idKorisnik = idKorisnik;
        this.idUsluge = idUsluge;
        this.cena = cena;
        this.poruka = poruka;
        this.datum = datum;
        this.korisnickoIme = korisnickoIme;
        this.naziv = naziv;
        this.adresa=adresa;
        this.grad=grad;
    }

    public int getIdRezervacije() {
        return idRezervacije;
    }

    public void setIdRezervacije(int idRezervacije) {
        this.idRezervacije = idRezervacije;
    }

    public int getIdKorisnik() {
        return idKorisnik;
    }

    public void setIdKorisnik(int idKorisnik) {
        this.idKorisnik = idKorisnik;
    }

    public int getIdUsluge() {
        return idUsluge;
    }

    public void setIdUsluge(int idUsluge) {
        this.idUsluge = idUsluge;
    }

    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public String getPoruka() {
        return poruka;
    }

    public void setPoruka(String poruka) {
        this.poruka = poruka;
    }

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
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
}
