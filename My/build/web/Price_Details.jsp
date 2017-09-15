<%-- 
    Document   : Price_Details
    Created on : Jan 30, 2017, 11:37:13 AM
    Author     : Administrator
--%>

<%
            String Email_id="";
            if (session != null) {
                if (session.getAttribute("Email_id") != null) {
                  Email_id = (String) session.getAttribute("Email_id");
                   } 
            } else {
                response.sendRedirect("Login.jsp");
            }
%>


<HTML>
<HEAD>
	<TITLE> Add/Remove Fare details</TITLE>
	<SCRIPT language="javascript">
            var ar = [];
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
			element2.name = "item"+rowCount;
			cell3.appendChild(element2);

			var cell4 = row.insertCell(3);
			var element3 = document.createElement("input");
			element3.type = "number";
			element3.size = "30";
			element3.placeholder = "Enter Fare/month";			
			element3.name = "price"+rowCount;
			cell4.appendChild(element3);

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

/*.button5 {border-radius: 50%;}*/
.button {
    background-color: #20B2AA; 
    border: none;
    color: white;
    padding: 15px 15px;
    text-align: center;
    border-radius: 50%;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    
}

</style>
</HEAD>
<%String ORZ_ID=request.getParameter("ORZ_ID"); %>
<div align=center style='color:#f4d03f;'><h2>Hello,Add Your Lunch Box Fare Details</h2></div>
     <a style='color:#00FF7F; font-size:20px' href="Boot.jsp">Previous page</a>
      
<BODY background= "Images/hs.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;" >
   <form action="Price_Details" method="processRequest">
       <center> <INPUT type="button" width="48" height="48" value="Add Row" onclick="addRow('dataTable')" size="30" class="ad" />
        <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" size="30" class="dl" /> 	           
        <input type='hidden' name='ORZ_ID' value='<%=ORZ_ID%>' />
        <TABLE id="dataTabl" width="350px" border=""align="center" style='color:#00FF7F; font-size:17px' > 
         <tr> <th>Enter Distance To deliver</th> 
              <th>Per Month/Fare</th> </tr></TABLE>
	 <TABLE id="dataTable" width="400px" border="2"  >
	<TR>
        	<TD><INPUT type="checkbox" name="chk" /></TD>
		<TD> 1 </TD>
		<TD> <INPUT type="text" name="item"  size="30" placeholder="Enter Kilometer" > </TD>
            <TD> <INPUT type="number" name="price"  size="30" placeholder="Enter Fare/month" > </TD>
		</TR>
	</TABLE>
	<div style="padding-left:10%; float:center;">
		<input type="submit"  value="Submit" class="sb"   />
		<input type="reset" value="Reset" class="sb1" />
		</div><center>
</form>
</BODY>
</HTML>
