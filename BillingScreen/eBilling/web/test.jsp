<%-- 
    Document   : test
    Created on : Mar 12, 2017, 9:51:39 PM
    Author     : MH0411
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table id="tableMisc" class="table table-filter" style="background: #fff; border: 1px solid #ccc; border-top: none;">
            <thead>
                <th>Item Code</th>
                <th>Item Name</th>
                <th style="text-align: right;">Price (RM)</th>
            </thead>
            <tbody>
                <%
                    DecimalFormat df = new DecimalFormat("0.00");
                    String query2 = 
                    "SELECT health_facility_code "
                    + "FROM adm_user "
                    + "WHERE user_id = 'DR001'";
                    ArrayList<ArrayList<String>> data2 = Conn.getData(query2);
                    if (!data2.isEmpty()){
                        System.out.print(data2);
                    }%>
            </tbody>
        </table>
    </body>
</html>
