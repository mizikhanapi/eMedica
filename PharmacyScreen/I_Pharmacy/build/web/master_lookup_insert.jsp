<%-- 
    Document   : master_lookup_insert
    Created on : Jan 25, 2017, 4:25:39 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    Conn conn = new Conn();
    String masterCode = request.getParameter("masterCode");
    String masterName = request.getParameter("masterName");
    String masterSource = request.getParameter("masterSource");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT master_reference_code from adm_lookup_master WHERE master_reference_code = '"+masterCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0)
    {
        out.print("Duplicate master code. Please use different code");
    }
    else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_lookup_master values('"+masterCode+"', '"+masterName+"', '"+masterSource+"', '"+status+"', '"+userID+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
