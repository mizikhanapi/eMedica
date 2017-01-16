<%-- 
    Document   : addHoliday
    Created on : Apr 6, 2016, 10:41:42 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
        String state_code = request.getParameter("state_code");
        String hfc_code = request.getParameter("hfc_code");
        String discipline = request.getParameter("discipline");
        String subdiscipline = request.getParameter("subdiscipline");
        String day = request.getParameter("day");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String status = request.getParameter("status");
        String username = (String)session.getAttribute("username");
//        out.print(hfc_code);
//        out.print(discipline);
//out.print(subdiscipline);
//out.print(day);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "INSERT INTO pms_clinic_day (hfc_cd, discipline_cd,subdiscipline_cd, day_cd, start_time, end_time, state_code, status, created_by, created_date) "
                        + "VALUES ('" + hfc_code + "' , '" + discipline + "','" + subdiscipline + "','" + day + "','" + starttime + "','" + endtime + "','" + state_code + "','active', '" + username + "', now())";

        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);

        
         if (isInsert) 
            {
                %><script language='javascript'>
                    window.location= 'adminAppointment.jsp?error=Insert clinic day succesful';
                </script> <%
            } else 
            {
                %><script language='javascript'>
                    window.location= 'adminAppointment.jsp?error=Insert clinic day fail due to data may exist';
                </script> <%
            }
        

        
%>
