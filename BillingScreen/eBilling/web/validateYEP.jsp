<%-- 
    Document   : validateYEP
    Created on : Feb 24, 2017, 10:44:50 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sql = 
            "SELECT pb.patient_name, cl.customer_id, IFNULL(cl.dr_amt_13, 0), IFNULL(cl.cr_amt_13,0) "
            + "FROM far_customer_ledger cl, pms_patient_biodata pb "
            + "WHERE cl.customer_id = pb.pmi_no";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);    

    if(data.isEmpty()){
        String infoMessage = "There is no year end processing has been done before.";
        out.print("-|-1|" + infoMessage);
    } else {
        out.print("-|1|");
    }     
%>
