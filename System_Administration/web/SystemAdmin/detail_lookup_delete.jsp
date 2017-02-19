<%-- 
    Document   : detail_lookup_delete
    Created on : Jan 26, 2017, 12:27:04 PM
    Author     : user
--%>

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
    Conn conn = new Conn();
    String detailCode = request.getParameter("detailCode");
    String masterCode = request.getParameter("masterCode");

    String sqlSelect = "select detail_reference_code, description from adm_lookup_detail a join adm_health_facility b "
            + "on a.Detail_Reference_code = b.district_cd or a.detail_reference_code = b.town_cd "
            + "or a.detail_reference_code = b.state_cd WHERE detail_reference_code = '"+detailCode+"' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlSelect);

    if (dataUse.size() > 0) {

        out.print("You can't delete this item because it is referrenced by Health Facility");

    } else {
        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_lookup_detail WHERE master_reference_code = '" + masterCode + "' AND detail_reference_code = '" + detailCode + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>
