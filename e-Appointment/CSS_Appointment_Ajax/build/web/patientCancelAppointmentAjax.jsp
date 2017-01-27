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
    String ic = (String)session.getAttribute("ic");
    String PMI_NO = request.getParameter("pmiNo");
    String HFC_CODE = request.getParameter("hfcCode");
    String DATE = request.getParameter("date");
    

    RMIConnector rmic = new RMIConnector();
    String sqlUpdate = "UPDATE pms_appointment "
                + "SET status='canceled', canceled_by='"+ic+"', canceled_date=now(), canceled_reason='-' "
                + "WHERE pmi_no='"+PMI_NO+"' AND hfc_cd='"+HFC_CODE+"' AND DATE(appointment_date)='"+DATE+"'";

    boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);
              
    if(isUpdate)
    {
        out.print("canceled");
    }
%>
