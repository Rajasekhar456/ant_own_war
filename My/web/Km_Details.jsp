<%-- 
    Document   : Km_Details
    Created on : Mar 16, 2017, 6:13:28 PM
    Author     : Administrator
--%>
<%
            if (session != null) {
                if (session.getAttribute("ORZ_ID") != null)
                    {                
                       } 
                else{   response.sendRedirect("Home.jsp");
                }
            } else {
                response.sendRedirect("Login.jsp");
            }
%>
<!DOCTYPE html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <html>
 <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <TITLE> Add/Remove Fare details </TITLE>
	<SCRIPT language="javascript">
            
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var cell1 = row.insertCell(0);
			var element1 = document.createElement("input");
			element1.type = "checkbox";
			element1.name="chkbox[]";
		
			cell1.appendChild(element1);
		
			var cell2 = row.insertCell(1);
			cell2.innerHTML = rowCount + 1;

			/* size="30" placeholder="enter item name" */
			
			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.size = "30";
			element2.placeholder = "Enter Kilometer";
			element2.name = "km"+rowCount;
			cell3.appendChild(element2);

			var cell4 = row.insertCell(3);
			var element3 = document.createElement("input");
			element3.type = "number";
			element3.size = "30";
			element3.placeholder = "Enter Fare/month";			
			element3.name = "fare"+rowCount;
			cell4.appendChild(element3);

		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}

	</SCRIPT>
 <style>
.ad,.dl{
      color: green;
        font-weight: bold;
    font-size: 100%;    
    width:13%;
 }
 .sb,.sb1{
   color: blue;
  font-weight: bold;
  font-size: 100%;    
  size:50;
  }
  .al{
      align:left
  }
  </style>
  </head>
<div align="" style='color:#7FFF00; font-size:23px'><h2>Hello,Add Your Lunch Box Fare Details</h2></div>
     <a class="al" style="color:yellow; font-size:20px" href="Boot.jsp">Previous page</a>
     <body background="Images/hs.jpg" style="padding-left:30%;background-size:1380px 650px; background-repeat: no-repeat;" >
    <form action="Km_Details" method="post">
       <INPUT type="button"  class="ad"  width="48" height="48" value="Add Row" onclick="addRow('dataTable')" size="30"></INPUT>
 	<INPUT type="button" class="dl" value="Delete Row" onclick="deleteRow('dataTable')" size="30"  ></INPUT> 	           
                  <TABLE id="dataTabl" width="350px" border=""align="" style='color:yellow; font-size:17px' > 
                    <tr> <th style="font-size:18px" >Enter Distance To deliver</th> 
                    <th style="font-size:18px">Per Month/Fare</th> </tr></TABLE>
	             <TABLE id="dataTable" width="400px" border="2"  >
               	<TR>
			<TD><INPUT type="checkbox" /></TD>
			<TD style='color:white;' > 1 </TD>
			<TD> <INPUT type="number" name="km0"  size="30" placeholder="Enter Kilometer" ></input> </TD>
                        <TD> <INPUT type="number" name="fare0"  size="30" placeholder="Enter Fare/month" ></input> </TD>
		</TR>
	</TABLE>
	<div style="padding-left:10%;">
		<input type="submit"  value="Submit" class="sb" ></input>
		<input type="reset" value="Reset" class="sb1" ></input>
		</div>
</form>
</body>
 </html>