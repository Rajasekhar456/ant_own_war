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
public class OrgDisplay extends HttpServlet {

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
         ResultSet rs = null;
         Statement st = null;
         Connection conn = null;
         String city1=request.getParameter("city");
         
    try {
         int i=0;
         Class.forName("oracle.jdbc.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
         st = conn.createStatement();
         String str="select * from OWNER_DETAILS where CITY_NAME='"+city1+"'";
         rs=st.executeQuery(str);
         out.println("<html><head><title>Your Organization Details</title></head><body  background= \"Images/mh.png\" style=\"background-size:1400px 700px;background-repeat: no-repeat;\">");
         out.println("<div align=center style='color:#FFFF00;' ><h2 >ORGANIZATIONS IN "+city1.toUpperCase()+" </h2></div>");
         out.println(" <a style='color:#00FF7F; font-size:20px' href=\"Selectcity.jsp\">Previous page</a>");
         out.println("<style>table {border-collapse:collapse;width: 60%;}th, td {ext-align: left;padding: 8px}tr:nth-child(even){background-color:#7FFFD4}tr:nth-child(odd){background-color:#FFD700}th {background-color:#800080;color: white;}</style>");
         out.println("<table border=2 align=center ><tr><th>Organization Name</th><th>Address</th><th>Phone Number</th><th>City</th><th>View Fare_Details/month</th>");
//         st = conn.createStatement();
//         rs=st.executeQuery("select * from OWNER_DETAILS where CITY_NAME='"+city1+"'");
         while(rs.next())
          {
            i++;
            String organizationname=rs.getString("HOTEL_NAME");
            String address=rs.getString("ADDRESS");
            String city=rs.getString("CITY_NAME");
            String phno=rs.getString("PHONE_NUMBER");
            String ORZ_ID=Integer.toString(rs.getInt("ORZ_ID"));
            System.out.println(ORZ_ID);
            out.println("<tr><td>");
            out.println(organizationname);
            out.println("</td><td>");
            out.println(address);
            out.println("</td><td>");
            out.println(phno);
            out.println("</td><td>");
            out.println(city);
            out.println("</td><td>");
            out.println("<a href='Fare_km.jsp?ORZ_ID="+ORZ_ID+"'>View Fare_Details </a>");
            out.println("</td></tr>");
           }
            out.println("</table></body></html>");
            if(i==0)
            {
            out.println("sorry this area no Organizatons");
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
            Logger.getLogger(OrgDisplay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrgDisplay.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OrgDisplay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrgDisplay.class.getName()).log(Level.SEVERE, null, ex);
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
