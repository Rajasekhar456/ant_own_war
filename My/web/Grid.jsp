<%-- 
    Document   : Grid
    Created on : Jan 31, 2017, 10:30:23 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title></title>
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.metro.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.metro.mobile.min.css" />

        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/jquery.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
    </head>
    <SCRIPT>
    
     $(document).ready(function () {
                    var dataSource = new kendo.data.DataSource({
                       pageSize: 20,
                       data: products,
                       autoSync: true,
                       schema: {
                           model: {
                             id: "ProductID",
                             fields: {
                                ProductID: { editable: false, nullable: true },
								
                                ProductName: { validation: { required: true } },
								
                                Category: { defaultValue: { CategoryID: 1, CategoryName: "Beverages"} },
								
                                UnitPrice: { type: "number", validation: { required: true, min: 1} }
                             }
                           }
                       }
                    });
    
     $("#grid").kendoGrid({
                        dataSource: dataSource,
                        pageable: true,
                        height: 550,
                        toolbar: ["create"],
                        columns: [
                            { field:"ProductName",title:"Product Name" },
							
                            { field: "Category", title: "Category", width: "180px", editor: categoryDropDownEditor, template: "#=Category.CategoryName#" },
							
                            { field: "UnitPrice", title:"Unit Price", format: "{0:c}",editor: categoryDropDownEditor, width: "130px" },
							
                            { command: "destroy", title: " ", width: "150px" }],
                        editable: true
                    });
                });
    
     function categoryDropDownEditor(container, options) {
                    $('<input required name="' + options.field + '"/>')
                        .appendTo(container)
                        .kendoDropDownList({
                            autoBind: false,
                            dataTextField: "CategoryName",
                            dataValueField: "CategoryID",
                            dataSource: {
                                type: "odata",
                                transport: {
//                                    read: "https://demos.telerik.com/kendo-ui/service/Northwind.svc/Categories"
                                }
                            }
                        });
                }
    
    
    
    
    
    
</script>>

    <script>
        var display;
        
        
        //        var DataObj=[];
        //        var temp=new Object();
        //        temp.FIRST_NAME='hussain';
        //        temp.EMAIL_ID='hussain@gmail.com';
        //        temp.PHONE_NUMBER='9889898989';
        //        temp.CITY_NAME='India';
        //        DataObj.push(temp);
        //        alert(DataObj.toSource())
                           
        //       var display;
        function Griddisplay(){
            $.ajax({
               
                success:function(result){
//                    dispaly=JSON.parse(result);
                    $("#grid").kendoGrid({
                        id:"grid",
                        dataSource:temp.FIRST_NAME='hussain',
                                       
           
                        columns: [
                              {  field: "PRODUCT NAME",
                                title: "FIRST_NAME",
                                width: 240
                            }, {
                                field: "CATEGORY",
                                editor: categoryDropDownEditor,
                                title: "EMAIL_ID"
                            }, {
                                field: "UNIT PRICE",
                                type: "number",
                                editor: categoryDropDownEditor,
                                title: "PHONE_NUMBER"
                            }],
                         editable: true
                    })
                }
            })
        }

    </script>
    
    <body onload="Griddisplay()">
        
        <!--<input type="submit" value="delete"></>-->
        <div id="grid"></div>
       </body>
</html>
