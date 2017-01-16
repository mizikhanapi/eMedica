<%-- 
    Document   : deleteHoliday
    Created on : Apr 7, 2016, 2:48:04 AM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String e1 = request.getParameter("e1");
    String e2 = request.getParameter("e2");
    
    if(e1.equals(e1) && e2.equals(e2))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_holiday WHERE state_code = '"+ e1 +"'  AND holiday_date = '"+ e2 +"'";

        boolean isDelete = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlDelete);
        
//        out.print(sqlDelete);
        
        if(isDelete)
        {
            %>
                <script language='javascript'>
                window.location= 'adminAppointment.jsp';
                </script> 
            <%
        }
    }
    else
    {
        response.sendRedirect("data not exist");
    }
%>       