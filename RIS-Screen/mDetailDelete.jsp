<%-- 
    Document   : mDetailDelete
    Created on : Mar 5, 2017, 11:28:29 AM
    Author     : Huda Athirah
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String cd = request.getParameter("cditem");
    String hrc_cd = request.getParameter("idcat");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM ris_item_detail WHERE modality_cd = '" + cd + "' and hfc_cd = '" + hfc_cd + "' ";

    boolean status = rmic.setQuerySQL(connect.HOST, connect.PORT, sql);

    if (status) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }
%>