<%-- 
    Document   : destroySession
    Created on : Feb 13, 2017, 10:47:22 AM
    Author     : -D-
--%>

<%
    
    session.invalidate();
    HttpSession newSession = request.getSession(false);

    response.sendRedirect("login.jsp");
  

%>
