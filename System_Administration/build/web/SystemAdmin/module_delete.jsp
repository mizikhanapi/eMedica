<%-- 
    Document   : module_delete
    Created on : Feb 7, 2017, 3:51:34 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    
    String moduleCode = request.getParameter("moduleCode");
    String systemCode = request.getParameter("systemCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_module WHERE system_code = '" + systemCode + "' AND module_code = '"+moduleCode+"' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>

