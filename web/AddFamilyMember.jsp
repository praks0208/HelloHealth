<%-- 
    Document   : AddFamilyMember
    Created on : 18 Mar, 2023, 2:10:53 PM
    Author     : Pranav
--%>

<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!---->

<!--csslinks-->
<link href="css/mycss.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/common.css">
<!---->
<link rel="shortcut icon" href="img/logo.jpg" type="favicon/ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Hello Health :Family</title>
    <style>
        body{
        background-image: url("img/bgf.jpg");
    }
            label{font-size: 30px;
            
            font-family: Candara, Calibri, Segoe, 'Segoe UI', Optima, Arial, sans-serif;
}
td{font-size: 20px;
            text-align: center;
            font-family: Candara, Calibri, Segoe, 'Segoe UI', Optima, Arial, sans-serif;
    
} 
        </style>
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
                    System.out.println(cd.getC_name());
            
                }
            else
            {
            
                session.invalidate();
                response.sendRedirect("Client_Login.jsp");
            }
        %>
        <div class="container-fluid">
    <div class="header">
    </div>
</div>
<div id="sidebar_btn">
  <img src="img/menu.png" class="img-circle" width="100" height="100">
</div>
<div id="sidebar">
 <ul>
    <li><a href="c_home.jsp" title="Home"><img src="img/home.png" class="img-cirlce" width="100" height="100"></a></li>
    <li><a href="Add_Feedback.jsp" title="Feedback"><img src="img/blog.png" class="img-circle" width="100" height="100"></a></li>
    <li><a href="ViewClientProfile.jsp" title="Profile"><img src="img/update2.png" class="img-circle" width="100" height="100"></a></li>
    <li><a href="Client_logout.jsp" title="Logout"><img src="img/logout.png" class="img-circle" width="100" height="100"></a></li>
  </ul>
</div>
<script>
$(document).ready(function(){
 $('#sidebar_btn').click(function()
{$('#sidebar').toggleClass('visible');
});
});
</script> 
<div class="contentcp">
     <div class="clientcontent">
        <form action="AddFamilyMember_Action.jsp" method="post">
          <div class="form-group">     
     
         
     <label for="usr">Name:</label>
     <input type="text" class="form-control input-lg" id="usr" name="mem_name" required><br>
    
     <label for="usr">Date Of Birth:</label>
     <input type="date" class="form-control input-lg" id="usr" name="mem_dob" required><br>
          
      <label for="usr">Blood Group:</label>
     <input type="text" class="form-control input-lg" id="usr" name="mem_bg"><br>
         
     <label for="usr">Height:</label>
     <input type="text" class="form-control input-lg" id="usr" name="mem_height"><br>
     
     <label for="usr">Weight:</label>
     <input type="text" class="form-control input-lg" id="usr" name="mem_weight"><br>
     
     <label for="usr">Gender:</label>
     <label><input type="radio" name="mem_gender" value="Male" required>Male</label> <label><input type="radio" name="mem_gender" value="Female" required>Female</label>
     <br>
          <center><input type="submit" name="action" value="Submit"></center>
          <br>
          </div>
         </form>
     </div>
</div>
    <div class="footer">
	<div class="copy">
	  <div class="container">
        <div class="component">
        <a href="#" class="icon icon-cube facebook">facebook</a>
        <a href="#" class="icon icon-cube twitter">twitter</a>
        <a href="#" class="icon icon-cube googleplus">google+</a>
        </div>
      </div>
	  <br><p>Copyright &copy; Hello Health</p>
    </div>
</div>
    </body>
</html>

