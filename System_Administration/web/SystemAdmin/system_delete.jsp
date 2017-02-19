<%-- 
    Document   : system_delete
    Created on : Feb 7, 2017, 12:56:35 PM
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

    String id = request.getParameter("systemCode");

    String sqlCheck = "Select system_code from adm_module where system_code = '" + id + "' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlCheck);

    if (dataUse.size() > 0) {

        out.print("You can't delete this item because it is referenced by module");

    } else {

        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_system WHERE system_code = '" + id + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>
