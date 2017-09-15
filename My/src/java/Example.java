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
public class Example extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ResultSet rs = null;
        Connection con = null;
        PreparedStatement pst = null;
        JSONArray jarry = new JSONArray();
        try {

            JSONObject dataObj = new JSONObject();
            dataObj.put("text", "Hai");
            JSONArray dataArray = new JSONArray();
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");

            pst = con.prepareStatement("select name,id from temp where parent_id=-1");
            rs = pst.executeQuery();
            JSONObject parentObj = new JSONObject();
            JSONArray jarry1 = new JSONArray();
            int parentId = -1;
            int id = 0;

            while (rs.next()) {
                parentObj.put("text", rs.getString("name"));
                parentId = rs.getInt("id");
                System.out.println(parentId);
                pst = con.prepareStatement("select * from temp where parent_Id='" + parentId + "'");
                rs = pst.executeQuery();
                JSONArray temp = new JSONArray();
                while (rs.next()) {
                    JSONObject jobj = new JSONObject();
                    jobj.put("text", rs.getString("name"));
                    jobj.put("id", rs.getString("id"));
                    temp.add(jobj);

                }
                parentObj.put("items", temp);
                    for (int x = 0; x < temp.size(); x++) {
                    int childId = temp.getJSONObject(x).getInt("id");
                   
                        JSONArray resulrArray= fetchChildData(childId);
                    jarry1.add(temp.getJSONObject(x).accumulate("items", resulrArray));

                }
                dataArray.add(parentObj);
                System.out.println("dataJSONarray " + dataArray);
                System.out.println("dataArray  " + dataArray);
                out.println(dataArray);
            }
            System.out.println("jarry1  "+jarry1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pst.close();
            out.close();
            con.close();
        }

    }

    public JSONArray fetchChildData(int ID) throws ServletException, IOException, SQLException {


        ResultSet rs = null;
        Connection con = null;
        PreparedStatement pst = null;
        JSONArray dataArray = new JSONArray();
        JSONArray jarry1 = new JSONArray();
        try {

            JSONObject dataObj = new JSONObject();
            dataObj.put("text", "Hai");

            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");

            pst = con.prepareStatement("select name,id from temp where parent_id=?");
            pst.setInt(1, ID);
            rs = pst.executeQuery();
            JSONObject parentObj = new JSONObject();
            int parentId = -1;
            int id = 0;

            while (rs.next()) {
                parentObj.put("text", rs.getString("name"));
                parentId = rs.getInt("id");
                System.out.println(parentId);
                pst = con.prepareStatement("select * from temp where parent_Id='" + parentId + "'");
                rs = pst.executeQuery();
                JSONArray temp = new JSONArray();
                while (rs.next()) {
                    JSONObject jobj = new JSONObject();
                    jobj.put("text", rs.getString("name"));
                    jobj.put("id", rs.getString("id"));
                    temp.add(jobj);

                }
                parentObj.put("items", temp);
                for (int x = 0; x < temp.size(); x++) {
                    int childId = temp.getJSONObject(x).getInt("id");
                    JSONArray resulrArray= fetchChildData(childId);
                    jarry1.add(temp.getJSONObject(x).accumulate("items", resulrArray));

                }

                dataArray.add(parentObj);
                System.out.println("dataJSONarray " + dataArray);
                System.out.println("dataArray  " + dataArray);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pst.close();
            con.close();
        }
        return jarry1;

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
            Logger.getLogger(Example.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Example.class.getName()).log(Level.SEVERE, null, ex);
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
