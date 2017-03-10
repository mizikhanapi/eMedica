<%-- 
    Document   : destroySession
    Created on : Feb 15, 2017, 6:04:52 PM
    Author     : -D-
--%>

<%
    
    session.invalidate();
    HttpSession newSession = request.getSession(false);

    response.sendRedirect("CIS000000.jsp");
  

%>
