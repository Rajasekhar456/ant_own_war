
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Administrator
 */
public class UserLists {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList fetchAllUsers() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        ps = con.prepareStatement("Select * From USER_DETAILS ");
        rs = ps.executeQuery();
        ArrayList list2 = new ArrayList();
        while (rs.next()) {
            ArrayList list1 = new ArrayList();
            list1.add(rs.getString("FIRST_NAME"));
            list1.add(rs.getString("LAST_NAME"));
            list1.add(rs.getString("USER_NAME"));
            list2.add(list1);
        }
        return list2;
    }
}