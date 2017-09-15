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
public class Update1_123 extends HttpServlet {

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
        String FULLNAME = request.getParameter("FULLNAME");
        String FROMADDRESS = request.getParameter("FROMADDRESS");
        String HPIN = request.getParameter("HPIN");
        String TOADDRESS = request.getParameter("TOADDRESS");
        String PIN = request.getParameter("PIN");
        String PHONENUMBER = request.getParameter("PHONENUMBER");
        String SDATE = request.getParameter("SDATE");
        String TIME = request.getParameter("TIME");
        Connection con = null;
        PreparedStatement ps = null;
        System.out.println("FULLNAME  "+PIN);
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            ps = con.prepareStatement("update ORDER_INFO set FULLNAME=?,FROMADDRESS=?,HPIN=? ,"
                    + "TOADDRESS=?,PIN=?,PHONENUMBER=?,SDATE=?,TIME=? where FULLNAME=? ");
            ps.setString(1, FULLNAME);
            ps.setString(2, FROMADDRESS);
            System.out.println(FROMADDRESS);
            ps.setString(3, HPIN);
            ps.setString(4, TOADDRESS);
            ps.setString(5, PIN);
            ps.setString(6, PHONENUMBER);
            ps.setString(7, SDATE);
            ps.setString(8, TIME);
            ps.setString(9, FULLNAME);
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
