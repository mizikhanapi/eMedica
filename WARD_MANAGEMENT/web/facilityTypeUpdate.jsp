
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
    
    String wclass = request.getParameter("MWClass");
    String wclassid = request.getParameter("MWID");
    String wstatus = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_ward_class SET ward_class_code = '" + wclassid + "',ward_class_name = '" + wclass + "', ward_class_status = '" + wstatus + "' WHERE ward_class_code = '" + wclass + "' ";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>