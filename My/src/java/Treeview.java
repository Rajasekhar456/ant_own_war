/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class Treeview extends HttpServlet {

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
        PreparedStatement pst = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        try { 
            Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        pst = con.prepareStatement("SELECT * FROM TEMP where PARENT_ID=-1");
        rs = pst.executeQuery();
        while (rs.next()) {
            JSONArray jarry = new JSONArray();
            JSONObject obj = new JSONObject();
            obj.put("name", rs.getString("NAME"));
//            obj.put("id", rs.getString("PARENT_ID"));

            JSONArray jarry1 = new JSONArray();
            String ID = rs.getString("ID");
            pst1 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID + "'");
            rs1 = pst1.executeQuery();
            while (rs1.next()) {
                JSONObject obj1 = new JSONObject();
                obj1.put("name", rs1.getString("NAME"));
                // obj1.put("id", rs1.getString("PARENT_ID"));
                JSONArray jarry2 = new JSONArray();

                String ID1 = rs1.getString("ID");
                pst2 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID1 + "'");
                rs2 = pst2.executeQuery();
                while (rs2.next()) {
                    JSONObject obj2 = new JSONObject();
                    obj2.put("name", rs2.getString("NAME"));

                    jarry2.add(obj2);
                }


                obj1.put("items", jarry2);
                jarry1.add(obj1);
            }
            obj.put("items", jarry1);
            jarry.add(obj);

            out.println(jarry);
        }
    }catch(Exception e)
    {
      e.printStackTrace();
    } 
            finally {
            if (rs1 != null) {
                rs1.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (pst1 != null) {
                pst1.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (out != null) {
                out.close();
            }
            if (con != null) {
                con.close();
            }
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
            Logger.getLogger(Treeview.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Treeview.class.getName()).log(Level.SEVERE, null, ex);
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
