<%-- 
    Document   : role_update
    Created on : Feb 16, 2017, 12:38:23 PM
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
    
    String roleCode = request.getParameter("roleCode");
    String roleName = request.getParameter("roleName");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_role SET role_name = '"+roleName+"', status = '"+status+"'"+
                        " WHERE role_code = '"+roleCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>