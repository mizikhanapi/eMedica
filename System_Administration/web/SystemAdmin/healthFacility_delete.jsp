<%-- 
    Document   : healthFacility_delete
    Created on : Feb 10, 2017, 10:45:53 AM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();

    String id = request.getParameter("hfc_cd");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_health_facility WHERE hfc_cd = '" + id + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
