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
    String ic = (String)session.getAttribute("ic");
    String e27 = request.getParameter("e27");
    String e32 = request.getParameter("e32");
    String e48 = request.getParameter("e48");

    RMIConnector rmic = new RMIConnector();
    String sqlUpdate = "UPDATE pms_appointment "
                + "SET status='canceled', canceled_by='"+ic+"', canceled_date=now(), canceled_reason='-' "
                + "WHERE pmi_no='"+e27+"' AND hfc_cd='"+e48+"' AND DATE(appointment_date)='"+e32+"'";

    boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);
              
    if(isUpdate)
    {
        response.sendRedirect("patientAppointment.jsp");
    }
%>
