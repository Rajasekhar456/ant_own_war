<%-- 
    Document   : EditGrid
    Created on : Jun 7, 2017, 12:08:02 PM
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
 <div class="testbox">    
        <table align="center">
      
     <font color="#ECE5B6">
        <h1><center>Update Form</center></h1></font>
     <form action="Update1" method="post">

     <%    while (rs.next()) {
        %>
 
          <tr><td><font size="5" color="white">Name:<font></td><td><input type="text" id="t1" name="FIRST_NAME" value="<%=rs.getString("FIRST_NAME")%>" ></td></tr>
          <tr><td><font size="5" color="white">Email id:<font></td><td><input type="Email" id="t2" name="EMAIL_ID" value="<%=rs.getString("EMAIL_ID")%>" ></td></tr>
          <tr><td><font size="5" color="white">Phone number:<font></td><td><input type="number" id="t4" name="PHONE_NUMBER"  value="<%=rs.getString("PHONE_NUMBER")%>" ></td></tr>
          <tr><td> <font size="5" color="white">City Name:<font></td><td><input type="text"  id="t5" name="CITY_NAME" value="<%=rs.getString("CITY_NAME")%>" ></textarea></td></tr>    
          <tr><td><font size="5" color="white">Address:<font></td><td><input type="text"  id="adrs" name="ADDRESS" value="<%=rs.getString("ADDRESS")%>"></textarea></td></tr> 
          <tr> <td align="center"><input type="submit" name="Submit" value="Update"></td>   
        </tr>
                   
            <%
                }
            %>
    </table></div>
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
      <style>
.testbox {
           margin: 5px auto;
           margin-top:5px;
           width:500px; 
           height:750px; 
           border-radius:8px/7px; 
           background:rgba(10,100,128,0.7); 
           box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
           border: solid 1px #cbc9c9;
           padding-bottom:20px;
          }
      </style>