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
import java.util.ArrayList;
import java.util.Enumeration;
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
public class Price_Details extends HttpServlet {

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
    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Statement st = null;
        Connection conn;
        conn = null;
//        ResultSet rs = null;
         ArrayList<String> ar=new ArrayList<String>();
		Enumeration en=request.getParameterNames();
		while(en.hasMoreElements())
		{
			Object objOri=en.nextElement();
			String param=(String)objOri;
			String value=request.getParameter(param);
			ar.add(value);
		}
           
          String ORZ_ID=ar.get(0);
		ar.remove(0);
		String[] km = new String[100];
		String[] fare = new String[100];;
		int i=0;
		int j=1;
		int length=0;
		for(String str:ar)
		{
			length+=1;
		}
             System.out.println("length = "+length);
             int rs=0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
           i=0;j=1;
           for(int k=0;k<length/2;k++)
           {
              System.out.println("items [] ="+ar.get(i)+" and prices[] = "+ar.get(j)+" length/2 = "+(length/2));
	      conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
	      Statement stmt=conn.createStatement();
	      rs=stmt.executeUpdate("insert into add_items values('"+ar.get(i)+"',"+Integer.parseInt(ar.get(j))+",ORG_ID.NEXTVAL,"+Integer.parseInt(ORZ_ID)+")");
	      conn.close();
              stmt.close();
              i+=2;
              j+=2;
           } 
           
           if(rs>0)
              {
               System.out.println("hebsdl");
               out.print("<html><body background='#.jpg' style='background-size:1400px 700px;background-repeat: no-repeat';>");  
               out.print("<br><br><br><br><br><center><h1 style='color:orange'>Your Items Are Successfully Added<br/><h2 style='color:orange'>please click the home button</h2></center></h1><br>");
               out.println("<form action=Boot.jsp>");
               out.println("<center>");
               out.println("<br><br>");
               out.println("<input type=submit value=home style=font-size:15pt;color:white;background-color:green;border:10px solid #336600;padding:3px>");
               out.println("</center>");
               out.println("</form>"); 
               out.println("</body>");
               out.println("</html>");  
             }
        }catch (Exception e) {
            e.printStackTrace();
        }
        finally { 
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
            Logger.getLogger(Price_Details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Price_Details.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Price_Details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Price_Details.class.getName()).log(Level.SEVERE, null, ex);
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
