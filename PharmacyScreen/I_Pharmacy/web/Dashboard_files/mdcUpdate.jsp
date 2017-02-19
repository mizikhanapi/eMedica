<%-- 
    Document   : mdcUpdate
    Created on : Jan 31, 2017, 11:07:39 AM
    Author     : Shammugam
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

    String UD_MDC_CODE = request.getParameter("UD_MDC_CODE");
    String UD_ATC_CODE = request.getParameter("UD_ATC_CODE");
    String D_TRADE_NAME = request.getParameter("D_TRADE_NAME");
    String D_GNR_NAME = request.getParameter("D_GNR_NAME");
    String D_ROUTE_CODE = request.getParameter("D_ROUTE_CODE");
    String D_FORM_CODE = request.getParameter("D_FORM_CODE");
    String D_STRENGTH = request.getParameter("D_STRENGTH");
    String D_STOCK_QTY = request.getParameter("D_STOCK_QTY");
    String D_LOCATION_CODE = request.getParameter("D_LOCATION_CODE");
    String STATUS = request.getParameter("STATUS");
    String MINIMUM_STOCK_LEVEL = request.getParameter("MINIMUM_STOCK_LEVEL");

    String D_PACKAGING = request.getParameter("D_PACKAGING");
    String D_PRICE_PPACK = request.getParameter("D_PRICE_PPACK");
    String D_COST_PRICE = request.getParameter("D_COST_PRICE");
    String D_SELL_PRICE = request.getParameter("D_SELL_PRICE");
    String D_QTY = request.getParameter("D_QTY");
    String D_QTYT = request.getParameter("D_QTYT");
    String D_FREQUENCY = request.getParameter("D_FREQUENCY");
    String D_DURATION = request.getParameter("D_DURATION");
    String D_DURATIONT = request.getParameter("D_DURATIONT");
    String D_ADVISORY_CODE = request.getParameter("D_ADVISORY_CODE");
    String D_CAUTIONARY_CODE = request.getParameter("D_CAUTIONARY_CODE");
    String D_EXP_DATE = request.getParameter("D_EXP_DATE");
    String D_CLASSIFICATION = request.getParameter("D_CLASSIFICATION");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE pis_mdc2 SET UD_ATC_CODE = '" + UD_ATC_CODE + "',D_TRADE_NAME = '" + D_TRADE_NAME + "',D_GNR_NAME = '" + D_GNR_NAME + "',D_ROUTE_CODE = '" + D_ROUTE_CODE + "',D_FORM_CODE = '" + D_FORM_CODE + "',D_STRENGTH = '" + D_STRENGTH + "',D_STOCK_QTY = '" + D_STOCK_QTY + "',D_LOCATION_CODE = '" + D_LOCATION_CODE + "' "
            + " , STATUS = '" + STATUS + "',MINIMUM_STOCK_LEVEL = '" + MINIMUM_STOCK_LEVEL + "',D_PACKAGING = '" + D_PACKAGING + "',D_PRICE_PPACK = '" + D_PRICE_PPACK + "',D_COST_PRICE = '" + D_COST_PRICE + "',D_SELL_PRICE = '" + D_SELL_PRICE + "',D_QTY = '" + D_QTY + "',D_QTYT = '" + D_QTYT + "',D_FREQUENCY = '" + D_FREQUENCY + "',D_DURATION = '" + D_DURATION + "' "
            + " , D_DURATIONT = '" + D_DURATIONT + "',D_ADVISORY_CODE = '" + D_ADVISORY_CODE + "',D_CAUTION_CODE = '" + D_CAUTIONARY_CODE + "',D_EXP_DATE = '" + D_EXP_DATE + "',D_CLASSIFICATION = '" + D_CLASSIFICATION + "' WHERE UD_MDC_CODE = '" + UD_MDC_CODE + "' ";

    out.print(sqlUpdate);
//    boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);
//
//    if (isUpdate == true) {
//        out.print("Success");
//    } else {
//        out.print("Failed");
//    }

%>