<%-- 
    Document   : pmiGen
    Created on : Jan 23, 2017, 7:00:23 PM
    Author     : shay
--%>
<%@page import="testpmi.getPmiController"%>
<%@page import="testpmi.TestPmi"%>
<%@page import="dBConn.Conn"%>
<%@page import="dBConn.PMI"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    TestPmi pmi = new TestPmi();
    getPmiController pmiw = new getPmiController();
    String pmino;
    String input =  request.getParameter("idInput");
    //String input = "9506070152";
    int PMINOGEN = pmiw.getNewPmi();
pmino = pmi.getPMI(input,PMINOGEN);
out.print(pmino);
%>