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

    String KINpmino, KINidtype, KINdob, KINphone, KINemail, KINname, KINoldic, KINidnumber, KINoccu, sql,sqlCheck, KINhomephone, KINaddress,KINdistrict,KINpostcode,KINcountry,KINtown,KINstate,KINseq,KINrelationship,KINnewic;
    KINpmino = request.getParameter("KINpmino");
    KINidtype = request.getParameter("KINidtype");
    KINdob = request.getParameter("KINdob");
    KINphone = request.getParameter("KINphone");
    KINemail = request.getParameter("KINemail");
    KINname = request.getParameter("KINname");
    KINoldic = request.getParameter("KINoldic");
    KINidnumber = request.getParameter("KINidnumber");
    KINoccu = request.getParameter("KINoccu");
    KINhomephone = request.getParameter("KINhomephone");
    KINaddress = request.getParameter("KINaddress");
    KINdistrict = request.getParameter("KINdistrict");
    KINpostcode = request.getParameter("KINpostcode");
    KINcountry = request.getParameter("KINcountry");
    KINtown = request.getParameter("KINtown");
    KINstate = request.getParameter("KINstate");
    KINseq = request.getParameter("KINseq");
    KINrelationship = request.getParameter("KINrelationship");
    KINnewic = request.getParameter("KINnewic");
    
    
    sql = "SELECT NEXTOFKIN_SEQ_NO FROM autogenerate_noksno";
    Boolean insert1 = false, insert2 = false,update = false;
    sqlCheck = "select * from pms_nextofkin where pmi_no ='" + KINpmino + "' and NEW_IC_NO='"+KINnewic+"' AND OLD_IC_NO='"+KINoldic+"' OR NEXTOFKIN_SEQ_NO = '" + KINseq + "'";
    ArrayList<ArrayList<String>> Checkseq = conn.getData(sqlCheck);

    ArrayList<ArrayList<String>> seq = conn.getData(sql);

    String[] g = new String[1];
    int num = 0;
    for (int i = 0; i < seq.size(); i++) {
        num = Integer.parseInt(seq.get(i).get(0).substring(4, seq.get(i).get(0).length()));
        num += 1;
        String formatted = String.format("%05d", num);
        g[0] = formatted;
    }
    String newSeq = "NOKS" + g[0];
    String sql2 = "INSERT INTO pms_nextofkin (PMI_NO, NEXTOFKIN_SEQ_NO, NEXTOFKIN_RELATIONSHIP_CODE, NEXTOFKIN_NAME, NEW_IC_NO, OLD_IC_NO, ID_TYPE, ID_NO, BIRTH_DATE, OCCUPATION_CODE, ADDRESS, DISTRICT_CODE, TOWN_CODE, POSTCODE, STATE_CODE, COUNTRY_CODE, MOBILE_PHONE, HOME_PHONE, E_MAIL) VALUES ('" + KINpmino + "','" + newSeq + "','" + KINrelationship + "','" + KINname + "','" + KINnewic + "','" + KINoldic + "','" + KINidtype + "','" + KINidnumber + "','" + KINdob + "','" + KINoccu + "','" + KINaddress + "','" + KINdistrict + "','" + KINtown + "','" + KINpostcode + "','" + KINstate + "','" + KINcountry + "','" + KINphone + "','" + KINhomephone + "','" + KINemail + "')";
    String sql3 = "INSERT INTO autogenerate_noksno (NEXTOFKIN_SEQ_NO) VALUES ('" + newSeq + "')";

    if (Checkseq.size() > 0) {
        String sql4 = "update pms_nextofkin set PMI_NO='" + KINpmino + "',NEXTOFKIN_SEQ_NO='" + KINseq + "',NEXTOFKIN_RELATIONSHIP_CODE='" + KINrelationship + "',NEXTOFKIN_NAME='" + KINname + "',NEW_IC_NO='" + KINnewic + "',OLD_IC_NO='" + KINoldic + "',ID_TYPE='" + KINidtype + "',ID_NO='" + KINidnumber + "',BIRTH_DATE='" + KINdob + "',OCCUPATION_CODE='" + KINoccu + "', ADDRESS='"+KINaddress+"', DISTRICT_CODE='"+KINdistrict+"', TOWN_CODE='"+KINtown+"', POSTCODE='"+KINpostcode+"', STATE_CODE='"+KINstate+"', COUNTRY_CODE='"+KINcountry+"', MOBILE_PHONE='"+KINphone+"', HOME_PHONE='"+KINhomephone+"', E_MAIL='"+KINemail+"' where NEW_IC_NO='" + KINnewic + "' AND OLD_IC_NO='" + KINoldic + "' and pmi_no ='" + KINpmino + "' or NEXTOFKIN_SEQ_NO='" + KINseq + "'";
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