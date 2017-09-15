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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 *
 * @author Administrator
 */
public class Demo extends HttpServlet {

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
        Statement stmt = null;
        Connection conn;
        conn = null;  
        JSONArray jarry = new JSONArray();
        	int rs=0;
            String fname = request.getParameter("t1");
            String mail = request.getParameter("t2");
            String password = request.getParameter("t3");
            String phno = request.getParameter("t4");
            String city = request.getParameter("t5");
            String address = request.getParameter("adrs");
            jarry.add(address);
//        val=val+addr;
        String addr1 = request.getParameter("hide");
        int a = Integer.parseInt(addr1);
        System.out.println("addr1:" + addr1);

        for (int i = 1; i <= a; i++) {

            String addr2 = request.getParameter("addr" + i);
            System.out.println("addr:" + addr2);
//                val=val+","+addr2; 
            jarry.add(addr2);
        }
        System.out.println(jarry);
        String resp = "";
        for (int j = 0; j < jarry.size(); j++) {
            if (j == 0) {
                resp = jarry.getString(j);   
            } else {
                resp = resp + "," + jarry.getString(j);
            }
System.out.println(resp);
        }
        try { 
//             ArrayList<String> ar=new ArrayList<String>();
//		Enumeration en=request.getParameterNames();
//                
//		while(en.hasMoreElements())
//		{
//			Object objOri=en.nextElement();
//			String param=(String)objOri;
//			String value=request.getParameter(param);
//			ar.add(value);
//		}
//        
//                String[] adrs = new String[100];
//		int i=0;
//		int j=1;
//		int length=0;
//		for(String str:ar)
//		{
//			length+=1;
//		}
//		System.out.println("length = "+length);
//	
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            stmt = conn.createStatement();
            
//            i=0;j=1;
//			  for(int k=0;k<length/2;k++)
//			  { 
//				  System.out.println("adrs [] ="+ar.get(i)+" ");
//				  stmt=conn.createStatement();
//                                  String query="insert into NEW_USER values('" + fname + "','" + mail + "','" + password + "','" + phno + "','" + city + "','"+ar.get(i)+"')";
//                                  rs = stmt.executeUpdate(query);
//			        i+=2;
//			        j+=2;
//                          }
             
            String query="insert into NEW_USER values('" + fname + "','" + mail + "','" + password + "','" + phno + "','" + city + "','" + resp + "')";
            int n = stmt.executeUpdate(query);
            System.out.println("n  " + n);
            
            if (n > 0) {
                out.print("<html><head><title>Registered</title></head><body>");
                out.print("<br><br><br><br><br><center><h1>“You have successfully registered.”</center></h1>");
                out.println("<form action=GridHtml.jsp target=_parent>");
                out.println("<center>");
                out.println("<br><br>");
                out.println("<input type=submit value=home page>");
                out.println("</center>");
                out.println("</form>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            stmt.close();
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
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
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
         System.out.println("n  " );
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
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

