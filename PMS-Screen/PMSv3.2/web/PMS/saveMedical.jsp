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

    String MEDpmino, MEDinsurans, MEDpolicy, MEDdate, MEDhfc,MEDstatus,MEDseq,sql,sqlCheck;
    MEDpmino = request.getParameter("pmino");
    MEDinsurans = request.getParameter("insuranceCom");
    MEDpolicy = request.getParameter("policy");
    MEDdate = request.getParameter("maturityDate");
    MEDhfc = request.getParameter("hfc");
    MEDstatus = request.getParameter("status");
    MEDseq = request.getParameter("seq");
    
    
    //sql = "SELECT FAMILY_SEQ_NO FROM AUTOGENERATE_FSNO";
    Boolean insert1 = false, insert2 = false,update = false;
    sqlCheck = "select * from pms_medical_insurance where pmi_no ='" + MEDpmino + "'and POLICY_NO = '" + MEDpolicy + "'";
    ArrayList<ArrayList<String>> Checkseq = conn.getData(sqlCheck);

    //ArrayList<ArrayList<String>> seq = conn.getData(sql);

//    String[] g = new String[1];
//    int num = 0;
//    for (int i = 0; i < seq.size(); i++) {
//        num = Integer.parseInt(seq.get(i).get(0).substring(2, seq.get(i).get(0).length()));
//        num += 1;
//        String formatted = String.format("%05d", num);
//        g[0] = formatted;
//    }
//    String newSeq = "FS" + g[0];
    String sql2 = "INSERT INTO PMS_MEDICAL_INSURANCE (pmi_no,insurance_company_code,policy_no,maturity_date,health_facility,policy_status) VALUES ('" + MEDpmino + "','" + MEDinsurans + "','" + MEDpolicy + "','" + MEDdate + "','" + MEDhfc + "','" + MEDstatus + "')";
    //String sql3 = "INSERT INTO AUTOGENERATE_FSNO (FAMILY_SEQ_NO) VALUES ('" + newSeq + "')";

    if (Checkseq.size() > 0) {
        String sql4 = "update PMS_MEDICAL_INSURANCE set PMI_NO='"+MEDpmino+"', insurance_company_code='"+MEDinsurans+"', policy_no='"+MEDpolicy+"', maturity_date='"+MEDdate+"', health_facility='"+MEDhfc+"', policy_status='"+MEDstatus+"' where  pmi_no ='" + MEDpmino + "' AND policy_no='" + MEDpolicy + "'";
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
        //insert2 = rmic.setQuerySQL(conn.HOST, conn.PORT, sql3);

        if (insert1 == true) {
            out.print("true");
        } else {
            out.print("false");
            out.print(Checkseq.size());
            out.print(sql2);
            //out.print(sql3);
        }
       
    }

//    out.print(newSeq);

%>