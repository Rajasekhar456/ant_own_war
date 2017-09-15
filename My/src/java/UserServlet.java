/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class UserServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ResultSet rs = null;
        Statement stmt = null;
        Connection con = null;

        try {
            String user;
            user = request.getParameter("userName");
            String pass;
            pass = request.getParameter("password");
            System.out.println("user  name  " + user);
            System.out.println("pass  " + pass);
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            stmt = con.createStatement();
            rs = (ResultSet) stmt.executeQuery("select Password from OWNER_DETAILS where EMAIL_ID='" + user + "' and PASSWORD= '" + pass + "'");
            if (rs.next()) {
                if (user.equalsIgnoreCase(rs.getString("USER_NAME")) && pass.equalsIgnoreCase(rs.getString("PASSWORD"))) {
                    System.out.println("correct user");
                    out.print("<html><body>");
                    out.print("<br><br><br><br><br><center><h1>successfully Login</center></h1>");
                    out.println("</body>");
                    out.println("</html>");
                } else {
                    out.print("<br><br><br><br><br><center><h1>Unsuccessfully Login</center></h1>");
                }
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP
//     * <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
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
/* ArrayList ar = (ArrayList) request.getAttribute("UserDetails");
    ar.add(request.getAttribute("UserDetails"));
    ar.add("riche");
    ar.add("jacky");
    ar.add("rosy");  */
/*var list = '=ar';
            alert(list)*/