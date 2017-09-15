<%-- 
    Document   : Profile
    Created on : Jan 30, 2017, 6:12:12 PM
    Author     : Administrator
--%>
<%
//            if (session != null) {
//                if (session.getAttribute("Email_id") != null) {
//                  String Email_id = (String) session.getAttribute("Email_id");
//                    out.print("<div align=center style='color:#f4d03f; font-size:20px' ><h2>Hello,Welcome To "+Email_id.toUpperCase()+" Your's Profile</h2></div>");
//                    
//                   } 
//                else{   response.sendRedirect("Home.jsp");
//                }
//            } else {
//                response.sendRedirect("Login.jsp");
//            }
%>
<form action="Logout" method="post">
                    <p align="right">
                <input type="submit" value="Logout" id="sb" />
            </p>
            
           
              <a  class="button" href="Boot.jsp" title="Register">Back</a>
            <style>
                .button {
    background-color: #20B2AA; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    border-radius: 5px;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
  #sb
    {
       width:5em;
       height:2em;
       color: white;
       border-radius: 5px;
      background-color:#800080; 
     }
            </style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.rtl.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.silver.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.mobile.all.min.css"/>

        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
        <title>Profile</title>
        <script type="text/x-kendo-template" id="template">
        <div align="center">
            <h2 align="center">#= HOTEL_NAME #</h2>
            <table>
                <tr><td>FIRST_NAME</td><td><input type="text" id="FIRST_NAME" value=#=FIRST_NAME# /></td></tr>
                <tr><td>LAST_NAME</td><td><input type="text" id="LAST_NAME" value=#=LAST_NAME# /></td></tr>
                <tr><td>EMAIL_ID</td><td><input type="Email" id="EMAIL_ID"  value=#=EMAIL_ID# /></td></tr>
                <tr><td>PHONE_NUMBER</td><td><input type="number" id="PHONE_NUMBER" value=#=PHONE_NUMBER# /></td></tr>
                <tr><td>ADDRESS</td><td><input type="text" id="ADDRESS" value=#=ADDRESS# /></td></tr>
                <tr><td>CITY_NAME</td><td><input type="text" id="CITY_NAME" value=#=CITY_NAME# /></td></tr>
                <tr><td>PIN_NUMBER</td><td><input type="number" id="PIN_NUMBER" value=#=PIN_NUMBER# /></td> </tr>
                <tr><td>HOTEL_NAME</td><td><input type="text" id="HOTEL_NAME" value=#=HOTEL_NAME# /></td></tr>
                <tr><td><button onclick="Update()">UPDATE</button></td>
                    <td><button onclick="Cancel()">Cancel</button></td> </tr>

            </table>
        </div>
    </script>
    <script type="text/x-kendo-template" id="view">
         <div align="center">
            <h2 align="center">#= HOTEL_NAME #</h2>
            <table>
                <tr><td>FIRST_NAME:</td><td><input type="text" id="FIRST_NAME" readOnly="true" value=#=FIRST_NAME#> </td></tr>
                <tr><td>LAST_NAME</td><td><input type="text" id="LAST_NAME" readOnly="true"value=#=LAST_NAME# /></td></tr>
                <tr><td>EMAIL_ID</td><td><input type="Email" id="EMAIL_ID" readOnly="true" value=#=EMAIL_ID# /></td></tr>
                <tr><td>PHONE_NUMBER</td><td><input type="number" id="PHONE_NUMBER" readOnly=true value=#=PHONE_NUMBER# /></td></tr>
                <tr><td>ADDRESS</td><td><input type="text" id="ADDRESS" readOnly="true"value=#=ADDRESS# /></td></tr>
                <tr><td>CITY_NAME</td><td><input type="text" id="CITY_NAME" readOnly="true"value=#=CITY_NAME# /></td></tr>
                <tr><td>PIN_NUMBER</td><td><input type="number" id="PIN_NUMBER" readOnly="true" value=#=PIN_NUMBER# /></td> </tr>
                <tr><td>HOTEL_NAME</td><td><input type="text" id="HOTEL_NAME" readOnly="true" value=#=HOTEL_NAME# /></td></tr>
             </table>
        </div>
        
        
    </script>
    
    <script>
       
        var wnd;
        var detailsTemplate;
        var profileTemplate;
        var Data;
        function GridData(){
            $(document).ready(function () {
                $.ajax(
                {
//                    url: 'Profile',
//                    type: "post",
                    
                    success: function(Data) {
//                        Data=JSON.parse(Data);
                        $("#grid").kendoGrid({
                    
                    selectable: 'row',
                   
                            columns: [
                                 
                                { field: "FIRST_NAME", width: 120},
                                { field: "LAST_NAME",width: 120},
                                { field: "EMAIL_ID",width: 150},
                                { field: "PHONE_NUMBER",width: 100},
                                { field: "ADDRESS",width: 190},
                                { field: "CITY_NAME",width: 100},
                                { field: "PIN_NUMBER",width: 80},
                                { field: "HOTEL_NAME",width: 90},
                                { command: [
                                    
                                        { name: "edit",  click: editProfile },
                                        { name: "destroy", click: deleteProfile},
                                        { name: "veiw",  click: showProfile },
                                    ],
                                     
                                    title: "ACTIONS", width: "230px"}

                                ],
                            dataSource: Data    
//                            pageable: {
//                                pageSize: 10,
//                                refresh: true
//                            }
                        });

                    }
                });
                
                wnd = $("#details")
                .kendoWindow({
                    title: "User Details",
                    modal: true,
                    visible: false,
                    resizable: false,
                    width: 300,
                    actions: ["Minimize", "Maximize", "Close"]
                }).data("kendoWindow");
                detailsTemplate = kendo.template($("#template").html());
                profileTemplate = kendo.template($("#view").html());
            });
        }
        function showProfile(e){
            e.preventDefault();
            var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            wnd.content(profileTemplate(dataItem));
            wnd.center().open();
        }
         function editProfile(e){
            e.preventDefault();
            var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            wnd.content(detailsTemplate(dataItem));
            wnd.center().open();
        }
        function deleteProfile(e)
        { 
            e.preventDefault();
            alert("Delete");
            var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            wnd.content(detailsTemplate(dataItem));
            var EMAIL_ID = document.getElementById("EMAIL_ID").value;
            alert(EMAIL_ID);
            var strDelete = confirm("Are you sure you want to delete this record?");
            if(strDelete==false){}
            else{
                $.ajax(
                {
                    url: 'Delete',
                    type: "post",
                    data: {'EMAIL_ID': EMAIL_ID,'password': 'password'},
                    success: function(Data) {
                        alert(Data);
                        GridData();
                    }
                })
            }

                
        }
        function Cancel(){ wnd.center().close();}
        function Update(){
            var FIRST_NAME = document.getElementById("FIRST_NAME").value;
            var LAST_NAME = document.getElementById("LAST_NAME").value;
            var EMAIL_ID = document.getElementById("EMAIL_ID").value;
            //alert(LAST_NAME);return;
            var PHONE_NUMBER = document.getElementById("PHONE_NUMBER").value;
            var ADDRESS = document.getElementById("ADDRESS").value;
            var CITY_NAME = document.getElementById("CITY_NAME").value;
            var PIN_NUMBER = document.getElementById("PIN_NUMBER").value;
            var HOTEL_NAME = document.getElementById("HOTEL_NAME").value;
            alert("bye");
            $.ajax(
            {
                
                url: 'Update',
                type: "post",
                data: {"FIRST_NAME": FIRST_NAME,"LAST_NAME": LAST_NAME,"EMAIL_ID": EMAIL_ID,"PHONE_NUMBER": PHONE_NUMBER,"ADDRESS": ADDRESS,"CITY_NAME": CITY_NAME,"PIN_NUMBER": PIN_NUMBER,"HOTEL_NAME": HOTEL_NAME},
           
               success: function(Data) {
                    alert(Data);
                    wnd.center().close();
                    GridData();
                }
            })
                    

        }


    </script>

</head>
<body onload="GridData()" background= "Images/h2.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;">


    <div id="grid"></div>
    <div id="details"></div>
    <div id="gridex"></div>
    <script>
    </script>
</body>
</form>
</html>

