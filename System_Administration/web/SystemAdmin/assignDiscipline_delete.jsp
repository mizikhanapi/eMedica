<%-- 
    Document   : assignDiscipline_delete
    Created on : Feb 15, 2017, 11:34:58 PM
    Author     : user
--%>

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

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_hfc_discipline WHERE hfc_cd = '" + hfcCode + "' AND discipline_cd = '"+disciplineCode+"' AND subdiscipline_cd = '"+subdisciplineCode+"' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>