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

    String FAMpmino, FAMrelay, FAMfamilypmino, FAMname, FAMoccu,FAMseq,sql,sqlCheck;
    FAMpmino = request.getParameter("pmino");
    FAMrelay = request.getParameter("relay");
    FAMfamilypmino = request.getParameter("fampnimo");
    FAMname = request.getParameter("name");
    FAMoccu = request.getParameter("occu");
    FAMseq = request.getParameter("seq");
    
    
    sql = "SELECT FAMILY_SEQ_NO FROM AUTOGENERATE_FSNO";
    Boolean insert1 = false, insert2 = false,update = false;
    sqlCheck = "select * from pms_family where pmi_no ='" + FAMpmino + "'and FAMILY_SEQ_NO = '" + FAMseq + "'";
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
    String newSeq = "FS" + g[0];
    String sql2 = "INSERT INTO pms_family (PMI_NO, FAMILY_SEQ_NO, FAMILY_RELATIONSHIP_CODE, PMI_NO_FAMILY, FAMILY_MEMBER_NAME, OCCUPATION_CODE) VALUES ('" + FAMpmino + "','" + newSeq + "','" + FAMrelay + "','" + FAMfamilypmino + "','" + FAMname + "','" + FAMoccu + "')";
    String sql3 = "INSERT INTO AUTOGENERATE_FSNO (FAMILY_SEQ_NO) VALUES ('" + newSeq + "')";

    if (Checkseq.size() > 0) {
        String sql4 = "update pms_family set PMI_NO='"+FAMpmino+"', FAMILY_SEQ_NO='"+FAMseq+"', FAMILY_RELATIONSHIP_CODE='"+FAMrelay+"', PMI_NO_FAMILY='"+FAMfamilypmino+"', FAMILY_MEMBER_NAME='"+FAMname+"', OCCUPATION_CODE='"+FAMoccu+"' where  pmi_no ='" + FAMpmino + "' AND FAMILY_SEQ_NO='" + FAMseq + "'";
        update = rmic.setQuerySQL(conn.HOST, conn.PORT, sql4);
        
        if (update == true) {
            out.print("true");
        } else {
            out.print("false");
            out.print(Checkseq.size());
            out.print(sql4);
        }
    } else {
        insert1 = rmic.setQuerySQL(conn.HOST, conn.PORT, sql2);
        insert2 = rmic.setQuerySQL(conn.HOST, conn.PORT, sql3);

        if (insert1 == true && insert2 == true) {
            out.print("true");
        } else {
            out.print("false");
            out.print(Checkseq.size());
            out.print(sql2);
            out.print(sql3);
        }
       
    }

//    out.print(newSeq);

%>