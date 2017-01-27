<%-- 
    Document   : saveEmp
    Created on : Jan 20, 2017, 3:05:49 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String pmino, empCode, empName, occupation, joinDate, incomeRange, hfc, createDate, status, sql, sqlCheck, empseq;
    pmino = request.getParameter("EMPpmino");
    empseq = request.getParameter("EMPseq");
    empCode = request.getParameter("EMPcd");
    empName = request.getParameter("EMPname");
    occupation = request.getParameter("EMPoccu");
    joinDate = request.getParameter("EMPjdate");
    incomeRange = request.getParameter("EMPinrange");
    hfc = request.getParameter("EMPhfc");
    createDate = request.getParameter("EMPcredate");
    status = request.getParameter("EMPstatus");
    sql = "SELECT EMPLOYMENT_SEQ_NO FROM AUTOGENERATE_ESNO";
    Boolean insert1 = false, insert2 = false,update = false;
    sqlCheck = "select * from PMS_EMPLOYMENT where EMPLOYMENT_SEQ_NO = '" + empseq + "' and pmi_no ='" + pmino + "'";
    ArrayList<ArrayList<String>> Checkseq = conn.getData(sqlCheck);

    ArrayList<ArrayList<String>> seq = conn.getData(sql);

    String[] g = new String[1];
    int num = 0;
    for (int i = 0; i < seq.size(); i++) {
        num = Integer.parseInt(seq.get(i).get(0).substring(2, seq.get(i).get(0).length()));
        num += 1;
        String formatted = String.format("%05d", num);
        g[0] = formatted;
    }
    String newSeq = "ES" + g[0];
    String sql2 = "INSERT INTO PMS_EMPLOYMENT (PMI_NO,EMPLOYMENT_SEQ_NO,EMPLOYER_CODE,EMPLOYER_NAME,OCCUPATION_CODE,JOINED_DATE,INCOME_RANGE_CODE,HEALTH_FACILITY,CREATE_DATE,EMPLOYMENT_STATUS) VALUES ('" + pmino + "','" + newSeq + "','" + empCode + "','" + empName + "','" + occupation + "','" + joinDate + "','" + incomeRange + "','" + hfc + "','" + createDate + "','" + status + "')";
    String sql3 = "INSERT INTO AUTOGENERATE_ESNO (EMPLOYMENT_SEQ_NO) VALUES ('" + newSeq + "')";

    if (Checkseq.size() > 0) {
        String sql4 = "update PMS_EMPLOYMENT set PMI_NO='" + pmino + "',EMPLOYMENT_SEQ_NO='" + empseq + "',EMPLOYER_CODE='" + empCode + "',EMPLOYER_NAME='" + empName + "',OCCUPATION_CODE='" + occupation + "',JOINED_DATE='" + joinDate + "',INCOME_RANGE_CODE='" + incomeRange + "',HEALTH_FACILITY='" + hfc + "',CREATE_DATE='" + createDate + "',EMPLOYMENT_STATUS='" + status + "' where EMPLOYMENT_SEQ_NO='" + empseq + "' and pmi_no ='" + pmino + "'";
        update = rmic.setQuerySQL(conn.HOST, conn.PORT, sql4);
        
        if (update == true) {
            out.print("true");
        } else {
            out.print("false");
//            out.print(Checkseq.size());
//            out.print(sql4);
        }
    } else {
        insert1 = rmic.setQuerySQL(conn.HOST, conn.PORT, sql2);
        insert2 = rmic.setQuerySQL(conn.HOST, conn.PORT, sql3);

        if (insert1 == true && insert2 == true) {
            out.print("true");
        } else {
            out.print("false");
//            out.print(Checkseq.size());
//            out.print(sql2);
//            out.print(sql3);
        }
    }

//    out.print(newSeq);

%>