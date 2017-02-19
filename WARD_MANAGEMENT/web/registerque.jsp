<%-- 
    Document   : registerqueue
    Created on : Jan 13, 2017, 10:53:48 AM
    Author     : shay
--%>
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
     String now = request.getParameter("now");
    String pmino = request.getParameter("pmino");
    String epiDate = request.getParameter("epiDate");
    String poic = request.getParameter("poic");
    String pid = request.getParameter("pid");
    String MRN = request.getParameter("MRN");
    String pname = request.getParameter("pname");
    String pnic = request.getParameter("pnic");
    String pidno = request.getParameter("pidno");
    String EliSource = request.getParameter("EliSource");
    String AdmissionType = request.getParameter("AdmissionType");
    String Refer = request.getParameter("Refer");
    String DocType = request.getParameter("DocType");
    String GL = request.getParameter("GL");
    String EliTy = request.getParameter("EliTy");
    String AdmissionReason = request.getParameter("AdmissionReason");
    String PoliceCase = request.getParameter("PoliceCase");
    String DocNo = request.getParameter("DocNo");
    String payer = request.getParameter("payer");
    String Dis = request.getParameter("Dis");
    String wname = request.getParameter("wname");
    String Deposit = request.getParameter("Deposit");
    String WardType = request.getParameter("WardType");
    String BedID = request.getParameter("BedID");
    String guardInd = request.getParameter("guardInd");
    String referNo = request.getParameter("referNo");
    String gruGuard = request.getParameter("gruGuard");
    String glExpDate = request.getParameter("glExpDate");
    String epiTime = request.getParameter("epiTime");
    String stat = request.getParameter("stat");
    String hfc = request.getParameter("hfc");
    String referHfc = request.getParameter("referHfc");
    String referDis = request.getParameter("referDis");
    String queueSql = "";
    String insertPatientQueue = "";
    int queue_now = 0;
    int newQueueNo = 0;

    String insertEpisode = "";
    String isAlreadyRegister = "select pmi_no from pms_episode where pmi_no = '" + pmino + "' and (status like '%Consult%' or status = '0' or status = '2' or status like '%Second Opinion%') and episode_date like '%" + now + "%';";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);

    if (alreadyRegis.size() > 0) {
        out.print("already");
//out.print(queue_now);
    } else {
       
       // insertPatientQueue = "insert into pms_patient_queue(hfc_cd,queue_name,episode_date,pmi_no,queue_no,queue_type)values('" + hfc + "','" + comQueue + "','" + epiDate + "','" + pmi + "','" + newQueueNo + "','" + comTy + "');";
        insertEpisode = "INSERT INTO wis_inpatient_episode(hfc_cd, pmi_no, episode_date, discipline_cd, subdiscipline_cd, "
                + "ward_class_code, ward_id, bed_id, patient_category_cd, visit_type_cd,"
                + "emergency_type_cd, eligibility_type_cd, eligibility_category_cd, referred_from_hfc, referred_from_discipline, referred_reference_no, order_by,"
                + "admission_reason, admission_description, guardian_ind, group_guardian,inpatient_status, created_by, created_date)"
                + "VALUES ('" + hfc + "','" + pmino + "','" + epiDate + "','" + WardType + "','" + oldic + "','" + typeId + "',"
                + "'" + wname + "','" + WardType + "','" + BedID + "','" + visTyCode + "','" + emTy + "','" + eliCatCode + "','" + eliTyCode + "',"
                + "'" + disCode + "','" + EliTy + "','" + EliSource + "','" + referHfc + "','" + referDis + "','" + prioGruCode + "','" + polCase + "',"
                + "'" + AdmissionReason + "','" + guardInd + "','" + gruGuard + "','" + guardInd + "','" + stat + "',"
                + "'" + gruGuard + "','" + glExpDate + "','" + epiTime + "','" + stat + "','" + hfc + "','" + comTy + "','" + comQueue + "','" + newQueueNo + "');";

        rmic.setQuerySQL(conn.HOST, conn.PORT, insertEpisode);
        rmic.setQuerySQL(conn.HOST, conn.PORT, insertPatientQueue);
        rmic.setQuerySQL(conn.HOST, conn.PORT, queueSql);
        out.print("Success");
        //out.print(queueSql);
//out.print(insertEpisode);
//out.print(insertEpisode);
    }

%>
