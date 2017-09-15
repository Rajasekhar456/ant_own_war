/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class Order_Details extends HttpServlet {

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
         HttpSession session=request.getSession(); 
         Statement st = null;
        Connection conn;
        conn = null;
        try {
            String fname = request.getParameter("t1");
            String fadrs = request.getParameter("t3");
            String hpin = request.getParameter("t7");
            String tadrs = request.getParameter("t4");
            String pin = request.getParameter("t6");
            String phn = request.getParameter("t5");
            String fdate = request.getParameter("t8");
           String time = request.getParameter("t9");
       
            String ORZ_ID = (String) session.getAttribute("ORZ_ID");
            String Email_id = (String) session.getAttribute("Email_id");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            st = conn.createStatement();
            String str="insert into ORDER_INFO values('" + fname + "','" + fadrs + "','" + tadrs + "','" + pin + "','" + phn + "','"+ORZ_ID+"','" + hpin + "','"+ fdate + "','"+ time +"','"+ Email_id +"')";
            int n = st.executeUpdate(str);
            System.out.println("n  " + n);
            if (n > 0) {
                 RequestDispatcher rd=request.getRequestDispatcher("Payment.jsp");
					  rd.forward(request, response);
//                 out.print("<html><head><title>Registered</title></head><body background= \"Images/5.jpg\" style=\"background-size:1280px 650px;background-repeat: no-repeat;\">");
//                out.print("<br><br><br><br><br><center><font size=\"5\" color=\"white\"><h1>“Your Request has been successfully Send.”</center></h1>");
//                out.println("<form action=Home.jsp target=_parent>");
//                out.println("<center>");
//                out.println("<br><br>");
//                out.println("<input type=submit value=Logout page>");
//                out.println("</center>");
//                out.println("</form>");
//                out.println("</body>");
//                out.println("</html>");
//                
            } 
      } catch (Exception e) {
            e.printStackTrace();
        }
finally {            
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
            Logger.getLogger(Order_Details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Order_Details.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Order_Details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Order_Details.class.getName()).log(Level.SEVERE, null, ex);
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
