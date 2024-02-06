<%-- 
    Document   : AddRepoDt
    Created on : 19 Mar, 2023, 12:58:07 PM
    Author     : Prasanna
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello Health :Reports</title>
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
<style>
    body{
        background-image: url("img/bgf.jpg");
    }
</style>

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
<%
        int cid=cd.getClient_id();
        Client_Dt c=Client_Worker.showClientById(cid);
        int fid=c.getFam_id();
        ArrayList<FamilyMember_Dt> list=new ArrayList<FamilyMember_Dt>();
                list=FamilyMember_Worker.getAllF_Members(fid);
                
    
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
<div class="content1">
    <div class="clientcontent">
        <a href="show_Reports.jsp" title="Show Reports">Show Earlier Reports</a>
    <form action="AddReportDt.jsp" method="post">
        <label for="usr">Please select the Family Member to whom the report belongs correctly as this details cannot be edited after you select it:</label>
        <select name="f_name" class="form-control input-lg" id="usr">
          
            <% for(FamilyMember_Dt fd:list){%><option value="<%=fd.getMem_id()%>"><%=fd.getM_name()%></option>
    <%}%>
    </select>
    <br>
    <label for="usr">Enter Report name:</label>
    <input type="text" class="form-control input-lg" id="usr" name="rep_name" required><br>

      <label for="usr">Enter the Date:</label>
     <input type="date" class="form-control input-lg" id="usr" name="rep_dob"><br>
    
     <label for="usr">Enter the test-Date:</label>
     <input type="date" class="form-control input-lg" id="usr" name="rep_test_dt"><br>
     
     <center><input type="submit" class="btn-lg" value="Next" name="next"></center>
     
    </form>
    </div>
</div>

<script>
$(document).ready(function(){
 $('#sidebar_btn').click(function()
{$('#sidebar').toggleClass('visible');
});
});
</script>
<!--Footer-->
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
 <!--footer-->		

    </body>
</html>

