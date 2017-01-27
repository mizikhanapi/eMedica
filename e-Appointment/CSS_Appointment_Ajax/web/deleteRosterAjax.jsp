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
    Conn Conn = new Conn();
    String  staffId = request.getParameter("staffId");
    String hfc = request.getParameter("hfc");
    String startDate = request.getParameter("startDate");
    
    if(staffId.equals(staffId) && hfc.equals(hfc) && startDate.equals(startDate))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_duty_roster WHERE hfc_cd = '"+ hfc +"'  AND user_id = '"+ staffId +"' AND start_date = '" + startDate+ "'";

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
