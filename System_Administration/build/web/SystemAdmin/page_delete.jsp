<%-- 
    Document   : page_delete
    Created on : Feb 8, 2017, 11:28:43 AM
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
    String pageCode = request.getParameter("pageCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_page WHERE system_code = '" + systemCode + "' AND module_code = '"+moduleCode+"' AND page_code = '"+pageCode+"' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
