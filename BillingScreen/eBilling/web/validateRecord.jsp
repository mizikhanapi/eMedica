<%-- 
    Document   : validateRecord
    Created on : Feb 24, 2017, 6:48:26 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ic = request.getParameter("ic");
    
    String sql0 = "SELECT cl.customer_id "
            + "FROM pms_patient_biodata pb, far_customer_ledger cl "
            + "WHERE pb.new_ic_no = '"+ ic +"'";
    ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql0);

    if(dataPatient.isEmpty()){
        String infoMessage = "Record not found.\nPlease recheck the IC";
        out.print("-|-1|" + infoMessage);
    } else {
        out.print("-|1|");
    }     
%>