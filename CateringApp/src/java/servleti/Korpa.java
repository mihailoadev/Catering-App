/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import bean.Korisnik;
import bean.Rezervacija;
import bean.Usluga;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miki
 */
public class Korpa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int cenaint = 0;
        String datum = request.getParameter("datum");

        HttpSession sesija = request.getSession();

        Usluga usluga = (Usluga) sesija.getAttribute("usluga");

        Korisnik k = (Korisnik) sesija.getAttribute("korisnik");

        int brojPoena = k.getPoeni();

        String cenaStr = request.getParameter("cena");

        Rezervacija r = new Rezervacija();

        String poruka = request.getParameter("poruka");

        try {
            cenaint = Integer.parseInt(cenaStr);
        } catch (Exception ex) {

            request.setAttribute("poruka", ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }

        if (brojPoena <= 200) {

            int snizenje = 0;

            brojPoena = brojPoena + 100;

            request.setAttribute("snizenje", snizenje);
        } else {
            int snizenje = brojPoena / 100;

            if (cenaint > 7000) {

                brojPoena = brojPoena - 200;
                String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba";
                String user = "root";
                String pass = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection konekcija = DriverManager.getConnection(dburl, user, pass);
                    String upit = "UPDATE korisnik SET poeni = ? WHERE idKorisnika = ?;";
                    PreparedStatement ps = konekcija.prepareStatement(upit);
                    ps.setInt(1, brojPoena);
                    ps.setInt(2, k.getIdKorisnik());

                    ps.executeUpdate();
                    //Zatvaranje konekcije
                    konekcija.close();
                    ps.close();

                } catch (Exception ex) {
                    request.setAttribute("poruka", ex.getMessage());
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
            if (snizenje > 2) {

                snizenje = 2;
                snizenje = snizenje * 500;
                cenaint = cenaint - snizenje;
            } else {
                snizenje = snizenje * 500;

                cenaint = cenaint - snizenje;
            }

            request.setAttribute("snizenje", snizenje);
        }

        String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection(dburl, user, pass);

            String upit = "INSERT INTO rezervacija(idKorisnika,idUsluge,cena,poruka,datum,korisnickoIme,adresa,grad,naziv) VALUES(?,?,?,?,?,?,?,?,?)";
            String upit2 = "UPDATE korisnik SET poeni = ? WHERE idKorisnika = ?;";

            PreparedStatement ps = konekcija.prepareStatement(upit);
            PreparedStatement ps2 = konekcija.prepareStatement(upit2);

            ps.setInt(1, k.getIdKorisnik());
            ps.setInt(2, usluga.getIdUsluge());
            ps.setInt(3, cenaint);
            ps.setString(4, poruka);
            ps.setString(5, datum);
            ps.setString(6, k.getKorisnickoIme());
            ps.setString(7, k.getAdresa());
            ps.setString(8, k.getGrad());
            ps.setString(9, usluga.getNaziv());

            ps2.setInt(1, brojPoena);
            ps2.setInt(2, k.getIdKorisnik());

            ps.executeUpdate();
            ps2.executeUpdate();

            //Zatvaranje konekcije
            konekcija.close();
            ps.close();
            ps2.close();

        } catch (Exception ex) {
            request.setAttribute("poruka", ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }

        request.setAttribute("datum", datum);
        request.setAttribute("bazna", cenaStr);
        request.setAttribute("brojPoena", brojPoena);
        request.setAttribute("ukupna", cenaint);
        request.getRequestDispatcher("potvrdaRezervacije.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
