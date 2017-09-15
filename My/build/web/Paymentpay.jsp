<%-- 
    Document   : Paymentpay
    Created on : Apr 20, 2017, 12:12:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--<%@ include file="connection.jsp"--%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.http.*"%>

<style>
a:link, a:visited {
    background-color: black;
    color: white;
	height:18px;
	width:120px;
    padding: 5px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    border-radius:10px;
	font-size:18px;
	float:right;
}
a:hover, a:active {
    background-color:blue;
}
</style>
</head>
 <% int i=0;%>
 <div>
<%
       String ORZ_ID=(String)session.getAttribute("ORZ_ID");
       String AMT_ID=(String)session.getAttribute("AMT_ID");
       	if(ORZ_ID==null)
		{%>
<!--<a href="ticketbooking.jsp" target="_top">My account</a></h1>-->
        <%}%></div><br>
     <%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    	 
try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
   	 
      String AMOUNT=(String)session.getAttribute("AMOUNT");
	  if(AMOUNT!=null)
      {
	  int uam=Integer.parseInt(AMOUNT);
//	  String name= request.getParameter("name");
	  String number1= request.getParameter("number");
          
//	    int number= Integer.parseLong(number1);
	  String cvc1= request.getParameter("cvc");
//	    int cvc= Integer.parseInt(cvc1);
          String month1= request.getParameter("month");
//	    int month= Integer.parseInt(month1);
	  String year1= request.getParameter("year");
//	    int year= Integer.parseInt(year1);
	  
//	  String pin1= request.getParameter("pin");
//	    int pin = Integer.parseInt(pin1);
         stmt=con.createStatement();
         rs=stmt.executeQuery("select * from uaccount");
	
    while(rs.next())
     {
	  String cardnum=rs.getString("CNUMBER");
//	  String dbname=rs.getString(2);
	   String dbcvc=rs.getString("CVV");
          String dbmonth=rs.getString("MONTH");
	  String dbyear=rs.getString("YEAR");
	 
//	  int dbpin=rs.getInt(6);
//	  if((number1==cardnum)&&(cvc1==dbcvc)&&(month1==dbmonth)&&(year1==dbyear))
//          if((number1==cardnum))
          if((number1.equals(cardnum))&&(cvc1.equals(dbcvc))&&((month1.equals(dbmonth))&&(year1.equals(dbyear))))
//                  &&(cvc1==dbcvc))&&((month1==dbmonth)&&(year1==dbyear)))          
             {
       out.println("<br><br><br><br><br><font size=5 color=blue><center>“Your Amount has been successfully Paid.”</center></font>");	
                    
                 }
         else 
          {
                out.println("<br><br><br><br><br><font size=5 color=blue><center>Invalid card details or Transaction failed</center></font>");
            
           out.println("<br><br><br><br><br><font size=5 color=blue><center>“Your Amount has been successfully Paid.”</center></font>");	
          }
          
////	    i++;
////        long dbamount=rs.getLong(uam);	   
////	    if(dbamount>=uam)
////		{
////		String park="park";
////		stmt.executeUpdate("update uaccount set amount=amount-"+uam+" where CVV="+dbcvc+"");
////		stmt.executeUpdate("update paccount set amount=amount+"+uam+" where name='"+park+"'");
//                out.println("<br><br><br><br><br><font size=5 color=blue><center>“Your Amount has been successfully Paid.”/center></font>");
////		response.sendRedirect("final.jsp");
//		}
//		else{
//		out.println("<br><br><br><br><br><font size=5 color=blue><center>Insufficint funds</center></font>");
//		}
//       }
//	  } 
//     }	  
//	  else
//	  {
//	  out.println("<br><br><br><br><br><font size=5 color=blue><center>Again you need to select date and adult and child number, please go back </center></font>");
//	  }
//    if(i==0&&AMOUNT!=null)
//	  {
//	 out.println("<br><br><br><br><br><font size=5 color=blue><center>Invalid card details or Transaction failed</center></font>");
//	 
//         }
//	}
                   }
                 }
           }

  catch(Exception e)
   {
   System.out.println(e);
   }
	
	    
     %>
