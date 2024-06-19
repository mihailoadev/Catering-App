/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

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
public class IzmenaUsluga extends HttpServlet {

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

        String naziv = request.getParameter("naziv"),
                opis = request.getParameter("opis");

          int cena = Integer.parseInt(request.getParameter("cena"));
        int idUsluge = Integer.parseInt(request.getParameter("idUsluge"));
        

        
        String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba",
                user = "root",
                pass = "";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, user, pass);

            String upit = "UPDATE usluga SET naziv = ?, opis = ?, cena = ? WHERE idUsluge = ?";
            PreparedStatement ps = con.prepareStatement(upit);

            ps.setString(1, naziv);

             ps.setString(2, opis);
             
            ps.setInt(3, cena);
             
            ps.setInt(4, idUsluge);

            ps.executeUpdate();

            
            
            
            ps.close();
            
            con.close();
            request.setAttribute("poruka", "Uspesno ste promenili uslugu");
            request.getRequestDispatcher("PregledAgencija").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("poruka", e);
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
