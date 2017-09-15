<%-- 
    Document   : DynaTreeView
    Created on : Feb 8, 2017, 6:21:53 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
         <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.rtl.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.silver.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.mobile.all.min.css"/>
       
     <link rel="stylesheet" href="styles/kendo.common.min.css" />
    <link rel="stylesheet" href="styles/kendo.default.min.css" />
    <link rel="stylesheet" href="styles/kendo.default.mobile.min.css" />

    <script src="js/jquery.min.js"></script>
    <script src="js/kendo.all.min.js"></script>        
         
        <title>JSP Page</title>
        <script>
            function TreeviewData(){
                alert("hai ");
               
                    $.ajax({
                        type:"GET",
                        url:"Example",
                        datatype:"json",
                        
                        success:function(Data)
                        {
                            alert(Data);
                             var Prsdata=JSON.parse(Data);
                             alert(Data);
                              alert(Prsdata);
                           var dataS = new kendo.data.HierarchicalDataSource
                          ({
                             data:Prsdata
                            })
                         $("#treeview").kendoTreeView({
                         dataSource:dataS,
                         dataTextField: "text"
                        });         
                        }
                    });
            }
                                         
    </script>
    </head>
    <body  onload="TreeviewData()">
<div id="treeview"></div>
    </body>
</html>
