<%-- 
    Document   : updateLeaveApprove
    Created on : May 6, 2016, 1:28:29 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String e22 = request.getParameter("e22");
    String e23 = request.getParameter("e23");
    String e24 = request.getParameter("e24");
    String username = (String)session.getAttribute("username");
    
//    out.print(e22);
//    out.print(e23);
//    out.print(e24);
//    out.print(username);
    
    
    if(e23.equals(username))
    {
        %><script language='javascript'>
            window.location= 'adminAppointment.jsp?error=You are not allow to approve leave for yourself as you are admin. Please ask other admin to do so';
        </script> <%
    }
    else
    {
        if(e22.equals(e22) && e23.equals(e23) && e24.equals(e24))
        {
            RMIConnector rmic = new RMIConnector();
            String sqlUpdate = "UPDATE pms_staff_leave "
                    + "SET status = 'approve', approved_by = '" + username + "', approved_date = now() "
                    + "WHERE user_id='" + e23 + "' AND hfc_cd='" + e22 + "' AND start_leave_date='" + e24 + "'";

            boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);


            if(isUpdate)
            {
                %><script language='javascript'>
                    window.location= 'adminAppointment.jsp?error=Successfully approved this staff leave application';
                </script> <%
            }
        }
        else
        {
            response.sendRedirect("data not exist");
        }
    }

%>
