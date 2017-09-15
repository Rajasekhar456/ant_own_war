<%-- 
    Document   : GridDemo
    Created on : May 30, 2017, 5:57:39 PM
    Author     : Hussain
--%>

<%--
    Document   : Kendo
    Created on : Feb 1, 2017, 10:55:58 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Kendo UI Snippet</title>

        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.rtl.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.silver.min.css"/>
        <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.mobile.all.min.css"/>

        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="http://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
        <script type="text/x-kendo-template" id="template">
        </script>
    </head>
    <body onload="loadTree()">
        <div id="my-treeview"></div>
        <ul id="menu">
            <li id="Delete">Delete</li>
            <li id="AddUser">AddUser</li>
            <li id="Add">Add</li>
        </ul>
        <div id="window">
            <input type="button" onclick="addData()" value="Add"/>
            <div id="grid"></div>
        </div>
        <div id="UserWindow">
            <input type="text" id="User"/>
            <input type="button" onclick="addUserData()" value="Add User"/>
        </div>

        <script>
            var checkedData = {};
            var Node="", UserNode="";
            function loadTree(){
                $.ajax({
                    url: 'KendoTree',
                    type: "post",
                    data: {DataFor:"Tree"},
                    success: function(Data) {
                        Data=JSON.parse(Data);
                        var dataSource = new kendo.data.HierarchicalDataSource({
                            data:Data
                        })
                        var treeview = $("#my-treeview").data("kendoTreeView");
                        treeview.setDataSource(dataSource);
                    }
                })
            }





            var treeview = $("#my-treeview").kendoTreeView({
                checkboxes: true<%--{
                    checkChildren: true
                }--%>,
                        check: function(e){
                            e.preventDefault();
                            var checkbox = $(e.node).find(":checkbox");
                            var checked = checkbox.prop("checked");
                            if(checked === true)
                            {
                                checkedData[e.node.textContent] = checked;
                            }
                            else
                            {
                                checkedData[e.node.textContent] = false;
                            }
                        }
                    }).data("kendoTreeView");

                    $("#menu").kendoContextMenu({
                        target: "#my-treeview",
                        filter: ".k-in",
                        select: function(e) {
                            var menuid = e.item.id;
                            if(menuid === "Delete")
                            {
                                var checked = [];

                                for(var i in checkedData){
                                    if(checkedData[i]){
                                        checked.push(i);
                                    }
                                }
                                var chkdata=checked.toString();
                                $.ajax({
                                    url: 'KendoTree',
                                    type: "post",
                                    data: {DataFor:"Delete", chkUserData:chkdata},
                                    success: function(result) {
                                        alert(result);
                                    }
                                });

                                
                                checkedData={};
                                var treeView = $('#my-treeview').data("kendoTreeView");
                                $('#my-treeview').find('input:checkbox:checked').each(function(){
                                    treeView.remove($(this).closest('.k-item'));
                            
                                });
                                var treeView = $('#my-treeview').data("kendoTreeView");
                                var node = $(e.target);
                                alert(node.text());
                                var selectId = node.text();
                                treeView.remove(treeView.findByText(selectId));


                            }
                            else if(menuid === "AddUser")
                            {
                                Userwnd.center().open();
                                var node = $(e.target);
                                UserNode = $(e.target);
                            }
                            else
                            {
                                loadGrid();
                                wnd.center().open();
                                var treeView = $('#my-treeview').data("kendoTreeView");
            <%--var selectNode =  treeView.select();--%>
                            var node = $(e.target);
                            Node = $(e.target);
                        }
                    
                    }
                });
                var wnd = $("#window").kendoWindow({
                    height: 450,
                    width: 600,
                    visible: false
                }).data("kendoWindow");
                var Userwnd = $("#UserWindow").kendoWindow({
                    height: 100,
                    width: 300,
                    visible: false
                }).data("kendoWindow");


                function loadGrid()
                {
                    $.ajax({
                        url: 'KendoTree',
                        type: "post",
                        data: {DataFor:"Grid"},
                        success: function(Data) {
                            Data=JSON.parse(Data);
                            var dataSource = new kendo.data.DataSource({
                                data: Data,
                                pageSize: 7,
                                schema: {
                                    model: {
                                        scrollable: true,
                                        fields: {
                                            Data: {editable: true, nullable: false}
                                        }
                                    }
                                }
                            });
                            var grid = $("#grid").data("kendoGrid");
                            grid.setDataSource(dataSource);
                        }
                    });
                }


                var grid = $("#grid").kendoGrid({
                    height: 400,
                    scrollable: true,
                    pageable: {
                        pageSize: 10,
                        refresh: true
                    },
                    columns: [
                        {
                            width: 80,
                            template: "<input class='checkbox' type='checkbox' />",
                            field: "CheckId"

                        },
            <%--{ field: "id", title: "Id"},--%>
                        { field: "Data", title: "Mobile"},
                    ],
                    change: function(e) {
                        $('tr').find('[type=checkbox]').prop('checked', false);
                        $('tr.k-state-selected').find('[type=checkbox]').prop('checked', true);
                    },
                    dataBound: onDataBound
                }).data("kendoGrid");


                var checkedIds = {};

                function onDataBound()
                {
                    $(".checkbox").bind("change", function (e) {
                        $(e.target).closest("tr").toggleClass("k-state-selected");
                        var checked = this.checked,
                        row = $(this).closest("tr"),
                        grid = $("#grid").data("kendoGrid"),
                        dataItem = grid.dataItem(row);
                        checkedIds[dataItem.Data+"-"+dataItem.id] = checked;
                        if (checked) {
                            //-select the row
                            row.addClass("k-state-selected");
                        } else {
                            //-remove selection
                            row.removeClass("k-state-selected");
                        }

                    });
                }
                wnd.one("activate", function() {
                    grid.resize();
                });

                function addData() {
                    var checked = [];
                    
                    for(var i in checkedIds){
                        if(checkedIds[i]){
                            checked.push(i);
                        }
                    }
                    var chkdata=checked.toString();
                    var ParentData = Node.text();
            

                    $.ajax({
                        url: 'KendoTree',
                        type: "post",
                        data: {DataFor:"Mobile", chkMobileData:chkdata, Parent:ParentData},
                        success: function(result) {
                            alert(result);
                        }
                    });



                    var chkdataSplit = chkdata.split(",");
                    for(var i=0; i < chkdataSplit.length; i++)
                    {
                        var chkdataid = chkdataSplit[i];
                        var chkdataidSplit = chkdataid.split("-")
                        var Data = chkdataidSplit[0];
                        var chkid = chkdataidSplit[1]
                        var treeView = $('#my-treeview').data("kendoTreeView");
                        treeView.append({text:Data,id:chkid} ,Node);
                        alert(chkdataid);
                    }
                    wnd.close();
                };
                function addUserData()
                {
                    var Data = document.getElementById("User").value;
                    var Selectdata = UserNode.text();
                
                    $.ajax({
                        url:"KendoTree",
                        type: "post",
                        data: {DataFor:"Parent", SelectData:Selectdata ,AddUserData: Data},
                        success: function(result) {
                            alert(result);
                        }

                    })
                    var treeView = $('#my-treeview').data("kendoTreeView");
                    treeView.append({text:Data,id:Data} ,UserNode);
                    Userwnd.close();
                }

        </script>

    </body>
</html>
