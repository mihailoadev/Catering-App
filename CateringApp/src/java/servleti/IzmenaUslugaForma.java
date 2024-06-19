/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

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
public class IzmenaUslugaForma extends HttpServlet {

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
        int idUsluge = Integer.parseInt(request.getParameter("idUsluge"));

        String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba";
        String user = "root";
        String pass = "";

        HttpSession sesija = request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection(dburl, user, pass);
            String upit = "SELECT * FROM usluga where idUsluge = ?";
            PreparedStatement ps = konekcija.prepareStatement(upit);

            ps.setInt(1, idUsluge);
            Usluga u = new Usluga();

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                u.setIdUsluge(rs.getInt("idUsluge"));
                u.setNaziv(rs.getString("naziv"));
                u.setOpis(rs.getString("opis"));
                u.setCena(rs.getInt("cena"));
                u.setIdAgencije(rs.getInt("cena"));

            }

            ps.close();
            konekcija.close();
            sesija.setAttribute("usluga", u);
            request.getRequestDispatcher("izmenaUslugaForma.jsp").forward(request, response);
        } catch (Exception ex) {

            request.setAttribute("error", ex.getMessage());
            request.setAttribute("poruka", "Greska.");
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
