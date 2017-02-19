<%-- 
    Document   : module_insert
    Created on : Feb 7, 2017, 2:43:11 PM
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
    String systemCode = request.getParameter("systemCode");
    String moduleName = request.getParameter("moduleName");
    String moduleCode = request.getParameter("moduleCode");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT module_code FROM adm_module WHERE module_code = '"+moduleCode+"' AND system_code = '"+systemCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the module code that you have entered is already used. Please enter different code.");
        
    }else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_module(system_code, module_code, module_name, status, created_by, created_date) "
                    +"VALUES('"+systemCode+"', '"+moduleCode+"', '"+moduleName+"', '"+status+"', '"+userID+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
