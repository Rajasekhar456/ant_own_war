
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
public class Treevw extends HttpServlet {

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
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        ResultSet rs1 = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            pst = con.prepareStatement("select * from TEMP where PARENT_ID=-1");
            rs = pst.executeQuery();
            JSONArray jarry = new JSONArray();

            while (rs.next()) {
                JSONObject obj = new JSONObject();
                obj.put("text", rs.getString("NAME"));

                JSONArray jarry1 = new JSONArray();
                String ID = rs.getString("ID");
                pst1 = con.prepareStatement("select * from TEMP where PARENT_ID='" + ID + "'");
                rs1 = pst1.executeQuery();
                while (rs1.next()) {
                    JSONObject obj1 = new JSONObject();
                    obj1.put("text", rs1.getString("NAME"));
                    
                    JSONArray jarry2 = new JSONArray();
                    String ID1 = rs1.getString("ID");
                    FetchUserDetails f = new FetchUserDetails();
                    jarry2 = f.childDetails(ID1);
                    obj1.put("items", jarry2);
                    jarry1.add(obj1);

                }
                obj.put("items", jarry1);
                jarry.add(obj);
            }

            
            out.println(jarry);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pst.close();
            rs.close();
            out.close();
            con.close();
        }
    }
}