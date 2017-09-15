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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class View_Requests extends HttpServlet {

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
        HttpSession session = request.getSession(false);
         Statement st = null;
         Statement st1 = null;
         Connection conn = null;
          Connection conn1 = null;
         ResultSet rs = null;
           ResultSet rs1 = null;
        
    try {
         int i=0;
          String ORZ_ID = (String) session.getAttribute("ORZ_ID");
//         String Email_id = (String)session.getAttribute("Email_id");
//         session.setAttribute("Email_id", Email_id);
         Class.forName("oracle.jdbc.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
         st = conn.createStatement();
         String str="Select * from ORDER_INFO where ORZ_ID IN (Select ORZ_ID from OWNER_DETAILS where ORZ_ID='"+ORZ_ID+"')";
         rs=st.executeQuery(str);
         out.println("<html><head><title>Your_Requests</title></head><body  background= \"Images/it2.jpg\" style=\"background-size:1400px 700px;background-repeat: no-repeat;\">");
          out.print("<div align=center style='color:#f4d03f; font-size:20px' ><h2>Your Delivery Requests</h2></div>");
                  
         out.println(" <a style='color:#00FF7F; font-size:20px' href=\"Boot.jsp\">Previous page</a>");
         out.println("<style>table {border-collapse:collapse;width: 90%;}th, td {ext-align: left;padding: 8px}tr:nth-child(even){background-color:#7FFFD4}tr:nth-child(odd){background-color:#FFD700}th {background-color:#800080;color: white;}</style>");
         out.println("<table border=2 align=center ><tr><th>FULLNAME</th><th>FROM ADDRESS</th><th>HOME PIN</th><th>TO ADDRESS</th><th>WORKPLACE PIN</th><th>PHONE NUMBER</th><th>STARTING DATE</th><th>YOUR LUNCH TIME</th><th>AMOUNT/MONTH</th>");
//         out.println("</body></head><html>");
         st1 = conn.createStatement();
            String str1="select AMOUNT from ORDER_AMOUNT where ORZ_ID='"+ORZ_ID+"'";
            rs1=st1.executeQuery(str1);
            while(rs1.next())
            {
             String AMOUNT=rs1.getString("AMOUNT");

         
         if(rs.next())
          {
            i++;
            String FULLNAME=rs.getString("FULLNAME");
            String FROMADDRESS=rs.getString("FROMADDRESS");
            String HPIN=rs.getString("HPIN");
            String TOADDRESS=rs.getString("TOADDRESS");
            String PIN=rs.getString("PIN");
             String PHONENUMBER=rs.getString("PHONENUMBER");
             String SDATE=rs.getString("SDATE");
             String TIME=rs.getString("TIME");

            out.println("<tr><td>");
            out.println(FULLNAME);
            out.println("</td><td>");
            out.println(FROMADDRESS);
            out.println("</td><td>");
            out.println(HPIN);
            out.println("</td><td>");
            out.println(TOADDRESS);
            out.println("</td><td>");
            out.println(PIN);
            out.println("</td><td>");
            out.println(PHONENUMBER);
            out.println("</td><td>");
            out.println(SDATE);
            out.println("</td><td>");
            out.println(TIME);
            out.println("</td><td>");
            out.println(AMOUNT);
            out.println("</td></tr>");
            }
           }
            out.println("</table></body></html>");
 if(i==0)
            {
         out.println("<html><head>");
         out.println("<div align=center style='color:yellow; font-size:20px' ><h2 > You Have No Any Requests </h2></div>");
         
         out.println("</head></html>");
//    
              
            }
        } finally {   
            rs.close();
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
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
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
