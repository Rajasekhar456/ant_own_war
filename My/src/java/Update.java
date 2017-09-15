/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class Update extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String FIRST_NAME = request.getParameter("FIRST_NAME");
        String LAST_NAME = request.getParameter("LAST_NAME");
        String EMAIL_ID = request.getParameter("EMAIL_ID");
        String PHONE_NUMBER = request.getParameter("PHONE_NUMBER");
        String ADDRESS = request.getParameter("ADDRESS");
        String CITY_NAME = request.getParameter("CITY_NAME");
        String PIN_NUMBER = request.getParameter("PIN_NUMBER");
        String HOTEL_NAME = request.getParameter("HOTEL_NAME");
        Connection con = null;
        PreparedStatement ps = null;
        System.out.println("FIRST_NAME  "+FIRST_NAME);
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            ps = con.prepareStatement("update OWNER_DETAILS set FIRST_NAME=?,LAST_NAME=?,EMAIL_ID=? ,"
                    + "PHONE_NUMBER=?,ADDRESS=?,CITY_NAME=?,PIN_NUMBER=?,HOTEL_NAME=? where FIRST_NAME=? ");
            ps.setString(1, FIRST_NAME);
            ps.setString(2, LAST_NAME);
            System.out.println(LAST_NAME);
            ps.setString(3, EMAIL_ID);
            ps.setString(4, PHONE_NUMBER);
            ps.setString(5, ADDRESS);
            ps.setString(6, CITY_NAME);
            ps.setString(7, PIN_NUMBER);
            ps.setString(8, HOTEL_NAME);
            ps.setString(9, FIRST_NAME);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("Updated...");
            } else {
                out.println("Not Updated...");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        }
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
