<!-- 
    Document   : Paymentnow
    Created on : Apr 19, 2017, 6:15:33 PM
    Author     : Administrator-->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="connection.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.http.*"%>
<html>
<head>
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
       String uname=(String)session.getAttribute("uname");
		if(uname==null)
		{%>
<a href="ticketbooking.jsp" target="_top">My account</a></h1>
        <%}%></div><br>
     <%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
    	 
try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
   	 
      String uamount=(String)session.getAttribute("total");
	  if(uamount!=null)
      {
	  int uam=Integer.parseInt(uamount);
	  String name= request.getParameter("name");
	  String month1= request.getParameter("month");
	    int month= Integer.parseInt(month1);
	  String year1= request.getParameter("year");
	    int year= Integer.parseInt(year1);
	  String number1= request.getParameter("number");
	    long number= Long.parseLong(number1);
	  String cvc1= request.getParameter("cvc");
	    int cvc= Integer.parseInt(cvc1);
	  String pin1= request.getParameter("pin");
	    int pin = Integer.parseInt(pin1);
         stmt=con.createStatement();
         rs=stmt.executeQuery("select * from uaccount");
	
    while(rs.next())
     {
	  long cardnum=rs.getLong(1);
	  String dbname=rs.getString(2);
	  int dbmonth=rs.getInt(3);
	  int dbyear=rs.getInt(4);
	  int dbcvc=rs.getInt(5);
	  int dbpin=rs.getInt(6);
	  if((number==cardnum)&&(name.equals(dbname))&&(month==dbmonth)&&(year==dbyear)&&(cvc==dbcvc)&&(pin==dbpin))
       {
	    i++;
        long dbamount=rs.getLong(7);	   
	    if(dbamount>=uam)
		{
		String park="park";
		stmt.executeUpdate("update uaccount set amount=amount-"+uam+" where pin="+dbpin+"");
		stmt.executeUpdate("update paccount set amount=amount+"+uam+" where name='"+park+"'");
		response.sendRedirect("final.jsp");
		}
		else{
		out.println("<br><br><br><br><br><font size=5 color=blue><center>Insufficint funds</center></font>");
		}
       }
	  } 
     }	  
	  else
	  {
	  out.println("<br><br><br><br><br><font size=5 color=blue><center>Again you need to select date and adult and child number, please go back </center></font>");
	  }
    if(i==0&&uamount!=null)
	  {
	 out.println("<br><br><br><br><br><font size=5 color=blue><center>Invalid card details or Transaction failed</center></font>");
	  }
	}
  catch(Exception e)
   {
   System.out.println(e);
   }
	
	    
     %>
























function updateForm(len)
        {
            alert(len);
            var uname = $("#uname").val(); 
            var mobileno = $("#mobileno").val();
           var str="";
            
            
            for(var i=0;i<len;i++){
                var uaddr=$("#uaddr"+i).val();
                alert(uaddr);
                //            data['address'+i]=uaddr;
                data[i]=uaddr;
            }
//            alert(data.toSource());
            var addr=data.toString();
            alert(addr);
            var email = $("#email").val();
            $.ajax({
                type:"get",
                url:"UpdateData",
                data:{"uname" : uname,"mobileno" : mobileno ,"uaddr": addr,"email": email},
                success: function(data){
                 
                    wnd.center().close();
                    window.location="Home.jsp";
                   
                }                       
            });
                          
        }


































<!--view requests jsp-->
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class View_Requests extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
         Statement st = null;
         Statement st1 = null;
         Connection conn = null;
          Connection conn1 = null;
         ResultSet rs = null;
           ResultSet rs1 = null;
        
    try {
         int i=0;
          String ORZ_ID = (String) session.getAttribute("ORZ_ID");
//         String Email_id = (String)session.getAttribute("Email_id");
//         session.setAttribute("Email_id", Email_id);
         Class.forName("oracle.jdbc.OracleDriver");
         conn =  DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
         st = conn.createStatement();
         String str="Select * from ORDER_INFO where ORZ_ID IN (Select ORZ_ID from OWNER_DETAILS where ORZ_ID='"+ORZ_ID+"')";
         rs=st.executeQuery(str);
         out.println("<html><head><title>Your_Requests</title></head><body  background= \"Images/it2.jpg\" style=\"background-size:1400px 700px;background-repeat: no-repeat;\">");
         out.println(" <a style='color:#00FF7F; font-size:20px' href=\"Boot.jsp\">Previous page</a>");
         out.println("<style>table {border-collapse:collapse;width: 70%;}th, td {ext-align: left;padding: 8px}tr:nth-child(even){background-color:#7FFFD4}tr:nth-child(odd){background-color:#FFD700}th {background-color:#800080;color: white;}</style>");
         out.println("<table border=2 align=center ><tr><th>FULLNAME</th><th>FROM ADDRESS</th><th>TO ADDRESS</th><th>PIN</th><th>PHONE NUMBER</th><th>AMOUNT/MONTH</th>");
//         out.println("</body></head><html>");
         while(rs.next())
          {
            i++;
            String FULLNAME=rs.getString("FULLNAME");
            String FROMADDRESS=rs.getString("FROMADDRESS");
            String TOADDRESS=rs.getString("TOADDRESS");
            String PIN=rs.getString("PIN");
             String PHONENUMBER=rs.getString("PHONENUMBER");
//            conn1 = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            st1 = conn.createStatement();
            String str1="select AMOUNT from ORDER_AMOUNT where ORZ_ID='"+ORZ_ID+"'";
            rs1=st1.executeQuery(str1);
            if(rs1.next())
            {
             String AMOUNT=rs1.getString("AMOUNT");
            
//            String ORZ_ID=Integer.toString(rs.getInt("ORZ_ID"));
//            System.out.println(ORZ_ID);
            out.println("<tr><td>");
            out.println(FULLNAME);
            out.println("</td><td>");
            out.println(FROMADDRESS);
            out.println("</td><td>");
            out.println(TOADDRESS);
            out.println("</td><td>");
            out.println(PIN);
            out.println("</td><td>");
            out.println(PHONENUMBER);
            out.println("</td><td>");
            out.println(AMOUNT);
            out.println("</td></tr>");
            }
           }
            out.println("</table></body></html>");
 if(i==0)
            {
         out.println("<html><head>");
         out.println("<div align=center style='color:yellow; font-size:20px' ><h2 > You Have No Any Requests </h2></div>");
         
         out.println("</head></html>");
//    
              
            }
        } finally {   
            rs.close();
            st.close();
            conn.close();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(View_Requests.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}









































<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Treeview</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.rtl.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.silver.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.mobile.all.min.css"/>
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <!--<script src="http://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>-->
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="http://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>

        <script type="text/x-kendo-template" id="template">

        <div id="addDetails">
            <input type="text" id="tb" name="tb1" />
            <button type="button" id="bn">ADD</button>

        </div>

    </script>
    <script>
        var dataSource;
        var wnd,detailsTemplate;
        var menu;
        function TreeviewData(){
            //                $(document).ready(function () {
            alert("ASAD")
            $.ajax({
                type:"GET",
                url:"Example",
                datatype:"json",
                success:function(Data)
                {
                 alert("ASAD5")
                    var data1=JSON.parse(Data);
                    //                              dataSource = new kendo.data.HierarchicalDataSource({
                    //                        data:data1
                    //                              });
                var treeview=$("#treeview").kendoTreeView({
                        dataSource:data1,
                        dataTextField: "text"
                    }).data("kendoTreeView");
                
                    handleTextBox = function(callback) {
                        return function(e) {
                            if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                                callback(e);
                            }
                        };
                    };
                    wnd = $("#details")
                    .kendoWindow({
                        title: "Treeview",
                        modal: true,
                        visible: false,
                        resizable: false,
                        width: 400,
                        height:100,
                        actions: ["Minimize", "Maximize", "Close"]
                    }).data("kendoWindow");
                    detailsTemplate = kendo.template($("#template").html());
                    $("#menu").kendoContextMenu({
                        target: "#treeview",
                        filter:".k-in",
                        select: function(e) {
                            if( (e.item.id) == "Add_name")
                            {
                                alert(e.item.id);
                                alert("aaaa")
                                wnd.content(detailsTemplate);
                                wnd.center().open();
                                var node=$(e.target);
                                var UserNode = $(e.target);
                                var Selectdata = UserNode.text();
                                var append = handleTextBox(function(e) {
                                    var Data = $("#tb").val();
                                    alert(Data);
                                    var selectedNode =treeview.select();
                                    alert(treeview.select())  
                                    $.ajax({
                                        
                                        type:"GET",
                                        url:"Add",
                                        data:{p:Selectdata,n:Data},
                                        success:function(result){
                                            alert("SUCCESS")
                                            treeview.append({
                                                text: $("#tb").val()
                                            }, selectedNode);

                                            wnd.close();
                                        }
                                    })
                                })
                                $("#bn").click(append);
                                $("#tb").keypress(append);
                            }
                        }
                    }).data("kendoContextMenu");
                          
                }
            });
            //                })
        }                  
    </script>

</head> 

<body onload="TreeviewData()">
    <div id="treeview"></div>
    <div id="details"></div>
    <div id="menu">
    
        <li id="Add_name">Add_name</li>
    </div>

</body>
</html>


<!--Login Servlet-->
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        ResultSet rs = null;
        Statement stmt = null;
        Connection con = null;
        try {
            String Email_id = request.getParameter("Email_id");
            String password = request.getParameter("password");
            String FIRST_NAME,LAST_NAME,PHONE_NUMBER,ADDRESS,CITY_NAME,PIN_NUMBER,HOTEL_NAME;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from OWNER_DETAILS where Email_id='" + Email_id + "' and password='" + password + "'");
//            rs = stmt.executeQuery("select * from OWNER_DETAILS");
            int i=0;
            if(rs.next()) {
//                 if(Email_id.equalsIgnoreCase(rs.getString("Email_id")) && password.equalsIgnoreCase(rs.getString("password")))
//                 {
                RequestDispatcher rd=request.getRequestDispatcher("Boot.jsp");
                request.setAttribute("Email_id",Email_id);
//                  i=1;
//                  break;

//                HttpSession session=request.getSession();  
//                     
//                HttpSession session = request.getSession(false);
//                session.setAttribute("password", password);
//                session.setAttribute("Email_id", Email_id);
//                response.sendRedirect("Boot.jsp");


               } 
            

            String query="select * from OWNER_DETAILS where Email_id='"+Email_id+"'";
            ResultSet res1=stmt.executeQuery(query);
      while(res1.next())	
         {
          FIRST_NAME=res1.getString("FIRST_NAME");
          LAST_NAME=res1.getString("LAST_NAME");
          PHONE_NUMBER=res1.getString("PHONE_NUMBER");
          ADDRESS=res1.getString("ADDRESS");
          CITY_NAME=res1.getString("CITY_NAME");
          PHONE_NUMBER=res1.getString("PHONE_NUMBER");
          PIN_NUMBER=res1.getString("PIN_NUMBER");
          HOTEL_NAME=res1.getString("HOTEL_NAME");
          request.setAttribute("FIRST_NAME",FIRST_NAME);
          System.out.println(FIRST_NAME);
          request.setAttribute("LAST_NAME",LAST_NAME);
          System.out.println(LAST_NAME);
          request.setAttribute("PHONE_NUMBER",PHONE_NUMBER);
          System.out.println(PHONE_NUMBER);
          request.setAttribute("ADDRESS", ADDRESS);
          System.out.println(ADDRESS);
          request.setAttribute("CITY_NAME", CITY_NAME);
          System.out.println(CITY_NAME);
          request.setAttribute("PHONE_NUMBER", PHONE_NUMBER);
          System.out.println(PHONE_NUMBER);
          request.setAttribute("PIN_NUMBER", PIN_NUMBER);
          System.out.println(PIN_NUMBER);
          request.setAttribute("HOTEL_NAME", HOTEL_NAME);
          System.out.println(HOTEL_NAME);
  }
      
      if(i==0)
       {
              out.print("<script>alert('Sorry username or password error')</script>");
              RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
              rd.include(request, response);
//RequestDispatcher rd=request.getRequestDispatcher("login2.html");
//out.println("<script>alert('Please enter correct details')</script>");
//rd.include(request, response);
             }
         else
           {
             RequestDispatcher rd=request.getRequestDispatcher("Price_Details.jsp");
             rd.forward(request, response);
           }
            
            //                 else {
//
//                out.print("<script>alert('Sorry username or password error')</script>");
//
//                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
//                rd.include(request, response);

            

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}



catalog.java

package com;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class catalog extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public catalog() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();
ArrayList<String> ar=new ArrayList<String>();
Enumeration en=request.getParameterNames();
while(en.hasMoreElements())
{
Object objOri=en.nextElement();
String param=(String)objOri;
String value=request.getParameter(param);
ar.add(value);
}
String res_id=ar.get(0);
ar.remove(0);
String[] items = new String[100];
String[] prices = new String[100];;
int i=0;
int j=1;
int length=0;
for(String str:ar)
{
length+=1;
}
System.out.println("length = "+length);
int rs=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
i=0;j=1;
for(int k=0;k<length/2;k++)
{

System.out.println("items [] ="+ar.get(i)+" and prices[] = "+ar.get(j)+" length/2 = "+(length/2));
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
Statement stmt=con.createStatement();
rs=stmt.executeUpdate("insert into add_items values('"+ar.get(i)+"',"+Integer.parseInt(ar.get(j))+",ITEM_ID.NEXTVAL,"+Integer.parseInt(res_id)+")");
con.close();
stmt.close();
i+=2;
j+=2;
}
if(rs>0)
{
out.println("</center>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
}

}
catch(Exception e)
{
System.out.println(e);}}}



<!--                  <select id="t7" name="t7" required>
                      <option selected="selected" value="" >-Select your city-</option>
                      <option value="" disabled="disabled" style="background-color:#3E3E3E"><font color="#FFFFFF"><i>-Andhra Pradesh-</i></font></option>
                  <option value="Anantapur" >Anantapur</option>
                  <option value="Guntakal">Guntakal</option>
                  <option value="Guntur">Guntur</option>
                  <option value="Hyderabad">Hyderabad/Secunderabad</option>
                  <option value="kakinada">kakinada</option>
                  <option value="kurnool">kurnool</option>
                  <option value="Nellore">Nellore</option>
                  <option value="Nizamabad">Nizamabad</option>
                  <option value="Rajahmundry">Rajahmundry</option>
                  <option value="Tirupati">Tirupati</option>
                  <option value="Vijayawada">Vijayawada</option>
                  <option value="Visakhapatnam">Visakhapatnam</option>
                  <option value="Warangal">Warangal</option>
                  <option value="Andra Pradesh-Other">Andra Pradesh-Other</option>
                 <option value="Other">Other</option>
                  </select></td>></tr>-->


>method ela rastaru 
public class AllUsersList {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList fetchAllUsers() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        ps = con.prepareStatement("Select * From USER_REG ");
        rs = ps.executeQuery();
        ArrayList list2 = new ArrayList();
        while (rs.next()) {
            ArrayList list1 = new ArrayList();
                list1.add(rs.getString("USER_NAME"));
                list1.add(rs.getString("MOBILE"));
                list1.add(rs.getString("EMAIL_ID"));
                list2.add(list1);
        }
         return list2;
    }
}
ela rataruu




<!--    
 <CENTER><INPUT  type="button" value="Add Row" class="button button5" onclick="addRow('dataTable')" />
         <INPUT type="button" value="Delete Row" class="button button5" onclick="deleteRow('dataTable')" /></CENTER>
           <input type='hidden' name='res_id' value='<%=ORZ_ID%>' />
   
	<TABLE id="dataTable" width="350px" border="1"align="center" >
	   
            
            <TR>         
 			<TD><INPUT type="checkbox" name="chk"/></TD>
	         	<TD> 1 </TD>
                        <TD ><INPUT type="text" name="km" id="t1" placeholder="Enter kilometers" /></TD>
			<TD><INPUT type="number" name="fare" id="t2" placeholder="Enter Fare/Month"/></TD>
                        <TD><INPUT type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<%=Email_id %>"></TD>
		</TR>
                
	 </TABLE>
                        <CENTER><input type="submit" name="submit" value="Submit"  class="sb" />
                            

<button type="reset" value="Reset" class="sb" />Reset</button></CENTER>-->

  <%
    ResultSet rs = null;
    Statement stmt = null;
    Connection con = null;
     String name = request.getParameter("ORZ_ID");
     String AMOUNT = request.getParameter("total");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.204:1521:xe", "dev", "dev123");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from ORDER_AMOUNT where ORZ_ID='"+name+"'");%>
       <!--<input type="text" size="6" style="font-size:23px" name="ORZ_ID" value=<%=AMOUNT %> />-->
       <%  while (rs.next()) {
        %>
        <tr><td><%=rs.getString("AMOUNT")%></td></tr>
     <input type="text" size="6" style="font-size:23px" name="ORZ_ID" value=<%=AMOUNT %> />
      <%
                }
            %>

      <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    %>
    
    
    
    //date picer code
    
    <head>
 <script type="text/javascript" lnaguage="javascript">
 $(function()
  {
  $("#datepicker").datepicker(
  {
  showOn:"both",
  buttonImage:"image.jpg",
  dateFormat:"yy-mm-dd",
  buttonImageOnly:false,
  minDate:+0, //you do not want to show previous date.
  maxDate:+0   // you do not want to show next day.
  });
  });
 </script>
 </head>
 <body>
 <input type="text" name="calendar" id="datepicker">
 </body>