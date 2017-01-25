<%-- 
    Document   : deleteHoliday
    Created on : Apr 7, 2016, 2:48:04 AM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
        RMIConnector rmic = new RMIConnector();
        String sqlUpdate = "UPDATE pms_appointment "
                + "SET status='inactive' "
                + "WHERE appointment_date < now()";

        boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);
        
        if(isUpdate)
        {
            %><script language='javascript'>
                alert('Successfully updated absent patient'); 
                window.location= 'adminAppointment.jsp';
            </script> <%
        }

%>       