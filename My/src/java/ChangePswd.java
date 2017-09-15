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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class ChangePswd extends HttpServlet {

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
        Statement stmt=null;
        HttpSession session=request.getSession(); 
        String EMAIL_ID = (String) session.getAttribute("Email_id");
        String prepwd=request.getParameter("pwd3");
	String newpwd=request.getParameter("pwd1");	
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            stmt =con.createStatement();
	 if (EMAIL_ID!= null)
		 {
         int i=stmt.executeUpdate("update OWNER_DETAILS set PASSWORD='"+newpwd+"' where  PASSWORD='"+prepwd+"'");
		 if(i>0)
		 {
		 out.println("<br><br><br><b><font size=5 color=#2271A0><center><b>your password has been changed</b></center></font>");
		 out.println("<br><<br><b><font size=5 color=#2271A0><center><b>you need to login again</b></center></font>"); 
		 out.println("<body>");	
		 out.println("<center><br><font size=5 color=#2271A0><a href='Login.jsp' target=\"_top\">Login page </a></center>");
                 out.println ("</body>");
		 out.println("</html>");
		}
		 else
                 out.println("<script>alert('Sorry username or password error')</script>");
		 }
		 }
		 catch(Exception e)
          {
           System.out.println(e);
          }
         finally {            
              con.close();
	          stmt.close();   
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
        } catch (SQLException ex) {
            Logger.getLogger(ChangePswd.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ChangePswd.class.getName()).log(Level.SEVERE, null, ex);
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
