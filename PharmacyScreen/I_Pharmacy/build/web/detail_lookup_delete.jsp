<%-- 
    Document   : detail_lookup_delete
    Created on : Jan 26, 2017, 12:27:04 PM
    Author     : user
--%>

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
    String detailCode = request.getParameter("detailCode");
    String masterCode = request.getParameter("masterCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_lookup_detail WHERE master_reference_code = '"+masterCode+"' AND detail_reference_code = '" + detailCode + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
