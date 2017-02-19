<%-- 
    Document   : subdiscipline_update
    Created on : Feb 6, 2017, 12:09:23 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();

    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String subdisciplineName = request.getParameter("subdisciplineName");
    String type = request.getParameter("type");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_subdiscipline SET subdiscipline_name = '" + subdisciplineName + "', subdiscipline_type = '" + type + "', subdiscipline_status = '" + status + "'"
            + " WHERE discipline_cd = '" + disciplineCode + "' AND subdiscipline_cd = '"+subdisciplineCode+"'";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
