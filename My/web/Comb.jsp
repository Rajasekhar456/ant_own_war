<%-- 
    Document   : Comb
    Created on : Feb 6, 2017, 6:10:24 PM
    Author     : Administrator
--%>
<html>
    <head>
<script>
            var data1;
            function Gridvalues(){
                alert("hi");
                $.ajax({
                    url:"My/Profile", 
                    type:"post",
                    datatype:"json",               
                    success:function(result){
                        data1=JSON.parse(result);
                        alert("bye");
                        alert(result);
                       $("#gridex").kendoGrid({
                              
                            id:"gridex",
                            dataSource:data1,
                           
                            pageable:
                                {
                                pageSize:5
                            },
                            
                            dataBound: Datacal,
                            columns:
                                [
                                { field: "FIRST_NAME" },
                                { field: "EMAIL_ID" },
                                                               
                       { command: [
//                                        {text:"View",click: showDetails},
//                                        {text:"Edit",click:editDetails},
                                        {text:"Delete",click: deleteDetails}],title:"actions"}], 
                            change: function(e) {
                                $('tr').find('[type=checkbox]').prop('checked', false);
                                $('tr.k-state-selected').find('[type=checkbox]').prop('checked', true);
                            }
                            
                        }).data("kendoGrid");
                    }
                });
            }
                
            var checkedIds = {};
            function Datacal()
            {
                alert("gfjasb");
                $(".checkbox").bind("change", function (e) {
                    $(e.target).closest("tr").toggleClass("k-state-selected");
                    var checked = this.checked,
                    row = $(this).closest("tr"),
                    grid = $("#gridex").data("kendoGrid"),
                    dataItem = grid.dataItem(row);
                    checkedIds[dataItem.sno] = checked;
                    if (checked) {
                       
                        row.addClass("k-state-selected");
                    } else {
                      
                        row.removeClass("k-state-selected");
                    }
                              
                });
            }
            function deleteForm() {
                var checked = [];
                for(var i in checkedIds){
                    if(checkedIds[i]){
                        checked.push(i);
                    }
                }
                alert(checked);
                var strDelete = confirm("Are you sure to Delete this Records!!");
                if(strDelete == false){}
                else{
                    var chkdata=checked.toString();
                    alert("helo");
                    $.ajax({
                        type: "get",
                        url: "Del",
                        
                        data: {Delete:"MultiDelete",DataChk: chkdata},
                        success: function(data) {
                            alert(data);
                            window.location="comb.jsp";
                         
                        }
                                    
                    });
                }  
            }
        </script>
    <body onload="Gridvalues()">
        <div id="gridex"></div>
        <input type="submit" id="deletebutton" value="Delete" onclick="deleteForm()">
    </body>
</head> 
</html>