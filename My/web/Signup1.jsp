<%-- 
    Document   : Signup1
    Created on : Jan 12, 2017, 4:38:08 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register here</title>
        <style>
.testbox {
           margin: 20px auto;
           margin-top:50px;
           width:550px; 
           height:310px; 
           border-radius:8px/7px; 
           background:rgba(10,100,128,0.9); 
           box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
           border: solid 1px #cbc9c9;
           padding-bottom:20px;
           
          }
      body{  
          background-color:#FAFAD2;  
          }
  #sb
     {
      width:5em;
      height:2em;
      color: white;
      border-radius: 5px;
     background-color:#800080; 
    }
  a{
    text-decoration:none;
   }
   a:hover{
         cursor: pointer;
         text-decoration:underline;
        }
a.button {
       font-size: 17px;
        font-weight: 1000;
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
</style>

        <script type="text/javascript">
            function signup()
            {
                var t1=document.getElementById('t1').value;
                var t3=document.getElementById('t3').value;
                var t4=document.getElementById('t4').value;
                var t6=document.getElementById('t6').value;
                var t5=document.getElementById('t5').value;

               if(t1 == "")
                {
                    alert("please enter first name ");
//                    t1.focus();
                    return false;
                }
                 
                else if(t3 == "")
                {
                    alert("please enter email id");
//                    t3.focus();
                    return false;
                }
               
                 else if(t4 == "")
                {
                    alert("please enter password ");
//                    t4.focus();
                    return false;
                }
                else if(t6 == "")
                {
                    alert("please enter Address");
//                   t6.focus();
                    return false;
                }
               else if(t5 == "")
                {
                    alert("please enter Phone number");
//                   t5.focus();
                    return false;
                }
         else if(t4.length<8)
           {
             alert("Password length should be 8");
             return false;
           }
                 else if(t5.length<10)
           {
             alert("phone number length should be 10");
             return false;
           }
           else if ( t6!= t4) 
                {
                alert("Password do not match.");
            return false;
                    }
        return true;
      }
        </script> 
    </head>
    <body background= "Images/ln2.jpg" style="background-size:1400px 650px;background-repeat: no-repeat;">
      <a  class="button" href="Home.jsp" title="Register">previous page</a>
      <div class="testbox">
       <font color="Yellow">
        <h1><center>Registration Form</center></h1></font>
       <br>
       <form  name="sign" onsubmit="return signup()" action="Signup1" method="post" >
          <table align="center">
          <tr><td><font size="5" color="white">Full Name:</td><td><input type="text" id="t1" name="t1" placeholder="Enter Your Full name" size="30" ></td></tr>
          <tr><td><font size="5" color="white">Email id:</td><td><input type="Email" id="t3" name="t3" size="30" placeholder="username@gmail.com"></td></tr>
          <tr><td><font size="5" color="white">Password:</td><td><input type="password" id="t4" name="t4" placeholder="password" size="30"></td></tr>
          <tr><td> <font size="5" color="white">Confirm Password:</td><td> <input type="password" id="t6" name="t6" size="30" placeholder="Enter Confirm Password"></td></tr>
          <tr><td><font size="5" color="white">Phone number:</td><td><input type="number" id="t5" name="t5" max="9999999999" placeholder="phone number" size="30" ></td></tr>
          <tr></tr><tr></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>
         <input type="submit" value="submit" id="sb" ></td><td>
         <input type="reset" value="Reset" id="sb"></td></tr>
         </table>
         </form>
      </center>
    </div>
  </body>
</html>
