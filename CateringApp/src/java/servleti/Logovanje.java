/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import bean.Korisnik;
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
public class Logovanje extends HttpServlet {

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

        String korisnickoIme = request.getParameter("korisnickoIme"),
                lozinka = request.getParameter("lozinka"),
                poruka;
        HttpSession sesija = request.getSession();
        Korisnik korisnik = new Korisnik();
        korisnik.setKorisnickoIme(korisnickoIme);
        sesija.setAttribute("korisnik", korisnik);

        if (korisnickoIme.isEmpty() || lozinka.isEmpty()) {
            poruka = "Morate uneti sva polja";
            request.setAttribute("poruka", poruka);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {
            Connection con = null;
            Statement stmt;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ketering_sluzba", "root", "");
                stmt = con.createStatement();
                String upit = "SELECT * FROM korisnik WHERE korisnickoIme='" + korisnickoIme + "' AND lozinka='" + lozinka + "'";
                rs = stmt.executeQuery(upit);
                if (rs.next()) {
                    int idKorisnika = rs.getInt("idKorisnika");
                    String ime = rs.getString("ime"),
                            prezime = rs.getString("prezime"),
                            email = rs.getString("email"),
                            adresa = rs.getString("adresa"),
                            grad = rs.getString("grad");
                    int poeni = rs.getInt("poeni");
                    int privilegije = rs.getInt("privilegije");
                    korisnik.setIdKorisnik(idKorisnika);
                    korisnik.setIme(ime);
                    korisnik.setPrezime(prezime);
                    korisnik.setEmail(email);
                    korisnik.setPrivilegije(privilegije);
                    korisnik.setPoeni(poeni);
                    korisnik.setGrad(grad);
                    korisnik.setAdresa(adresa);
                    

                    stmt.close();
                    con.close();
                } else {
                    poruka = "Neispravno korisnicko ime ili lozinka. Pokusajte ponovo!";

                    request.setAttribute("poruka", poruka);
                    stmt.close();
                    con.close();
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                request.setAttribute("poruka", "Vasi podaci");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (SQLException e) {
                sesija.invalidate();
                String errms = e.getMessage();

                if (con != null) {
                    try {
                        con.close();;
                    } catch (Exception ex) {
                        errms += ex.getMessage();
                    }
                }
                request.setAttribute("poruka", errms);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (Exception exc) {
            }
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
