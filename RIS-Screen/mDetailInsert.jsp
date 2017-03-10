<%-- 
    Document   : tDetailInsert
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
    String  item_name = request.getParameter("item_name");
    String ccode = request.getParameter("ccode");
    String s_source = request.getParameter("s_source");
    String s_container = request.getParameter("s_container");
    String v_requerid = request.getParameter("v_req");
    String s_instruction = request.getParameter("s_inst");
    String b_price = request.getParameter("b_price");
    String s_price = request.getParameter("s_price");
    String status = request.getParameter("status");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    String createdby = "Huda Athirah";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
        //String sqlInsert = "INSERT INTO lis_item_detail(item_cd,item_name,test_cat,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) "
                //+ "VALUES ('" + icd10 + "','" + item_name + "','" + ccode + "','','','','',"+status+"','','','',','','','','" + createdby + "','0000-00-00')";

   String sqlInsert = "INSERT INTO RIS_modality(hfc_cd,modality_cd,modality_name,discipline_cd,subdiscipline_cd,created_by,created_date,status) VALUES ('" + icd10 + "','" + item_name + "','" + ccode + "','"+s_source+"','"+s_container+"','"+v_requerid+"','"+s_instruction+"','"+status+"','"+b_price+"','"+s_price+"','','','','" + createdby + "','0000-00-00')";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isInsert = rmic.setQuerySQL(connect.HOST, connect.PORT, sqlInsert);
    //out.println(isInsert);
    if (isInsert) {
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

