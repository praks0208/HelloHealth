<%@page import="com.hellohealth.Client_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
            try{
            session.invalidate();
            }
            catch(java.lang.IllegalStateException e)
            {
                response.sendRedirect("Client_Login.jsp");
            }
        }
        try{
            session.removeAttribute("client");
            session.invalidate();
            response.sendRedirect("Client_Login.jsp");
        }
        catch(Exception n)
        {
            n.printStackTrace();
            response.sendRedirect("Client_Login.jsp");
        }
        %>
    </body>
</html>
