/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class FetchUserDetails {
//    public class FeathAllusers {

    public JSONArray childDetails(String id) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        JSONArray jarry = new JSONArray();
        JSONArray jarry2 = new JSONArray();
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            pst = con.prepareStatement("select * from TEMP where PARENT_ID='" + id + "'");
            rs = pst.executeQuery();

            while (rs.next()) {
                JSONObject obj = new JSONObject();
                obj.put("text", rs.getString("NAME"));
                String ID1 = rs.getString("ID");
                jarry2 = childDetails(ID1);
                obj.put("items", jarry2);
                jarry.add(obj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pst.close();
            con.close();
        }
        System.out.println("jarry  "+jarry);
        return jarry;
    }
}

    

