<%-- 
    Document   : supplierInsert
    Created on : Jan 25, 2017, 9:43:35 PM
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

    String sqlCheck = "SELECT Supplier_ID from pis_supplier_info WHERE Supplier_ID = '" + Supplier_ID + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO pis_supplier_info (Supplier_ID,Supplier_Name,Office_Tel_No,ADDRESS1,ADDRESS2,ADDRESS3,DISTRICT_CODE , TOWN_CODE,POSTCODE,STATE_CODE,COUNTRY_CODE,Mobile_No,Fax_No,Email)"
                + " VALUES ('" + Supplier_ID + "','" + Supplier_Name + "','" + Office_Tel_No + "','" + ADDRESS1 + "','" + ADDRESS2 + "','" + ADDRESS3 + "','" + DISTRICT_CODE + "','" + TOWN_CODE + "','" + POSTCODE + "','" + STATE_CODE + "','" + COUNTRY_CODE + "','" + Mobile_No + "','" + Fax_No + "','" + Email + "'  )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>