<%-- 
    Document   : Exdate
    Created on : May 25, 2017, 10:27:33 AM
    Author     : Administrator
--%>

<%@ page import ="java.sql.*" %>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ravi22");
HttpSession session1=request.getSession(false);    
	String role=(String)session1.getAttribute("name");
System.out.println("mob session="+role);
String nul="null";
String admin="select sum(qty) as qq,sum(amt) as itm_amt from cart1 where u_id=? and payment_status=?";
PreparedStatement prs=con.prepareStatement(admin);
prs.setString(1,role);
prs.setString(2,nul);
ResultSet rs=prs.executeQuery();
if(rs.next())
{
	
	String res_item_qty=rs.getString("qq");
	System.out.println("quantity is:"+res_item_qty);
	String res_i=rs.getString("itm_amt");
	System.out.println("quantity is:"+res_i);
}
String admin1="select * from cart1 where u_id=? and payment_status=?";
PreparedStatement prs1=con.prepareStatement(admin1);
prs1.setString(1,role);
prs1.setString(2,"null");

ResultSet rs1=prs1.executeQuery();
String  ids="";
while(rs1.next())
{
	if(ids!="")
		ids=ids+",";
	ids=ids+(rs1.getString("cart_id"));
}
System.out.println("Ids are :"+ids);

%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        OSS
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
   <link href="css/font-awesome.css" rel="stylesheet">
     <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

   
    <link href="css/custom.css" rel="stylesheet">

    <script src="assets/jquery-1.9.0.min.js"></script>
   
   <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">

	<script type="text/javascript">
$(window).on("load",function(){
	disableddate();
});
var disableddate=function()
{

	
	var qt=document.form1.qty1.value;
	if(qt<10)
	{
	var today=new Date();
	var dis_date=(today.getFullYear())+"-"+((today.getMonth()+1)<10 ? "0"+(today.getMonth()+1):(today.getMonth()+1))+"-"+(today.getDate()+2);
	$("#seldate").attr('min',dis_date);
	}
	else if(qt<20||qt>20)
	{
    var today=new Date();
	var dis_date=(today.getFullYear())+"-"+((today.getMonth()+1)<10 ? "0"+(today.getMonth()+1):(today.getMonth()+1))+"-"+(today.getDate()+4);
	$("#seldate").attr('min',dis_date);
    }  
	
	};
</script>



</head>

<body>

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
  <!--  <div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer of the day</a>  <a href="#">Get flat 35% off on orders over Rs.10,000/-</a>
            </div>
           
		  </div>
    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="home.jsp" data-animate-hover="bounce">
                     <img src="img/logo1.PNG" alt="sweets" class="hidden-xs">
                    <img src="img/logo1.PNG" alt="sweets" class="visible-xs"><span class="sr-only">OSS - go to homepage</span>
                 </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                   
               </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class=""><a href="home.jsp">Home</a>
                    </li>
					<li class="">
                        <a href="traditional.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">traditional</a>
                   </li>
					<li class="">
                        <a href="ghee.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">ghee</a>
                   </li>
				   <li class="">
                        <a href="cashew.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">cashew</a>
                   </li>
				   <li class="">
                        <a href="milk.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">Milk</a>
                   </li>
				     <li class="">
                        <a href="customer-orders.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">my orders</a>
                   </li>
				   <li class="">
                        <a href="logout.jsp" class="" data-toggle="" data-hover="dropdown" data-delay="200">logout</a>
                   </li>
				<!--    <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="itemqty2.jsp" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span></a>
                </div>
			-->	   
                    </ul>
                    

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">
			
                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="itemqty2.jsp" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span></a>
                </div>
				           
                <!--/.nav-collapse -->

               

            </div>

            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Checkout - Address</li>
                    </ul>
                </div>

                <div class="col-md-9" id="checkout">

                    <div class="box">
                        <form method="post" name="form1" action="checkout13.jsp">
                            <h1>Address</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
								 <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment</a>
                                </li>
                            
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="Address">Address</label>
                                            <input type="text" class="form-control" name="address" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="Name">Name</label>
                                            <input type="text" class="form-control" name="name" required>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="city">city</label>
                                            <input type="text" class="form-control" name="city" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="zip">ZIP</label>
                                            <input type="number" required class="form-control" name="zip">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="mobilenumber">Mobile Number</label>
                                            <input type="number" class="form-control" required name="mobilenumber">
                                        </div>
                                    </div>
                         <div class="col-sm-6 col-md-3">
                              <div class="form-group">
                                    <label for="select delivery date">Select Delivery Date</label>
                                    <input type="date" class="form-control" name="del_date" id="seldate" required>
                               </div>
                          </div>

                                  
                                </div>
                                <!-- /.row -->
                            </div>
<input type="text" value="<%=rs.getString(1)%>" hidden name="qty1" id="qty1">
<input type="text" value="<%=rs.getString(2)%>" hidden name="amt">
<input type="text" value="<%=ids%>" hidden name="ids">


                            <div class="box-footer">
                                <div class="pull-left">
                         <!--           <a href="basket.html" class="btn btn-default"><i class="fa fa-chevron-left"></i>Back to basket</a>
                             -->   </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Continue<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col-md-9 -->

                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

        <!-- *** FOOTER ***
 _________________________________________________________ -->
      

        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
        <div id="copyright">
            <div class="container">
                <div class="col-md-6">
                    <p class="pull-left">© 2017 Your name goes here.</p>

                </div>
                <div class="col-md-6">
                    <p class="pull-right">Template by <a href="https://bootstrapious.com/e-commerce-templates">krkteam@creative.com</a>
                         <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                    </p>
                </div>
            </div>
        </div>
        <!-- *** COPYRIGHT END *** -->



    </div>
    <!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>






</body>

</html>