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
        String state_code = request.getParameter("state_code");
        String holiday_date = request.getParameter("holiday_date");
        String holiday_desc = request.getParameter("holiday_desc");
        String holiday_type = request.getParameter("holiday_type");
        String status = request.getParameter("status");
        String username = (String)session.getAttribute("username");
        
        
//        out.print(state_code);
//        out.print(holiday_date);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "INSERT INTO pms_holiday (state_code, holiday_date,holiday_desc, holiday_type, status, created_by, created_date) "
                        + "VALUES ('" + state_code + "' , '" + holiday_date + "','" + holiday_desc + "','" + holiday_type + "','active', '" + username + "', now())";

        out.print(sqlInsert);
//        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
//
////                  out.print(sqlInsert);
////                  out.print("|"+isInsert+"|");
////                  if (true) { return; }
//        if (isInsert) 
//        {
//            %><script language='javascript'>
//                window.location= 'adminAppointment.jsp?error=Insert holiday succesful';
//            </script> <%
//        } else 
//        {
//            %><script language='javascript'>
//                window.location= 'adminAppointment.jsp?error=Insert holiday fail due to data may exist';
//            </script> <%
//        }

%>
