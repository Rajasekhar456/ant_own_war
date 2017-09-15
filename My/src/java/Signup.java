/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Signup extends HttpServlet {

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
        Statement st = null;
        Statement st1 = null;
        Connection conn;
        
        conn = null;
        try {
            String fname = request.getParameter("t1");
            String lname = request.getParameter("t2");
            String hname = request.getParameter("t9");
            String mail = request.getParameter("t3");
            String password = request.getParameter("t4");
            String phno = request.getParameter("t5");
            String address = request.getParameter("t6");
            String city = request.getParameter("t7");
            String pinno = request.getParameter("t8");
            String ORZ_ID = request.getParameter("ORZ_ID");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            st = conn.createStatement();
            int n = st.executeUpdate("insert into OWNER_DETAILS values('" + fname + "','" + lname + "','" + mail + "','" + password + "','" + phno + "','" + address + "','" + city + "','" + pinno + "','" + hname + "',ORZ_ID.NEXTVAL)");
            System.out.println("n  " + n);
              if(n>0)
	    {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
                st1 = conn.createStatement();
                
               // String ORZ_ID="";
                ResultSet res1=st1.executeQuery("select ORZ_ID from OWNER_DETAILS where HOTEL_NAME='"+ hname +"' and ADDRESS='"+ address +"' and CITY_NAME='"+ city +"' and PHONE_NUMBER = "+ phno +" and EMAIL_ID='"+ mail +"'");
                if(res1.next())
                ORZ_ID=Integer.toString(res1.getInt(1));
                out.print("<html><head><title>Registered</title></head><body bgcolor=#DAF7A6 >");
                out.print("<br><br><br><br><br><center><h1>“You have successfully registered and logged in.”<br/></center></h1>");
                out.println("<form action=Home.jsp target=_parent>");
                out.println("<center>");
                out.println("<br><br>");
                out.println("<input type='hidden' name='ORZ_ID' value='"+ORZ_ID+"'>");
                out.println("<input type=submit value=click style=font-size:15pt;color:white;background-color:green;border:10px solid #336600;padding:3px>");
                out.println("</center>");
                out.println("</form>");
                out.println("</body>");
                out.println("</html>");
                }

//            if (n > 0) {
//                out.print("<html><head><title>Registered</title></head><body bgcolor=#DAF7A6>");
//                out.print("<br><br><br><br><br><center><h1>“You have successfully registered and logged in.”</center></h1>");
//                out.println("<form action=Home.jsp target=_parent>");
//                out.println("<center>");
//                out.println("<br><br>");
//                out.println("<input type=submit value=home page>");
//                out.println("</center>");
//                out.println("</form>");
//                out.println("</body>");
//                out.println("</html>");
//            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            st.close();
            conn.close();
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
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
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
