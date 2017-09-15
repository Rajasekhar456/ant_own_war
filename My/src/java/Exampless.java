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
public class Exampless extends HttpServlet {

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
//        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        PreparedStatement pst3 = null;
//        PreparedStatement pst4 = null;
        PreparedStatement pst5 = null;
        ResultSet rs = null;
//        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
//        ResultSet rs4 = null;
        ResultSet rs5 = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            pst = con.prepareStatement("SELECT * FROM TEMP1 where PARENT_ID=-1");
            rs = pst.executeQuery();
            JSONArray jarry = new JSONArray();
            while (rs.next()) {
//            JSONArray jarry = new JSONArray();
                JSONObject obj = new JSONObject();
                obj.put("text", rs.getString("NAME"));
                obj.put("id", rs.getString("PARENT_ID"));

                JSONArray jarry1 = new JSONArray();
                String ID = rs.getString("ID");
                pst = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID + "'");
                rs = pst.executeQuery();
                while (rs.next()) {
                    JSONObject obj1 = new JSONObject(); 
                    obj1.put("text", rs.getString("NAME"));
                    obj1.put("id", rs.getString("PARENT_ID"));
                    JSONArray jarry2 = new JSONArray();

                    String ID1 = rs.getString("ID");
                    pst2 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID1 + "'");
                    rs2 = pst2.executeQuery();
                    while (rs2.next())
                    {
                        JSONObject obj2 = new JSONObject();
                        obj2.put("text", rs2.getString("NAME"));
                        obj2.put("id", rs2.getString("PARENT_ID"));
                        JSONArray jarry3 = new JSONArray();
                        String ID2 = rs2.getString("ID");
                        pst3 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID2 + "'");
                        rs3 = pst3.executeQuery();
                        while (rs3.next())
                        {
                            JSONObject obj3 = new JSONObject();
                            obj3.put("text", rs3.getString("NAME"));
                            obj3.put("id", rs3.getString("PARENT_ID"));
//                            JSONArray jarry4 = new JSONArray();
//                            String ID3 = rs3.getString("ID");
//                            pst4 = con.prepareStatement("select * from temp where PARENT_ID='" + ID3 + "'");
//                            rs4 = pst4.executeQuery();
//                            while (rs4.next())
//                            {
//                                JSONObject obj4 = new JSONObject();
//                                obj4.put("text", rs3.getString("NAME"));
//                                obj3.put("id", rs3.getString("PARENT_ID"));
//                            
                                JSONArray jarry5 = new JSONArray();
                                String ID4 = rs3.getString("ID");
                                pst5 = con.prepareStatement("select * from temp where PARENT_ID='" + ID4 + "'");
                                rs5 = pst5.executeQuery();
                                while (rs5.next())
                                {
                                  JSONObject obj5 = new JSONObject();
                                  obj5.put("text", rs5.getString("NAME"));
                                
                                  obj5.put("id", rs5.getString("PARENT_ID"));
                                  obj5.put("items", jarry5);
                                  jarry5.add(obj5);
                                } 
                                
//                                  jarry4.add(obj4);
                                  jarry3.add(obj3);
                            
                            }
                            obj2.put("items", jarry3);
                            jarry2.add(obj2);
                    }                      
                        obj1.put("items", jarry2);
                        jarry1.add(obj1);
//                    }
                }
              obj.put("items", jarry1);
              jarry.add(obj);
              }
                out.println(jarry);
            
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            pst.close();
            out.close();
            con.close();
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
            Logger.getLogger(Exampless.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Exampless.class.getName()).log(Level.SEVERE, null, ex);
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
 /* TODO output your page here. You may use following sample code.
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet treeview4levels</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet treeview4levels at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/