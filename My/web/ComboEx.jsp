<%-- 
    Document   : ComboEx
    Created on : Jan 30, 2017, 12:29:38 PM
    Author     : Administrator
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>kondoDropDown</title>
      
        <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }</style>
        <title></title>
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />

        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/jquery.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
        <script>
            function ComboboxData(){
                $.ajax(
                {
                    url: 'ComboEx1',
                    type: "post",
                    data: {DataFor:"Combobox"},
                    success: function(Data) {                      
                        $("#combobox").kendoComboBox({
                            dataTextField: "EMAIL_ID",
                            dataValueField: "userID",
                            placeholder: "EMAIL_ID",
                            dataSource: JSON.parse(Data)
                            
                        });
                    }
                })
            }
            
        </script>

    </head>

</head>
<body onload="ComboboxData()" >    
<div id="combobox"/>
        </body>
</body>
</html>






