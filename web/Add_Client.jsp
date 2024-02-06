<%-- 
    Document   : Add_Client.jsp
    Created on : 17 Mar, 2023, 8:40:42 PM
    Author     : Pranav
--%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<a href="Add_Client.jsp"></a>
<META Http-Equiv="Expires" Content="0">
  <!--css links-->
  <link rel="stylesheet" href="css/common.min.css">
  <link rel="stylesheet" href="css/demo.css">
  <link rel="stylesheet" href="css/signup.css">
  <link rel="stylesheet" href="css/circle-menu.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/style.css" rel='stylesheet' type='text/css' />
  <!--bootstrap links-->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="img/2.png" type="favicon/ico" />
  <style>
  body {
      position: relative; 
 }
  #Personal {padding-top:70px;height:650px;color: #000000;background-color: rgba(16, 89, 134, 0.13);}
  #Contact {padding-top:50px;height:550px;color: #000000;background-color: rgba(16, 89, 134, 0.13);}
  #Medical {padding-top:50px;height:700px;color: #000000;background-color: rgba(16, 89, 134, 0.13);}
    </style>
        <title>Client Registration</title> 
<link rel="shortcut icon" type="image/icon" href="images/logo.png"/>
<script lang="javascript">
function ValidateEmail(inputText)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(inputText.value.match(mailformat))  
{  
document.form1.text1.focus();  
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
document.form1.text1.focus();  
return false;  
}  
} 
</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="150">
<form action="AddClient_Action.jsp" method="post" role="form">
    <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
   <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>                        
    </button>
       <a class="navbar-brand" href="index.html" title="Home">Hello Health</a>
   </div>
   
   <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
     <li><a href="#Personal">Personal</a></li>
     <li><a href="#Contact">Contact</a></li>
     <li><a href="#Medical">Medical</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="index.html"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li><a href="Client_Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
   </div>
  </div>
 </nav>  
    
 <div id="Personal" class="container-fluid">
  <h1>Personal</h1>
  <!--name-->
  <div class="container">
   <br><div class="form-group">
     <label for="usr">Name:</label>
     <input type="text" class="form-control input-lg" id="usr" name="c_name" required>
    </div>
     <!--pass-->
    <br>
    <div class="form-group">
     <label for="usr">Password:</label>
     <input type="password" name="c_password" class="form-control input-lg" id="usr" required>
    </div>
	<br><!--pass2    JAVASCRIPT   -->
    <div class="form-group">
     <label for="usr">Retype Password:</label>
     <input type="password" name="password" class="form-control input-lg" id="usr" required>
    </div>
	<!--DOB-->
    <br>
    <div class="form-group">
     <label for="usr">Date Of Birth:</label>
     <input type="date" name="c_dob" class="form-control input-lg" id="usr" required>
    </div>
	<!--Gender-->
	<br>
    <div class="form-group">
     <label for="usr">Gender:</label>
     <label><input type="radio" name="c_gender" value="Male">Male</label> <label><input type="radio" name="c_gender" value="Female">Female</label>
    </div>
   
  </div>
</div>

<!--CONTACT_DETAILS-->
<div id="Contact" class="container-fluid">
 <br><h1>Contact</h1>
 <div class="container">

	<!--City-->
   <br> <div class="form-group">
	<label for="usr">City:</label>
        <input type="text" name="c_address" class="form-control input-lg" id="usr" required>
     </div>
	 <!--Mail-->
	 <br><div class="form-group">
     <label for="usr">Email:</label>
     <input type="text" name="c_email" class="form-control input-lg" id="usr" required>
     </div>
	 <!--Phone-->
	 <br><div class="form-group">
     <label for="usr">Phone:</label>
     <input type="text" name="c_phone" class="form-control input-lg" id="usr" required>
     </div>

 </div></div>
<!--MEDICAL_DETAILS-->
<div id="Medical" class="container-fluid">
 <br><h1>Medical</h1>
 <div class="container">
  <br><div class="form-group">
   <label for="usr">Blood Group:</label>
   <input type="text" name="c_bgroup" class="form-control input-lg" id="usr">
  </div>
	<!--Height-->
  <br>
  <div class="form-group">
   <label for="usr">Height:</label>
   <input type="text" name="c_height" class="form-control input-lg" id="usr">
  </div>
	<!--Weight-->
  <br>
  <div class="form-group">
  <label for="usr">Weight:</label>
  <input type="text" name="c_weight" class="form-control input-lg" id="usr">
  </div>
  <br><br><center><input type="submit" class="btn btn-info btn-lg" value="Submit" name="submit" oncick='ValidateEmail()'></center>
</div>
 <br><br><br>
 <div class="login">
	  Copyright &copy; Hello Health
    </div>
</div>
</form>
<nav id="c-circle-nav" class="c-circle-nav">
  <button id="c-circle-nav__toggle" class="c-circle-nav__toggle">
    <span>Toggle</span>
  </button>
  <ul class="c-circle-nav__items">
    <li class="c-circle-nav__item">
        <a href="index.html" class="c-circle-nav__link" title="Home">
        <img src="img/house.svg" alt="">
      </a>
    </li>
    <li class="c-circle-nav__item">
      <a href="blog.jsp" class="c-circle-nav__link" title="Blog">
        <img src="img/blog.svg" alt="">
      </a>
    </li>
    <li class="c-circle-nav__item">
        <a href="about.html" class="c-circle-nav__link" title="About Us">
        <img src="img/about-us.svg" alt="">
      </a>
    </li>
    <li class="c-circle-nav__item">
      <a href="contact.html" class="c-circle-nav__link"title="Contact Us">
        <img src="img/phone-call.svg" alt="">
      </a>
    </li>
    <li class="c-circle-nav__item">
      <a href="#" class="c-circle-nav__link">
        <img src="img/tools.svg" alt="">
      </a>
    </li>
  </ul>
</nav>
<script src="js/circleMenu.min.js"></script>
<!--footer-->
	
<script type="text/javascript">
		$("h1").fitText(1.1, { minFontSize: '25px', maxFontSize: '50px' });
	</script>
</body>
</html>
