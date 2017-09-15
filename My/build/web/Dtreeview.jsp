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
            $.ajax({
                type:"GET",
                url:"Example",
                datatype:"json",
                success:function(Data)
                {
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