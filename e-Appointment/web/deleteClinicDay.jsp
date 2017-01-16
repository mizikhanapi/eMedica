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
    String e7 = request.getParameter("e7");
    String e8 = request.getParameter("e8");
    String e9 = request.getParameter("e9");
    String e10 = request.getParameter("e10");
//    out.print(e7);
//    out.print(e8);
//    out.print(e9);
//    out.print(e10);
    
    if(e7.equals(e7) && e8.equals(e8) && e9.equals(e9) && e10.equals(e10))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_clinic_day WHERE hfc_cd = '"+ e7 +"'  AND discipline_cd = '"+ e8 +"' AND subdiscipline_cd = '" + e9 + "' AND day_cd = '" + e10 + "'";

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