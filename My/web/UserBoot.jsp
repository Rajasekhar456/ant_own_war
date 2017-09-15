<%-- 
    Document   : UserBoot
    Created on : Apr 10, 2017, 4:58:10 PM
    Author     : Administrator
--%>
<%
            if (session != null) {
                if (session.getAttribute("Email_id") != null) {
                  String Email_id = (String) session.getAttribute("Email_id");
//                    out.print("<div align=center style='color:#f4d03f; font-size:20px' ><h2>Hello,Welcome To "+Email_id.toUpperCase()+" Your's Profile</h2></div>");
                    
                   } 
                else{   response.sendRedirect("Home.jsp");
                }
            } else {
                response.sendRedirect("Login.jsp");
            }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order_Now</title>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    
        <script>
            function noBack() 
{
	window.history.forward();
}

        </script>>
    </head>
        <body onload="noBack();" background= "Images/nw1.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;">  
            
<!--            <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">-->

            
            
            
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">   
            <div class="navbar-header">
            <a class="navbar-brand" href="#"></a>
            </div>
            <ul class="nav navbar-nav">
            <li class="active">
             <a href="Selectcity.jsp"  target="_self" data-target="#myNavbar" style="font-size:18px">Order_Now</a></li>
 
            <li><a href="SendRequest.jsp" target="_self" data-target="#myNavbar"style="font-size:18px" >You Send Requests</a></li>
             <li><a href="ChangePswd1.jsp" target="_self" data-target="#myNavbar" style="font-size:18px">Change Password</a></li>
             </head>
            </ul>
               <form action="Logout" method="post">
            <p align="right">
                <input type="submit" value="Logout" class="btn btn-success"/>
            </p></form></div>
            </nav>
            
            <div class="container">
              <h3></h3>
              <p></p>
                </div>

             </body>
              </html>
