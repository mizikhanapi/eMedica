<%-- 
    Document   : supplierUpdate
    Created on : Jan 26, 2017, 11:07:39 AM
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

    String Supplier_ID = request.getParameter("Supplier_ID");
    String Supplier_Name = request.getParameter("Supplier_Name");
    String Office_Tel_No = request.getParameter("Office_Tel_No");
    String Email = request.getParameter("Email");
    String ADDRESS1 = request.getParameter("ADDRESS1");
    String ADDRESS2 = request.getParameter("ADDRESS2");
    String ADDRESS3 = request.getParameter("ADDRESS3");

    String DISTRICT_CODE = request.getParameter("DISTRICT_CODE");
    String TOWN_CODE = request.getParameter("TOWN_CODE");
    String POSTCODE = request.getParameter("POSTCODE");
    String STATE_CODE = request.getParameter("STATE_CODE");
    String COUNTRY_CODE = request.getParameter("COUNTRY_CODE");
    String Mobile_No = request.getParameter("Mobile_No");
    String Fax_No = request.getParameter("Fax_No");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE pis_supplier_info SET Supplier_Name = '" + Supplier_Name + "',Office_Tel_No = '" + Office_Tel_No + "',ADDRESS1 = '" + ADDRESS1 + "' "
            + " , ADDRESS2 = '" + ADDRESS2 + "',ADDRESS3 = '" + ADDRESS3 + "',DISTRICT_CODE = '" + DISTRICT_CODE + "',TOWN_CODE = '" + TOWN_CODE + "',POSTCODE = '" + POSTCODE + "' "
            + " , STATE_CODE = '" + STATE_CODE + "',COUNTRY_CODE = '" + COUNTRY_CODE + "',Mobile_No = '" + Mobile_No + "',Fax_No = '" + Fax_No + "',Email = '" + Email + "' WHERE Supplier_ID = '" + Supplier_ID + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>