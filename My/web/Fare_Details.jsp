 <%-- 
    Document   : Fare_Details
    Created on : Mar 7, 2017, 3:10:54 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fare_Details</title>
        <style>
 th,td
     {
ext-align: left;padding: 8px
     }
tr:nth-child(even)
     {
background-color:#7FFFD4
     }
tr:nth-child(odd)
     {
background-color:#FFD700
     }

</style>
<!--<script type="text/javascript">
	function checkTotal() {
		document.hussain.total.value = '';
		var sum = 0;
		for (i=0;i<document.hussain.choice.length;i++) {
		if (document.hussain.choice[i].checked) {
			sum = sum + parseInt(document.hussain.choice[i].value);
		  }
		}
		document.hussain.total.value = sum;
	}
</script>-->
    </head> 
 <h1 align='center'>Lunch Box Fare Details</h1>
	<body>
            <form action="Order_Details" name="hussain">
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    response.setContentType("text/html");
    String name = request.getParameter("ORZ_ID");
    System.out.println("id="+name);
try{  
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123"); 
    stmt=con.createStatement();  
    String str="";
    str = "select * from PRICE_DETAILS where ORZ_ID='"+name+"'";
    rs=stmt.executeQuery(str);
    System.out.println("Hello"+str);
%>
      <table width="500" border="2" align="center"><tr><th>KILOMETERS</th><th>FARE/MONTH</th><th></th>
	<%
while(rs.next())
{
String km=rs.getString("KM");
String fare=rs.getString("PRICE");
%>
<tr><th><%=km %></th><th><%=fare %></th><td><input type="checkbox" name="choice" value=<%=fare %>></td></tr>
<%
}
}
catch(Exception e){
  e.printStackTrace();
}
   finally {  
            rs.close();
            stmt.close();
            con.close();
            out.close();
   }
            %>
</table>
<style>
div.absolute {
position: absolute;
top: 400px;
left: 1000px;
buttom: 100px;
width: 300px;
height: 200px;
border: 6px solid #8AC007;
}
.lg {
color:red;
font-weight: bold;
font-size: 100%;    
width:40%;
 }

</style>
<div class="absolute" align="center">
<span style="font-size:45px">Total:</span><input type="text" size="6" style="font-size:23px" name="total" value="0"/>
<input type="submit" class="lg" value="Confirm Order" onchange="checkTotal()">
</div>
</form>
</body>
</html>


