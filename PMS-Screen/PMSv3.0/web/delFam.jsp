<%-- 
    Document   : saveEmp
    Created on : Jan 20, 2017, 3:05:49 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String pmino = request.getParameter("pmino");
    String seqEmp = request.getParameter("seqno");
    String delSql = "delete from pms_family where pmi_no = '"+pmino+"' and FAMILY_SEQ_NO ='"+seqEmp+"' ";
    Boolean del = false;
    del = rmic.setQuerySQL(conn.HOST, conn.PORT, delSql);
    if(del==true){
        out.print("true");
    }else{
        out.print("false");
    }
%>