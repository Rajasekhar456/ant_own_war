<%-- 
    Document   : Allusers
    Created on : Jan 17, 2017, 5:55:50 PM
    Author     : Administrator
--%>

<%@page import="com.in10s.UserList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.ArrayList" language="java" %>
<%

    UserList alist = new UserList();
    ArrayList al = alist.fetchAllUsers();
    System.out.println("al  " + al);
    int size = al.size();
    System.out.println("Array Length " + size);
    String str = "";
    for (int i = 0; i < size; i++) {
        ArrayList singleUserDetails = (ArrayList) al.get(i);
        System.out.println("singleUserDetails" + (i) + " " + singleUserDetails);
        str = str + "-" + singleUserDetails;
    }

    System.out.println(str);


    // ArrayList ar = (ArrayList) request.getAttribute("UserDetails");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Users</title>
        <script>
            function test(){
                var theDiv = document.getElementById("FIRST_NAME");
                theDiv.innerHTML += 'FIRST_NAME';
                var theDiv1 = document.getElementById("LAST_NAME");
                theDiv1.innerHTML += 'LAST_NAME';
                var theDiv2 = document.getElementById("USER_NAME");
                theDiv2.innerHTML += 'USER_NAME';
                var ListData = '<%=str%>';
                var ListDataSplit=ListData.split('-');
                for (var i = 1; i < ListDataSplit.length; i++)
                {
                    var list=ListDataSplit[i];
                    var list=list.replace('[','');
                    var list=list.replace(']','');
                    var listDetails=list.split(',');
                    var table=document.getElementById("FIRST_NAME");
                    var table1=document.getElementById("LAST_NAME");
                    var table2=document.getElementById("USER_NAME");
                    if (listDetails.length===3)
                    {
                        var FIRST_NAME=listDetails[0];
                        var LAST_NAME=listDetails[1];
                        var USER_NAME=listDetails[2];
                        
                        var tr = document.createElement('tr');
                        var tr1 = document.createElement('tr');
                        var tr2 = document.createElement('tr');
                        var td1 = document.createElement('td');
                        var td2 = document.createElement('td');
                        var td3 = document.createElement('td');
                        var text1 = document.createTextNode(FIRST_NAME);
                        var text2 = document.createTextNode(LAST_NAME);
                        var text3 = document.createTextNode(USER_NAME);
                        td1.appendChild(text1);
                        td2.appendChild(text2);
                        td3.appendChild(text3);
                        tr.appendChild(td1);
                        tr1.appendChild(td2);
                        tr2.appendChild(td3);
                        table.appendChild(tr);
                        table1.appendChild(tr1);
                        table2.appendChild(tr2);
                    }
                }
                
            }
        </script>
    </head>
    <body onload="test()">
    <center>
        <h1>USERS LIST</h1>
        <table >
            <tr>
                <td style="width: 100px" id="FIRST_NAME">  </td>
                <td style="width: 100px" id="LAST_NAME">  </td>
                <td style="width: 100px" id="USER_NAME">  </td>
            </tr>
        </table>
    </center>
</body>
</html>

