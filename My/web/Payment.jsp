<%-- 
    Document   : Payment
    Created on : Apr 19, 2017, 11:10:15 AM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>payment Form</title>
<script type="text/javascript">
function val()
{
var number=document.sign.number.value;
var cvc=document.sign.cvc.value;
var month=document.sign.month.value;
var year=document.sign.year.value;
//var pin=document.sign.pin.value;
 if(isNaN(number)||number.indexOf(" ")!=-1)
  {
    alert("Enter numeric value in your card number")
    document.sign.number.focus();
     return false; 
  }
else if(number.length<16)
    {
     alert("Invalid card number");
     document.sign.number.focus();
     return false;
    }
else if(number.length>16)
    {
     alert("Invalid card number");
     document.sign.number.focus();
     return false;
    }
else if(cvc.length<3)
    {
     alert("Invalid cvc");
     document.sign.cvc.focus();
     return false;
    }
else if(cvc.length>3)
    {
     alert("Invalid cvc");
     document.sign.cvc.focus();
     return false;
    }
else if(month.length<2)
    {
     alert("month should be two numerics ex(01 or 11)");
     document.sign.month.focus();
     return false;
    }
else if(month.length>2)
    {
     alert("month should be two numerics ex(01 or 11");
     document.sign.moth.focus();
     return false;
    }
else if(year.length<2)
    {
     alert("year should be two numerics ex(01 or 11)");
     document.sign.year.focus();
     return false;
    }
else if(year.length>2)
    {
     alert("year should be two numerics ex(01 or 11");
     document.sign.year.focus();
     return false;
    }
//else if(isNaN(pin)||pin.indexOf(" ")!=-1)
//  {
//    alert("Enter numeric value in your pin number")
//    document.sign.pin.focus();
//     return false; 
//  }
//else if(pin.length<4)
//    {
//     alert("Invalid pin number");
//     document.sign.pin.focus();
//     return false;
//    }
//else if(pin.length>4)
//    {
//     alert("Invalid pin number");
//     document.sign.pin.focus();
//     return false;
//    }

}
</script>
<style>
input[type=text] {
    width: 45%;
    font-size:14px;
    padding: 11px 16px;
    margin: 4px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 40px;
    box-sizing: border-box;
}
input[type=number] {
    width: 30%;
    font-size:14px;
    padding: 11px 16px;
    margin: 4px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 40px;
    box-sizing: border-box;
}
.by{
    width:45%;
    height:450px;
    border-radius:40px;
    background-color:#F0FFF0;
    padding: 5px;
    margin: 20px 409px;  
}
input[type=submit] {
    width: 89%;
    background-color:#4d4d4d;
    color: whitesmoke;
    padding: 17px 20px;
    margin:6px 0;
    border: none;
    border-radius: 40px;
}

input[type=submit]:hover {
    background-color: #45a049;
}
/*a:link, a:visited {
    background-color: black;
    color: white;
	height:25px;
	width:120px;
    padding: 5px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    border-radius:10px;
	font-size:18px;
	float:right;
}*/


a:hover, a:active {
    background-color:blue;
}
</style>
</head>
<body background= "Images/cd.jpg" style="background-size:1680px 650px;background-repeat: no-repeat;">
<div>
    <div style="background-color:black;"><h1><font color="white" size="6">Payment Form</font>
</div>
    
<% 
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    ResultSet rs1 = null;
    Statement stmt1 = null;
    Connection con1 = null;	 
try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        String query = "SELECT * FROM ORDER_AMOUNT order by AMT_ID";
        rs = stmt.executeQuery(query);
        while (rs.next()) {
        session.setAttribute("AMT_ID", rs.getString("AMT_ID"));
        session.setAttribute("AMOUNT", rs.getString("AMOUNT"));
               }
              
        String AMT_ID=(String)session.getAttribute("AMT_ID");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con1 = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt1 = con1.createStatement();
       String query1 = "SELECT * FROM ORDER_AMOUNT WHERE AMT_ID="+AMT_ID+"";
       rs1 = stmt1.executeQuery(query1);
      %> 
      <div align="left" style='color:yellow; font-size:20px' ><h2>Total payment to be made:

       <%
         while (rs1.next()) 
         {
        %>
       <%= rs1.getString("AMOUNT")%>
             
         <%
               }
           %>   
       </h2></div>     
      <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    %>
 
    <div class="by" >
  <form  onsubmit="return val()" name="sign" action="Paymentpay.jsp" metho="post" align="center" >
    <center><h1>Confirm Purchase</h2><hr></center><br>    
   <font size="5" color="black">Enter Debit Card Number: <input type="text" placeholder="1234 XXXX XXXX XXXX" name="number" required><br><BR>
    <!--<input type="text" placeholder="NAME" name="name" required>&nbsp;&nbsp;&nbsp;-->
   <font size="5" color="black"> CVV:<input type="number"  placeholder="CVC" name="cvc" required><br><br>
   <font size="5" color="black">Expiry Date:<input type="number"  placeholder="MM" name="month" required>
   <input type="number"  placeholder="yy" name="year" required><br><br>  
 <!--<input type="password"  placeholder="pin" name="pin" required><br><br>-->
   <input type="submit" value="Pay now" style="font-size:25px"/><br><br>
	 <!--<center><img src="#" width="400px" height="90px"></img></center>-->	 
         </form>
</div>
</div>
</body>>
</html>
