<%-- 
    Document   : AddReport
    Created on : 19 Mar, 2023, 1:20:11 PM
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.hellohealth.*,java.io.*,java.lang.*,java.sql.*,java.util.* "%>
<!DOCTYPE html>
<html>
<head>

<link rel="shortcut icon" href="../Icons/Logo.png" type="favicon/ico" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <link rel="stylesheet" href="..\css\admin.css">
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
<link rel="shortcut icon" href="img/logo.jpg" type="favicon/ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="..\css\index.js"></script>
    <%String msg = (String)session.getAttribute("alertMsg"); %>
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
        session.setAttribute("rep_name",request.getParameter("rep_name"));
        session.setAttribute("rep_dob",request.getParameter("rep_dob"));
        session.setAttribute("rep_t_dt",request.getParameter("rep_test_bg"));
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
  <form method="post" enctype="multipart/form-data" action="TempImgReportAction.jsp">
   
  <div class='col-lg-5'>
    
      <label for="usr">Please select the Family Member to whom the report belongs correctly as this details cannot be edited after you select it:</label>
        <select name="f_name" class="form-control input-lg" id="usr">
          
            <% for(FamilyMember_Dt fd:list){%><option value="<%=fd.getMem_id()%>"><%=fd.getM_name()%></option>
    <%}%>
    </select>

<br>
    <label for="usr">Enter Report name:</label>
     <input type="text" class="form-control input-lg" id="usr" name="rep_name"><br>
     
     <label for="usr">Enter the Date:</label>
     <input type="date" class="form-control input-lg" id="usr" name="rep_date"><br>
     
     <label for="usr">Enter the test-Date:</label>
     <input type="date" class="form-control input-lg" id="usr" name="rep_test_dt"><br>
     
  </div>
   
       <div class="upload">
           <input type="file" name="fileimage1" required>
       </div>
       <div class="upload">
       <input type="file" name="fileimage2">
       </div>
       <div class="upload">
       <input type="file" name="fileimage3">
       </div>
          <div class="upload">   
       <input type="file" name="fileimage4">
          </div>
   </div> 
     <center><input type="submit" class="styled-button-1" value="add" name="action"></center>
    
   </form>
  </div>

   
<script>
$(document).ready(function(){
 $('#sidebar_btn').click(function()
{$('#sidebar').toggleClass('visible');
});
});
</script>

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

