<%-- 
    Document   : index
    Created on : Dec 19, 2016, 3:18:20 PM
    Author     : Administrator
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="newjavascript.js"></script>
        <title>JSP Page</title>
    </head>
    <body style="background-color: beige"> 
        <center>
            <h1>JSP PAGE</h1>

            <br>
            <table border="1px" align="center" >
                <tr>
                    <td style="width: 60px; text-align: center">SNo
                    <td style="width: 100px; text-align: center">Name
                    <td style="width: 100px; text-align: center">Mobile
                    <td style="width: 24px"><input type="button" onclick="fncJsBtnMinus()" style="width: 30px" value="-"/>
                </tr>
                <tr>
                    <td style="width: 60px"><input type="text" id="txtSNo" readonly="true" style="width:60px; background-color: bisque"/>
                    <td style="width: 100px"><input type="text" id="txtName" style="width:100px; background-color: bisque"/>
                    <td style="width: 100px"><input type="text" id="txtMobile" style="width:100px; background-color: bisque"  />
                    <td style="width: 24px"><input type="button" onclick="fncJsBtnPlus()" value="+" style="width: 30px"/>
                </tr>
            </table>

            <div id="div1" style="overflow: auto;height: 100px; position: relative; width: 320px;">
                <table border="0px" align="left" id="tblDet"></table>
            </div>


            <table>
                <tr>
                    <td>
                    <table border="1px" style="position:relative;height:90px;width:60px;background-color:#e6e6e6;border-radius:0px" align=right >
                        <tr style="background-color:#666362;">      <td style="height:18px;width:60px; color: white" >SNo </tr>
                        <tr style="background-color:#666362;">	<td style="height:18px;width:60px; color: white" >Name </tr>
                        <tr style="background-color:#666362;">	<td style="height:18px;width:60px; color: white" >Mobile </tr>
                        <tr style="background-color:#666362;">	<td style="height:18px;width:60px;" ></tr>
                    </table>

                    <td>
                    <table border="0px" style="position:relative;height:90px;width:280px;border-radius:0px" align=right >
                        <tr>
                            <td>
                                <div id="div2" style="position:relative;overflow:auto;height:110px;width:280px;">
                                    <table border="0px" id="tblDet1" align="left" cellspacing="0" cellpadding="0">
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </tr>
            </table>
        </center>
    </body>
    
</html>












