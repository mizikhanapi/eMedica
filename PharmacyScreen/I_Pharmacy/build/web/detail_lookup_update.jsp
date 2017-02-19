<%-- 
    Document   : detail_lookup_update
    Created on : Jan 26, 2017, 12:30:28 PM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();

    String masterCode = request.getParameter("masterCode");
    String detailCode = request.getParameter("detailCode");
    String detailDesc = request.getParameter("detailDesc");
    String priority = request.getParameter("priority");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String status = request.getParameter("status");

    startDate = DateFormatter.formatDate(startDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    endDate = DateFormatter.formatDate(endDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

    RMIConnector rmic = new RMIConnector();

    String sqlInsert = "UPDATE adm_lookup_detail set description = '" + detailDesc + "', status = '" + status + "', priority_indicator = '"+priority+"', start_date = '"+startDate+"', end_Date = '"+endDate+"'"
            + " WHERE master_reference_code = '" + masterCode + "' AND detail_reference_code = '" + detailCode + "'";

//    out.print(sqlInsert);
    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
