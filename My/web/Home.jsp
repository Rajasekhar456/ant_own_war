<%-- 
    Document   : Home
    Created on : Jan 16, 2017, 3:07:01 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/jsp; charset=ISO-8859-1">
        <title>FOOD ORDERING SYSTEM</title>
        <style type="text/css">
            #titlebg{
                color: orange;
                height: 60px;
                text-align:center;
                width: 100%;
                font-size:30px;
                padding-top:1px;padding-bottom:20px;background: linear-gradient( #008080,#243949); 
            }
            #mrq
            {
                color:yellow;
                height: 60px;
                text-align: center;
                width: 100%;
                font-size:25px;
                padding-top:1px;padding-bottom:1px;background: linear-gradient(#EC6F66,#800080); 
            }
            .add{
                border-radius: 100%;
                background: #800080;
                color:  #FFF8DC;
                float:left;

                font: 14px/24px "times new roman";
                height: 200px;
                margin: 0 14px;
                text-align: center;
                width: 200px;
            }
            .order
            {
                border-radius: 50%;
                background:#FFA500;
                color: #00008B;
                float:right;
                font: 14px/24px "Lucida Console"; 
                height: 200px;
                margin: 0 14px;
                text-align: center;
                width: 200px;
            }
            table.ex1 {
                table-layout: auto;

            }

        </style>
    </head>
    <body background= "Images/mh.png" style="background-size:1400px 700px;background-repeat: no-repeat; background-size: auto;" >
        <div id="titlebg">
            <img src="Images/lg2.jpg" align="left" height="80" width="180"/>

            <!--<span style='font-size:50px;font-family:Imprint MT Shadow;color:orange'><b><i>Q</i></span>uick MyFood</b>-->

            <span style='font-size:50px;font-family:Imprint MT Shadow;color:orange'><b><i>F</i></span>ood 
            <span style='font-size:50px;font-family:Imprint MT Shadow;color:orange'><b><i>D</i></span>elivery 
            <span style='font-size:50px;font-family:Imprint MT Shadow;color:orange'><b><i>S</i></span>ervices</b>

    </div>
    <div id="mrq">
        <marquee scrolldelay="250" behavior="alternate" >Welcome To Food Delivery Services</marquee>
    </div>
<marquee behavior="alternate"><img src="Images/lg.png" align="right" height="80" width="150"/></marquee>
<br><br><br><br><br><br><br>
<a href="Login.jsp">
    <div class="add" style="font-size:25px">
        <br>
        <br><b>Add</b><br> 
        <br>
        <b>MyLunchService
            <br>
            <br>
            Details
        </b>
    </div>
</a>

<a href="Login1.jsp">
    <div class="order" style="font-size:25px">
        <br>
        <br>
        <b>Order</b> 
        <br>
        <br>
        <b>Now</b>
    </div>
</a>
</body>

<%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from OWNER_DETAILS");%>

<div><center><table class="ex1" align="center" border=2 >
            <caption><h1 style='color:#FFFF00;'>Food Delivery Services</h1></caption>
            <td><b>ORGANIZATION_NAME</b></td>
            <td><b>PHONE_NUMBER</b></td>
            <td><b>CITY_NAME</b></td>
            <!--<td><b>VIEW_FARES</b></td>-->
            <div>
                <style>
                    table {
                        border-collapse:collapse;width: 50%;
                    }
                    th, td {
                        text-align: left;padding: 8px
                    }
                    tr:nth-child(even){
                        background-color:#7FFFD4
                    }
                    tr:nth-child(odd){
                        background-color:#FFD700
                    }th {
                        background-color:#800080;color: white;
                    }
                </style>
                <%    while (rs.next()) {
                %>
                <tr><td><%=rs.getString("HOTEL_NAME")%></td>
                    <td><%=rs.getString("PHONE_NUMBER")%></td>
                    <td><%=rs.getString("CITY_NAME")%></td>
                    <!--<td><a href="Login1.jsp">CLICK_HERE</a></td></tr>-->
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
