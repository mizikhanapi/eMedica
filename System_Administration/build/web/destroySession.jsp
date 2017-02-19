<%-- 
    Document   : destroySession
    Created on : Aug 13, 2016, 10:26:29 AM
    Author     : user
--%>

<%
    
    session.invalidate();
    HttpSession newSession = request.getSession(false);

    response.sendRedirect("index.jsp");
  

%>
