<%-- 
    Document   : page_update
    Created on : Feb 8, 2017, 11:26:07 AM
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
    String pageCode = request.getParameter("pageCode");
    String pageName = request.getParameter("pageName");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_page SET page_name = '" + pageName + "', status = '" + status + "'"
            + " WHERE system_code = '" + systemCode + "' AND module_code = '"+moduleCode+"' AND page_code = '"+pageCode+"'";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>