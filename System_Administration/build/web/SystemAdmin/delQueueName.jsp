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
    String name = request.getParameter("name");
    String hfc = request.getParameter("hfc");
    
    String sql = "delete from pms_queue_name where queue_type='"+code+"' and queue_name='"+name+"' and hfc_cd = '"+hfc+"'";
    Boolean operation = false;
    operation = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    out.print(operation);
%>