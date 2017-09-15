<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login Page</title>
        <script type="text/javascript">
            
            function valid()
            {
                var Email_id=document.getElementById('Email_id').value;
                var pass=document.getElementById('password').value;
                if(Name == "" && pass == "")	
                {
                    alert("please enter all fields");
                    return false;
                }
                else if(Email_id == "")
                {
                    alert("please enter Email id");
                    return false;
                }
                else if(pass == "")
                {
                    alert("please enter password");
                    return false;
                }
            }
        </script>
        <style type="text/css">
            .login{ 
                position: absolute;
                top: 50%;
                left: 30%;
                margin: -150px 0 0 -150px;
                width:300px;
                height:300px;
                
            }
            .login h1 { color: red; letter-spacing:1px; text-align:center; }
            .lg {
                
                background-color:#44c767;
	        -moz-border-radius:28px;
	        -webkit-border-radius:28px;
	        border-radius:28px;
	        border:1px solid #18ab29;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:Arial;
	        font-size:17px;
	       padding:16px 31px;
	       text-decoration:none;
	        text-shadow:0px 1px 0px #2f6627;
                
            } 
            .lg:hover {
	                 background-color:#5cbf2a;
                       }
            .lg:active {
	                   position:relative;
	                    top:1px;
                          }
.myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:16px 31px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton:hover {
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}
 .un,.pw{
                    color:#FFFF00;
                    font-weight: bold;
                    font-size: 120%; 
                }
        .testbox {
          
          }
        
        </style>
    </head>
    <body  background= "Images/ln.jpg" style="background-size:1400px 650px;background-repeat: no-repeat;">
          <marquee behavior="alternate"  SCROLLDELAY=150><img  src="Images/f3.png" align="right" height="150" width="200"/></marquee>
        <div class="login">
            <h1>Login</h1>
            <form onsubmit="return valid();"  name="sign" action="LoginServlet1"  method="processRequest"  >
                
                <div class="un">Email_id:</br><input type="text" id="Email_id" size="50" name="Email_id" placeholder="Enter your Email_id..."/></div></br>
                <div class="pw">Password:</br><input type="password" id="password" size="50"  name="password" placeholder="Enter your Password..."/></div></br>
                <input type="submit" name="submit" class="lg" value="Login"  /> 
                <a href="Signup1.jsp" class="myButton">New Register</a>
               </form>          
        </div>
    </body>
</html>
