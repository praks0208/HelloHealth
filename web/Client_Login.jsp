<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.hellohealth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client_Login</title>
        <script type="text/javascript">
          
        function validateForm() 
        {
             if((document.getElementById('username').value) == "Mail" ||(document.getElementById('password').value) == "Password") 
            {
                alert("Please fill in all the details");
                return false;
            }
            else
            {
                return true; 
            }
            
        }
       </script>

<!--bootstrap links-->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!---->

<!--csslinks-->
<link href="css/mycss.css" rel='stylesheet' type='text/css' />

<!---->
<link rel="shortcut icon" href="2.png" type="favicon/ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<%
        String client="";
        Object o=session.getAttribute("client");
 
        response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        Client_Dt cd=new Client_Dt();
 
        if(o!=null)
            {
                
                cd=(Client_Dt)o;
                System.out.println("not null");
                response.sendRedirect("c_home.jsp");
            }
        else
        {
            
            session.invalidate();
            System.out.println("null");
        }
        
%>
    
    <div class="container-fluid">

<div id="sidebar_btn">
  <img src="img/menu.png" class="img-circle" width="200" height="200">
 </div>
 <div id="signin"> 
       <a href="Add_Client.jsp" title="Sign Up"><img src="img/signup.png" class="img-circle"/></a>
   </div>
<div id="sidebar">
 <ul>
    <li><a href="index.html" title="Home"><img src="img/home.png" class="img-cirlce"></a></li>
    <li><a href="blog.html" title="Blog"><img src="img/blog.png" class="img-circle"></a></li>
    <li><a href="about.html" title="About Us"><img src="img/about.png" class="img-circle"></a></li>
    <li><a href="contact.html" title="Contact"><img src="img/contact.png" class="img-circle"></a></li>
  </ul>
</div>
<div id="login">
<hr><font color="white">CLIENT LOGIN</font>
<form name="myform" onSubmit= "return validateForm();" action="ClientLogin_Action.jsp" method="post">
	      	<input type="text" name="username" id="username" class="user" value="Mail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Mail';}" />
	      	<input type="password" name="password" id="password" class="pass" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" />
	      	
                <!--<label><a href="forgotpassword.jsp" title="Forgot Password">Forgot Password? Click Here</a></label>-->
		          	<input type="submit" value="LOGIN" name="login"/>
	 	</form>
<hr>
<p> <div class="login"><font color="black">Copyright &copy; Hello Health</font></div>
    
</div>
<script>
$(document).ready(function(){
        $('#sidebar_btn').click(function()
        {$('#sidebar').toggleClass('visible');
        });
        });  
</script>
</div>
 <!--footer-->		
</body>
</html>
