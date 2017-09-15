<%-- 
    Document   : LoginGrid
    Created on : Jun 5, 2017, 10:16:41 AM
    Author     : Hussain
--%>

<%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    
    try {
        String Email_id=(String)session.getAttribute("Email_id");
//        session.setAttribute("ADDRESS", rs.getString("ADDRESS"));
//        String ADDRESS=(String)session.getAttribute("ADDRESS");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        String query="select * from NEW_USER where EMAIL_ID='"+Email_id+"'"; 
        rs = stmt.executeQuery(query);
//        session.setAttribute("ADDRESS", rs.getString("ADDRESS"));       
//        String ADDRESS=(String)session.getAttribute("ADDRESS");
//           out.println(ADDRESS);
        %>
        
<div><center><table class="ex1" align="center" border=1 >
        <h1>User Details</h1>
      <!--<div style="text-align:center"> <a href="NewUser.jsp" class="myButton">Create New User</a></div>-->
        <td><b>NAME</b></td>
        <td><b>EMAIL_ID</b></td>
        <td><b>PHONE_NUMBER</b></td>
        <td><b>CITY_NAME</b></td>
        <td><b>ADDRESS</b></td>
        <td><b>CLICK HERE TO EDIT</b></td>
        <div>
<style>
            .myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:16px 31px;
	text-decoration:none;
	/*text-shadow:0px 1px 0px #2f6627;*/
         /*box-shadow: 0 9px #999;*/
}</style>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href="NewUser.jsp" class="myButton">Create New User</a></div>  
        <%    while (rs.next()) {
        %>
        
        <tr><td><%=rs.getString("FIRST_NAME")%></td>
            <td><%=rs.getString("EMAIL_ID")%></td>
            <td><%=rs.getString("PHONE_NUMBER")%></td>
            <td><%=rs.getString("CITY_NAME")%></td>
            <td width="25%"><%=rs.getString("ADDRESS")%></td>
  <td><button onclick="location.href='GridEdit.jsp' ">Edit</button>
  <button onclick="location.href='DelExa.jsp' ">Delete</button></td></tr>
            <%
                }
            %>

    </table>
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
