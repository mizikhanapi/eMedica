<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

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
    String ic = (String) session.getAttribute("ic");
    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    out.print("ic = " + ic);
    out.print("|username = " +username);
    out.print("|hfc = " +hfc);
    out.print("|name = " +name);

    String hfcSession = (String) session.getAttribute("sessionHFC");
//    out.print(hfcSession);

    String hfcCode = "SELECT Detail_Ref_code "
            + "FROM lookup_detail "
            + "WHERE Master_Ref_code = '0081' AND Description = '" + hfcSession + "'";
    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(hfcCode);

    String hfcCD;
    if (dataHFCCode.size() > 0) {
        hfcCD = dataHFCCode.get(0).get(0);
    } else {
        hfcCD = null;
    }
    String sqlhfc = "SELECT DISTINCT state_code "
            + "FROM pms_duty_roster "
            + "WHERE hfc_cd = '" + hfcSession + "' ";
    ArrayList<ArrayList<String>> dataSQLHFC = Conn.getData(sqlhfc);

//    out.print(sqlhfc);
    String codeState = dataSQLHFC.get(0).get(0);

    String sqlDisplayHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' "
            + "AND ld.`Detail_Ref_code` = pmsh.state_code AND (pmsh.state_code = '" + codeState + "' OR pmsh.state_code = '00') "
            + "ORDER BY ld.`Description` ASC, pmsh.holiday_date ASC, pmsh.status DESC";
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
            + "WHERE t.state_code=ld.`Detail_Ref_code` AND ld.`Master_Ref_code` = '0002'  AND hfc_cd= '" + hfcCD + "' AND t.status='active')b "
            + "WHERE hfc.Master_Ref_Code='0081' AND hfc.Detail_Ref_code = b.hfc_cd)c "
            + "WHERE al.`Master_Ref_code`='0072' AND al.`Detail_Ref_code` = c.discipline_cd)d "
            + "WHERE sub.`Master_Ref_code` = '0071' AND sub.`Detail_Ref_code` = d.subdiscipline_cd "
            + "ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sqlUsername = "SELECT ic_no "
            + "FROM adm_signup_tbl "
            + "WHERE username = '" +username+ "'";
    ArrayList<ArrayList<String>> dataICNO = Conn.getData(sqlUsername);
    out.print("|dataICNO = " +dataICNO);

    String dataIC;

    if (dataICNO.size() > 0) {
        dataIC = dataICNO.get(0).get(0);
    } else {
        dataIC = null;
    }
    out.print("|dataIC = " +dataIC);
    String sqlIC = "SELECT PMI_NO, PATIENT_NAME "
            + "FROM pms_patient_biodata "
            + "WHERE NEW_IC_NO = '" + dataIC + "'";
    ArrayList<ArrayList<String>> dataPMINo = Conn.getData(sqlIC);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);

    String dataPMI;
    
    

    if (dataPMINo.size() > 0) {
        dataPMI = dataPMINo.get(0).get(0);
    } else {
        dataPMI = null;
    }
    out.print("|dataPMI = "+dataPMI);

    String sqlPatientDetails = "SELECT pb.PMI_NO, pb.PATIENT_NAME, pb.ID_NO "
            + "FROM pms_patient_biodata pb, signup_tbl st "
            + "WHERE pb.`NEW_IC_NO` = st.ic_no AND st.username = '" + username + "'";
    ArrayList<ArrayList<String>> dataPatientDetails = Conn.getData(sqlPatientDetails);

//    String dateFrom = request.getParameter("dateFrom");
//    String dateTo = request.getParameter("dateTo");
    String dateFrom = "2017-01-01";
    String dateTo = "2017-01-31";

    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, "
            + "LCASE(lookSub.staff_name) ,lookSub.discipline_name, lds.Description AS subdipline_name, lookSub.appointment_type, lookSub.ID_NO, lookSub.status, lookSub.canceled_reason "
            + "FROM lookup_detail lds, "
            + "(SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, "
            + "lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, lookDis.subdiscipline, lookDis.appointment_type, lookDis.ID_NO, lookDis.status, lookDis.canceled_reason "
            + "FROM lookup_detail ld, "
            + "(SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, pb.PATIENT_NAME, au.USER_NAME, pa.discipline, pa.subdiscipline, "
            + "pa.appointment_type, pb.ID_NO, pa.status, pa.canceled_reason "
            + "FROM pms_appointment pa, pms_patient_biodata pb, adm_user au "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID AND pa.pmi_no = '" + dataPMI + "' AND pa.hfc_cd = '" + hfcCD + "' AND (DATE(pa.appointment_date) BETWEEN '" + dateFrom + "' AND '" + dateTo + "') "
            + "ORDER BY pa.appointment_date DESC, pa.start_time ASC) lookDis "
            + "WHERE lookDis.discipline=ld.Detail_Ref_code "
            + "AND ld.Master_Ref_code = '0072') lookSub "
            + "WHERE lds.Master_Ref_code = '0071' "
            + "AND lookSub.subdiscipline=lds.Detail_Ref_code";
    ArrayList<ArrayList<String>> dataAppointment = Conn.getData(sqlAppointment);
    
    String pmi;
    String patientName;
    String idPatient;
    if (dataAppointment.size() > 0) {
        pmi = dataAppointment.get(0).get(2);
        patientName = dataAppointment.get(0).get(3);
        idPatient = dataAppointment.get(0).get(8);
    } else {


        String sqlPatientDet = "SELECT PMI_NO, PATIENT_NAME, ID_NO "
                + "FROM pms_patient_biodata "
                + "WHERE NEW_IC_NO = '" + ic + "'";
        ArrayList<ArrayList<String>> dataPatientDet = Conn.getData(sqlPatientDet);

        pmi = dataPatientDet.get(0).get(0);
        patientName = dataPatientDet.get(0).get(1);
        idPatient = dataPatientDet.get(0).get(2);
    }




%>
<!DOCTYPE html>
<html>
    <title>Patient Page</title>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: 2%; margin-bottom: 2%">
                    <img src="image/posterHeader.jpg" width="1600" height="345">
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-md-offset-1 " style="padding-top: 0.5%;">
                    Welcome <%=username%>
                </div>
                <div class="col-md-5 text-right">
                    <button class="btn btn-info buttonAuthenticate" onclick="window.location.href = 'destroySession.jsp'">Log out</button>
                </div>
            </div>   
            <div class="row">
                <div class="col-md-2 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
                    <script>
                        function a() 
                        {
                            <%
                            try
                            {
                                String error = request.getParameter("error");
                                if (error != null) 
                                {
                                    %>
                                    alert('<%=error %>');
                                    location.href = 'patientAppointment.jsp';
                                    <%
                                }
                            } 
                            catch (Exception e) 
                            {
                            }
                            %>
                        }
                        $(document).ready(function() {
                            $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                                //save the latest tab; use cookies if you like 'em better:
                                localStorage.setItem('lastTab', $(this).attr('href'));
                            });
                            //go to the latest tab, if it exists:
                            var lastTab = localStorage.getItem('lastTab');
                            if (lastTab) {
                                $('a[href=' + lastTab + ']').tab('show');
                                var a1 = setTimeout("a()", 1000);
                            } else
                            {
                                // Set the first tab if cookie do not exist
                                $('a[data-toggle="tab"]:first').tab('show');
                            }
                        });


                    </script>
                    <h3 class="headerTitle">Categories</h3>
                    <nav class="navbar navbar-inverse" style="background-color: white; ">
                        <div class="container-fluid">

                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar" >
                                <ul class="nav navbar-nav"  style="margin-bottom: 5%;" >
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                                    <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Check Availability<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a data-toggle="tab" class="dropdown-item" href="#doctorDirectory">Doctor Availability</a></li>
                                            <li><a data-toggle="tab" class="dropdown-item" href="#clinicDayDirectory">Clinic Availability</a></li>
                                        </ul>
                                    </li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#viewholiday">View Holiday</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#applyAppointment">Make Appointment</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#viewAppointment">View Appointment</a></li>
                                    <li id="tab"><a href="http://www.utem.edu.my/pusat_kesihatan/en/" target="_blank">University Health Centre</a></li>
                                </ul> 
                            </div>
                        </div>
                    </nav>
                </div> 
                <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">

                        <div id="viewAppointment" class="tab-pane fade">
                            <h3 class="headerTitle">View Appointment</h3>
                            <p><b>PMI No : </b><% out.print(pmi);%> </p>
                            <p><b>ID No : </b><% out.print(idPatient); %></p>
                            <p><b>Patient Name : </b><% out.print(patientName); %></p>
                            <form method="post" action="patientAppointmentViewAll.jsp">
                                <p><b>Date From : </b><input type="date" name="dateFrom" value="" required></p>
                                <p><b>Date To : </b><input type="date"  name="dateTo" value="" required> 
                                    <button class="btn btn-xs btn-success" type="submit" value="Check Your Date" formaction="patientAppointmentSelectDate.jsp">Check Your Date</button>
                                    <button class="btn btn-xs btn-success" type="submit" value="ignore" formnovalidate>View All</button></p>
                            </form> 

                            <div class="table-responsive">

                                <%
                                    if (dataAppointment.size() > 0) { %>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th style="background-color : yellow;"></th>
                                            <th>Canceled Appointment</th>
                                            <th style="background-color : #8cff66;"></th>
                                            <th>Upcoming Appointment</th>
                                            <th style="background-color : red;"></th>
                                            <th>Past Appointment</th>
                                        </tr>
                                    </thead>
                                </table>
                                <table class="table table-bordered table-hover" style="margin-bottom: 4%" id="appointmentTable">
                                    <thead>
                                        <tr>
                                            <th><center>No</center></th>
                                    <th><center>Appointment Date</center></th>
                                    <th><center>Appointment Time</center></th>
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
                                            for (int i = 0; i < dataAppointment.size(); i++) {
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
                                            <%                                                Date currentDate = new Date();
                                                String todayDate = DATE_FORMAT.format(currentDate);

                                                if ((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("active")) { %>
                                            <td class="incoming_date_area"><center><%out.print(i + 1);%></center></td>
                                            <td class="incoming_date_area"><center><%=appointmentDate%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td class="incoming_date_area"><left><%=dataAppointment.get(i).get(4)%></left></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <td class="incoming_date_area">
                                            <center>
                                                <button class="btn btn-xs btn-primary" onClick="return myFunction('<%=dataAppointment.get(i).get(2)%>', '<%=hfcCD%>', '<%=dataAppointment.get(i).get(0)%>')">Cancel</button>
                                                <script>
                                                    function myFunction(e27, e48, e32)
                                                    {
                                                        var result = confirm("Are you sure to cancel your appointment. This action is unreturnable");
                                                        if (result == true)
                                                        {
                                                            window.location = 'patientCancelAppointment.jsp?e27=' + e27 + '&e48=' + e48 + '&e32=' + e32 + '&status=inactiev&canceled_by=<%=ic%>';
                                                        } else
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
                                            else if ((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("canceled")) 
                                            {%>
                                            <td style="background-color : yellow"><center><%out.print(i + 1);%></center></td>
                                            <td><center><%=appointmentDate%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                            <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
                                            <td>
                                            <center>
                                                <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href = 'patientCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                            </center>
                                            </td>
                                            <td><center><%=dataAppointment.get(i).get(10)%></center></td>
                                            <%
                                    } else {
                                    %>
                                    <td style="background-color:red"><center><%out.print(i + 1);%></center></td>
                                    <td><center><%=appointmentDate%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(1)%></center></td> 
                                    <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                    <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                    <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
                                    <td>
                                    <center>
                                        <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href = 'patientCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                    </center>
                                    </td>
                                    <td><center>Not Applicable</center></td>
                                    <%  } %>

                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %><p style="margin-top: 4%;"><center>No data</center></p><%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                    Copyright &copy; BIOCORE 2016
                </div>
            </div>
        </div>
                                    
    </body>
</html>
