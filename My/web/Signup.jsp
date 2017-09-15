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
                
               if(t1 == "")
                {
                    alert("please enter first name ");
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
                    alert("please enter Organization name ");
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
                else if(t8.length<6)
           {
             alert("pin number length should be 6");
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
/*    body{  
          background-color:#C1E1A6;  
          }*/
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
    <body background= "Images/5.jpg" style="background-size:1280px 650px;background-repeat: no-repeat;">
      <a  class="button" href="Home.jsp" title="Register">previous page</a>
      <div class="testbox">
       <font color="#ECE5B6">
        <h1><center>Registration Form</center></h1></font>
       <br>
          <form  name="sign" onsubmit="return signup()" action="Signup" method="post" >
          <table align="center">
              
          <tr><td><font size="5" color="white">First Name:<font></td><td><input type="text" id="t1" name="t1" placeholder="first name" size="30" ></td></tr>
          <tr><td><font size="5" color="white">Last Name:<font></td><td><input type="text" id="t2" name="t2" placeholder="last name" size="30" ></td></tr>
          <tr><td><font size="5" color="white">Organization Name:<font></td><td><input type="text" id="t9" name="t9" placeholder="Enter Your Organization name" size="30" ></td></tr>
          <tr><td><font size="5" color="white">Email id:<font></td><td><input type="Email" id="t3" name="t3" size="30" placeholder="username@gmail.com"></td></tr>
          <tr><td><font size="5" color="white">Password:<font></td><td><input type="password" id="t4" name="t4" placeholder="password" size="30"></td></tr>
          <tr><td><font size="5" color="white">Phone number:<font></td><td><input type="number" id="t5" name="t5" placeholder="phone number" size="30" ></td></tr>
          <tr><td><font size="5" color="white">Address:<font></td><td><textarea  id="t6" name="t6" placeholder="address" cols="32" rows="5" name="t6"></textarea></td></tr>
          <tr><td> <font size="5" color="white">City Name:
                  <font></td><td> 
                  <!--<input type="text" id="t7" name="t7" placeholder="phone number" size="30" ></td></tr>-->
                  <select  id="t7" name="t7" >
                      <option selected="selected" value="" >-Select your city-</option>
                      <option value="" disabled="disabled" style="background-color:#3E3E3E"><font color="#FFFFFF"><i>-Andhra Pradesh-</i></font></option>
                  <option value="Anantapur" >Anantapur</option>
                  <option value="Guntakal">Guntakal</option>
                  <option value="Guntur">Guntur</option>
                  <option value="Hyderabad">Hyderabad/Secunderabad</option>
                  <option value="kakinada">kakinada</option>
                  <option value="kurnool">kurnool</option>
                  <option value="Nellore">Nellore</option>
                  <option value="Nizamabad">Nizamabad</option>
                  <option value="Rajahmundry">Rajahmundry</option>
                  <option value="Tirupati">Tirupati</option>
                  <option value="Vijayawada">Vijayawada</option>
                  <option value="Visakhapatnam">Visakhapatnam</option>
                  <option value="Warangal">Warangal</option>
                  <option value="Andra Pradesh-Other">Andra Pradesh-Other</option>
                 <option value="Other">Other</option>
                  </select></td></tr>
       <tr><td> <font size="5" color="white">Pin Number:<font></td><td><input type="number" id="t8" name="t8" placeholder="pin number" size="30"></td></font></tr> 
       <tr></tr><tr></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>
         <input type="submit" value="submit" id="sb"></td><td>
         <input type="reset" value="Reset" id="sb"></td></tr>
         </table>
         </form>
      </center>
    </div>
  </body>
</html>
