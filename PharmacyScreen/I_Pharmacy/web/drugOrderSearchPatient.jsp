
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    String searchPatient = "";

    Conn conn = new Conn();

    if (idType.equals("pmino")) {
        searchPatient = "select * from pms_patient_biodata where PMI_NO='" + idInput + "'";
    } else if (idType.equals("icnew")) {
        searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='" + idInput + "'";
    } else if (idType.equals("icold")) {
        searchPatient = "select * from pms_patient_biodata where OLD_IC_NO='" + idInput + "'";
    }

    ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
    
    if (search.size() > 0) {
            ArrayList<String> search1 = search.get(0);
            String newVal = StringUtils.join(search1, "|");
            out.print(newVal);
    } else {
        out.print("No Data");
    }
%>