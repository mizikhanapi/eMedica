<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    //String systemParam = "select * from system_param";
    //ArrayList<ArrayList<String>> systemParams = connect.getData(systemParam);
    //String status = systemParams.get(0).get(2);
    //if status = 1,select from table pms_patient_biodata and special_intergration_information
    // status 0 = public
    // status 1 = universiti
    // status bole dapat kat session
    String status = "1"; //session.getAttribute("SYSTEMSTAT").toString();
    String searchPatient = "";

    if (status.equals("1")) {

        if (idType.equals("pmino")) {
            searchPatient = "select * from pms_patient_biodata where PMI_NO='" + idInput + "'";
        } else if (idType.equals("icnew")) {
            searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='" + idInput + "'";
        } else if (idType.equals("icold")) {
            searchPatient = "select * from pms_patient_biodata where OLD_IC_NO='" + idInput + "'";
        } else if (idType.equals("004")) {
            searchPatient = "select * from pms_patient_biodata where ID_NO='" + idInput + "' AND ID_TYPE='004'";
        } else if (idType.equals("005")) {
            searchPatient = "select * from pms_patient_biodata where ID_NO='" + idInput + "'AND ID_TYPE='005'";
        }

        ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
        if (search.size() > 0) {
            ArrayList<String> search1 = search.get(0);
            String newVal = StringUtils.join(search1, "|");
%>
<%out.print(newVal);%>
<%
} else if (search.size() == 0 && (idType.equals("004") || idType.equals("005"))) {
    String searchSpecial = "select national_id_no,person_id_no,person_type,name,gender,race,nationality,home_address,home_address_2,postcode,country,phone_no from special_integration_information where person_id_no ='" + idInput + "'";
    ArrayList<ArrayList<String>> search2 = conn.getData(searchSpecial);
    if (search2.size() > 0) {
        ArrayList<String> search3 = search2.get(0);
        String newVal = StringUtils.join(search3, "|");
%>
<%out.print("SMP|" + newVal);%>
<%
} else {
%>
<%out.print("N/A1");%>
<%
    }
} else if (search.size() == 0 && idType.equals("icnew")) {
    String searchSpecial = "select national_id_no,person_id_no,person_type,name,gender,race,nationality,home_address,home_address_2,postcode,country,phone_no from special_integration_information where national_id_no ='" + idInput + "'";
    ArrayList<ArrayList<String>> search2 = conn.getData(searchSpecial);
    if (search2.size() > 0) {
        ArrayList<String> search3 = search2.get(0);
        String newVal = StringUtils.join(search3, "|");
%>
<%out.print("SMP|" + newVal);%>
<%
} else {
%>
<%out.print("N/A1");%>
<%
    }
} else { %>
<%out.print("N/A1");%>
<%
    }

} else if (status.equals("0")) {

    if (idType.equals("pmino")) {
        searchPatient = "select * from pms_patient_biodata where PMI_NO='" + idInput + "'";
    } else if (idType.equals("icnew")) {
        searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='" + idInput + "'";
    } else if (idType.equals("icold")) {
        searchPatient = "select * from pms_patient_biodata where OLD_IC_NO='" + idInput + "'";
    }

    ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
    if (search.size() > 0) {
        ArrayList<String> search1 = search.get(0), districtCode = new ArrayList<String>(), townCode = new ArrayList<String>(), postcodeCode = new ArrayList<String>(), stateCode = new ArrayList<String>(), countryCode = new ArrayList<String>();

        String newVal = StringUtils.join(search1, "|");
%>
<%out.print(newVal);%>
<%
} else { %>
<%out.print("N/A0");%>
<%
        }

    }

%>   