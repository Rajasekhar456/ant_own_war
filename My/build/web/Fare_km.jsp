<%-- 
    Document   : Fare_km
    Created on : Mar 13, 2017, 3:14:36 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fare_Details</title>
        
   <style>
div.absolute {
position: absolute;
top: 400px;
left: 950px;
buttom: 100px;
width: 300px;
height: 200px;
border: 6px solid #8AC007;
}
.lg {
color:red;
font-weight: bold;
font-size: 100%;    
width:50%;
 }
.lg1 {
color:red;
font-weight: bold;
font-size: 50%;    
width:3%;
 }
   </style>
<script type="text/javascript">
	function checkTotal() {
		document.hussain.total.value = '';
//		 document.hussain.KM.value = '';	
//		var sum = 0;
		for (i=0;i<document.hussain.choice.length;i++) {
		if (document.hussain.choice[i].checked) {
			var sum =parseInt(document.hussain.choice[i].value);
		  }
		}
		document.hussain.total.value = sum;
//                document.hussain.KM.value = KM;	
    }
//        function subtractQty(){
//			if(document.getElementById("qty").value - 1 < 0)
//				return;
//			else
//				 document.getElementById("qty").value--;
//		}
</script>

    </head>
<body  background= "Images/pr.jpg" style="background-size:1400px 700px;background-repeat: no-repeat;">
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    response.setContentType("text/html");
    String name = request.getParameter("ORZ_ID");
    System.out.println("id="+name);
    session.setAttribute("ORZ_ID", name);
try{  
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123"); 
    stmt=con.createStatement();  
    String str="";
    str = "select * from FARE_DETAILS where ORZ_ID='"+name+"' order by km";
    rs=stmt.executeQuery(str);
    System.out.println("Hello"+str);
%>	
<!--<input type="text" name="ORZ_ID" value= />-->
        <h1 align='center' style='color: #FF6347;'> Lunch Box Fare Details</h1>
<input action="action" type="button" value="Back" class="bk" onclick="history.go(-1);" />	
<body><form action="Fare_km" method="post" name="hussain">
        
 
<style>
     .bk {
    background-color:red; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    border-radius: 5px;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
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
	<table width="500" border=2 align=center><tr><th>KILOMETERS</th><th>FARE/MONTH</th><th></th>
	<%
while(rs.next())
{
String KM=rs.getString("KM");
String FARE=rs.getString("FARE");
%>
            <tr><th><%=KM %>km</th><th><%=FARE %>/-</th><td><input type="checkbox" name="choice" value=<%=FARE %> onchange="checkTotal()"></td></tr>
    <!--<td><input type="hidden" name="choice" value=<%=KM %> onchange="checkTotal()"> </td></tr>-->
<%
}
}
catch(Exception e){}
%>

</table>
<div class="absolute" align="center">
<br>
<br>
<span style="font-size:45px;color:#00FF7F">Total:</span><input type="text" size="6" style="font-size:23px;" name="total" value="0" /><br>
<!--<span style="font-size:45px;color:#00FF7F">KM :<input type="text" size="6" style="font-size:23px;" name="KM" />-->
                                            <input type="hidden" size="6" style="font-size:23px" name="ORZ_ID" value=<%=name %> />
<br> 
<br>

<input type="submit" class="lg" value="Confirm Order"></a>
</div>
</form>
<!--<h1 align='center' style='color: #7FFF00 ;'>Enter How Many Months<br> You Want to Deliver<br>
     <input type='button' name='subtract'   onclick='javascript: subtractQty();' value='-'/>                   
    <input type='text' name='qty' id='qty' size="15" />
                        <input type='button' name='add' class="lg1" onclick='javascript: document.getElementById("qty").value++;' value='+'/>
                       </h1>-->
</body>
</html>
