/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Administrator
 */
public class Profile extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        JSONArray jarry = new JSONArray();
        try {
//            String EMAIL_ID = request.getParameter("EMAIL_ID");
//            String PASSWORD = request.getParameter("PASSWORD");
            HttpSession session=request.getSession(); 
            String EMAIL_ID = (String) session.getAttribute("Email_id");
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            pst = con.prepareStatement("select * from OWNER_DETAILS where EMAIL_ID='"+EMAIL_ID+"'");
//            pst = con.prepareStatement("select * from OWNER_DETAILS ");
            rs = pst.executeQuery();

            while (rs.next()) {
                JSONObject obj = new JSONObject();
                obj.put("FIRST_NAME", rs.getString("FIRST_NAME"));
                obj.put("LAST_NAME", rs.getString("LAST_NAME"));
                obj.put("EMAIL_ID", rs.getString("EMAIL_ID"));
                obj.put("PHONE_NUMBER", rs.getString("PHONE_NUMBER"));
                obj.put("ADDRESS", rs.getString("ADDRESS"));
                obj.put("CITY_NAME", rs.getString("CITY_NAME"));
                obj.put("PIN_NUMBER", rs.getString("PIN_NUMBER"));
                obj.put("HOTEL_NAME", rs.getString("HOTEL_NAME"));
                jarry.add(obj);
            }
            out.println(jarry);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pst.close();
            out.close();
            con.close();
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


        } catch (SQLException ex) {
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


        } catch (SQLException ex) {
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
