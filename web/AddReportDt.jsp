<%-- 
    Document   : AddReportDt
    Created on : 19 Mar, 2023, 1:14:56 PM
    Author     : Pranav
--%>

<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello Health</title>
        <style>
    body{
        background-image: url("img/bgf.jpg");
    }
</style>
    </head>
    <body>
        <%
            int f_id=Integer.parseInt(request.getParameter("f_name"));
            String rname=request.getParameter("rep_name");
            String rdate=request.getParameter("rep_dob");
            String rtdate=request.getParameter("rep_test_dt");
            
            Reports_Dt rd=new Reports_Dt();
            rd.setRep_c_id(f_id);
            rd.setRep_date(rdate);
            rd.setRep_tdate(rtdate);
            rd.setRep_name(rname);
            String result=Reports_Worker.addReport(rd);
            if(result.equals(Results.Success))
            {
                response.sendRedirect("AddReport.jsp");
                
            }
            else
            {
                response.sendRedirect("Error.jsp");
            }
        
        %>
    </body>
</html>

