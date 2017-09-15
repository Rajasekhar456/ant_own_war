<%-- 
    Document   : Hotel_Details
    Created on : Jan 25, 2017, 4:18:12 PM
    Author     : Administrator
--%>
<%
            if (session != null) {
                if (session.getAttribute("ORZ_ID") != null)
                    {
                  String ORZ_ID = (String) session.getAttribute("ORZ_ID"); %>
                    <!--out.print("<div align=center style='color:#f4d03f;' ><h2>Hello,Welcome To "+Email_id.toUpperCase()+" Your's Profile</h2></div>");-->
                     <input type='hidden' name='ORZ_ID' value='<%=ORZ_ID%>' />
                     <%  } 
                else{   response.sendRedirect("Boot.jsp");
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
        <title>Hotel_Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <script>
            function noBack() 
{
	window.history.forward();
}

        </script>>
    </head>
        <body onload="noBack();" background= "Images/h.jpg" style="background-size:1380px 650px;background-repeat: no-repeat;">  
            
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">   
            <div class="navbar-header">
            <a class="navbar-brand" href="#"></a>
            </div>
            <ul class="nav navbar-nav">
            <li class="active">
             <a href="Km_Details.jsp"  target="_self" data-target="#myNavbar" style="font-size:18px">Add Fare_details/month</a></li>
 
            <li><a href="Profile.jsp" target="_self" data-target="#myNavbar" style="font-size:18px">View Profile</a></li>
            </a></li>
             <li ><a  href="#"></a></li>
             
             <li><a href="View_Requests" style="font-size:18px">View_Requests</a></li>
             <li><a href="ChangePswd.jsp" target="_self" data-target="#myNavbar" style="font-size:18px">Change Password</a></li>
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
