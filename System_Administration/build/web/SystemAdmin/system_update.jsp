<%-- 
    Document   : system_update
    Created on : Feb 7, 2017, 12:59:20 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Conn conn  = new Conn();
    
    String systemCode = request.getParameter("systemCode");
    String systemName = request.getParameter("systemName");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_system SET system_name = '"+systemName+"', status = '"+status+"'"+
                        " WHERE system_code = '"+systemCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>