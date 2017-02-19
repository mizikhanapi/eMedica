<%-- 
    Document   : page_insert
    Created on : Feb 7, 2017, 8:04:20 PM
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
    String moduleCode = request.getParameter("moduleCode");
    String pageName = request.getParameter("pageName");
    String pageCode = request.getParameter("pageCode");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT page_code FROM adm_page WHERE page_code = '"+pageCode+"' AND module_code = '"+moduleCode+"' AND system_code = '"+systemCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the page code that you have entered is already used. Please enter different code.");
        
    }else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_page(system_code, module_code, page_code, page_name, status, created_by, created_date) "
                    +"VALUES('"+systemCode+"', '"+moduleCode+"', '"+pageCode+"', '"+pageName+"', '"+status+"', '"+userID+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
