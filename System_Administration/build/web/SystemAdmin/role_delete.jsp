<%-- 
    Document   : role_delete
    Created on : Feb 16, 2017, 12:25:44 PM
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

    String roleCode = request.getParameter("roleCode");

    String sqlCheck = "Select role_code from adm_user_access_role where role_code = '" + roleCode + "' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlCheck);

    if (dataUse.size() > 0) {

        out.print("You can't delete this item because it is referenced by user access role");

    } else {

        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_role WHERE role_code = '" + roleCode + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>
