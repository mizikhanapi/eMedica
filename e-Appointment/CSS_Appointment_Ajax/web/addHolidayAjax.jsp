<%-- 
    Document   : addHoliday
    Created on : Apr 6, 2016, 10:41:42 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
        String state_code = request.getParameter("state");
        String holiday_date = request.getParameter("date");
        String holiday_desc = request.getParameter("desc");
        String holiday_type = request.getParameter("appTo");
        String status = request.getParameter("status");
        String username = (String)session.getAttribute("username");
        
        
//        out.print(state_code);
//        out.print(holiday_date);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "INSERT INTO pms_holiday (state_code, holiday_date,holiday_desc, holiday_type, status, created_by, created_date) "
                        + "VALUES ('" + state_code + "' , '" + holiday_date + "','" + holiday_desc + "','" + holiday_type + "','active', '" + username + "', now())";

        
        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
        if (isInsert) 
        {
            out.print("success");
        } else 
        {
           out.print("error");
        }

%>
