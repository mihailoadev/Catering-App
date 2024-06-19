/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import bean.Korisnik;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miki
 */
public class PregledKorisnika extends HttpServlet {

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

        HttpSession sesija = request.getSession();

        ArrayList<Korisnik> listaKorisnika = new ArrayList<Korisnik>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/ketering_sluzba", "root", "");

            String upit = "SELECT * FROM korisnik WHERE privilegije IN (1, 2, 3)";
            PreparedStatement ps = konekcija.prepareStatement(upit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Korisnik k = new Korisnik();

                k.setEmail(rs.getString("email"));
                k.setIdKorisnik(rs.getInt("idKorisnika"));
                k.setIme(rs.getString("ime"));
                k.setPrezime(rs.getString("prezime"));
                k.setKorisnickoIme(rs.getString("korisnickoIme"));
                k.setAdresa(rs.getString("adresa"));
                k.setGrad(rs.getString("grad"));
                k.setPrivilegije(rs.getInt("privilegije"));
                k.setPoeni(rs.getInt("poeni"));

                listaKorisnika.add(k);
            }

            if (!listaKorisnika.isEmpty()) {
                sesija.setAttribute("lista", listaKorisnika);
                konekcija.close();
                request.getRequestDispatcher("ispisKorisnika.jsp").forward(request, response);
            } else {
                konekcija.close();
                request.setAttribute("greska", "Za sada nema korisnika");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            request.setAttribute("poruka", ex);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
