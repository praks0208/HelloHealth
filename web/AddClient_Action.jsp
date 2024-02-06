<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Registration</title>
         <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!---->

<!--css links-->
<link rel="stylesheet" href="css/circle-menu.min.css">
<link rel="stylesheet" href="css/demo.css">
<!---->

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img/logo.jpg" type="favicon/ico" />
    </head>
    <body bgcolor="#000000">
        <%
                          
            //fetch values from form
            String name=request.getParameter("c_name");
            String date=request.getParameter("c_dob");
            String email=request.getParameter("c_email");
            String phone=request.getParameter("c_phone");
            String address=request.getParameter("c_address");
            String password=request.getParameter("c_password");
            String bgroup=request.getParameter("c_bgroup");
            int height=Integer.parseInt(request.getParameter("c_height"));
            int weight=Integer.parseInt(request.getParameter("c_weight"));
            String gender=request.getParameter("c_gender");
            
            //Create A Family
            Family_Dt fd= new Family_Dt();
            fd.setF_creator(name);
            Family_Worker.addFamily(fd);
            
            //Create A Client
            int fid=Family_Worker.getMaxId();
            Client_Dt cd = new Client_Dt();
            cd.setC_name(name);
            cd.setC_dob(date);
            cd.setC_mail(email);
            cd.setC_phone(phone);
            cd.setC_address(address);
            cd.setC_pass(password);
            cd.setC_bg(bgroup);
            cd.setC_height(height);
            cd.setC_weight(weight);
            cd.setC_gender(gender);
            cd.setC_user(name);
            cd.setFam_id(fid);

            //call worker methods to set values to the query
            Client_Worker.addClient(cd);

            FamilyMember_Dt md = new FamilyMember_Dt();
            md.setM_F_id(fid);
            md.setM_name(name);
            md.setM_bgroup(bgroup);
            md.setM_dob(date);
            md.setM_gender(gender);
            md.setM_height(height);
            md.setM_weight(weight);
            FamilyMember_Worker.addF_Member(md);
            
            //Result Evaluation
            //if(result.equals(Results.SUCCESS))
    //{
    //response.sendRedirect("index.jsp");
    //}
    //else
    //{
    //    response.sendRedirect("Add_Client.jsp");
    //}
%>
 

<!----start-header---->
<div class="jumbotron " id="home"> 
    <div class="container">
        <center><h1 id="j">Hi &nbsp;<%=cd.getC_name()%> !!!&nbsp;&nbsp;You can now &nbsp;&nbsp;<a href="Client_Login.jsp" title="Login"><img src="img\Login.png" height="200" width="200"></a>&nbsp;&nbsp;to Continue....</h1></center>
    </div>
</div>
<!----end-header---->

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
      <a href="blog.html" class="c-circle-nav__link" title="Blog">
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
<div class="footer">
    
	  <div class="copy">
	    <div class="container">
			  
                          <center> 
                          <table>
                               <tr> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td>  </td> <td>  </td><td>  </td><td>  </td> </tr>
                               <tr>    
                                   <td colspan="6"><h1>&nbsp;Please do Visit us at: &nbsp;</h1></td>
                                   <td>&nbsp;<a href="https://www.facebook.com/" class="icon icon-mono facebook" title="facebook">facebook</a>&nbsp;</td>
                                   <td>&nbsp;<a href="https://twitter.com/?lang=en" class="icon icon-mono twitter" title="twitter">twitter</a>&nbsp;</td>
                                   <td>&nbsp;<a href="https://plus.google.com/" class="icon icon-mono googleplus" title="Google+">google+</a>&nbsp;</td>                             
                               </tr>
                             </table>
                          </center>
                           
             </div>
             <br> <p>Copyright &copy; Hello Health</p>
	  </div>
	 </div>
 <!--footer-->	
<script type="text/javascript">
		$("j").fitText(1.1, { minFontSize: '30px', maxFontSize: '75px' });
	</script>
    </body>
</html>
