<%-- 
    Document   : module_update
    Created on : Feb 7, 2017, 3:37:53 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    Conn conn = new Conn();

    String systemCode = request.getParameter("systemCode");
    String moduleCode = request.getParameter("moduleCode");
    String moduleName = request.getParameter("moduleName");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_module SET module_name = '" + moduleName + "', status = '" + status + "'"
            + " WHERE system_code = '" + systemCode + "' AND module_code = '"+moduleCode+"'";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>