<%-- 
    Document   : detail_lookup_insert
    Created on : Jan 26, 2017, 12:08:36 PM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();

    String masterCode = request.getParameter("masterCode");
    String detailCode = request.getParameter("detailCode");
    String detailDesc = request.getParameter("detailName");
    String priority = request.getParameter("priority");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String status = request.getParameter("status");
    String userID = (String) session.getAttribute("USER_ID");

    String sqlCheck = "Select master_reference_code FROM adm_lookup_detail WHERE master_reference_code = '" + masterCode + "' AND detail_reference_code = '" + detailCode + "' LIMIT 1 ";

    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    String sqlCheck2 = "SELECT master_reference_code FROM adm_lookup_master WHERE  master_reference_code = '"+masterCode+"' LIMIT 1";
     ArrayList<ArrayList<String>> masterExist = conn.getData(sqlCheck2);

    if (duplicate.size() > 0) {
        out.print("Sorry, the code that you're entering is already used. Please, enter different code");

    }else if(masterExist.size() <= 0){
    
        out.print("X");
    
    } else {
        
        startDate = DateFormatter.formatDate(startDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        endDate = DateFormatter.formatDate(endDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_lookup_detail"
                + " VALUES('" + masterCode + "', '" + detailCode + "', '" + detailDesc + "', '"+priority+"', '"+startDate+"', '"+endDate+"', '" + status + "', '" + userID + "', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>