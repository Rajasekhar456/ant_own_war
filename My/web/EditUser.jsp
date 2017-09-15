<%-- 
    Document   : EditUser
    Created on : Jun 5, 2017, 10:38:45 AM
    Author     : Hussain
--%>

<%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    try {
        String Email_id=(String)session.getAttribute("Email_id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from NEW_USER where EMAIL_ID='"+Email_id+"'");%>
        
<div><center><table class="ex1" align="center" border=1 >
        
            <h1>User Details</h1>
     
        <td><b>NAME</b></td>
        <td><b>EMAIL_ID</b></td>
        <td><b>PHONE_NUMBER</b></td>
        <td><b>CITY_NAME</b></td>
        <td><b>ADDRESS</b></td>
        <td><b>CLICK HERE TO EDIT</b></td>
        <div>
<form action="Update" method="post">

        <%    while (rs.next()) {
        %>
       
        <tr><td><input type="text" name="FIRST_NAME"   value="<%=rs.getString("FIRST_NAME")%>"</td>
            <td><input type="text" name="EMAIL_ID"   value="<%=rs.getString("EMAIL_ID")%>"</td>
            <td><input type="text" name="PHONE_NUMBER"   value="<%=rs.getString("PHONE_NUMBER")%>"</td>
            <td><input type="text" name="CITY_NAME"   value="<%=rs.getString("CITY_NAME")%>"</td>
            <td><input type="text" name="ADDRESS"   value="<%=rs.getString("ADDRESS")%>"</td>
          <td><input type="submit" name="Submit" value="Update"></td>   
        </tr>
           
            <%
                }
            %>

    </table>
            </form>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    %>
</html>
