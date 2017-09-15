<%-- 
    Document   : Hotel_Details
    Created on : Jan 25, 2017, 4:41:49 PM
    Author     : Administrator
--%>

<%-- 
    Document   : Signup
    Created on : Jan 12, 2017, 4:38:08 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register here</title>
        <script type="text/javascript">
            function signup()
            {
                var t1=document.getElementById('t1').value;
                var t2=document.getElementById('t2').value;
                var t9=document.getElementById('t9').value;
                var t3=document.getElementById('t3').value;
                var t4=document.getElementById('t4').value;
                var t5=document.getElementById('t5').value;
                var t6=document.getElementById('t6').value;
                var t7=document.getElementById('t7').value;
                var t8=document.getElementById('t8').value;
                var t0=document.getElementById('t0').value;
               if(t1 == "")
                {
                    alert("please enter 1km price  ");
                //    t1.focus();
                    return false;
                }
                 
                else if(t2 == "")
                {
                    alert("please enter last name ");
                  //  t2.focus();
                    return false;
                }
                else if(t9 == "")
                {
                    alert("please enter hotel name ");
               //    t9.focus();
                    return false;
                }
                else if(t3 == "")
                {
                    alert("please enter email id");
                   // t3.focus();
                    return false;
                }
               
                 else if(t4 == "")
                {
                    alert("please enter password ");
                   // t4.focus();
                    return false;
                }
               else if(t5 == "")
                {
                    alert("please enter Phone number");
                  // t5.focus();
                    return false;
                }
                else if(t6 == "")
                {
                    alert("please enter Address");
                  //// t6.focus();
                    return false;
                }
                else if(t7 == "")
                {
                    alert("please enter City Name");
               //    t7.focus();
                    return false;
                }
                else if(t8 == "")
                {
                    alert("please enter Area Pin Number");
               //    t9.focus();
                    return false;
                }
                  else if(t0 == "")
                {
                    alert("please enter Area Pin Number");
               //    t9.focus();
                    return false;
                }
                 
             }
             
        </script> 
    </head>
    <style>
.testbox {
           margin: 5px auto;
           margin-top:5px;
           width:550px; 
           height: 510px; 
           border-radius:8px/7px; 
           background:rgba(10,100,128,0.7); 
           box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
           border: solid 1px #cbc9c9;
           padding-bottom:20px;
          }
    body{  
          background-color:#C1E1A6;  
          }
  #sb
      {
       width:5em;
       height:2em;
       color: white;
       border-radius: 5px;
      background-color:#800080; 
     }
  /*a{
    text-decoration:
   }
   a:hover{
         cursor: pointer;
         text-decoration:;
        }*/
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
    <body>
      <a  class="button" href="Home.jsp" title="Register">previous page</a>
      <div class="testbox">
       <font color="#800080">
        <h1><center>Registration Form</center></h1></font>
       <br>
          <form  name="sign" onsubmit="return signup()" action="#" method="#" >
          <table align="center">
              <td><b>Pickup to Delivery Point</b></td>
             <td><b>Per Month</b></td>
          <tr><td><font size="5" color="white">1km:<font></td><td><input type="text" id="t1" name="t1" placeholder="Enter price" size="30" ></td></tr>
          <tr><td><font size="5" color="white">2km:<font></td><td><input type="text" id="t2" name="t2" placeholder="Enter price" size="30" ></td></tr>
           <tr><td><font size="5" color="white">3km:<font></td><td><input type="text" id="t9" name="t9" placeholder="Enter price" size="30" ></td></tr>
          <tr><td><font size="5" color="white">4km:<font></td><td><input type="Email" id="t3" name="t3" size="30" placeholder="Enter price"></td></tr>
          <tr><td><font size="5" color="white">5km:<font></td><td><input type="password" id="t4" name="t4" placeholder="Enter price" size="30"></td></tr>
          <tr><td><font size="5" color="white">6km:<font></td><td><input type="number" id="t5" name="t5" placeholder="Enter price" size="30" ></td></tr>
          <tr><td><font size="5" color="white">7km:<font></td><td><textarea  id="t6" name="t6" placeholder="Enter price" cols="32" rows="5" name="t6"></textarea></td></tr>
          <tr><td> <font size="5" color="white">8km:<font></td><td> <input type="text"id="t7" name="t7" size="30" placeholder="Enter price"></td></tr>
        <tr><td> <font size="5" color="white">9km:<font></td><td><input type="number" id="t8" name="t8" placeholder="Enter price" size="30"></td></font></tr> 
        <tr><td> <font size="5" color="white">10km:<font></td><td><input type="number" id="t0" name="t0" placeholder="Enter price" size="30"></td></font></tr>
        <tr></tr><tr></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>
         <input type="submit" value="submit" id="sb"></td><td>
         <input type="reset" value="Reset" id="sb"></td></tr>
         </table>
         </form>
      </center>
    </div>
  </body>
</html>
