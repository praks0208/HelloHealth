<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hello Health</title>

<!--bootstrap links-->
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
<link rel="shortcut icon" href="img/2.png" type="favicon/ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script language="JavaScript">
<!--
$(document).ready(function() {
        function disableBack() { window.history.forward(); }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack(); };
    });
function calculateBmi() {
var weight = document.bmiForm.weight.value;
var height = document.bmiForm.height.value;
if(height > weight)
{
alert("It seems you interchanged the values")
}
else{
if(weight > 0 && height > 0){	
var finalBmi = weight/(height/100*height/100);
document.bmiForm.bmi.value = finalBmi;
}
else{
alert("Please Fill in everything correctly")
}
}
}
//-->
</script>
</head>
<body>
<%
     String client="";
        Object o=session.getAttribute("client");
 

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
    <li><a href="#" title="Home"><img src="img/home.png" class="img-cirlce" width="100" height="100"></a></li>
    <li><a href="Add_Feedback.jsp" title="Feedback"><img src="img/blog.png" class="img-circle" width="100" height="100"></a></li>
    <li><a href="Show_ClientProfile.jsp" title="Profile"><img src="img/update2.png" class="img-circle" width="100" height="100"></a></li>
    <li><a href="Client_logout.jsp" title="Logout"><img src="img/logout.png" class="img-circle" width="100" height="100"></a></li>
  </ul>
</div>
<div id="welcome" class="client">
<hr><hr><span class="glyphicon glyphicon-thumbs-up"></span> Hi &nbsp;<%=cd.getC_name()%> !!!
<hr><hr>
<div id="links">
    <div id="img1"><a href="ManageFamily.jsp" title="Manage Family"><img src="img/fanager.png"  class="btn-lg" height="300" width="350"></a></div>
    <div id="img2"><a href="ManageReports.jsp" title="Manage Reports"><img src="img/Ranager.png" class="btn-lg" height="300" width="350"></a></div>   
</div>
<hr><hr>
<div id="links2">
    <div id="img1"><a href="ManageReminders.jsp" title="Reminder System"><img src="img/Timer.png" class="btn-lg" height="300" width="350"></a></div>
    <div id="img2"><a href="AddGuider.jsp" title="Vaccine Guider"><img src="img/Picture1.png" class="btn-lg" height="300" width="350"></a></div>
</div>
<hr><hr>
</div>

<script>
$(document).ready(function(){
 $('#sidebar_btn').click(function()
{$('#sidebar').toggleClass('visible');
});
});
</script>
<!--Footer-->
<div class="footer" id="client" >
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
 <!--footer-->		
<script type="text/javascript">
		$("h1").fitText(1.1, { minFontSize: '25px', maxFontSize: '75px' });
	</script>

</body>
</html>
