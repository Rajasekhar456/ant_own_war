<%-- 
    Document   : Delete
    Created on : Jun 8, 2017, 2:15:05 PM
    Author     : Hussain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    Statement stmt = null;
           Connection con = null;
        PreparedStatement ps = null;
        try {
        String Email_id=(String)session.getAttribute("Email_id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
       ps = con.prepareStatement("Delete From NEW_USER Where EMAIL_ID='" + Email_id + "'");
       int i = ps.executeUpdate();
if (i > 0) {
                out.println("Deleted..."+Email_id);
            } else {
                out.println("Not Deleted...");
            }
                   } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
%>
    </body>
</html>
