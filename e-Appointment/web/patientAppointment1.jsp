<%
    String hfc = request.getParameter("hfc_name");
    session.setAttribute("sessionHFC", hfc);
    
    response.sendRedirect("patientAppointmentAjax.jsp");

%>