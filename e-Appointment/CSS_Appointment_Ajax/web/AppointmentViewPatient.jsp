<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
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
    Conn Conn = new Conn();
    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUBDISCIPLINE_CODE");

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

    String sqlStaffLeave = "SELECT sl.hfc_cd, au.USER_ID, LCASE(au.USER_NAME) AS patientName, date(sl.start_leave_date), date(sl.end_leave_date), sl.leave_reason, sl.status "
            + "FROM pms_staff_leave sl, adm_user au "
            + "WHERE (sl.status = 'process' OR sl.status = 'approve' OR status = 'not approve') AND au.USER_ID = sl.user_id "
            + "ORDER BY au.USER_NAME DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);

    String sqlAdminLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '" + username + "' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataAdminLeave = Conn.getData(sqlAdminLeave);

    String sqlAdminUsername = "SELECT USER_NAME FROM adm_user WHERE USER_ID = '" + username + "'";
    ArrayList<ArrayList<String>> dataAdminUsername = Conn.getData(sqlAdminUsername);

    String adminUsername = dataAdminUsername.get(0).get(0);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);
    String searchAppointmentPatient = request.getParameter("searchAppointmentPatient");


    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, "
            + "lookSub.staff_name ,lookSub.discipline_name, lds.Description AS subdipline_name, lookSub.appointment_type, lookSub.status, lookSub.canceled_reason "
            + "FROM lookup_detail lds, "
            + "(SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, "
            + "lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, lookDis.subdiscipline, lookDis.appointment_type, lookDis.status, lookDis.canceled_reason "
            + "FROM lookup_detail ld, "
            + "(SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, LCASE(pb.PATIENT_NAME) AS PATIENT_NAME, "
            + "LCASE(au.USER_NAME) AS USER_NAME, "
            + "pa.discipline, pa.subdiscipline, pa.appointment_type, pa.status, pa.canceled_reason "
            + "FROM pms_appointment pa, pms_patient_biodata pb, adm_user au "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID "
            + "AND  (lower(pb.PATIENT_NAME) like '%"+searchAppointmentPatient+"%' OR upper(pb.PATIENT_NAME) like '%"+searchAppointmentPatient+"%') "
            + "ORDER BY pa.appointment_date DESC, pa.start_time ASC) lookDis "
            + "WHERE lookDis.discipline=ld.Detail_Ref_code "
            + "AND ld.Master_Ref_code = '0072') lookSub "
            + "WHERE lds.Master_Ref_code = '0071' "
            + "AND lookSub.subdiscipline=lds.Detail_Ref_code";
    ArrayList<ArrayList<String>> dataAppointment = Conn.getData(sqlAppointment); 
    


%>


<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">

            <div class="row">

                <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">

                        <div id="viewAppointment" class="tab-pane active">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Appointment Date</center></th>
                            <th><center>Appointment Time</center></th>
                            <th><center>PMI No</center></th>
                            <th><center>Patient Name</center></th>
                            <th><center>Doctor Name</center></th>
                            <th><center>Discipline</center></th>
                            <th><center>Subdicipline</center></th>
                            <th><center>Appointment Type</center></th>
                            <th><center>Action</center></th>
                            <th><center>Cancel Reason</center></th>  
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataAppointment.size() > 0) 
                            {
                                for (int i = 0; i < dataAppointment.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String appDateFromDB = dataAppointment.get(i).get(0);
                                    Date covertedAppDate = formatter.parse(appDateFromDB);
//                                    String endLeaveDateFromDB = dataAppointment.get(i).get(1);
//                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String appointmentDate = DATE_FORMAT.format(covertedAppDate);
//                                    String endLeave = DATE_FORMAT.format(endLeaveDate);
                                    
//                                    String staffIDFromDB = dataStaffLeave.get(i).get(1);
                                    
                                    %>
                                    <tr>
                                       <%
                                        Date currentDate=new Date();
                                        String todayDate=DATE_FORMAT.format(currentDate);

                                        if((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(8).equals("active"))
                                        { %>
                                            <td class="incoming_date_area"><center><%out.print(i+1);%></center></td>
                                            <td class="incoming_date_area"><center><%=appointmentDate%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(2)%></center></td>
                                            <td class="incoming_date_area"><left><%=dataAppointment.get(i).get(3)%></left></td>
                                            <td class="incoming_date_area"><left><%=dataAppointment.get(i).get(4)%></left></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <!--<td><center><%=dataAppointment.get(i).get(8)%></center></td>-->
                                            <td class="incoming_date_area">
                                    <center>
                                        <button class="btn btn-xs btn-primary" onClick="return myFunction('<%=dataAppointment.get(i).get(2)%>','<%=hfcCD%>','<%=dataAppointment.get(i).get(0)%>')">Cancel</button>
                                            <script>
                                                function myFunction(e27,e48,e32)
                                                {
                                                    var result = prompt("Canceled Reason :", "");
                                                    if (result != null)
                                                    {
                                                        if(result != "")
                                                        {    
                                                            window.location = 'cancelAppointment.jsp?e27='+e27+'&e48='+e48+'&e32='+e32+'&status=canceled&canceled_by=<%=username%>&canceledReason='+result;
                                                        }
                                                        else
                                                        {
                                                            return false;
                                                        }
                                                    }
                                                    else
                                                    {
                                                        return false;
                                                    }
                                                }
                                            </script>
                                    </center>
                                        </td>
                                        <td class="incoming_date_area"><center></center></td>
                                        <% 
                                                                                } 
                                        else if((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(8).equals("canceled"))
                                        {%>
                                            <td style="background-color : yellow"><center><%out.print(i+1);%></center></td>
                                            <td><center><%=appointmentDate%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                            <td><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                            <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                            <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <!--<td><center><%=dataAppointment.get(i).get(8)%></center></td>-->
                                            <td>
                                                <center>
                                                    <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href='adminCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                                </center>
                                            </td>
                                            <td><center><%=dataAppointment.get(i).get(9)%></center></td>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                            <td style="background-color:red"><center><%out.print(i+1);%></center></td>
                                            <td><center><%=appointmentDate%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                            <td><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                            <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                            <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <!--<td><center><%=dataAppointment.get(i).get(8)%></center></td>-->
                                            <td>
                                                <center>
                                                    <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href='adminCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                                </center>
                                            </td>
                                            <td><center>Not Applicable</center></td>
                                        <%
                                        }
                                        %>
                                    </tr>
                                <%
                                    if(covertedAppDate.before(today))
                                    {      
                                        RMIConnector rmic = new RMIConnector();
                                        String sqlInsert = "UPDATE pms_appointment SET status='inactive' WHERE appointment_date < date(now());";

                                        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                    }
                                }
                            }
                                %>
                    </tbody>
                </table>

            </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
