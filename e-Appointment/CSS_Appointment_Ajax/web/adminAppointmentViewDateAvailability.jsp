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
   Conn Conn = new Conn();
    String username = (String)session.getAttribute("username");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String)session.getAttribute("USER_NAME");
    String title = (String)session.getAttribute("OCCUPATION_CODE");
    String discipline = (String)session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String)session.getAttribute("SUBDISCIPLINE_CODE");
    String searchDateAvailability = request.getParameter("searchDateAvailability");
    String searchDoctorAvailability = request.getParameter("searchDoctorAvailability");
    


    

    String hfcCode = "SELECT Detail_Ref_code "
            + "FROM lookup_detail "
            + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataHFC = Conn.getData(hfcCode);  

    String hfcCD;
    if(dataHFC.size() > 0)
    {
        hfcCD = dataHFC.get(0).get(0);
    }
    else
    {
        hfcCD = null;
    }
    
//    out.print(hfcCD);
    String sqlDisplayHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
    ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayHoliday);
    
    String sqlDisplayClinic =  "SELECT d.*, sub.description AS subdiscipline_name "
            + "FROM lookup_detail sub, "
            + "(SELECT c.*, al.description AS discipline_name "
            + "FROM lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name "
            + "FROM lookup_detail hfc,"
            + "(SELECT t.*,ld.description AS state_name "
            + "FROM lookup_detail ld, "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time,  status "
            + "FROM pms_clinic_day)t "
            + "WHERE t.state_code=ld.`Detail_Ref_code` AND ld.`Master_Ref_code` = '0002'  AND hfc_cd= '"+hfcCD+"')b "
            + "WHERE hfc.Master_Ref_Code='0081' AND hfc.Detail_Ref_code = b.hfc_cd)c "
            + "WHERE al.`Master_Ref_code`='0072' AND al.`Detail_Ref_code` = c.discipline_cd)d "
            + "WHERE sub.`Master_Ref_code` = '0071' AND sub.`Detail_Ref_code` = d.subdiscipline_cd "
            + "ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sqlDisplayRoster =  "SELECT LCASE(ad.USER_NAME) as patientName, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status "
            + "FROM adm_user ad, pms_duty_roster dr "
            + "WHERE ad.USER_ID = dr.user_id";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);
    
    String sqlStaffLeave = "SELECT sl.hfc_cd, au.USER_ID, LCASE(au.USER_NAME) AS patientName, date(sl.start_leave_date), date(sl.end_leave_date), LCASE(sl.leave_reason) AS reason, sl.status "
            + "FROM pms_staff_leave sl, adm_user au "
            + "WHERE (sl.status = 'process' OR sl.status = 'approve' OR status = 'not approve') AND au.USER_ID = sl.user_id "
            + "ORDER BY au.USER_NAME DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);  
    
    
    String sqlAdminLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '"+username+"' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataAdminLeave = Conn.getData(sqlAdminLeave);
    
    
    String sqlAdminUsername = "SELECT USER_NAME FROM adm_user WHERE USER_ID = '"+username+"'";
    ArrayList<ArrayList<String>> dataAdminUsername = Conn.getData(sqlAdminUsername);
    
    String adminUsername = dataAdminUsername.get(0).get(0);
//    out.print(sqlStaffLeave);

    String sqlDoctorID = "SELECT * FROM adm_user WHERE USER_NAME = '"+searchDoctorAvailability+"'";
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
    
//    out.print(sqlDoctorAvailable);
    
    
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
    
//    out.print(sqlAppointment);
    
    String e1 = null; 
    String e2 = null;
    String e3 = null;
    String e4 = null;
    String e5 = null;
    String e6 = null;
    String stateCode = null;
    String e7 = null;
    String HFCCode = null;
    String e8 = null;
    String disciplineCode = null;
    String e9 = null;
    String subdisciplineCode = null;
    String e10 = null;
    String e11 = null;
    String e12 = null;
    String e13 = null;
    String e14 = null;
    String userID = null;
    String e15 = null;
    String e16 = null;
    String e17 = null;
    String e18 = null;
    String e19 = null;
    String e20 = null;
    String e21 = null;
    String e22 = null;
    String e23 = null;
    String e24 = null;
    String e25 = null;
    String e26 = null;
    String e27 = null;
    String e28 = null;
    String e29 = null;
    String e30 = null;
    String e31 = null;
    String e32 = null;
    String e33 = null;
    String e34 = null;
    String e35 = null;
    String disciplineCodeApp = null;
    String e36 = null;
    String subDisciplineCodeApp = null;
    String e37 = null;
    String e38 = null;
    String e39 = null;
    String e40 = null;
    String e41 = null;
    String e42 = null;
    String e43 = null;
    String e44 = null;
    String e45 = null;
    String e46 = null;
    String e47 = null;
    String e48 = null;

    e1 = request.getParameter("e1");
    e2 = request.getParameter("e2");
    e3 = request.getParameter("e3");
    e4 = request.getParameter("e4");
    e5 = request.getParameter("e5");   
    e6 = request.getParameter("e6"); 
    e7 = request.getParameter("e7"); 
    e8 = request.getParameter("e8"); 
    e9 = request.getParameter("e9"); 
    e10 = request.getParameter("e10"); 
    e11 = request.getParameter("e11");
    e12 = request.getParameter("e12");
    e13 = request.getParameter("e13");
    e14 = request.getParameter("e14");
    e15 = request.getParameter("e15");
    e16 = request.getParameter("e16");
    e17 = request.getParameter("e17");
    e18 = request.getParameter("e18");
    e19 = request.getParameter("e19");
    e20 = request.getParameter("e20");
    e21 = request.getParameter("e21");
    e22 = request.getParameter("e22");
    e23 = request.getParameter("e23");
    e24 = request.getParameter("e24");
    e25 = request.getParameter("e25");
    e26 = request.getParameter("e26");
    e27 = request.getParameter("e27");
    e30 = request.getParameter("e30");
    e31 = request.getParameter("e31");
    e32 = request.getParameter("e32");
    e33 = request.getParameter("e33");
    e34 = request.getParameter("e34");
    e35 = request.getParameter("e35");
    e36 = request.getParameter("e36");
    e37 = request.getParameter("e37");
    e38 = request.getParameter("e38");
    e39 = request.getParameter("e39");
    e40 = request.getParameter("e40");
    e41 = request.getParameter("e41");
    e42 = request.getParameter("e42");
    e43 = request.getParameter("e43");
    e44 = request.getParameter("e44");
    e45 = request.getParameter("e45");
    e46 = request.getParameter("e46");
    e47 = request.getParameter("e47");
     e48 = request.getParameter("e48");
    
//    out.print(username);
//    out.print(e23);
%>
            
<!DOCTYPE html>
<html>
    <title>Admin Page</title>
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
                            location.href = 'adminAppointment.jsp';
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
            <nav class="navbar navbar-inverse " style="background-color: white;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar" >
                        <ul class="nav navbar-collapse"  style="margin-bottom: 5%;" >
                            <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                            <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Holiday<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="tab" class="dropdown-item" href="#maintainholiday">Maintain Holiday</a></li>
                                    <li><a data-toggle="tab" class="dropdown-item" href="#viewholiday">View Holiday</a></li>
                                </ul>
                            </li>
                            <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Clinic Day<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="tab" class="dropdown-item" href="#maintainclinicday">Maintain Clinic Day</a></li>
                                    <li><a data-toggle="tab" class="dropdown-item" href="#viewclinicday">View Clinic Day</a></li>
                                </ul>
                            </li>
                            <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Roster<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="tab" class="dropdown-item" href="#maintainroster">Maintain Staff Roster</a></li>
                                    <li><a data-toggle="tab" class="dropdown-item" href="#viewroster">View Staff Roster</a></li>
                                </ul>
                            </li>
                            <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Leave<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="tab" class="dropdown-item" href="#maintainleave">Maintain Staff Leave</a></li>
                                    <li><a data-toggle="tab" class="dropdown-item" href="#viewleave">Apply Leave</a></li>
                                </ul>
                            </li>
                            <li id="tab"><a data-toggle="tab" href="#doctorDirectory">Doctor Availability</a></li>
                            <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Appointment<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="tab" class="dropdown-item" href="#addAppointment">Make Patient Appointment</a></li>
                                    <li><a data-toggle="tab" class="dropdown-item" href="#viewAppointment">View Patient Appointment</a></li>
                                </ul>
                            </li>
                            <li id="tab"><a href="http://www.utem.edu.my/pusat_kesihatan/en/" target="_blank">University Health Centre</a></li>
                        </ul> 
                    </div>
                </div>
            </nav>
        </div>
        <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
            <div class="tab-content">
            <div id="home" class="tab-pane active">
                    <h3 class="headerTitle">What is e-Appointment</h3>
                    <p style="text-align: justify"><strong>e-Appointment is a Web Bases application that is used to manage the patient appointment record by using a web based. 
                            Moreover this system is benefited for patients in order for them to book their appointment by themselves. As this web based application is designed 
                            in a responsive form so that it is also will be able to be opened in any mobile devices. User will be using a web browser to open the application 
                            then perform the booking appointment activities. Before performing an appointment user need to check the doctor availability and also view a holiday. 
                            First time user need to attend to the clinic in order to use the system but sign up is needed before user can proceed to sign in into the system.
                    </strong></p>
                    <h3 class="headerTitle" style="margin-top: 3%;">How to use the system ?</h3>
                    <p><strong>Step 1: Patients need to attend to the clinic/hospital as a First Time User in order to use the system</strong></p>
                    <p><strong>Step 2: Patients need to Sign Up and fill in the Register Form </strong></p>
                    <p><strong>Step 3: Patients can use the system by Signing in into the system</strong></p>
                    <p><strong>Step 4: Patients have option to  check the doctor availability and view holiday before make an appointment or directly make an appointment</strong></p>
                    <p><strong>Step 5: Patients can view their previous appointment at the View Appointment tab</strong></p>
                    <h3 class="headerTitle" style="margin-top: 3%;">Our Location</h3>
                <div class="google_map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                        e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
                View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
            </div>
            <div id="maintainholiday" class="tab-pane fade">
                <h3 class="headerTitle">Maintain Holiday</h3>
                <form class="form-horizontal" role="form" method="post" action="addHoliday.jsp">
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">State Name</label>
                        <div class="col-sm-10"> 
                             <input type="hidden" name="stateBefore" value="<%=e1%>">
                            <select class="form-control" id="state" name="state_code" required>
                                <option></option>
                           <%   String sql2 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0002';";
                                ArrayList<ArrayList<String>> dataState = Conn.getData(sql2);
                                
                                if(e1 == null)
                                {
                                    if(dataState.size()>0)
                                    {
                                        for(int i = 0; i < dataState.size(); i++)
                                        {%>
                                            <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                        <%}
                                    }
                               }
                                else
                                {    
                                    for(int i = 0; i < dataState.size(); i++)
                                    {
                                        if(e1.equals(dataState.get(i).get(0)))
                                        {%> 
                                            <option value="<%=e1%>" selected><%=dataState.get(i).get(1)%></option>
                                       <%}
                                        else
                                        {%>
                                            <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                       <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="startdate">Date</label>  
                        <input type="hidden" name="dateBefore" value="<%=e2%>">
                        <div class="col-sm-10">   
                            <%if(e2 == null)
                            {%>
                                <input  name="holiday_date" type="text" class="form-control" id="startdate" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="holiday_date" value="<%=e2%>" type="text" class="form-control" id="startdate" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Select date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-2" for="description">Description</label>  
                        <div class="col-sm-10">
                            <%if(e3 == null)
                            {%>
                                 <textarea name="holiday_desc" class="form-control" rows="5" id="description" required></textarea>
                            <%}
                            else
                            {%>
                                <textarea name="holiday_desc" class="form-control" rows="5" id="description" required><%=e3%></textarea>
                            <%}%>

                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="type">Applicable to </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="type" name="holiday_type" required>
                                    <%if (e4 == null) 
                                {%>
                                    <option></option>
                                    <option value="national">national</option>
                                    <option value="state">state</option>
                                <%} 
                                else 
                                {
                                    if (e4.equals("national")) 
                                    {%> 
                                        <option value="national" selected>national</option>
                                        <option value="state">state</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="national">national</option>
                                        <option value="state" selected>state</option><%
                                    }%>
                              <%}%> 
                            </select>
                        </div>
                    </div>
<!--                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" required>
                                
                                <%if (e5 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e5.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>-->
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateHoliday.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Date</center></th>
                            <th><center>Description</center></th>
                            <th><center>State Name</center></th>
                            <th><center>Applicable to</center></th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (data.size() > 0) 
                            {
                                for (int i = 0; i < data.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String dateFromDB = data.get(i).get(4);
                                    Date dateDB = formatter.parse(dateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = DATE_FORMAT.format(dateDB);
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDB);
                                    //out.print(newDate);
                                    
                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                       <td><center><%=date%></center></td>
                                        <td><left><%=data.get(i).get(5)%></left></td>
                                        <td><left><%=data.get(i).get(10)%></left></td>
                                        <td><left><%=data.get(i).get(6)%></left></td>  
                                        <td><center>
                                            <a href="adminAppointment.jsp?e1=<%=data.get(i).get(3)%>&e2=<%=data.get(i).get(4)%>&e3=<%=data.get(i).get(5)%>&e4=<%=data.get(i).get(6)%>&e5=<%=data.get(i).get(7)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-danger" onClick="myFunctionsh('<%=data.get(i).get(3)%>','<%=data.get(i).get(4)%>')">Delete</button>
                                            <script>
                                            function myFunctionsh(e1,e2)
                                            {
                                                var result = confirm("Are you sure to delete the selected holiday data?");
                                                if(result == true)
                                                {
                                                    window.location = 'deleteHoliday.jsp?e1='+e1+'&e2='+e2+'';
                                                }
                                                else
                                                {
                                                    return false;
                                                }
                                            }
                                            </script>
                                        </center></td>
                                    </tr>
                                <%
//                                    out.print(dateDB);
//                                    out.print(today);
                                    if(dateDB.before(today))
                                    {      
                                                RMIConnector rmic = new RMIConnector();
                                                String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                    }
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="viewholiday" class="tab-pane fade">
            <h3 class="headerTitle">View Holiday</h3>
                <div class="dropdown"  style="padding-bottom: 2%">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">View By
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointment.jsp">All States</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewNational.jsp">National</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewJohor.jsp">Johor</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewKedah.jsp">Kedah</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewKelantan.jsp">Kelantan</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewMelaka.jsp">Melaka</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewNegeri9.jsp">Negeri Sembilan</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewPahang.jsp">Pahang</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewPerak.jsp">Perak</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewPerlis.jsp">Perlis</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewPenang.jsp">Pulau Pinang</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewSabah.jsp">Sabah</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewSarawak.jsp">Sarawak</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewSelangor.jsp">Selangor</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewTerengganu.jsp">Terengganu</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewKL.jsp">Wilayah Persekutuan Kuala Lumpur</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewPutrajaya.jsp">Wilayah Persekutuan Putrajaya</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="adminAppointmentViewLabuan.jsp">Wilayah Persekutuan Labuan</a></li>
                    </ul>
                  </div>
                <div class="table-responsive">
                 <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Date</center></th>
                            <th><center>Description</center></th>
                            <th><center>State Name</center></th>
                            <th><center>Applicable to</center></th>
                            <!--<th><center>Status</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (data.size() > 0) 
                            {
                                for (int i = 0; i < data.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String dateFromDB = data.get(i).get(4);
                                    Date dateDB = formatter.parse(dateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = DATE_FORMAT.format(dateDB);
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDB);
//                                    out.print(newDate);
                                    
                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=date%></center></td>
                                        <td><left><%=data.get(i).get(5)%></left></td>
                                        <td><left><%=data.get(i).get(10)%></left></td>
                                        <td><left><%=data.get(i).get(6)%></left></td>  
                                    </tr>
                                <%
                                    if(dateDB.before(today))
                                    {      
                                                RMIConnector rmic = new RMIConnector();
                                                String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                    }
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="maintainclinicday" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Clinic Day</h3>
                    <form class="form-horizontal" role="form" method="post" action="addClinicDay.jsp">    
                    <div class="form-group"> 
                        <script>
                                function showUser(str) 
                                {
                                  if (str=="") 
                                  {
                                    document.getElementById("hfc_code").innerHTML="";
                                    return;
                                  } 
//                                                  
                                  $.ajax({
                                      type:"POST",
                                      url:"adminGetHFC.jsp",
                                      data:{state:str},
                                      success:function(data){
//                                                          $("#test_drop").append($('<option>',{
//                                                             value:"KL",
//                                                             text:data
//                                                          }));
                                       document.getElementById("hfc_code").innerHTML=data;
                                      } 
                                  });
                                }
                        </script>
                        <label class="control-label col-sm-2" for="state">State </label>
                        <div class="col-sm-10"> 
                        <select class="form-control" id="state" name="state_code" onchange="showUser(this.value)" required>
                                <option></option>
                           <%   
                                String sql3 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0002'";
                                ArrayList<ArrayList<String>> dataStateClinic = Conn.getData(sql3);
                                
                                if(e6 == null)
                                {
                                    if(dataStateClinic.size()>0)
                                    {
                                        for(int i = 0; i < dataStateClinic.size(); i++)
                                        {%>
                                            <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                                        <%}
                                    }
                                }
                                else
                                {    
                                    String sqlStateCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0002' AND  Description ='"+e6+"'";
                                    ArrayList<ArrayList<String>> dataStateCode = Conn.getData(sqlStateCode);  

                                    stateCode = dataStateCode.get(0).get(0);

                                    for(int i = 0; i < dataStateClinic.size(); i++)
                                    {
                                        if(stateCode.equals(dataStateClinic.get(i).get(0)))
                                        {%> 
                                            <option value="<%=stateCode%>" selected><%=dataStateClinic.get(i).get(1)%></option>
                                       <%}
                                        else
                                        {%>
                                            <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                                       <%}
                                    }
                                }%>
                        </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                        <div id="hfc" class="col-sm-10">
                            <select class="form-control" id="hfc_code" name="hfc_code" required>
                                <option></option>
                            </select>
                            <input type="hidden" name="hfcBefore" value="<%=HFCCode%>">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="discipline">Discipline </label>
                        <div class="col-sm-10"> 
                            <select class="form-control" id="discipline" name="discipline" required>
                            <option></option>
                            <%  String sql5 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072';";
                                ArrayList<ArrayList<String>> dataDicClinic = Conn.getData(sql5);

                                if (e8 == null) 
                                {
                                    if (dataDicClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDicClinic.size(); i++) 
                                        {%>
                                                <option value="<%=dataDicClinic.get(i).get(0)%>"><%=dataDicClinic.get(i).get(1)%></option>
                                      <% }
                                    }
                                } 
                                else 
                                {
                                    String sqlDisciplineCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0072' AND  Description ='"+e8+"'";
                                    ArrayList<ArrayList<String>> dataDisciplineCode = Conn.getData(sqlDisciplineCode);  

                                    disciplineCode = dataDisciplineCode.get(0).get(0);

                                    for (int i = 0; i < dataDicClinic.size(); i++) 
                                    {
                                        if (disciplineCode.equals(dataDicClinic.get(i).get(0))) 
                                        {%> 
                                            <option value="<%=disciplineCode%>" selected><%=dataDicClinic.get(i).get(1)%></option>
                                      <% } 
                                        else 
                                        {%>
                                            <option value="<%=dataDicClinic.get(i).get(0)%>"><%=dataDicClinic.get(i).get(1)%></option>
                                      <% }
                                    }
                                }%>
                            </select>
                            <input type="hidden" name="disciplineBefore" value="<%=disciplineCode%>">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="subdiscipline">Subdiscipline </label>
                        <div class="col-sm-10">
                            <select class="form-control" id="subdiscipline" name="subdiscipline" required>
                            <option></option>
                            <%  String sql6 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0071';";
                                ArrayList<ArrayList<String>> dataSubClinic = Conn.getData(sql6);

                                if (e9 == null) 
                                {
                                   
                                    if (dataSubClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataSubClinic.size(); i++) 
                                        {%>
                                            <option value="<%=dataSubClinic.get(i).get(0)%>"><%=dataSubClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                } 
                                else 
                                {
                                    String sqlSubDisciplineCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0071' AND  Description ='"+e9+"'";
                                    ArrayList<ArrayList<String>> dataSubDisciplineCode = Conn.getData(sqlSubDisciplineCode);  

                                    subdisciplineCode = dataSubDisciplineCode.get(0).get(0);

                                    for (int i = 0; i < dataSubClinic.size(); i++) 
                                    {
                                        if (subdisciplineCode.equals(dataSubClinic.get(i).get(0))) 
                                        { %> 
                                            <option value="<%=subdisciplineCode%>" selected><%=dataSubClinic.get(i).get(1)%></option>
                                      <% } 
                                        else 
                                        { %>
                                            <option value="<%=dataSubClinic.get(i).get(0)%>"><%=dataSubClinic.get(i).get(1)%></option>
                                      <%}
                                    }}%> 
                            </select>
                           <input type="hidden" name="subdisciplineBefore" value="<%=subdisciplineCode%>">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">Clinic Day </label>
                        <div class="col-sm-10"> 
                        <input type="hidden" name="dayBefore" value="<%=e10%>">
                            <select class="form-control" id="state" name="day" required>
                                <option></option>
                                <% 
                                 if(e10 == null)
                                 {%>
                                    <option value="Monday">Monday</option>
                                    <option value="Tuesday">Tuesday</option>
                                    <option value="Wednesday">Wednesday</option>
                                    <option value="Thursday">Thursday</option>
                                    <option value="Friday">Friday</option>
                                    <option value="Saturday">Saturday</option>
                                    <option value="Sunday">Sunday</option>
                                <%}
                                else 
                                {
                                    if(e10.equals("Monday"))
                                    {%>
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option> 
                                    <%}
                                    else if(e10.equals("Tuesday"))
                                    {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option> 
                                    <%}
                                    else if(e10.equals("Wednesday"))
                                    {%>
                                        <option value="Monday">Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                    <%}
                                    else if(e10.equals("Thursday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else if(e10.equals("Friday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else if(e10.equals("Saturday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="<%=e10%>" selected><%=e10%></option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="<%=e10%>" selected><%=e10%></option>
                                <%}} %>
                               
                            </select>
                        </div>
                    </div>                                   
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="starttime">Start Time</label>  
                        <div class="col-sm-10">   
                            <%if(e11 == null)
                            {%>
                                <input  name="starttime" type="time-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="starttime" value="<%= e11 %>" type="time-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}%>
                        </div>
                    </div>   
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="endtime">End Time</label>  
                        <div class="col-sm-10">   
                            <%if(e12 == null)
                            {%>
                                <input  name="endtime" type="time-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="endtime" value="<%= e12 %>" type="time-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}%>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Clinic Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" required>
                                
                                <%if (e13 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e13.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateClinicDay.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                    </form>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center>No</center></th>
                            <th><center>State</center></th>
                            <th><center>Health Facility Name </center></th>
                            <th><center>Discipline</center></th>
                            <th><center>Subdiscipline</center></th>
                            <th><center>Clinic Day</center></th>
                            <th><center>Start Time</center></th>
                            <th><center>End Time</center></th>
                            <th><center>Clinic Status</center></th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (dataClinicDay.size() > 0) 
                        {
                            for (int i = 0; i < dataClinicDay.size(); i++) 
                            {%>
                            <tr>
                                <td><center><%out.print(i+1);%></center></td>
                                <td><left><%=dataClinicDay.get(i).get(8)%></left></td>
                                <td><left><%=dataClinicDay.get(i).get(9)%></left></td>
                                <td><left><%=dataClinicDay.get(i).get(10)%></left></td>
                                <td><left><%=dataClinicDay.get(i).get(11)%></left></td>
                                <td><left><%=dataClinicDay.get(i).get(2)%></left></td>
                                <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
                                <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
                                <td><center><%=dataClinicDay.get(i).get(7)%></center></td>
                                <td><center>
                                  <a href="adminAppointment.jsp?e6=<%=dataClinicDay.get(i).get(8)%>&e7=<%=dataClinicDay.get(i).get(9)%>&e8=<%=dataClinicDay.get(i).get(10)%>&e9=<%=dataClinicDay.get(i).get(11)%>&e10=<%=dataClinicDay.get(i).get(2)%>&e11=<%=dataClinicDay.get(i).get(5)%>&e12=<%=dataClinicDay.get(i).get(6)%>&e13=<%=dataClinicDay.get(i).get(7)%>"> 
                                      <button class="btn btn-xs btn-primary">Edit</button></a>
                                      <button class="btn btn-xs btn-danger" onClick="myFunctions('<%=dataClinicDay.get(i).get(1)%>','<%=dataClinicDay.get(i).get(3)%>','<%=dataClinicDay.get(i).get(4)%>','<%=dataClinicDay.get(i).get(2)%>')">Delete</button>
                                  <script>
                                  function myFunctions(e7,e8,e9,e10)
                                  {
                                      var result = confirm("Are you sure to delete the selected clinic day data?");
                                      if(result == true)
                                      {
                                          window.location = 'deleteClinicDay.jsp?e7='+e7+'&e8='+e8+'&e9='+e9+'&e10='+e10+'';
                                      }
                                      else
                                      {
                                          return false;
                                      }
                                  }
                                  </script>
                              </center></td>
                            </tr>
                            <%}
                        }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="viewclinicday" class="tab-pane fade">
                <h3 class="headerTitle">View Clinic Day</h3>  
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center>No</center></th>
                            <th><center>State</center></th>
                            <th><center>Health Facility Name </center></th>
                            <th><center>Discipline</center></th>
                            <th><center>Subdiscipline</center></th>
                            <th><center>Clinic Day</center></th>
                            <th><center>Start Time</center></th>
                            <th><center>End Time</center></th>
                            <!--<th><center>Status</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (dataClinicDay.size() > 0) 
                        {
                            for (int i = 0; i < dataClinicDay.size(); i++) 
                            {%> 
                                <tr>
                                    <td><center><%out.print(i+1);%></center></td>
                                    <td><left><%=dataClinicDay.get(i).get(8)%></left></td>
                                    <td><left><%=dataClinicDay.get(i).get(9)%></left></td>
                                    <td><left><%=dataClinicDay.get(i).get(10)%></left></td>
                                    <td><left><%=dataClinicDay.get(i).get(11)%></left></td>
                                    <td><left><%=dataClinicDay.get(i).get(2)%></left></td>
                                    <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
                                    <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
                                </tr>
                         <% }
                        }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="maintainroster" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Staff Roster</h3>
                    <form class="form-horizontal" role="form" method="post" action="addRoster.jsp"> 
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Health Facility Name </label>
                        <div class="col-sm-10"> 
                            
                            <%if(e15 == null)
                            {%>
                            <input  class="form-control" value="<%=hfc%>" type="text" readonly>
                            <%}
                            else
                            {%>
                                <input class="form-control" value="<%=e15%>" type="text" readonly>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Staff ID / Name / Title </label>
                        <div class="col-sm-10"> 
                            <select class="form-control" id="staffID" name="staffID">
                                <option></option>
                           <%   
                                String sql7 = "SELECT USER_ID, USER_NAME, OCCUPATION_CODE, HEALTH_FACILITY_CODE "
                                   + "FROM adm_user "
                                   + "WHERE (OCCUPATION_CODE = 'DOCTOR' OR OCCUPATION_CODE = 'NURSE') AND HEALTH_FACILITY_CODE = '"+hfc+"'";
                                ArrayList<ArrayList<String>> dataUserRoster = Conn.getData(sql7); 
                                
                                if(e14 == null)
                                {
                                    if(dataUserRoster.size()>0)
                                    {
                                        for(int i = 0; i < dataUserRoster.size(); i++)
                                        {%>
                                            <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                        <%}
                                    }
                                }
                                else
                                {    
//                                    String sql8 = "SELECT USER_ID FROM adm_user WHERE USER_NAME = '"+e14+"'";
//                                    ArrayList<ArrayList<String>> dataDisplayUserRoster = Conn.getData(sql8);
//                                    if(dataUserRoster.size()>0)
                                    //for add
                                    String sqlUserName = "SELECT USER_NAME FROM adm_user WHERE USER_ID = '"+e14+"'";
                                    ArrayList<ArrayList<String>> dataDisplayUserName = Conn.getData(sqlUserName);

                                    String Username = dataDisplayUserName.get(0).get(0);

//                                    userID = dataDisplayUserRoster.get(0).get(0);

                                    for(int i = 0; i < dataUserRoster.size(); i++)
                                    {
                                        
                                        if(Username.equals(dataUserRoster.get(i).get(1)))
                                        {%>
                                            <option value="<%=e14%>" selected ><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>

                                        <%}
                                        else
                                        {%>
                                            <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                       <%}
                                    }
                                }%>
                            </select>
                            <input type="hidden" name="userIDBefore" value="<%=e14%>">
                    </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Shift </label>
                        <div class="col-sm-10">
                            <select class="form-control" id="roster_category" name="roster_category" required>
                                <option></option>
                                <% 
                                 if(e16 == null)
                                 {%>
                                    <option value="Morning">Morning</option>
                                    <option value="Afternoon">Afternoon</option>
                                    <option value="Night">Night</option>
                                    <option value="Day off">Day off</option>
                                    <option value="Public Holiday">Public Holiday</option>
                                <%}
                                else 
                                {
                                    if(e16.equals("Morning"))
                                    {%>
                                        <option value="Morning" selected><%=e16%></option>
                                        <option value="Afternoon">Afternoon</option>
                                        <option value="Night">Night</option>
                                        <option value="Day off">Day off</option>
                                        <option value="Public Holiday">Public Holiday</option>

                                    <%}
                                    else if(e16.equals("Afternoon"))
                                    {%>
                                        <option value="Morning" >Morning</option>
                                        <option value="<%=e16%>" selected><%=e16%></option>
                                        <option value="Night">Night</option>
                                        <option value="Day off">Day off</option>
                                        <option value="Public Holiday">Public Holiday</option>
                                    <%}
                                    else if(e16.equals("Night"))
                                    {%>
                                        <option value="Morning">Morning</option>
                                        <option value="Afternoon">Afternoon</option>
                                        <option value="<%=e16%>" selected><%=e16%></option>
                                        <option value="Day off">Day off</option>
                                        <option value="Public Holiday">Public Holiday</option>
                                    <%}
                                    else if(e16.equals("Day off"))
                                {%>
                                        <option value="Morning" >Morning</option>
                                        <option value="Afternoon" >Afternoon</option>
                                        <option value="Night">Night</option>
                                        <option value="<%=e16%>" selected><%=e16%></option>
                                        <option value="Public Holiday">Public Holiday</option>
                                <%} 
                                    else
                                    {%>
                                        <option value="Morning" >Morning</option>
                                        <option value="Afternoon" >Afternoon</option>
                                        <option value="Night">Night</option>
                                        <option value="Day off">Day off</option>
                                        <option value="<%=e16%>" selected><%=e16%></option>
                                    <%}} %>
                               
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startDate">Start Date </label>
                        <input type="hidden" name="startDateBefore" value="<%=e17%>">
                        <div class="col-sm-10">
                           <%if(e17 == null)
                            {%>
                                <input  class="form-control" name="start_date" value="" type="date" id="startDate">
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="start_date" value="<%=e17%>" type="date" id="startDate">
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endDate">End Date </label>
                        <div class="col-sm-10">
                          <%if(e18 == null)
                            {%>
                                <input  class="form-control" name="end_date" value="" type="date" >
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="end_date" value="<%=e18%>" type="date" >
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startTime">Start Time </label>
                        <div class="col-sm-10">
                          <%if(e19 == null)
                            {%>
                                <input  class="form-control" name="start_time" value="" type="time" id="startDate">
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="start_time" value="<%=e19%>" type="time" id="startDate">
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endTime">End Time </label>
                        <div class="col-sm-10">
                         <%if(e20 == null)
                            {%>
                                <input  class="form-control" name="end_time" value="" type="time" id="startDate">
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="end_time" value="<%=e20%>" type="time" id="startDate">
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Roster Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" >
                                
                                <%if (e21 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e21.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateRoster.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                    </form>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center> No</center> </th>
                            <th><center> Staff Name</center></th>
                            <th><center> Start Date </center></th>
                            <th><center> End Date</center></th>
                            <th><center> Start Time</center></th>
                            <th><center> End Time</center></th>
                            <th><center> Shift</center></th>
                            <th><center> Roster Status</center></th>
                            <th><center> Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (dataClinicRoster.size() > 0) 
                        {
                            for (int i = 0; i < dataClinicRoster.size(); i++) 
                            {
                                Date today = new Date();
                                String expectedPattern = "yyyy-MM-dd";
                                SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                String startDateFromDB = dataClinicRoster.get(i).get(3);
                                String endDateFromDB = dataClinicRoster.get(i).get(4);
                                Date startDateDB = formatter.parse(startDateFromDB);
                                Date endDateDB = formatter.parse(endDateFromDB);

                                SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                String dateStart = DATE_FORMAT.format(startDateDB);
                                String dateEnd = DATE_FORMAT.format(endDateDB);                              

//                                 %>
                                <tr>
                                    <td><center><%out.print(i+1);%></center></td>
                                    <td><left> <%=dataClinicRoster.get(i).get(0)%></left></td>
                                    <td><center> <%=dateStart%></center></td>
                                    <td><center> <%=dateEnd%></center></td>
                                    <td><center> <%=dataClinicRoster.get(i).get(5)%></center></td>
                                    <td><center> <%=dataClinicRoster.get(i).get(6)%></center></td>
                                    <td><left> <%=dataClinicRoster.get(i).get(7)%></left></td>
                                    <td><center> <%=dataClinicRoster.get(i).get(8)%></center></td>
                                    <td><center>
                                        <a href="adminAppointment.jsp?e14=<%=dataClinicRoster.get(i).get(1)%>&e15=<%=hfc%>&e16=<%=dataClinicRoster.get(i).get(7)%>&e17=<%=dataClinicRoster.get(i).get(3)%>&e18=<%=dataClinicRoster.get(i).get(4)%>&e19=<%=dataClinicRoster.get(i).get(5)%>&e20=<%=dataClinicRoster.get(i).get(6)%>&e21=<%=dataClinicRoster.get(i).get(8)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                            <button class="btn btn-xs btn-danger" onClick="myFunctionsr('<%=dataClinicRoster.get(i).get(1)%>','<%=hfc%>','<%=dataClinicRoster.get(i).get(3)%>')">Delete</button>
                                        <script>
                                        function myFunctionsr(e14,e15,e17)
                                        {
                                            var result = confirm("Are you sure to delete the selected roster data?");
                                            if(result == true)
                                            {
                                                window.location = 'deleteRoster.jsp?e14='+e14+'&e15='+e15+'&e17='+e17+'';
                                            }
                                            else
                                            {
                                                return false;
                                            }
                                        }
                                        </script>
                                    </center></td>
                                </tr>
                         <%}
                        }%>
                    </tbody>
                    </table>
                  </div>
            </div>
            <div id="viewroster" class="tab-pane fade">
                <h3 class="headerTitle">View Staff Roster</h3>
                    <div class="table-responsive">
                     <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center> No</center> </th>
                            <th><center> Staff Name</center></th>
                            <th><center> Start Date </center></th>
                            <th><center> End Date</center></th>
                            <th><center> Start Time</center></th>
                            <th><center> End Time</center></th>
                            <th><center> Shift</center></th>
                            <!--<th><center> Status</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataClinicRoster.size() > 0) 
                            {
                                for (int i = 0; i < dataClinicRoster.size(); i++) 
                                {Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String startDateFromDB = dataClinicRoster.get(i).get(3);
                                    String endDateFromDB = dataClinicRoster.get(i).get(4);
                                    Date startDateDB = formatter.parse(startDateFromDB);
                                    Date endDateDB = formatter.parse(endDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String dateStart = DATE_FORMAT.format(startDateDB);
                                    String dateEnd = DATE_FORMAT.format(endDateDB);                              
                                    
//                                 %>
                                    <tr>
                                        <td><center><%out.print(i+1);%></center></td>
                                        <td><left> <%=dataClinicRoster.get(i).get(0)%></left></td>
                                        <td><center> <%=dateStart%></center></td>
                                        <td><center> <%=dateEnd%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(5)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(6)%></center></td>
                                        <td><left> <%=dataClinicRoster.get(i).get(7)%></left></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                    </table>
                    </div>
            </div>
            <div id="maintainleave" class="tab-pane fade">
                <h3 class="headerTitle">Maintain Staff Leave</h3>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Staff Name</center></th>
                            <th><center>Start date</center></th>
                            <th><center>End date</center></th>
                            <th><center>Reason</center></th>
                            <th><center>Total Day</center></th>
                            <th><center>Leave Status</center></th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (dataStaffLeave.size() > 0) 
                        {
                            for (int i = 0; i < dataStaffLeave.size(); i++) 
                            {
                                Date today = new Date();
                                String expectedPattern = "yyyy-MM-dd";
                                SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                String startLeaveDateFromDB = dataStaffLeave.get(i).get(3);
                                Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                                String endLeaveDateFromDB = dataStaffLeave.get(i).get(4);
                                Date endLeaveDate = formatter.parse(endLeaveDateFromDB);

                                SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                String startLeave = DATE_FORMAT.format(startLeaveDate);
                                String endLeave = DATE_FORMAT.format(endLeaveDate);

                                String staffIDFromDB = dataStaffLeave.get(i).get(1);

                                String sqlTotalDay = "SELECT DATEDIFF('"+endLeaveDateFromDB+"', '"+startLeaveDateFromDB+"') AS TotalDay "
                                        + "FROM pms_staff_leave "
                                        + "WHERE user_id = '"+staffIDFromDB+"'";
                                ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
                                int plusOneDay = 1;
                                int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                int totalDay = dayFromDBCalculation + plusOneDay;

                        %>
                                <tr>
                                    <%
                                    if(dataStaffLeave.get(i).get(6).equals("approve") || dataStaffLeave.get(i).get(6).equals("not approve"))
                                    { %>
                                    <td><center><%out.print(i+1);%></center></td>
                                    <td><left><%=dataStaffLeave.get(i).get(2)%></left></td>
                                    <td><center><%=startLeave%></center></td>
                                    <td><center><%=endLeave%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(5)%></center></td>
                                    <td><center><%=totalDay%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(6)%></center></td>
                                    <td><center>
                                        <a href="updateLeaveApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>"> 
                                            <button disabled="disabled" id="disableButton" class="btn btn-xs btn-primary">Approve</button>
                                        </a>
                                        <button disabled="disabled" class="btn btn-xs btn-primary" id="disableButton" onClick="location.href = 'updateLeaveNotApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>'">Not Approve</button>
                                    </center></td>
                                    <%}
                                    else
                                    {%>
                                    <td><center><%out.print(i+1);%></center></td>
                                    <td><left><%=dataStaffLeave.get(i).get(2)%></left></td>
                                    <td><center><%=startLeave%></center></td>
                                    <td><center><%=endLeave%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(5)%></center></td>
                                    <td><center><%=totalDay%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(6)%></center></td>
                                    <td><center>
                                        <a href="updateLeaveApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>"> 
                                            <button id="disableButton" class="btn btn-xs btn-primary">Approve</button>
                                        </a>
                                        <button class="btn btn-xs btn-primary" id="disableButton" onClick="location.href = 'updateLeaveNotApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>'">Not Approve</button>
                                    </center>
                                    </td>
                                    <%}%>
                                </tr>
                          <%}
                        }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="viewleave" class="tab-pane fade">
                <h3 class="headerTitle">Apply Leave</h3> 
                <form class="form-horizontal" role="form" method="post" action="addLeaveAdmin.jsp"> 
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                        <div class="col-sm-10"> 
                            
                           
                            <input  class="form-control" value="<%=hfc%>" type="text" readonly>
                         
                            
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Staff Name </label>
                        <div class="col-sm-10"> 
                            
                            <%if(e23 == null)
                            {%>
                                <input  class="form-control" value="<%=adminUsername%>" name="staffID" type="text" readonly>
                            <%}
                            else
                            {%>
                                <input class="form-control" value="<%=e23%>" name="staffID" type="text" readonly>
                            <%}%>
                        </div>
                    </div>  
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startLeave">Start Leave </label>
                        <input type="hidden" name="startLeaveBefore" value="<%=e24%>">
                        <div class="col-sm-10">
                           <%if(e24 == null)
                            {%>
                                <input  class="form-control" name="start_leave" value="" type="date" required>
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="start_leave" value="<%=e24%>" type="date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endLeave">End Leave </label>
                        <div class="col-sm-10">
                           <%if(e25 == null)
                            {%>
                                <input  class="form-control" name="end_leave" value="" type="date" required>
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="end_leave" value="<%=e25%>" type="date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-2" for="description">Leave Reason</label>  
                        <div class="col-sm-10">
                            <%if(e26 == null)
                            {%>
                                 <textarea class="form-control" name="leave_reason"  rows="5" id="description" required></textarea>
                            <%}
                            else
                            {%>
                                <textarea class="form-control"  name="leave_reason" rows="5" id="description" required><%=e26%></textarea>
                            <%}%>    
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Apply</button>
                            <!--<button type="submit" class="btn btn-success" formaction="updateLeave.jsp">Update</button>-->
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Start date</center></th>
                            <th><center>End date</center></th>
                            <th><center>Reason</center></th>
                            <th><center>Total Day</center></th>
                            <th><center>Leave Status</center></th>
                            <!--<th><center>Action</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataAdminLeave.size() > 0) 
                            {
                                for (int i = 0; i < dataAdminLeave.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String startLeaveDateFromDB = dataAdminLeave.get(i).get(1);
                                    Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                                    String endLeaveDateFromDB = dataAdminLeave.get(i).get(2);
                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String startLeave = DATE_FORMAT.format(startLeaveDate);
                                    String endLeave = DATE_FORMAT.format(endLeaveDate);
                                    
                                    String staffIDFromDB = dataAdminLeave.get(i).get(0);
                                    
//                                    RMIConnector rmic = new RMIConnector();
                                    String sqlTotalDay = "SELECT DATEDIFF('"+endLeaveDateFromDB+"', '"+startLeaveDateFromDB+"') AS TotalDay "
                                            + "FROM pms_staff_leave "
                                            + "WHERE user_id = '"+staffIDFromDB+"'";
                                    ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
//                                    boolean isSelect = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlTotalDay);
//                                    out.print(sqlTotalDay);
//                                    out.print(isSelect);
                                    int plusOneDay = 1;
                                    int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                    int totalDay = dayFromDBCalculation + plusOneDay;

                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                               out.print(i+1);
                                                    
                                                %>
                                        </center></td>
                                        <td><center><%=startLeave%></center></td>
                                        <td><center><%=endLeave%></center></td>
                                        <td><center><%=dataAdminLeave.get(i).get(3)%></center></td>
                                        <td><center><%=totalDay%></center></td>
                                        <td><center><%=dataAdminLeave.get(i).get(4)%></center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="doctorDirectory" class="tab-pane fade">
                <h3 class="headerTitle">Doctor Availability</h3>
                <p>Search Area:</p>                     
                <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <form method="post" name="myform" role="form" action="adminAppointmentViewDateAvailability.jsp">
                            <!--<div class="form-inline" >-->
                            <div class="form-group">
                                <input type="date" name="searchDateAvailability"  class="form-control" placeholder="Search Appointment Date" required="required"/>
                            </div>
                            <div class="form-group"> 
                                <!--<div class="col-sm-10">--> 
                                <select class="form-control" id="state" placeholder="Search Doctor Name"  name="searchDoctorAvailability" required>
                                    <option></option>
                                    <%   String sqlDctorAvailability = "SELECT doc.*,pdr.start_date,pdr.end_date "
                                            + "from pms_duty_roster pdr, "
                                            + "(SELECT USER_ID,USER_NAME,OCCUPATION_CODE "
                                            + "FROM adm_user  "
                                            + "WHERE OCCUPATION_CODE = 'DOCTOR')doc "
                                            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date)";
                                         ArrayList<ArrayList<String>> dataDctorAvailability = Conn.getData(sqlDctorAvailability);

                                            DateTime dt = DateTime.parse(searchDateAvailability);
                                            String todaysDate =(String) dt.toString("dd/MM/yyyy");
                                        
                                            if(dataDctorAvailability.size()>0)
                                            {
                                                 for(int i = 0; i < dataDctorAvailability.size(); i++)
                                                 {%>
                                                <option value="<%=dataDctorAvailability.get(i).get(1)%>"><%=dataDctorAvailability.get(i).get(1)%></option>
                                                <%}
                                            }
                                    %>
                                </select>
                                <!--</div>-->
                                <%out.print(sqlDctorAvailability);%>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-xs btn-success">Search</button>
                            </div>
                            <!--</div>-->
                        </form>
                        <form method="post" name="myform" role="form" action="adminAppointment.jsp">
                            <button class="btn btn-info">Today's Availability</button>
                        </form>
                    </div>
                </div>
                <p>Date :  <%out.print(todaysDate);%></p>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
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
                        <tbody><%

                            String index_color=null;
                            for (int i = 0; i < dataDoctorAvailable.size(); i++) 
                            {
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

    //                                            out.print(dataDoctorAvailable.get(i).get(1));
    //                                            out.print(searchDoctorAvailability.toLowerCase());

                        %>
                            <tr id="tbl_<%=i%>">
                                <td><center><%out.print(i + 1);%></center></td>
                                <td><left><%=dataDoctorAvailable.get(i).get(1)%></left></td>
                            <%

                                String doctorId = dataDoctorAvailable.get(i).get(0);

                                if(dataDoctorAvailable.get(i).get(1).equalsIgnoreCase(searchDoctorAvailability))
                                {
                                    index_color = Integer.toString(i);
                                     %><script>
                                $("#tbl_"+<%=index_color%>).css("background-color","#8cff66");

                                    </script><%
                                }
                                String doctorAvailablity = "select * from pms_staff_leave "
                                        + "where status='approve' AND "
                                        + "'"+searchDateAvailability+"' BETWEEN DATE(start_leave_date) "
                                        + "AND DATE(end_leave_date) AND user_id='" + doctorId + "' ";
                                ArrayList<ArrayList<String>> dataDoctorAvailablity = Conn.getData(doctorAvailablity);

                                String sqlDutyDoctor = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
                                        + "from pms_duty_roster pdr, "
                                        + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
                                        + "FROM adm_user "
                                        + "WHERE OCCUPATION_CODE = 'DOCTOR' AND USER_ID = '"+doctorId+"' "
                                        + "ORDER BY LCASE(USER_NAME) ASC)doc "
                                        + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                        + "DATE('"+searchDateAvailability+"') BETWEEN DATE(start_date) AND DATE(end_date) ";
                                ArrayList<ArrayList<String>> dataDutyDoctor = Conn.getData(sqlDutyDoctor);

    //                                            out.print(sqlDutyDoctor);

                                String sqlCheckHoliday = "SELECT * FROM pms_holiday WHERE DATE(holiday_date) = '"+searchDateAvailability+"' ";
                                ArrayList<ArrayList<String>> dataCheckHoliday = Conn.getData(sqlCheckHoliday);

                                String sqlCompareDay = "SELECT * FROM pms_clinic_day WHERE hfc_cd = '"+hfcCD+"' AND day_cd = '"+newCompareDay+"' ";
                                ArrayList<ArrayList<String>> dataCompareDay = Conn.getData(sqlCompareDay);

                                if(dataCheckHoliday.size() == 0)
                                {
                                    if(dataCompareDay.size() > 0)
                                    {
    //                                                    out.print(dataDutyDoctor.size());
                                      if(dataDutyDoctor.size() > 0)
                                        {


                                            if (dataDoctorAvailablity.size() > 0) 
                                            {

                                                for (int index = 0; index < dataDoctorAvailablity.size(); index++) 
                                                {
                                                    %>
                                                        <td><center>not available</center></td>
                                                        <td><center><%=dataDoctorAvailablity.get(index).get(7)%></center></td> 
                                                        <td><center>-</center></td> 
                                                    <%
                                                }
                                            } 
                                            else 
                                            { %>
                                                <td><center>available</center></td>
                                                <td><center>on duty</center></td> 
                                            <%
                                                String dateNotAvailable = "SELECT TIME(start_time) "
                                                        + "FROM pms_appointment "
                                                        + "WHERE date(appointment_date) = '"+searchDateAvailability+"' AND userid = '" + doctorId + "' AND status = 'active'";
                                                ArrayList<ArrayList<String>> dataDateNotAvailable = Conn.getData(dateNotAvailable);
                                                    %>
                                                <td>
                                                <center>
                                                    <%
                                                        if (dataDateNotAvailable.size() > 0) 
                                                        {

                                                            for (int j = 0; j < dataDateNotAvailable.size(); j++) 
                                                            {
                                                                out.print(dataDateNotAvailable.get(j).get(0));
                                                                out.print(",");
                                                            }
                                                        } 
                                                        else 
                                                        {
                                                            out.print("all time available");

                                                        }
                                                    %> 
                                                </center>
                                                </td>
                                         <% }
                                        }
                                        else
                                        { %><td><center>not available</center></td>
                                       <td><center>not in duty roster</center></td> 
                                       <td><center>-</center></td> <%
    //                                                      out.print(dataDutyDoctor.get(0).get(1)); 
                                        }
                                    }
                                    else
                                    { %>
                                       <td><center>not available</center></td>
                                       <td><center>clinic off</center></td> 
                                       <td><center>-</center></td>  <%
                                    }
                                }
                                else
                                { %>

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
            <div id="addAppointment" class="tab-pane fade">
            <h3 class="headerTitle">Make Patient Appointment</h3>
            <div class="row myform">
               <div class="col-md-8 col-md-offset-2">
                  <p>Search Patient : <b><i>Please choose only one</i></b></p>
                  <form method="post" name="myform" role="form" action="adminAppointment.jsp">
                    <div class="row" style="padding: 1%; margin-bottom: 2%; background-color: #d9d9d9">
                        <input type="hidden" name="canceledReason" value="-">
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                   <label>PMI No :</label>
                                   <input type="text" name="pmiNo" id="pmiNo" class="form-control" placeholder=""/>
                                </div>
                            </div>
                      
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                   <label>IC No :</label>
                                   <input type="text" name="icNo" id="icNo" class="form-control" placeholder=""/>
                                </div>
                            </div>
                     
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                   <label>ID No :</label>
                                   <input type="text" name="idNo" id="idNo" class="form-control" placeholder=""/>
                                </div>
                            </div>
                    </div>
                    <button class="btn btn-xs btn-success" style="margin-bottom: 3%">Search</button>
                  </form>
                  <p style="color: red"> *** Please make sure that you have check the availability and also view the holiday before make an appointment</p>
                    <p>Patient Details :</p>
                    <form class="form-horizontal" role="form" method="post" action="adminCheckAppointment.jsp">
                        <%    
                            String pmiNO = request.getParameter("pmiNo");
                            String icNo = request.getParameter("icNo");
                            String idType = request.getParameter("idType");
                            String idNo = request.getParameter("idNo");
                            String patientName = request.getParameter("patientName");
                            String appDate = request.getParameter("appDate");
                            String appTime = request.getParameter("appTime");
                            String appDoc = request.getParameter("appDoc");
                            String disApp = request.getParameter("disApp");
                            String subDisApp = request.getParameter("subDisApp");
                            String appType = request.getParameter("appType");
                           
                        
                            String sqlw = "SELECT * "
                                    + "FROM pms_patient_biodata "
                                    + "WHERE PMI_NO='"+pmiNO+"' OR NEW_IC_NO = '"+icNo+"' OR ID_NO = '"+idNo+"'";
                            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sqlw);
//                            displayValue = dataPatient.get(0).get(0);
                            
//                            out.print(sql);
                            String sqlPatientApp = "SELECT * "
                                    + "FROM pms_appointment";
                            ArrayList<ArrayList<String>> dataPatientApp = Conn.getData(sqlPatientApp);
//                            displayValue 
//                            out.print(sql);
                        %>
                    <div class="form-group" >
                        <label class="control-label col-sm-2" for="pmiNo">PMI No : </label>  
                        <div class="col-sm-10">   
                            <%
                                if(dataPatient.size() > 0)
                                {
                                    %>
                                        <input name="pmiNo" value="<%= dataPatient.get(0).get(0) %>" type="text" class="form-control" readonly> <%
                                    
                                }
                                else
                                {%>
                                    <input name="pmiNo" value="" type="text" class="form-control" readonly> <%
                                }
                            %>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="patientName">Patient Name : </label>  
                        <div class="col-sm-10">   
                        <% 
                            if(dataPatient.size() > 0)
                            {
                                if(dataPatient.get(0).get(2) == null)
                                {
                                    %><input type="text" name="patientName" value="" class="form-control" readonly> <%
                                }
                                else
                                {
                                    if(dataPatient.get(0).get(2).equals(e31))
                                    {
                                        %><input type="text" name="patientName" value="<%=dataPatient.get(0).get(2)%>" class="form-control" readonly> <%
                                    }
                                    else
                                    {                   
                                        %><input type="text" name="patientName" value="<%=dataPatient.get(0).get(2)%>" class="form-control" readonly> <%
                                    }
                                }
                            }
                            else
                            {
                                %><input type="text" name="patientName" value="" class="form-control" readonly> <%
                            } 
                        %>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pmiNo">ID No : </label>  
                        <div class="col-sm-10">   
                            <%
                           
                                if(dataPatient.size() > 0)
                                {%>
                                    <input name="idNo" value="<%= dataPatient.get(0).get(7) %>" type="text" class="form-control" readonly> <%
                                }
                                else
                                {%>
                                    <input name="idNo" value="" type="text" class="form-control" readonly> <%
                                }
                              %>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDoc">*Doctor : </label>  
                        <div class="col-sm-10">   
                         <select class="form-control" id="doctorApp" name="appDoc" required>
                        <option></option>
                            <%  
                                String sqlDoc = "SELECT * "
                                        + "FROM adm_user "
                                        + "WHERE HEALTH_FACILITY_CODE = '"+hfc+"' AND OCCUPATION_CODE = 'DOCTOR';";
                                ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);
                                
                                if(appDoc == null)
                                {
                                    if (dataDoctor.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDoctor.size(); i++) 
                                        {%>
                                                <option value="<%=dataDoctor.get(i).get(3)%>"><%=dataDoctor.get(i).get(3)%></option>
                                      <% }
                                    }
                                }
                                else
                                {
                                    for (int i = 0; i < dataDoctor.size(); i++) 
                                    {%>
                                        <option value="<%=dataDoctor.get(i).get(3)%>"><%=dataDoctor.get(i).get(3)%></option>
                                  <%} 
                                }%>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDate">*Appointment Date : </label>  
                        <div class="col-sm-10">   
                            <%if(appDate == null)
                            {%>
                                <input  name="appDate" type="date"  class="form-control" required>
                            <%}
                            else
                            {%>
                                <input name="appDate" value="<%= appDate %>" type="date"  class="form-control" required>
                            <%}%>
                        </div>
                    </div>
                    <script>
                            var today = new Date().toISOString().split('T')[0];
                            document.getElementsByName("appDate")[0].setAttribute('min', today);
                    </script>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appTime">*Appointment Time : </label>  
                        <div class="col-sm-10">   
                        <select class="form-control" id="doctorApp" name="appTime" required>
                            <option></option>
                            <%if(appTime == null)
                            {%>
                                <option value="09:00:00"><%out.print("09:00:00");%></option>
                                <option value="09:15:00"><%out.print("09:15:00");%></option>
                                <option value="09:30:00"><%out.print("09:30:00");%></option>
                                <option value="09:45:00"><%out.print("09:45:00");%></option>
                                <option value="10:00:00"><%out.print("10:00:00");%></option>
                                <option value="10:15:00"><%out.print("10:15:00");%></option>
                                <option value="10:30:00"><%out.print("10:30:00");%></option>
                                <option value="10:35:00"><%out.print("10:35:00");%></option>
                                <option value="10:40:00"><%out.print("10:40:00");%></option>
                                <option value="10:45:00"><%out.print("10:45:00");%></option>
                                <option value="11:00:00"><%out.print("11:00:00");%></option>
                                <option value="11:15:00"><%out.print("11:15:00");%></option>
                                <option value="11:30:00"><%out.print("11:30:00");%></option>
                                <option value="11:45:00"><%out.print("11:45:00");%></option>
                                <option value="12:00:00"><%out.print("12:00:00");%></option>
                                <option value="12:15:00"><%out.print("12:15:00");%></option>
                                <option value="12:30:00"><%out.print("12:30:00");%></option>
                                <option value="12:45:00"><%out.print("12:45:00");%></option>
                                <option value="13:00:00"><%out.print("13:00:00");%></option>
                                <option value="13:15:00"><%out.print("13:15:00");%></option>
                                <option value="13:30:00"><%out.print("13:30:00");%></option>
                                <option value="13:45:00"><%out.print("13:45:00");%></option>
                                <option value="14:00:00"><%out.print("14:00:00");%></option>
                                <option value="14:15:00"><%out.print("14:15:00");%></option>
                                <option value="14:30:00"><%out.print("14:30:00");%></option>
                                <option value="14:45:00"><%out.print("14:45:00");%></option>
                                <option value="15:00:00"><%out.print("15:00:00");%></option>
                                <option value="15:15:00"><%out.print("15:15:00");%></option>
                                <option value="15:30:00"><%out.print("15:30:00");%></option>
                                <option value="15:45:00"><%out.print("15:45:00");%></option>
                                <option value="16:00:00"><%out.print("16:00:00");%></option>
                                <option value="16:15:00"><%out.print("16:15:00");%></option>
                                <option value="16:30:00"><%out.print("16:30:00");%></option>
                            <%}
                            else
                            {%>
                                <option value="09:00:00"><%out.print("09:00:00");%></option>
                                <option value="09:15:00"><%out.print("09:15:00");%></option>
                                <option value="09:30:00"><%out.print("09:30:00");%></option>
                                <option value="09:45:00"><%out.print("09:45:00");%></option>
                                <option value="10:00:00"><%out.print("10:00:00");%></option>
                                <option value="10:15:00"><%out.print("10:15:00");%></option>
                                <option value="10:30:00"><%out.print("10:30:00");%></option>
                                <option value="10:35:00"><%out.print("10:35:00");%></option>
                                <option value="10:40:00"><%out.print("10:40:00");%></option>
                                <option value="10:45:00"><%out.print("10:45:00");%></option>
                                <option value="11:00:00"><%out.print("11:00:00");%></option>
                                <option value="11:15:00"><%out.print("11:15:00");%></option>
                                <option value="11:30:00"><%out.print("11:30:00");%></option>
                                <option value="11:45:00"><%out.print("11:45:00");%></option>
                                <option value="12:00:00"><%out.print("12:00:00");%></option>
                                <option value="12:15:00"><%out.print("12:15:00");%></option>
                                <option value="12:30:00"><%out.print("12:30:00");%></option>
                                <option value="12:45:00"><%out.print("12:45:00");%></option>
                                <option value="13:00:00"><%out.print("13:00:00");%></option>
                                <option value="13:15:00"><%out.print("13:15:00");%></option>
                                <option value="13:30:00"><%out.print("13:30:00");%></option>
                                <option value="13:45:00"><%out.print("13:45:00");%></option>
                                <option value="14:00:00"><%out.print("14:00:00");%></option>
                                <option value="14:15:00"><%out.print("14:15:00");%></option>
                                <option value="14:30:00"><%out.print("14:30:00");%></option>
                                <option value="14:45:00"><%out.print("14:45:00");%></option>
                                <option value="15:00:00"><%out.print("15:00:00");%></option>
                                <option value="15:15:00"><%out.print("15:15:00");%></option>
                                <option value="15:30:00"><%out.print("15:30:00");%></option>
                                <option value="15:45:00"><%out.print("15:45:00");%></option>
                                <option value="16:00:00"><%out.print("16:00:00");%></option>
                                <option value="16:15:00"><%out.print("16:15:00");%></option>
                                <option value="16:30:00"><%out.print("16:30:00");%></option>
                            <%} %>
                        </select>
                        </div>
                    </div>
                                                                <div class="form-group">
                                            <label class="control-label col-sm-2" for="appType">*Appointment Type : </label>  
                                            <div class="col-sm-10">   
                                                <select class="form-control" id="doctorApp" name="appType" required>
                                                    <option></option>
                                                    <%
                                                        String sqlAppType = "SELECT * FROM lookup_detail "
                                                                + "WHERE Master_Ref_code = '0086' ";
                                                        ArrayList<ArrayList<String>> dataAppType = Conn.getData(sqlAppType);

                                                        if (e48 == null) {
                                                            if (dataAppType.size() > 0) {
                                                                for (int i = 0; i < dataAppType.size(); i++) {%>
                                                    <option value="<%=dataAppType.get(i).get(2)%>"><%=dataAppType.get(i).get(2)%></option>
                                                    <% }
                                              }
                                          } else {
                                          }%>
                                                </select>
                                            </div>
                                        </div>
                    <button class="btn btn-xs btn-success" type="submit" value="Check" style="margin-bottom: 6%">Check</button>
                    <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>
                  
                    </form>
               

               </div>
            </div>
            </div>
            <div id="viewAppointment" class="tab-pane fade">
                <h3 class="headerTitle">View Patient Appointment</h3>
<!--            <form method="post" name="myform" role="form" action="updateAbsentPatient.jsp">
                    <button class="btn btn-primary">Update Absent Appointment</button>
                </form><br>-->
                <form method="post" name="myform" role="form" action="sendReminder.jsp">
                    <button class="btn btn-primary">Send Appointment Reminder</button>
                </form><br>
                <p>Search Appointment Area:</p>                     
                <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDate.jsp">
                        <div class="form-inline" >
                            <div class="form-group">
                               <!--<label>PMI No :</label>-->
                               <input type="date" name="searchAppointmentDate"  class="form-control" placeholder="Search Appointment Date"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-xs btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                    <form method="post" name="myform" role="form" action="adminAppointmentSelectPatient.jsp">
                        <div class="form-inline" >
                            <div class="form-group">
                               <!--<label>PMI No :</label>-->
                               <input type="text" name="searchAppointmentPatient" class="form-control" placeholder="Search Patient Name"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-xs btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDoctor.jsp">
                        <div class="form-inline" >
                            <div class="form-group">
                               <!--<label>PMI No :</label>-->
                               <input type="text" name="searchAppointmentDoctor" class="form-control" placeholder="Search Doctor Name"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-xs btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                    <form method="post" name="myform" role="form" action="adminAppointment.jsp">
                        <button class="btn btn-info">View All Appointment</button>
                    </form>
                    </div>
                </div>
                <p>Display Patient Appointment :</p>
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
                <div class="table-responsive">
                <table class="table table-bordered table-hover" style="margin-bottom: 4%">
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

                                        if((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("active"))
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
                                        else if((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("canceled"))
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
                                            <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
                                            <td>
                                                <center>
                                                    <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href='adminCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                                </center>
                                            </td>
                                            <td><center><%=dataAppointment.get(i).get(10)%></center></td>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                            <td style="background-color:red"><center><%out.print(i+1);%></center></td>
                                            <td><center><%=appointmentDate%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(3)%></center></td> 
                                            <td><center><%=dataAppointment.get(i).get(4)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                            <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                            <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
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
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                Copyright &copy; BIOCORE 2016
        </div>
    </div>
</div>
</body>
</html>

