<%-- 
    Document   : searchPatient
    Created on : Feb 10, 2017, 5:48:50 PM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    Conn conn = new Conn();
    String pmiNo = request.getParameter("pmiNo");
   //String pmiNo = "9107211466794";
    String PDI = "";

    String sqlPatient = "select * FROM pms_patient_biodata where pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPDI = conn.getData(sqlPatient);

    PDI = "PDI|" + dataPDI.get(0).get(0) + "|" + dataPDI.get(0).get(2);

    for (int i = 3; i < dataPDI.get(0).size(); i++) {
        PDI += "^" + dataPDI.get(0).get(i);
    }
    
    out.print(PDI);

%>