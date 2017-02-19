<%-- 
    Document   : validateSession
    Created on : Jan 19, 2017, 4:47:02 PM
    Author     : user
--%>


<% if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("../index.jsp");
    }%>
