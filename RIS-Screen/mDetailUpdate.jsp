<%-- 
    Document   : mDetailUpdate
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
    try{
    
    String icd10 = request.getParameter("icd10");
    String analytename = request.getParameter("analytename");
   // String ccode = request.getParameter("ccode");
    String s_source = request.getParameter("s_source");
    String s_container = request.getParameter("s_container");
    String v_req = request.getParameter("v_req");
    String s_inst = request.getParameter("s_inst");
    String b_price = request.getParameter("b_price");
    String s_price = request.getParameter("s_price");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();
    String sqlUpdate = "UPDATE RIS_modality SET item_name = '" + analytename + "', spe_source = '"+s_source+"', spe_container = '"+s_container+"', volume = '"+v_req+"',special_inst = '"+s_inst+"', buy_price = '"+b_price+"', ser_price = '"+s_price+"', status = '"+status+"' WHERE item_cd = '" + icd10 + "' ";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isUpdate = rmic.setQuerySQL(connect.HOST, connect.PORT, sqlUpdate);
    //out.println(isInsert);
    if (isUpdate) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }
    }catch(Exception e){
        out.println(e.getMessage());
    }
%>
