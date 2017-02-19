<%-- 
    Document   : subdiscipline_insert
    Created on : Feb 5, 2017, 10:57:58 PM
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
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String subdisciplineName = request.getParameter("subdisciplineName");
    String type = request.getParameter("type");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT subdiscipline_cd from adm_subdiscipline WHERE discipline_cd = '"+disciplineCode+"' AND subdiscipline_cd = '"+subdisciplineCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    
    String sqlCheck2 = "SELECT discipline_cd from adm_discipline WHERE discipline_cd = '"+disciplineCode+"' LIMIT 1";
    ArrayList<ArrayList<String>> disciplineExist = conn.getData(sqlCheck2);
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the subdiscipline code that you have entered is already used. Please enter different code.");
        
    }else if(disciplineExist.size() <= 0){
    
        out.print("Please choose existing discipline"); 
    }
    else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_subdiscipline values('"+disciplineCode+"', '"+subdisciplineCode+"', '"+subdisciplineName+"', '"+type+"', '"+userID+"', now(), '"+status+"')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
