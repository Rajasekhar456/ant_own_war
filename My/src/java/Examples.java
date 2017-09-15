/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Administrator
 */
public class Examples {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
//        JSONArray jarry = new JSONArray();
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        pst = con.prepareStatement("SELECT * FROM TEMP where PARENT_ID=-1");
        rs = pst.executeQuery();
        while (rs.next()) {
            JSONArray jarry = new JSONArray();
            JSONObject obj = new JSONObject();
            obj.put("name", rs.getString("NAME"));
//           obj.put("mno", rs.getString("MOBILE_NO"));

            JSONArray jarry1 = new JSONArray();
            String ID = rs.getString("ID");
            pst1 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID + "'");
            rs1 = pst1.executeQuery();
            while (rs1.next()) {
                JSONObject obj1 = new JSONObject();
                obj1.put("name", rs1.getString("NAME"));
//                obj1.put("mno", rs1.getString("MOBILE_NO"));
                JSONArray jarry2 = new JSONArray();

                String ID1 = rs1.getString("ID");
                pst2 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID1 + "'");
                rs2 = pst2.executeQuery();
                while (rs2.next()) {
                    JSONObject obj2 = new JSONObject();
                    obj2.put("name", rs2.getString("NAME"));
//                    obj2.put("mno", rs2.getString("MOBILE_NO"));
                    jarry2.add(obj2);
                }


                obj1.put("items", jarry2);
                jarry1.add(obj1);
            }
            obj.put("items", jarry1);
            jarry.add(obj);

            System.out.println(jarry);
        }
    }
}
