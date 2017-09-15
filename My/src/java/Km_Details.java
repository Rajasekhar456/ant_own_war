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
import java.util.ArrayList;
import java.util.Enumeration;
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
public class Km_Details extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
                                          
        String ORZ_ID=(String)session.getAttribute("ORZ_ID");
        PrintWriter out = response.getWriter();
//         ResultSet rs = null;        
        Connection con = null;
        ArrayList<String> ar=new ArrayList<String>();
        ArrayList<String> km=new ArrayList<String>();
        ArrayList<String> fare=new ArrayList<String>();
        Enumeration en=request.getParameterNames();
	while(en.hasMoreElements())
	{
	 Object objOri=en.nextElement();
	 String param=(String)objOri;
         if(param.contains("km"))
         {
                       
             km.add(param);
         }
         
	}
        
        for(int i=0;i<km.size();i++)
	{	 
	 String param=km.get(i);
          String number=param.split("m")[1];
             String kmValue=request.getParameter("km"+number);
            String fareValue=request.getParameter("fare"+number);
            ar.add(kmValue);
            ar.add(fareValue);                     
         }
        System.out.println(ar);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con =  DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
	int rs=0;
	try
		{
			for(int k=0;k<ar.size();k=k+2)
			{
                        	Statement stmt=con.createStatement();
                                String str="insert into FARE_DETAILS values('"+ar.get(k)+"','"+ar.get(k+1)+"',ORG_ID.NEXTVAL,"+Integer.parseInt(ORZ_ID)+")";
				rs+=stmt.executeUpdate(str);
				stmt.close();
			}		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
        finally {
                 con.close();	           
              
        }
		            System.out.println("rs = "+rs+"\t ar.size()"+ar.size());
		if(rs == ar.size()/2)
                   {
                    System.out.println("hebsdl");
                     out.print("<html><body background='images/it2.jpg' style='background-size:1400px 700px;background-repeat: no-repeat';>");  
                     out.print("<br><br><br><br><br><center><h1 style='color:orange'>Your Lunch Box Fare Deatils Are Successfully Added<br/><h2 style='color:orange'>please click the home button</h2></center></h1><br>");
                     out.println("<form action=Boot.jsp>");
                     out.println("<center>");
		     out.println("<br><br>");
		     out.println("<input type=submit value=home style=font-size:15pt;color:white;background-color:green;border:10px solid #336600;padding:3px>");
		     out.println("</center>");
		     out.println("</form>"); 
		     out.println("</body>");
		     out.println("</html>");  
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
                    try {
                        processRequest(request, response);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(Km_Details.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(Km_Details.class.getName()).log(Level.SEVERE, null, ex);
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
                    try {
                        processRequest(request, response);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(Km_Details.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(Km_Details.class.getName()).log(Level.SEVERE, null, ex);
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
