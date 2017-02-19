<%-- 
    Document   : assignDiscipline_update
    Created on : Feb 15, 2017, 11:23:20 PM
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

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_hfc_discipline SET hfc_discipline_status = '" + status + "'"
            + " WHERE hfc_cd = '" + hfcCode + "' AND discipline_cd = '"+disciplineCode+"' AND subdiscipline_cd = '"+subdisciplineCode+"'";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
