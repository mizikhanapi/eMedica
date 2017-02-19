<%-- 
    Document   : delQueueType
    Created on : Feb 8, 2017, 12:42:51 PM
    Author     : shay
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String code = request.getParameter("cd");
    String sql = "delete from pms_queue_type where queue_type = '"+code+"'";
    Boolean operation = false;
    operation = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    out.print(sql);
%>