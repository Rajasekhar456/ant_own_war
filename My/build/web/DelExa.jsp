<%-- 
    Document   : DelExa
    Created on : Jun 8, 2017, 2:21:07 PM
    Author     : Hussain
--%>


<%@ page import ="java.sql.*" %>
<%
    PreparedStatement ps = null;
    Statement stmt = null;
    Connection con = null;
    try {
        String Email_id=(String)session.getAttribute("Email_id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        ps = con.prepareStatement("Delete From NEW_USER Where EMAIL_ID='" + Email_id + "'");
       int i = ps.executeUpdate();

              if (i > 0) {
                        out.print("<script>alert('Deleted...')</script>");
                         RequestDispatcher rd = request.getRequestDispatcher("GridHtml.jsp");
                         rd.include(request, response);
            } else {
              out.print("<script>alert('Not Deleted...')</script>");
              RequestDispatcher rd = request.getRequestDispatcher("GridHtml.jsp");
              rd.include(request, response);
            }
    %>
<!--    </table></div>
    </form>-->
<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            stmt.close();
            con.close();
        }
    %>