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
public class LoginServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();


        ResultSet rs = null;
        Statement stmt = null;
        Connection con = null;
        try {
            String Email_id = request.getParameter("Email_id");
            String password = request.getParameter("password");
//            String ORZ_ID = request.getParameter("ORZ_ID");
            String HOTEL_NAME,CITY_NAME,ADDRESS,PHONE_NUMBER;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            stmt = con.createStatement();

            rs = stmt.executeQuery("select * from OWNER_DETAILS ");
//                    + "where Email_id='" + Email_id + "' and password='" + password + "'");
            int i=0;
			 
				  while(rs.next())
				{
				  if(Email_id.equalsIgnoreCase(rs.getString("Email_id")) && password.equalsIgnoreCase(rs.getString("password")))
				  {
					  System.out.println("correct user");
					  //request.setAttribute("res", resname);
					  //RequestDispatcher rd=request.getRequestDispatcher("adddetails.jsp");
                                          HttpSession session = request.getSession(false);
                                          session.setAttribute("password", password);
                                          session.setAttribute("Email_id", Email_id);
                                          session.setAttribute("ORZ_ID", rs.getString("ORZ_ID"));
					  System.out.println("Email_id = "+Email_id);
					  request.setAttribute("Email_id", Email_id);
					  //rd.forward(request, response);
					  i=1;
					  break;
				  }
			  }
                                   String query="select * from OWNER_DETAILS where Email_id='"+Email_id+"'";
				  System.out.println(query);
				  ResultSet res1=stmt.executeQuery(query);
				  while(res1.next())
				  {
					   HOTEL_NAME=res1.getString("HOTEL_NAME");
					   ADDRESS=res1.getString("ADDRESS");
					   CITY_NAME=res1.getString("CITY_NAME");
					   PHONE_NUMBER=res1.getString("PHONE_NUMBER");
						  request.setAttribute("HOTEL_NAME", HOTEL_NAME);
						  System.out.println(HOTEL_NAME);
						  request.setAttribute("ADDRESS", ADDRESS);
						  System.out.println(ADDRESS);
						  request.setAttribute("CITY_NAME", CITY_NAME);
						  System.out.println(CITY_NAME);
						  request.setAttribute("PHONE_NUMBER", PHONE_NUMBER);
						  System.out.println(PHONE_NUMBER);
				  }
				
				  if(i==0)
				  {
					  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
					  out.println("<script>alert('Sorry username or password error')</script>");
					  rd.include(request, response);
				  }
				  else
				  {
					  RequestDispatcher rd=request.getRequestDispatcher("Boot.jsp");
					  rd.forward(request, response);
				  }
            
//            if (rs.next()) {
//                //HttpSession session=request.getSession();  
//                HttpSession session = request.getSession(false);
//                session.setAttribute("password", password);
//                session.setAttribute("Email_id", Email_id);
//                response.sendRedirect("Boot.jsp");
//
//
//            } else {
//
//                out.print("<script>alert('Sorry username or password error')</script>");
//
//                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
//                rd.include(request, response);
//
//            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
