<%-- 
    Document   : deletePMSQueue
    Created on : Jan 16, 2017, 11:45:49 AM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String pmino = request.getParameter("pmino");
    String now = request.getParameter("today");
    
    String delSql ="DELETE FROM PMS_EPISODE WHERE PMI_NO ='"+pmino+"' AND EPISODE_TIME = '"+now+"'";
    Boolean delSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, delSql);
    if(delSuccess == true){
out.print("success");
//out.print(delSql);
//out.print(delSql); 
    }else{
out.print("fail");        
    }
%>
