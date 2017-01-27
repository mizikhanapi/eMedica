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
    Conn Conn = new Conn();
    String e1 = request.getParameter("state");
    String e2 = request.getParameter("date");
    
    if(e1.equals(e1) && e2.equals(e2))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_holiday WHERE state_code = '"+ e1 +"'  AND holiday_date = '"+ e2 +"'";

        boolean isDelete = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlDelete);
       
        
        if(isDelete)
        {
            out.print("success");
        }
    }
    else
    {
        out.print("error");
    }
%>       