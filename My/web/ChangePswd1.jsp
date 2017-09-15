<%-- 
    Document   : ChangePswd
    Created on : Apr 10, 2017, 11:28:48 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    <script type="text/javascript">
     function val()
      {
        var pwd1=document.form.pwd1.value;
        var pwd2=document.form.pwd2.value;
        var pwd3=document.form.pwd3.value;

        if(pwd1==""&&pwd2==""&&pwd3=="")
           {
            alert("please Enter all password fields");
            document.form.pwd3.focus();
            return false;
            }
        else if(pwd3=="")
        {
          alert("please enter current password");
          document.form.pwd3.focus();
          return false;
           }
        else if(pwd1=="")
        {
         alert("please enter new password");
         document.form.pwd1.focus();
         return false;
        }

        else if(pwd2=="")
        {
         alert("please enter confirm password");
         document.form.pwd2.focus();
         return false;
        }
        else if(pwd1.length<8)
           {
             alert("password length should be 8");
             document.form.pwd1.focus();
             return false;
           }
        else if(pwd1!==pwd2)
        {
         alert("please check your password(not matched)");
         document.form.pwd1.focus();
         return false;
        }
        }
   </script>
<style>

        form {
            
            margin:auto;
            width:45%;
            border-radius:25px;

        }
        input[type=text], input[type=password]{
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
                font-size:14px;
                border-radius: 30px;
        }
        .container {
            padding: 16px;
            background-color:#8c8c8c;
             background:rgba(10,100,108,0.7); 
                border-radius:25px;
        }
        input[type=submit] {
            background-color:#ff571a;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size:17px;
            border-radius: 30px;
        }
        input[type=reset] {
            background-color:pink;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
                font-size:17px;
            border-radius: 30px;
        }
         .bk {
    background-color:red; 
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    border-radius: 5px;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
        </style>
</head>
<body bgcolor="#003366" background= "Images/ch.jpg" style="background-size:1280px 750px;background-repeat: no-repeat;">
<br><br>
<input action="action" type="button" value="Back" class="bk" onclick="history.go(-1);" />
    <br><br><br>
<form action="ChangePswd1" method="post" name="form" onsubmit="return val()">
        <div class="container">
        <center><font size="5" color="#F1C40F"><h2>Change Password</h2></font></center><hr>
        <font size="5" color="white">Old Password:<input type="password" name="pwd3" placeholder="Current password">
        <font size="5" color="white">New Password:<input type="password" name="pwd1" placeholder="New password">
        <font size="5" color="white">Retype New Password<input type="password" name="pwd2" placeholder="Confirm password">
        <input type="submit" value="Submit" >
        <input type="reset" value="Cancel" >
<div>
</form>
</body>
</html> 