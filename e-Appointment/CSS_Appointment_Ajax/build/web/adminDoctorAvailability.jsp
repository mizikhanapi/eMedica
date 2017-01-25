<%-- 
    Document   : adminAppointmentViewDateAvailability
    Created on : Jul 31, 2016, 9:23:41 AM
    Author     : user
--%>


<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>
<%

    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUBDISCIPLINE_CODE");
    String searchDateAvailability = request.getParameter("date");
    String searchDoctorAvailability = request.getParameter("doctor");
    String hfcSession = (String) session.getAttribute("sessionHFC");
//    String searchDateAvailability ="2017-01-21";
//    String searchDoctorAvailability = "Dr Tester02";
//    
if(hfc == null || hfc == ""){
    hfc = hfcSession;
}
    String hfcCode = "SELECT Detail_Ref_code "
            + "FROM lookup_detail "
            + "WHERE Master_Ref_code = '0081' AND Description = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataHFC = Conn.getData(hfcCode);

    String hfcCD;
    if (dataHFC.size() > 0) {
        hfcCD = dataHFC.get(0).get(0);
    } else {
        hfcCD = null;
    }

//    out.print(hfcCD);
    String sqlDisplayHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
    ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayHoliday);

    String sqlDisplayClinic = "SELECT d.*, sub.description AS subdiscipline_name "
            + "FROM lookup_detail sub, "
            + "(SELECT c.*, al.description AS discipline_name "
            + "FROM lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name "
            + "FROM lookup_detail hfc,"
            + "(SELECT t.*,ld.description AS state_name "
            + "FROM lookup_detail ld, "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time,  status "
            + "FROM pms_clinic_day)t "
            + "WHERE t.state_code=ld.`Detail_Ref_code` AND ld.`Master_Ref_code` = '0002'  AND hfc_cd= '" + hfcCD + "')b "
            + "WHERE hfc.Master_Ref_Code='0081' AND hfc.Detail_Ref_code = b.hfc_cd)c "
            + "WHERE al.`Master_Ref_code`='0072' AND al.`Detail_Ref_code` = c.discipline_cd)d "
            + "WHERE sub.`Master_Ref_code` = '0071' AND sub.`Detail_Ref_code` = d.subdiscipline_cd "
            + "ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sqlDisplayRoster = "SELECT LCASE(ad.USER_NAME) as patientName, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status "
            + "FROM adm_user ad, pms_duty_roster dr "
            + "WHERE ad.USER_ID = dr.user_id";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);

    String sqlStaffLeave = "SELECT sl.hfc_cd, au.USER_ID, LCASE(au.USER_NAME) AS patientName, date(sl.start_leave_date), date(sl.end_leave_date), LCASE(sl.leave_reason) AS reason, sl.status "
            + "FROM pms_staff_leave sl, adm_user au "
            + "WHERE (sl.status = 'process' OR sl.status = 'approve' OR status = 'not approve') AND au.USER_ID = sl.user_id "
            + "ORDER BY au.USER_NAME DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);

    String sqlAdminLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '" + username + "' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataAdminLeave = Conn.getData(sqlAdminLeave);

    //String sqlAdminUsername = "SELECT USER_NAME FROM adm_user WHERE USER_ID = '"+username+"'";
    //ArrayList<ArrayList<String>> dataAdminUsername = Conn.getData(sqlAdminUsername);
    //String adminUsername = dataAdminUsername.get(0).get(0);
//    out.print(sqlStaffLeave);
    String sqlDoctorID = "SELECT * FROM adm_user WHERE USER_NAME = '" + searchDoctorAvailability + "'";
    ArrayList<ArrayList<String>> dataDoctorID = Conn.getData(sqlDoctorID);

    String doctorID = dataDoctorID.get(0).get(0);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR' "
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);

    //out.print(sqlDoctorAvailable);
    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, "
            + "lookSub.staff_name ,lookSub.discipline_name, lds.Description AS subdipline_name, lookSub.appointment_type, lookSub.ID_NO, lookSub.status, lookSub.canceled_reason "
            + "FROM lookup_detail lds, "
            + "(SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, "
            + "lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, lookDis.subdiscipline, lookDis.appointment_type, lookDis.ID_NO, lookDis.status, lookDis.canceled_reason "
            + "FROM lookup_detail ld, "
            + "(SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, LCASE(pb.PATIENT_NAME) AS PATIENT_NAME, "
            + "LCASE(au.USER_NAME) AS USER_NAME, pa.discipline, pa.subdiscipline, pa.appointment_type, pb.ID_NO, pa.status, pa.canceled_reason "
            + "FROM pms_appointment pa, pms_patient_biodata pb, adm_user au "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID "
            + "ORDER BY pa.appointment_date DESC, pa.start_time ASC) lookDis "
            + "WHERE lookDis.discipline=ld.Detail_Ref_code "
            + "AND ld.Master_Ref_code = '0072') lookSub "
            + "WHERE lds.Master_Ref_code = '0071' "
            + "AND lookSub.subdiscipline=lds.Detail_Ref_code";
    ArrayList<ArrayList<String>> dataAppointment = Conn.getData(sqlAppointment);

//    out.print(username);
//    out.print(e23);
%>

<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <body>
        <div id="doctorDirectory" class="tab-pane">            

            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="doctorAvailabilityTable">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                    <th><center>Doctor Name</center></th>
                    <th><center>Availability</center></th>
                    <th><center>Available/Unavailable Reason</center></th>
                    <th><center>Not Available On (Booked Time)</center></th>
                    <th><center>Duty Period</center></th>
                    </tr>
                    </thead>
                    <tbody><%                            String index_color = null;
                        for (int i = 0; i < dataDoctorAvailable.size(); i++) {
                            Date today = new Date();
                            String expectedPattern = "yyyy-MM-dd";
                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                            String startDateFromDB = dataDoctorAvailable.get(i).get(3);
                            String endDateFromDB = dataDoctorAvailable.get(i).get(4);
                            String dateCompareDay = searchDateAvailability;
                            Date startDateDB = formatter.parse(startDateFromDB);
                            Date endDateDB = formatter.parse(endDateFromDB);
                            Date CompareDay = formatter.parse(dateCompareDay);

                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                            String dateStart = DATE_FORMAT.format(startDateDB);
                            String dateEnd = DATE_FORMAT.format(endDateDB);

                            SimpleDateFormat df = new SimpleDateFormat("EEEE");
                            String newCompareDay = df.format(CompareDay);

                         

                        %>
                        <tr id="tbl_<%=i%>">
                            <td><center><%out.print(i + 1);%></center></td>
                    <td><left><%=dataDoctorAvailable.get(i).get(1)%></left></td>
                        <%

                            String doctorId = dataDoctorAvailable.get(i).get(0);

                            if (dataDoctorAvailable.get(i).get(1).equalsIgnoreCase(searchDoctorAvailability)) {
                                index_color = Integer.toString(i);
                        %><script>
                            $("#tbl_" +<%=index_color%>).css("background-color", "#8cff66");

                    </script><%
                        }
                        String doctorAvailablity = "select * from pms_staff_leave "
                                + "where status='approve' AND "
                                + "'" + searchDateAvailability + "' BETWEEN DATE(start_leave_date) "
                                + "AND DATE(end_leave_date) AND user_id='" + doctorId + "' ";
                        ArrayList<ArrayList<String>> dataDoctorAvailablity = Conn.getData(doctorAvailablity);
//out.print(doctorAvailablity);
                        String sqlDutyDoctor = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
                                + "from pms_duty_roster pdr, "
                                + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
                                + "FROM adm_user "
                                + "WHERE OCCUPATION_CODE = 'DOCTOR' AND USER_ID = '" + doctorId + "' "
                                + "ORDER BY LCASE(USER_NAME) ASC)doc "
                                + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                + "DATE('" + searchDateAvailability + "') BETWEEN DATE(start_date) AND DATE(end_date) ";
                        ArrayList<ArrayList<String>> dataDutyDoctor = Conn.getData(sqlDutyDoctor);

                        //                                            out.print(sqlDutyDoctor);
                        String sqlCheckHoliday = "SELECT * FROM pms_holiday WHERE DATE(holiday_date) = '" + searchDateAvailability + "' ";
                        ArrayList<ArrayList<String>> dataCheckHoliday = Conn.getData(sqlCheckHoliday);

                        String sqlCompareDay = "SELECT * FROM pms_clinic_day WHERE hfc_cd = '" + hfcCD + "' AND day_cd = '" + newCompareDay + "' ";
                        ArrayList<ArrayList<String>> dataCompareDay = Conn.getData(sqlCompareDay);
//out.print(sqlCompareDay);

                        if (dataCheckHoliday.size() == 0) {
                            if (dataCompareDay.size() > 0) {
                                //                                                    out.print(dataDutyDoctor.size());
                                if (dataDutyDoctor.size() > 0) {

                                    if (dataDoctorAvailablity.size() > 0) {

                                        for (int index = 0; index < dataDoctorAvailablity.size(); index++) {
                    %>
                    <td><center>not available</center></td>
                    <td><center><%=dataDoctorAvailablity.get(index).get(7)%></center></td> 
                    <td><center>-</center></td> 
                        <%
                                                        }
                                                    } else { %>
                    <td><center>available</center></td>
                    <td><center>on duty</center></td> 
                        <%
                            String dateNotAvailable = "SELECT TIME(start_time) "
                                    + "FROM pms_appointment "
                                    + "WHERE date(appointment_date) = '" + searchDateAvailability + "' AND userid = '" + doctorId + "' AND status = 'active'";
                            ArrayList<ArrayList<String>> dataDateNotAvailable = Conn.getData(dateNotAvailable);
                        %>
                    <td>
                    <center>
                        <%
                            if (dataDateNotAvailable.size() > 0) {

                                for (int j = 0; j < dataDateNotAvailable.size(); j++) {
                                    out.print(dataDateNotAvailable.get(j).get(0));
                                    out.print(",");
                                }
                            } else {
                                out.print("all time available");

                            }
                        %> 
                    </center>
                    </td>
                    <% }
                                         } else { %><td><center>not available</center></td>
                    <td><center>not in duty roster</center></td> 
                    <td><center>-</center></td> <%
                                               //                                                      out.print(dataDutyDoctor.get(0).get(1)); 
                                           }
                                       } else { %>
                    <td><center>not available</center></td>
                    <td><center>clinic off</center></td> 
                    <td><center>-</center></td>  <%
                                           }
                                       } else {%>

                    <td><center>not available</center></td>
                    <td><center><%=dataCheckHoliday.get(0).get(2)%></center></td> 
                    <td><center>-</center></td>  <%

                                           }%>
                    <td><center><%=dateStart%> <% out.print('-');%><%=dateEnd%></center></td>  
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>

