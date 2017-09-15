<%-- 
    Document   : newjsp
    Created on : Jan 25, 2017, 10:38:19 AM
    Author     : Administrator
--%>

<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            function hitAjaxToServlet(){
                  
                $.ajax({url: "Test", success: function(result){
                       
                    }});
                
            }
         
        </script>
    </head>
    <body onload="hitAjaxToServlet()">
        <h1>Hello World!</h1>
    </body>
</html>-->

<html>
    <head>
        <title>AJAX in java web application using jQuery</title>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
            <script type="text/javascript" >
                $(document).ready(function() {
                       //var name = $('#userName').val();
                        $.ajax({
                            Type: "GET",
                            url: "./Table",
                           // data: "userName="+'sri',
                            success: function(result){  
                                alert(result);


                            }
                        });
                    });




            </script>
    </head>
    <body>
        <form>
            <fieldset>
                <legend>AJAX implementation in JSP and Servlet using JQuery</legend>
                <br /> Enter your Name: <input type="text" id="userName" />
            </fieldset>

            <fieldset>
                <legend>Response from jQuery Ajax Request on Blur event</legend>
                <div id="ajaxResponse"></div>
            </fieldset>
        </form>
    </body>
</html>
</html>