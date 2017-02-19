<%-- 
    Document   : master_lookup_delete
    Created on : Jan 25, 2017, 6:27:52 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();

    String id = request.getParameter("masterCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_lookup_master WHERE master_reference_code = '" + id + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
