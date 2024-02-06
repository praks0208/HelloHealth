<%@page contentType="text/html" pageEncoding="UTF-8" import="com.hellohealth.*,java.io.*,java.lang.*,java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Login</title>
    </head>
    <body>
        <%
           response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); 
           
            String user= request.getParameter("username");
           String pass=request.getParameter("password");
           String query="select * from client where Client_mail='"+user+"';";
           Statement stmt=DatabaseConnector.getStatement();
           ResultSet rs=stmt.executeQuery(query);
           if(rs.next())
            {
		String und=rs.getString(4);
		String passd=rs.getString(7);
                
                if(und.equals(user)&&passd.equals(pass))
                {
                    int id=Client_Worker.getIdByEmail(user); //session is created and pssed to rest of the forms >>imp
                    Client_Dt cd=Client_Worker.showClientById(id);
                    session.setAttribute("client",cd);
                    response.sendRedirect("c_home.jsp");
                }
                else
                {
                    response.sendRedirect("Client_Login.jsp");
                }
            }
           else
           {
           response.sendRedirect("Client_Login.jsp");
           }
       
         %>   
    </body>
</html>

