<%-- 
    Document   : Demo2
    Created on : Jun 8, 2017, 10:15:14 AM
    Author     : Hussain
--%>

<%-- 
    Document   : NewUser
    Created on : Jun 2, 2017, 3:56:48 PM
    Author     : Hussain
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register here</title>
        <script type="text/javascript">
            var item,count=0;
            function signup()
            {
                var t1=document.getElementById('t1').value;
                var t2=document.getElementById('t2').value;
                var t3=document.getElementById('t3').value;
                var t4=document.getElementById('t4').value;
                var t5=document.getElementById('t5').value;
                var addr=document.getElementById('addr').value;
                if(t1 == "")
                {
                    alert("please enter first name ");
                    return false;
                }
                 
                else if(t2 == "")
                {
                    alert("please enter email id");
                    return false;
                }
              
                else if(t3 == "")
                {
                    alert("please enter password ");
                    return false;
                }
               
                else if(t4 == "")
                {
                    alert("please enter phone number ");
                    return false;
                }
                else if(t5 == "")
                {
                    alert("please enter City Name");
                    return false;
                }
                else if(addr == "")
                {
                    alert("please enter Address");
                    return false;
                }
                              
                else if(t3.length<8)
                {
                    alert("Password length should be 8");
                    return false;
                }
                else if(t4.length<10)
                {
                    alert("phone number length should be 10");
                    return false;
                }
             
            }
             $(function(){
                            $("#button_add_input").click(function(event){
                                alert("hai");
                                count=count+1;
                                document.getElementById("b3").value=count;
                                alert(document.getElementById("b3").value);
                    
                                var name12="addr"+count;
                                //                                  $("<tr>").attr({"id":"id_"+number}).appendTo("#table");        
                                var textArea = "<textarea name='"+name12+"' />";
                                var newrow = $('<tr><td></td><td>'+textArea+'<input type="button" value="-" id="button_delete_input" onclick="delUser($(this))"></td></tr>').attr({"id":"tr_"+ count});
                                newrow.insertAfter('#addr');
                    
                            });
                        });
            
                        function delUser(row){
                            alert("Hai JSP");
                            document.getElementById("b3").value=count;
                            row.closest('tr').remove();        
                            //         
                        }
        </script> 
    </head>
    <style>
        .testbox {
            margin: 5px auto;
            margin-top:5px;
            width:500px; 
            height:750px; 
            border-radius:8px/7px; 
            background:rgba(10,100,128,0.7); 
            box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
            border: solid 1px #cbc9c9;
            padding-bottom:20px;
        }
        .sb
        {
            width:5em;
            height:2em;
            color: white;
            border-radius: 5px;
            background-color:#800080; 
        }
        .button {
            font-size: 17px;
            /*        font-weight: 1000;*/
            float:left;
            color: white;
            padding: 6px 25px 0px 20px;
            margin: 10px 50px 20px 10px;
            display: inline;
            text-decoration: none;
            width: 100px;
            height: 18px; 
            border-radius: 5px; 
            background-color:#800080; 
            box-shadow: 0 3px rgba(58,87,175,.75);
            transition: all 0.1s linear 0s; 
            top: 3px;
            position: relative;
        }
    </style>
    <body >

        <div class="testbox">
            <font color="#ECE5B6">
            <h1><center>Registration Form</center></h1></font>
            <br>
            <form  name="sign" onsubmit="return signup()" action="Register" method="post" >
                <table align="center">

                    <tr><td><font size="5" color="white">Name:<font></td><td><input type="text" id="t1" name="t1" placeholder="Enter name" size="30" ></td></tr>
                    <tr><td><font size="5" color="white">Email id:<font></td><td><input type="Email" id="t2" name="t2" size="30" placeholder="Enter username@gmail.com"></td></tr>
                    <tr><td><font size="5" color="white">Password:<font></td><td><input type="password" id="t3" name="t3" placeholder="Enter password" size="30"></td></tr>
                    <tr><td><font size="5" color="white">Phone number:<font></td><td><input type="number" id="t4" name="t4" placeholder="Enter phone number" size="30" ></td></tr>
                    <tr><td> <font size="5" color="white">City Name:<font></td><td><input type="text"  id="t5" name="t5" placeholder="Enter city"></td></tr>    
                    <tr id="addr"><td><font size="5" color="white">Address:<font></td><td><textarea id="adr" name="addr" placeholder="Enter Address" cols="32" rows="5"></textarea>
                            <input type="button" value="+" id="button_add_input">  </td></tr>     
                    
                </table>
                <body >
                <center>  <input type="submit"  value="Submit" class="sb" ></input>
                    <input type="reset" value="Reset" class="sb" ></input>
                    <td> <input type="hidden" id="b3" name="hide" value=""></td>
                    <tr></tr><tr></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>


                            </form>
                </center>
        </div>
    </body>
</html>
