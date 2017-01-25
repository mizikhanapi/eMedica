<%-- 
    Document   : TestEmail_
    Created on : Aug 11, 2016, 8:31:58 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%
            String email = json.getString("email");
            String subject = json.getString("subject");
            String message = json.getString("message");
//   String email = (String) request.getAttribute("email");
//   String subject = (String) request.getAttribute("subject");
//   String msg = (String) request.getAttribute("message");

 String id = (String) request.getAttribute("id");
   String name = (String) request.getAttribute("name");
   
   
    //String data= "Test Email Data: "+email+" "+subject+" "+msg;
    
    out.print(id+name);
   
%>
