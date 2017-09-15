<%-- 
    Document   : Selectcity
    Created on : Feb 28, 2017, 5:30:39 PM
    Author     : Administrator
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>select city</title>
        <style>
#mrq
{
color:#F1C40F;
height: 60px;
text-align: center;
width: 100%;
font-size:25px;
padding-top:1px;padding-bottom:1px;background: linear-gradient(#800000,#008080); 
        }
.sb{
color: green;
font-weight: bold;
font-size: 100%;    
width:10%;
   }
          .bk {
    background-color:red; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    border-radius: 5px;
    /*display: inline-block;*/
    font-size: 16px;
    margin: 4px 2px;
    /*cursor: pointer;*/
}
</style>
 </head>
<body background= "Images/sl2.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;">
<div id="mrq">
<marquee scrolldelay="250" behavior="alternate"><b>Welcome To Food Delivery Services</b></marquee>
</div>
    
    <input action="action" type="button" value="Back" class="bk" onclick="history.go(-1);" />

<br>
<br>
<br>
<br>
<h1 style="color:yellow;" align="center">Select Your City To Order</h1><br/>
<div style="padding-left:50px;"align="center">
<form name="city" action="OrgDisplay"  method="processRequest" >
<select name="city"  id="city">
<option value="-- Select Your City --">-- Select Your City --</option>
<%
try {
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
    stmt = con.createStatement();
    String query = "SELECT DISTINCT CITY_NAME FROM OWNER_DETAILS";
    rs = stmt.executeQuery(query);
    ArrayList<String> cityNames=new ArrayList<String>();
    while(rs.next())
         {
          cityNames.add(rs.getString("CITY_NAME"));
            }
for(String str:cityNames)
     {
       String str1[]=str.split(",");
%>
  <option value='<%=str%>'><%=str.toUpperCase()%></option>  
  <%	
       }
}
catch(Exception e){}
%>

</select>
<input type="submit" value="submit" class="sb">
</form>
</div>
</body>
</html>
