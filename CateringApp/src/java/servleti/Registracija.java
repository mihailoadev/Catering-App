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

/**
 *
 * @author Miki
 */
public class Registracija extends HttpServlet {

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

        String ime = request.getParameter("ime"),
                prezime = request.getParameter("prezime"),
                adresa = request.getParameter("adresa"),
                grad = request.getParameter("grad"),
                korisnickoIme = request.getParameter("korisnickoIme"),
                lozinka = request.getParameter("lozinka"),
                lozinkaPotvrda = request.getParameter("lozinkaPotvrda"),
                email = request.getParameter("email");

        // Provera da li su sva polja popunjena
        if (ime != null && !ime.isEmpty() && prezime != null && !prezime.isEmpty() && korisnickoIme != null && !korisnickoIme.isEmpty()
                && lozinka != null && !lozinka.isEmpty() && lozinkaPotvrda != null && !lozinkaPotvrda.isEmpty() && email != null && !email.isEmpty()
                && adresa != null && !adresa.isEmpty() && grad != null && !grad.isEmpty()) {

            // Provera da li se lozinke poklapaju
            if (lozinka.equals(lozinkaPotvrda)) {
                // Kreiranje objekta Korisnik
                Korisnik korisnik = new Korisnik();
                korisnik.setIme(ime);
                korisnik.setPrezime(prezime);
                korisnik.setAdresa(adresa);
                korisnik.setGrad(grad);
                korisnik.setKorisnickoIme(korisnickoIme);
                korisnik.setLozinka(lozinka);
                korisnik.setEmail(email);

                String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba",
                        user = "root",
                        pass = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection(dburl, user, pass);
                    Statement st = con.createStatement();

                    // Provera da li korisničko ime već postoji
                    String upit = "SELECT korisnickoIme FROM korisnik WHERE korisnickoIme = '" + korisnickoIme + "'";
                    ResultSet rezultat = st.executeQuery(upit);

                    if (rezultat.next()) {
                        request.setAttribute("msg", "Korisnicko ime vec postoji");
                        request.getRequestDispatcher("registracija.jsp").forward(request, response);
                        st.close();
                        con.close();
                        return;
                    }

                    // Ubacivanje korisnika u bazu
                    upit = "INSERT INTO korisnik (ime, prezime, adresa, grad, korisnickoIme, lozinka, email) VALUES ('"
                            + korisnik.getIme() + "', '"
                            + korisnik.getPrezime() + "', '"
                            + korisnik.getAdresa() + "', '"
                            + korisnik.getGrad() + "', '"
                            + korisnik.getKorisnickoIme() + "', '"
                            + korisnik.getLozinka() + "', '"
                            + korisnik.getEmail() + "')";
                    st.executeUpdate(upit);

                    st.close();
                    con.close();

                    request.setAttribute("poruka", "Uspešno ste se registrovali. Pokušajte da se ulogujete.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                    request.setAttribute("poruka", e.getMessage());
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Lozinke se ne poklapaju");
                request.getRequestDispatcher("registracija.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja");
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
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
