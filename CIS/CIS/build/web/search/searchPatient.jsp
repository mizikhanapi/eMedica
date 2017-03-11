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
    
    String bloodType = "";
    String sex = "";
    String IdType = "";
    int age;
    String race = "";
    String allergy = "";
    String dob="";
    
Calendar now = Calendar.getInstance(); 
int year = now.get(Calendar.YEAR);  
int month = now.get(Calendar.MONTH);
    

    
    //Convert Code to Description
String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind from emedica.pms_patient_biodata where pmi_no = '"+pmiNo+"'";
ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

String sqlGetBlood = "select* from adm_lookup_detail where master_reference_code = '0074' and detail_reference_code = '"+dataQueue.get(0).get(3) +"'";
ArrayList<ArrayList<String>> dataBlood = conn.getData(sqlGetBlood);

String sqlGetSexCd = "select* from adm_lookup_detail where master_reference_code = '0041' and detail_reference_code = '" + dataQueue.get(0).get(4) + "'";
ArrayList<ArrayList<String>> dataSexCd = conn.getData(sqlGetSexCd);

String sqlGetIdType = "select* from adm_lookup_detail where master_reference_code = '0012' and detail_reference_code = '" + dataQueue.get(0).get(5) + "'";
ArrayList<ArrayList<String>> dataIdType = conn.getData(sqlGetIdType);

String sqlGetRace = "select* from adm_lookup_detail where master_reference_code = '0004' and detail_reference_code = '" + dataQueue.get(0).get(7) + "'";
ArrayList<ArrayList<String>> dataRace = conn.getData(sqlGetRace);

String sqlAllergy = "select* from adm_lookup_detail where master_reference_code = '0075' and detail_reference_code = '" + dataQueue.get(0).get(8) + "'";
ArrayList<ArrayList<String>> dataAllergy = conn.getData(sqlAllergy);

bloodType = dataBlood.get(0).get(2);
sex = dataSexCd.get(0).get(2);
IdType = dataIdType.get(0).get(2);
race = dataRace.get(0).get(2);
allergy = dataAllergy.get(0).get(2);




// Get Age from Date of Birth

dob = dataQueue.get(0).get(6).toString();
String[] dobAr = StringUtils.split(dob,"/");
int dobYear = Integer.parseInt(dobAr[0]);
int dobMonth = Integer.parseInt(dobAr[1]);

age = year-dobYear;

String patientBio = dataQueue.get(0).get(0) + "|"+dataQueue.get(0).get(1)+"|"+dataQueue.get(0).get(2)+"|"+bloodType+"|"+sex+"|"+IdType+"|"+age+"|"+race+"|"+allergy;

session.setAttribute("patientPMINo",dataQueue.get(0).get(0));
//session.setAttribute("patientPMINo","6303190161596");

session.setAttribute("patientBio", patientBio);


out.print(patientBio);



%>