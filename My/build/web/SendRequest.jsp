<%-- 
    Document   : SendRequest
    Created on : Apr 12, 2017, 3:24:38 PM
    Author     : Administrator
--%>
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
            <h2 align="center">#= FULLNAME #</h2>
            <table>
                <tr><td>FULLNAME</td><td><input type="text" id="FULLNAME" value=#=FULLNAME# /></td></tr>
                <tr><td>FROMADDRESS</td><td><input type="text" id="FROMADDRESS" value=#=FROMADDRESS# /></td></tr>
                <tr><td>HPIN</td><td><input type="number" id="HPIN"  value=#=HPIN# /></td></tr>
                <tr><td>TOADDRESS</td><td><input type="text" id="TOADDRESS" value=#=TOADDRESS# /></td></tr>
                <tr><td>PIN</td><td><input type="number" id="PIN" value=#=PIN# /></td></tr>
                <tr><td>PHONENUMBER</td><td><input type="text" id="PHONENUMBER" value=#=PHONENUMBER# /></td></tr>
                <tr><td>SDATE</td><td><input type="date" id="SDATE" value=#=SDATE# /></td> </tr>
                <tr><td>TIME</td><td><input type="time" id="TIME" value=#=TIME# /></td></tr>
                <tr><td><button onclick="Update()">UPDATE</button></td>
                    <td><button onclick="Cancel()">Cancel</button></td> </tr>

            </table>
        </div>
    </script>
    <script type="text/x-kendo-template" id="view">
         <div align="center">
            <h2 align="center">#= FULLNAME #</h2>
            <table>
                <tr><td>FULLNAME</td><td><input type="text" id="FULLNAME" readOnly="true" value=#=FULLNAME#> </td></tr>
                <tr><td>FROMADDRESS</td><td><input type="text" id="FROMADDRESS" readOnly="true"value=#=FROMADDRESS# /></td></tr>
                <tr><td>HPIN</td><td><input type="number" id="HPIN" readOnly="true" value=#=HPIN# /></td></tr>
                <tr><td>TOADDRESS</td><td><input type="text" id="TOADDRESS" readOnly=true value=#=TOADDRESS# /></td></tr>
                <tr><td>PIN</td><td><input type="number" id="PIN" readOnly="true"value=#=PIN# /></td></tr>
                <tr><td>PHONENUMBER</td><td><input type="number" id="PHONENUMBER" readOnly="true"value=#=PHONENUMBER# /></td></tr>
                <tr><td>SDATE</td><td><input type="date" id="SDATE" readOnly="true" value=#=SDATE# /></td> </tr>
                <tr><td>TIME</td><td><input type="time" id="TIME" readOnly="true" value=#=TIME# /></td></tr>
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
                    url: 'SendRequest',
                    type: "post",
                    
                    success: function(Data) {
                        Data=JSON.parse(Data);
                        $("#grid").kendoGrid({
                    
                    selectable: 'row',
                   
                            columns: [
                                 
                                { field: "FULLNAME", width: 120},
                                { field: "FROMADDRESS",width: 150},
                                { field: "HPIN",width: 100},
                                { field: "TOADDRESS",width: 150},
                                { field: "PIN",width: 100},
                                { field: "PHONENUMBER",width: 120},
                                { field: "SDATE",width: 80},
                                { field: "TIME",width: 90},
                                { command: [
                                    
                                        { name: "edit",  click: editProfile },
                                       
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
        function Cancel(){ wnd.center().close();}
        function Update(){
            var FULLNAME = document.getElementById("FULLNAME").value;
            var FROMADDRESS = document.getElementById("FROMADDRESS").value;
            var HPIN = document.getElementById("HPIN").value;
            //alert(FROMADDRESS);return;
            var TOADDRESS = document.getElementById("TOADDRESS").value;
            var PIN = document.getElementById("PIN").value;
            var PHONENUMBER = document.getElementById("PHONENUMBER").value;
            var SDATE = document.getElementById("SDATE").value;
            var TIME = document.getElementById("TIME").value;
            alert("bye");
            $.ajax(
            {
                
                url: 'Update',
                type: "post",
                data: {"FULLNAME": FULLNAME,"FROMADDRESS": FROMADDRESS,"HPIN": HPIN,"TOADDRESS": TOADDRESS,"PIN": PIN,"PHONENUMBER": PHONENUMBER,"SDATE": SDATE,"TIME": TIME},
           
               success: function(Data) {
                    alert(Data);
                    wnd.center().close();
                    GridData();
                }
            })
                    

        }


    </script>

</head>
<!--<form action="Logout" method="post">
                    <p align="right">
                <input type="submit" value="Logout" id="sb" />
            </p>-->
            
           <div align=center style='color:#f4d03f; font-size:20px' ><h2>Your Profile & View Sent Requests </h2></div>
              <a  class="button" href="UserBoot.jsp" title="Register">Back</a>
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


<body onload="GridData()" background= "Images/h2.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;">


    <div id="grid"></div>
    <div id="details"></div>
    <div id="gridex"></div>
    <script>
    </script>
</body>
</form>
</html>

