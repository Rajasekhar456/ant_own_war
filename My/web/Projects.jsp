<%-- 
    Document   : Projects
    Created on : Jun 2, 2017, 10:15:24 AM
    Author     : Administrator
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>kondoDropDown</title>
        <!--<base href="http://demos.telerik.com/kendo-ui/dropdownlist/index">-->
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />

        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/jquery.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
        <script>
            var comboData;
            function loadComboValues(){
                $.ajax({
                    type:"post",
                    url:"membersser",
                    datatype:"json",
                    success:function(data){
                        comboData=JSON.parse(data);
                                                alert(data);
                      
                        $("#comboDiv").kendoComboBox({
                            id:'statCombo',
                            animation: false,
                            dataTextField: "name",
                            dataValueField: "id",
                            dataSource: comboData,
                            select:onSelect
                        });
                    }
                });
            
            }
            function onSelect(e)
            {
                alert("HAI");
                var item = e.item;
                var text = item.text();
                alert(text);
                var id = e.item.id;
                alert(id);
                $.ajax({
                    type:"post",
                    url:"projectsserv",
                    datatype:"json",
                    data:{Pname:text,Id:id},
                    success:function(data){
                        var rescomboData=JSON.parse(data);
                        alert(data);
                        $('#comboDiv1').kendoComboBox({
                            id:'statCombo',
                            animation: false,
                            dataTextField: "name",
                            dataValueField: "name",
                            casecadeFrom:"comboDiv",
                            dataSource: rescomboData
//                            select:onSelect
//                        $('#textBoxAddr').val(rescomboData[0].SADDR);
//                        $('#textBoxMobile').val(rescomboData[0].MOBILE_NUMBER);
//                    }
                });
            }
                });
            }
        </script>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body onload="loadComboValues()" >

        <table>
            <tr>
                <!--            <th>Id</th>-->
                <th>MemberName</th>
                <th>Projects</th>
                <th>Modules</th>

            </tr>
            <tr>
                <td><div id="comboDiv"></td>
                <td><div id="comboDiv1"></td>
                <td><div id="comboDiv2"></td>

            </tr>
        </table>
    </body>
</html>