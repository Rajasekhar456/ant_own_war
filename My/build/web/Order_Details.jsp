<%-- 
    Document   : Oreder_Details
    Created on : Mar 20, 2017, 2:29:41 PM
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order_Details</title>
<style>
.testbox {
           margin: 20px auto;
           margin-top:0px;
           width:550px; 
           height:530px; 
           border-radius:6px/7px; 
           background:rgba(70,50,130,0.9); 
           box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
           border: solid 1px #cbc9c9;
           padding-bottom:20px;
           
          }
      body{  
          background-color:#FAFAD2;  
          }
/*  #sb
     {
      width:5em;
      height:2em;
      color: white;
      border-radius: 5px;
     background-color:#800080; 
    }*/
/*  a{
    text-decoration:none;
   }
   a:hover{
         cursor: pointer;
         text-decoration:underline;
        }*/
/*a.button {
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
        }*/
        input[type=submit] {
            background-color:#ff571a;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size:20px;
            border-radius: 30px;
        }
          input[type=reset] {
            background-color:tomato;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 80%;
            font-size:20px;
            border-radius: 30px;
        }
        .bk {
    background-color:red; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    border-radius: 5px;
    /*display: inline-block;*/
    font-size: 16px;
    margin: 4px 2px;
    /*cursor: pointer;*/
}
</style>
        <script type="text/javascript">
            function signup()
            {
                var t1=document.getElementById('t1').value;
                var t3=document.getElementById('t3').value;
                var t4=document.getElementById('t4').value;
                var t6=document.getElementById('t6').value;
                var t5=document.getElementById('t5').value;
                var t7=document.getElementById('t7').value;
               if(t1 == "")
                {
                    alert("please enter Full name ");
//                    t1.focus();
                    return false;
                }
                 
                else if(t3 == "")
                {
                    alert("please enter your home full address");
//                    t3.focus();
                    return false;
                }
               
                 else if(t4 == "")
                {
                    alert("please enter your area pin number");
//                    t4.focus();
                    return false;
                }
                else if(t6 == "")
                {
                    alert("please enter your Work place full address");
//                   t6.focus();
                    return false;
                }
               else if(t5 == "")
                {
                    alert("please enter your work place pin number");
//                   t5.focus();
                    return false;
                }
              
                 else if(t7 == "")
                {
                    alert("please enter Phone number");
//                   t5.focus();
                    return false;
                }
          else if(t7.length<6)
           {
             alert("pin number length should be 6");
             return false;
           }
                 else if(t6.length<6)
           {
             alert("pin number length should be 6");
             return false;
           }
                else if(t5.length<10)
           {
             alert("phone number length should be 10");
             return false;
           }  
             
       
                  
  }
   
    </script> 
    </head>
    <body background= "Images/hm.jpg" style="background-size:1400px 650px;background-repeat: no-repeat; ">
<input action="action" type="button" value="Back" class="bk" onclick="history.go(-1);" />
<div class="testbox">
       <font color="Yellow">
        <h1><center>Please Fill The Details To Order Now</center></h1></font>
       <form  name="sign" onsubmit="return signup()" action="Order_Details  " method="post" >
          <table align="center">
          <tr><td><font size="5" color="white">Full Name:</td><td><input type="text" id="t1" name="t1" placeholder="Enter Your Full name" size="30" ></td></tr>
          <tr><td><font size="5" color="white">From Address:</td><td><textarea type="text" id="t3" name="t3" cols="32" rows="5" placeholder="Enter your Home address"></textarea></td></tr>
          <tr><td> <font size="5" color="white">Home PIN:</td><td> <input type="number" id="t7" name="t7" size="40" placeholder="Enter Home place PIN number"></td></tr>
          <tr><td><font size="5" color="white">To Address:</td><td><textarea type="text" id="t4" name="t4" cols="32" rows="5" placeholder="Enter your work place address" size="30"></textarea></td></tr>
          <tr><td> <font size="5" color="white">Work Place PIN:</td><td> <input type="number" id="t6" name="t6" size="40" placeholder="Enter Work place PIN number"></td></tr>
          <tr><td><font size="5" color="white">Phone number:</td><td><input type="number" id="t5" name="t5" max="9999999999" placeholder="phone number" size="40" ></td></tr>
          <tr><td><font size="5" color="white"><label>Starting Date:</label></td><td><input type="date" name="t8" required></td></tr>
          <tr><td><font size="5" color="white"><label>Your LunchTime:</label></td><td><input type="time" name="t9" required/></td></tr> <tr>
          <!--<tr><td><font size="5" color="white">Date from:</td><td><input type="date" id="t8" name="t8" placeholder="starting date(DD-MM-YYYY)" size="25"></td></tr>-->
         
          
          <!--<tr><td><font size="5" color="white">Distance:</td><td><input type="number" id="t7" name="t" max="999" placeholder="Enter the max Distance" size="30"></td></tr>-->
          <tr></tr><tr></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>
         <input type="submit" value="Confirm Order" ></td><td>
         <input type="reset" value="Reset" ></td></tr>
         </table>
         </form>
      </center>
    </div>
  </body>
  

</html>
