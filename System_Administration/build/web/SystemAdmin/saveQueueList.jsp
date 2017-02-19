<%-- 
    Document   : saveQueueName
    Created on : Feb 8, 2017, 12:01:51 PM
    Author     : shay
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String staff = request.getParameter("staff");
    String ty = request.getParameter("ty");
    String nm = request.getParameter("nm");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String createdBy = request.getParameter("createdBy");
    String status = request.getParameter("stat");
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");
    String checkData = "select queue_type from pms_queue_list where queue_type='"+ty+"' and queue_name='"+nm+"' and user_id ='"+staff+"' and hfc_cd='"+hfc+"' and discipline_cd='"+dis+"'";
    String sql = "";
    Boolean operation = false;
    ArrayList<ArrayList<String>> resultCheck;
    
    resultCheck = conn.getData(checkData);
    if(resultCheck.size() < 1){
        sql = "insert into pms_queue_list( queue_type,queue_name,user_id,start_date,end_date,hfc_cd,discipline_cd,sub_discipline_cd,status,created_by,created_date) values('"+ty+"','"+nm+"','"+staff+"','"+startDate+"','"+endDate+"','"+hfc+"','"+dis+"','"+sub+"','"+status+"','"+createdBy+"',NOW());";
    }else{
        sql = "update pms_queue_list set start_date = '"+startDate+"',end_date = '"+endDate+" ,sub_discipline_cd ='"+sub+"',status = '"+status+"',created_by ='"+createdBy+"',created_date=NOW() where queue_type = '"+ty+"' and queue_name='"+nm+"' and user_id='"+staff+"' and hfc_cd='"+hfc+"' and discipline_cd='"+dis+"'";
    }
    operation = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    out.print(operation);
%>
