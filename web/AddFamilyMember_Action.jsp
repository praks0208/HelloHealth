<%@page import="com.hellohealth.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello Health</title>
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
                          
            int f_id=Client_Worker.getF_IdById(cd.getClient_id());
            Family_Dt fd=new Family_Dt();
            fd.setFamily_id(f_id);
            Family_Worker.AddFamilyMember(fd);
            
            //fetch values from form
            String name=request.getParameter("mem_name");
            String date=request.getParameter("mem_dob");
            String bgroup=request.getParameter("mem_bg");
            int height=Integer.parseInt(request.getParameter("mem_height"));
            int weight=Integer.parseInt(request.getParameter("mem_weight"));
            String gender=request.getParameter("mem_gender");
            
                        
            //Add Family Member
            FamilyMember_Dt md = new FamilyMember_Dt();
            md.setM_F_id(f_id);
            md.setM_bgroup(bgroup);
            md.setM_dob(date);
            md.setM_gender(gender);
            md.setM_height(height);
            md.setM_weight(weight);
            md.setM_name(name);

            //call worker methods to set values to the query
            String result=FamilyMember_Worker.addF_Member(md);

            //Result Evaluation
            if(result.equals(Results.Success))
            {
                response.sendRedirect("ShowFamily_Members.jsp");
    }
    //else
    //{
    //    response.sendRedirect("Add_Client.jsp");
    //}
%>
    </body>
</html>
