<%-- 
    Document   : Table
    Created on : Jan 18, 2017, 11:58:13 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <body>

        <div id="demo">
            <!--<h2>Let AJAX change this text</h2>-->
            <!--<button type="button" onclick="loadDoc()">Change Content</button>-->
        </div>

    </body>
</html> 

<%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from USER_DETAILS");%>
        <center>
       <h1> Drop down box or select element</h1>
        <select>
        <%  while(rs.next()){ %>
            <option><%=rs.getString("EMAIL_ID")%></option>
        <% } %>
        </select>
</center>
        <select id="comboBox">
        <option>Item 1</option>
       <option>Item 2</option>
       <option>Item 3</option>
    </select>

    <script>
      $(document).ready(function(){
        $("#comboBox").kendoComboBox();
       });
       
    </script>
   
<!--<center><table border=2 align=center>
        <caption><h1>User Information</h1></caption>
        <td><b>FIRST_NAME</b></td>
        <td><b>LAST_NAME</b></td>
        <td><b>USER_NAME</b></td>
        <td><b>EMAIL_ID</b></td>
  //      <%    while (rs.next()) {
        %>
        <tr><td><%=rs.getString("FIRST_NAME")%></td>
           <td><%=rs.getString("LAST_NAME")%></td>
            <td><%=rs.getString("USER_NAME")%></td>
            <td><%=rs.getString("EMAIL_ID")%></td></tr>
            <%
                }

            %>


    </table>-->
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    %>
<!--</html>
<!DOCTYPE html>
<html>
    <body onload="loadDoc()">
        <script>
            function loadDoc() 
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("demo").innerHTML =this.responseText;
                      // alert("data "+this.responseText);
                    }
                };
                xhttp.open("POST", "Table", true);
                xhttp.send();
            }
        </script>

    </body>
</html><!---->
