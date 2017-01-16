<%-- 
    Document   : connectDB
    Created on : Nov 24, 2016, 2:35:33 PM
    Author     : user
--%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Connection con = null;
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/servercis","root","qwerty");
  
                
      

              //  out.println("Connected!");
               
            }catch(Exception e){
            
                out.print(e);
            }
        %>
    </body>
</html>
