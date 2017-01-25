<%-- 
    Document   : deleteRoster
    Created on : May 4, 2016, 12:04:25 PM
    Author     : Asyraf
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String e15 = request.getParameter("e15");
    String e14 = request.getParameter("e14");
    String e17 = request.getParameter("e17");
    
    if(e15.equals(e15) && e14.equals(e14) && e17.equals(e17))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_duty_roster WHERE hfc_cd = '"+ e15 +"'  AND user_id = '"+ e14 +"' AND start_date = '" + e17 + "'";

        boolean isDelete = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlDelete);
        
//        out.print(sqlDelete);
        
        if(isDelete)
        {
            response.sendRedirect("adminAppointment.jsp");
        }
    }
    else
    {
        response.sendRedirect("data not exist");
    }
%>
