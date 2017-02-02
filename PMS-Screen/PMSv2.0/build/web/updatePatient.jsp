<%-- 
    Document   : updatePatient
    Created on : Jan 18, 2017, 3:46:09 PM
    Author     : shay
--%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String pmino, pminotemp, pname, ptitle, pnic, poic, pit, pino, pelicat, pelity, pbday, psex, pmarital, prace, pnational, preligional, pbloodty, prhesus, pallergy, pchronic, porgandonor, phomeadd, phomedistrict, phometown, ppostcode, pstate, pcountry, phomephone, ppostaladd, ppostaldistrict, ppostaltown, ppostalpostcode, ppostalstate, ppostalcountry, pmobilephone;
    pmino = request.getParameter("pmino");
    pminotemp = request.getParameter("pminotemp");
    pname = request.getParameter("pname");
    ptitle = request.getParameter("ptitle");
    pnic = request.getParameter("pnic");
    poic = request.getParameter("poic");
    pit = request.getParameter("pit");
    pino = request.getParameter("pino");
    pelicat = request.getParameter("pelicat");
    pelity = request.getParameter("pelity");
    pbday = request.getParameter("pbday");
    psex = request.getParameter("psex");
    pmarital = request.getParameter("pmarital");
    prace = request.getParameter("prace");
    pnational = request.getParameter("pnational");
    preligional = request.getParameter("preligional");
    pbloodty = request.getParameter("pbloodty");
    prhesus = request.getParameter("prhesus");
    pallergy = request.getParameter("pallergy");
    pchronic = request.getParameter("pchronic");
    porgandonor = request.getParameter("porgandonor");
    phomeadd = request.getParameter("phomeadd");
    phomephone = request.getParameter("phomephone");
    ppostaladd = request.getParameter("ppostaladd");    
    pmobilephone = request.getParameter("pmobilephone");
    
     phomedistrict = request.getParameter("phomedistrict");
     phometown = request.getParameter("phometowncd");
     ppostcode = request.getParameter("ppostcode");
     pstate = request.getParameter("pstate");
     pcountry = request.getParameter("pcountry");
    
     ppostaldistrict = request.getParameter("ppostaldistrict");
     ppostaltown = request.getParameter("ppostaltown");
     ppostalpostcode = request.getParameter("ppostalpostcode");
     ppostalstate = request.getParameter("ppostalstate");
     ppostalcountry = request.getParameter("ppostalcountry");
    
    
//    ArrayList<String> addressDescr = new ArrayList(), addressCode= new ArrayList();
//    addressDescr.add(phomedistrict1);
//    addressDescr.add(phometown1);
//    addressDescr.add(ppostcode1);
//    addressDescr.add(pstate1);
//    addressDescr.add(pcountry1);
//    
//    addressDescr.add(ppostaldistrict1);
//    addressDescr.add(ppostaltown1);
//    addressDescr.add(ppostalpostcode1);
//    addressDescr.add(ppostalstate1);
//    addressDescr.add(ppostalcountry1);
//    
//    for(int i =0;i < addressDescr.size();i++){
//        String sql = "select * from lookup_detail where description ='"+addressDescr.get(i)+"'";
//        ArrayList<ArrayList<String>> dataRetrieve = conn.getData(sql);
//        addressCode.add(dataRetrieve.get(0).get(1));
//    }
//    
//    phomedistrict = addressCode.get(0);
//    phometown = addressCode.get(1);
//    ppostcode = addressCode.get(2);
//    pstate = addressCode.get(3);
//    pcountry = addressCode.get(4);
//    
//    ppostaldistrict = addressCode.get(5);
//    ppostaltown = addressCode.get(6);
//    ppostalpostcode = addressCode.get(7);
//    ppostalstate = addressCode.get(8);
//    ppostalcountry = addressCode.get(9);
    
    String selectSql = "select * from pms_patient_biodata where PMI_NO ='" + pmino + "'";
    ArrayList<ArrayList<String>> patientRow = conn.getData(selectSql);
    //ArrayList<String> patientrowOne = patientRow.get(0);
    
    //ptitle = "Dato'";
    
    if(ptitle.contains("'")){
        ptitle = ptitle.replaceAll("'", "''");
        //out.print(ptitle);
    }

       
    //out.print(patientRow.toString());
    String sql1="";
    Boolean SQL=false;
    if (patientRow.size() > 0) {
         sql1 = "UPDATE PMS_PATIENT_BIODATA SET PMI_NO = '"+pmino+"',PMI_NO_TEMP = '"+pminotemp+"',PATIENT_NAME ='"+pname+"',TITLE_CODE = '"+ptitle+"',NEW_IC_NO = '" +pnic+ "',OLD_IC_NO = '" + poic + "',ID_TYPE = '" + pit + "',ID_NO = '" + pino + "',ELIGIBILITY_CATEGORY_CODE = '" + pelicat + "',ELIGIBILITY_TYPE_CODE = '" + pelity + "',BIRTH_DATE = '" + pbday + "',SEX_CODE = '" + psex + "',MARITAL_STATUS_CODE = '" + pmarital + "',RACE_CODE = '" + prace + "',NATIONALITY = '" + pnational + "',RELIGION_CODE = '" + preligional + "',BLOOD_TYPE = '" + pbloodty + "',BLOOD_RHESUS_CODE = '" + prhesus + "',ALLERGY_IND = '" + pallergy + "',CHRONIC_DISEASE_IND = '" + pchronic + "',ORGAN_DONOR_IND = '" + porgandonor + "',HOME_ADDRESS = '" + phomeadd + "',HOME_DISTRICT_CODE = '" + phomedistrict + "',HOME_TOWN_CODE = '" + phometown + "',HOME_POSTCODE = '" + ppostcode + "',HOME_STATE_CODE = '" + pstate + "',HOME_COUNTRY_CODE = '" + pcountry + "',HOME_PHONE = '" + phomephone + "',POSTAL_ADDRESS = '" + ppostaladd + "',POSTAL_DISTRICT_CODE = '" + ppostaldistrict + "',POSTAL_TOWN_CODE = '" + ppostaltown + "',POSTAL_POSTCODE = '" + ppostalpostcode + "',POSTAL_STATE_CODE = '" + ppostalstate + "',POSTAL_COUNTRY_CODE = '" + ppostalcountry + "',MOBILE_PHONE = '" + pmobilephone + "' WHERE PMI_NO = '"+pmino+"'";
         
    } else{
        
         sql1 = "insert into PMS_PATIENT_BIODATA(PMI_NO,PMI_NO_TEMP,"
                + "PATIENT_NAME,TITLE_CODE,NEW_IC_NO,OLD_IC_NO,ID_TYPE,"
                + "ID_NO,ELIGIBILITY_CATEGORY_CODE,ELIGIBILITY_TYPE_CODE,"
                + "BIRTH_DATE,SEX_CODE,MARITAL_STATUS_CODE,RACE_CODE,"
                + "NATIONALITY,RELIGION_CODE,BLOOD_TYPE,BLOOD_RHESUS_CODE,"
                + "ALLERGY_IND,CHRONIC_DISEASE_IND,ORGAN_DONOR_IND,"
                + "HOME_ADDRESS,HOME_DISTRICT_CODE,HOME_TOWN_CODE,"
                + "HOME_POSTCODE,HOME_STATE_CODE,HOME_COUNTRY_CODE,"
                + "HOME_PHONE,POSTAL_ADDRESS,POSTAL_DISTRICT_CODE,"
                + "POSTAL_TOWN_CODE,POSTAL_POSTCODE,POSTAL_STATE_CODE,"
                + "POSTAL_COUNTRY_CODE,MOBILE_PHONE)values('" + pmino + "', '" + pminotemp + "', '" + pname + "', '" + ptitle + "', '" + pnic + "', '" + poic + "', '" + pit + "', '" + pino + "', '" + pelicat + "', '" + pelity + "', '" + pbday + "', '" + psex + "', '" + pmarital + "', '" + prace + "', '" + pnational + "', '" + preligional + "', '" + pbloodty + "', '" + prhesus + "', '" + pallergy + "', '" + pchronic + "', '" + porgandonor + "', '" + phomeadd + "', '" + phomedistrict + "', '" + phometown + "', '" + ppostcode + "', '" + pstate + "', '" + pcountry + "', '" + phomephone + "', '" + ppostaladd + "', '" + ppostaldistrict + "', '" + ppostaltown + "', '" + ppostalpostcode + "', '" + ppostalstate + "', '" + ppostalcountry + "', '" + pmobilephone + "')";
}
    SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, sql1);
    out.print(SQL+"|"+sql1);
    

%>