<%-- 
    Document   : assignDiscipline_insert
    Created on : Feb 14, 2017, 8:13:04 PM
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
    String hfcCode = request.getParameter("hfcCode");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT hfc_cd FROM adm_hfc_discipline WHERE hfc_cd = '"+hfcCode+"' AND discipline_cd = '"+disciplineCode+"' AND subdiscipline_cd = '"+subdisciplineCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the discipline and subdicipline is already assigned to the health facility. Assign different discipline or subdiscipline.");
        
    }else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_hfc_discipline(hfc_cd, discipline_cd, subdiscipline_cd, created_by, created_date, hfc_discipline_status) "
                    +"VALUES('"+hfcCode+"', '"+disciplineCode+"', '"+subdisciplineCode+"', '"+userID+"', now(), '"+status+"')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
