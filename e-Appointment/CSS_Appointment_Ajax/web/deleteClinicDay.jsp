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
    String day = request.getParameter("day");
    String discipline = request.getParameter("discipline");
    String hfc_code = request.getParameter("hfc_code");
    String subdiscipline = request.getParameter("subdiscipline");

    
    if(day.equals(day) && discipline.equals(discipline) && hfc_code.equals(hfc_code) && subdiscipline.equals(subdiscipline))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_clinic_day WHERE hfc_cd = '"+ hfc_code +"'  AND discipline_cd = '"+ discipline +"' AND subdiscipline_cd = '" + subdiscipline + "' AND day_cd = '" + day + "'";

        boolean isDelete = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlDelete);
        
//        out.print(sqlDelete);
        
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