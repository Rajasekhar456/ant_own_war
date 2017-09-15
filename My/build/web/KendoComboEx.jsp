<!DOCTYPE html>
<html>
<head>
    <base href="http://demos.telerik.com/kendo-ui/dropdownlist/index">
    <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />

    <script src="https://kendo.cdn.telerik.com/2017.1.118/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
</head>
<body>

        <div id="example">
        <div id="cap-view" class="demo-section k-content">
            <h4>Customize your Kendo Cap</h4>
            <div id="cap" class="black-cap"></div>
            <h4>Cap Color</h4>
            <input id="color" value="1" style="width: 100%;" />

            <h4 style="margin-top: 2em;">Cap Size</h4>
            <select id="size" style="width: 100%;" >
                <option>S - 6 3/4"</option>
                <option>M - 7 1/4"</option>
                <option>L - 7 1/8"</option>
                <option>XL - 7 5/8"</option>
            </select>

            <button class="k-button k-primary" id="get" style="margin-top: 2em; float: right;">Customize</button>
        </div>
        <style>
            #cap {
                width: 242px;
                height: 225px;
                margin: 20px auto;
                background-image: url('../content/web/dropdownlist/cap.png');
                background-repeat: no-repeat;
                background-color: transparent;
            }
            .black-cap {
                background-position: 0 0;
            }
            .grey-cap {
                background-position: 0 -225px;
            }
            .orange-cap {
                background-position: 0 -450px;
            }
        </style>

            <script>
                $(document).ready(function() {
                    var data = [
                        { capName: "hai", capValue :"1" },
                        {capName: "bye", capValue: "2" },
                        { capName: "hello", capValue :"3" }
                    ];

                    // create DropDownList from input HTML element
                    $("#color").kendoDropDownList({
                        dataTextField: "capName",
                        dataValueField: "capValue",
                        dataSource: data,
                        index: 0,
                        change: onChange
                    });

                    // create DropDownList from select HTML element
                    $("#size").kendoDropDownList();

                    var color = $("#color").data("kendoDropDownList");

                    color.select(0);
                    var size = $("#size").data("kendoDropDownList");

                    function onChange() {
                        var value = $("#color").val();
                        $("#cap")
                            .toggleClass("#", value == 1)
                            .toggleClass("orange-cap", value == 2)
                            .toggleClass("grey-cap", value == 3);
                    };

                    $("#get").click(function() {
                        alert('Thank you! Your Choice is:\n\nColor ID: '+color.value()+' and Size: '+size.value());
                    });
                });
            </script>
        </div>


</body>
</html>