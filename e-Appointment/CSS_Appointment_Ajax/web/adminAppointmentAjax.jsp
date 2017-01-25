<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%--<%@page import="org.joda.time.DateTime"%>--%>
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
  
    response.addHeader("Access-Control-Allow-Origin", "*");
    if ("OPTIONS".equalsIgnoreCase(request.getMethod())) 
    {
        response.addHeader("Access-Control-Allow-Credentials", "true");
    }
    String username = (String)session.getAttribute("username");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String)session.getAttribute("USER_NAME");
    String title = (String)session.getAttribute("OCCUPATION_CODE");
    String discipline = (String)session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String)session.getAttribute("SUBDISCIPLINE_CODE");

    
    //out.print(hfc);
    
    if(discipline == null)
    {
        discipline = "Outpatient Discipline";
    }
    if(subdiscipline == null){
        subdiscipline = "General Medicine";
    }
//    out.print(username);
//    out.print(name);
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
    
    String adminUsername;
    
    if(dataAdminUsername.size() > 0)
    {
        adminUsername = dataAdminUsername.get(0).get(0);
    }
    else
    {
        adminUsername = null;
    }
//out.print(adminUsername);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);
    
    
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
    
//    boolean checkDropdown=false;

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
    
    String sql4 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0081'";
    ArrayList<ArrayList<String>> dataHFCClinic = Conn.getData(sql4);

                               
    String sqlHFCCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0081' AND  Description ='"+e7+"'";
    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);  

    if(dataHFCCode.size() > 0)
    {
       HFCCode = dataHFCCode.get(0).get(0);
    }
    else
    {
        HFCCode = null;
    }
//    out.print(e48);
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
           
<!--            <div class="row" id="rowSignInUp">
                <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">
                    <h3><em>e-Appointment</em></h3>
                </div>
                <div class="col-md-2 col-md-offset-3 col-sm-6 col-xs-6" id="right_column_signinup">
                    <ul id="menu">
                        <li style="margin-right: 4%; color: white;">Welcome <%=username%></li> 
                        <button class="btn btn-info buttonAuthenticate"> </button>
                        <li><button class="btn btn-info buttonAuthenticate" onclick="window.location.href = 'destroySession.jsp'">Log out</button></li>
                    </ul>
                </div>
                <div class="col-md-3"></div>
            </div>  -->
            <div class="row">
                <div class="col-md-5 col-md-offset-1 " style="padding-top: 0.5%;">
                    Welcome <%=username%>
                    <%out.print(Conn.STR_HOST);%>
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
                            <form class="form-horizontal">
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="state">State Name</label>
                                    <div class="col-sm-10"> 
                                        <input type="hidden" name="stateBefore" value="<%=e1%>">
                                        <select class="form-control" id="state" name="state_code" required>
                                            <option></option>
                                            <%   String sql2 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0002';";
                                                 ArrayList<ArrayList<String>> dataState = Conn.getData(sql2);
                                

                                                     if(dataState.size()>0)
                                                     {
                                                         for(int i = 0; i < dataState.size(); i++)
                                                         {%>
                                            <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                            <%}
                                        }
                                   %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="startdate">Date</label>  
                                    <input type="hidden" name="dateBefore" id="dateBefore">
                                    <input type="hidden" name="stateBefore" id="stateBefore">
                                    <div class="col-sm-10">   
                                        
                                        <input  name="holiday_date" type="text" class="form-control" id="startdate" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" placeholder="" required>
                                       
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2 col-md-2" for="description">Description</label>  
                                    <div class="col-sm-10">
                                       
                                        <textarea name="holiday_desc" class="form-control" rows="5" id="desc" required></textarea>
                                      


                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="type">Applicable to </label>
                                    <div class="col-sm-10">  
                                        <select class="form-control" id="appTo" name="holiday_type" required>
                                            
                                            <option></option>
                                            <option value="national">national</option>
                                            <option value="state">state</option>
                                           
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
                                <input type="hidden" id="holidayStatus">
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-success" id="addHoliday">Add</button>
                                        <button class="btn btn-success" id="updateBtn">Update</button>
                                        <button type="reset" class="btn btn-success" id="cancelBtn">Cancel</button>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="holidayTable">
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

                                        <input type="hidden" id="holidayData<%=i%>" value="<%=data.get(i).get(3)%>|<%=data.get(i).get(4)%>|<%=data.get(i).get(5)%>|<%=data.get(i).get(6)%>|<%=data.get(i).get(7)%>|<%=data.get(i).get(10)%>">
                              
                                    <td><center>
                                            <button class="btn btn-xs btn-primary editBtn" id="editHoliday|<%=i%>">Edit</button>
                                        
                                            <button class="btn btn-xs btn-danger" onClick="myFunctionsh('<%=data.get(i).get(3)%>','<%=data.get(i).get(4)%>')">Delete</button>
                                        <script>
                                        function myFunctionsh(e1,e2)
                                        {
                                            dataDelete = {
                                                state:e1,
                                                date:e2
                                            };
                                            
                                            var result = confirm("Are you sure to delete the selected holiday data?");
                                            if(result === true)
                                            {
                                                 $.ajax({
                                                    url: "deleteHoliday.jsp",
                                                    type: "post",
                                                    data: dataDelete,
                                                    timeout: 10000,
                                                    success: function(result){
                                                        var resultTrim = result.replace(";","");
                                                        var response = resultTrim.trim();
                                                        if (response === 'success'){
                                                            $('#holidayTable').load('adminAppointmentAjax.jsp #holidayTable');
                                                            alert('Holiday has successful deleted');
                                                        }else{
                                                            alert('error deleting the holiday');
                                                        }
                                                    },
                                                    error: function(xhr, ajaxOptions, thrownError){
                                                        console.log(xhr.status);
                                                        console.log(xhr.responseText);
                                                        console.log(thrownError);
                                                    }
                                                });
                                                
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
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" id="stateMenu">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="state">All States</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="00">National</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="01">Johor</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="02">Kedah</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="03">Kelantan</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="04">Melaka</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="05">Negeri Sembilan</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="06">Pahang</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="08">Perak</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="09">Perlis</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="07">Pulau Pinang</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="12">Sabah</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="13">Sarawak</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="10">Selangor</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="11">Terengganu</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="14">Wilayah Persekutuan Kuala Lumpur</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="16">Wilayah Persekutuan Putrajaya</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="15">Wilayah Persekutuan Labuan</a></li>
                                </ul>
                            </div>
                            <div class="table-responsive" id="viewAllHoliday">
                                <table class="table table-bordered table-hover" id="viewHoliday">
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
                            <form class="form-horizontal" id="clinicForm">    
                                <div class="form-group"> 
                                        <script>
                                                function showUser() 
                                                {
                                                  var str=$("#state_ option:selected").val();
                                                  
                                                  if (str==="") 
                                                  {
                                                    document.getElementById("hfc_codeC").innerHTML="";
                                                    return;
                                                  } 
//                                                
                                                  <%
//                                                  if($('#hfc_code').val()!=null)){
                                                  %>
//                                                           if($('#hfc_code').val()==null)){
                                                  $.ajax({
                                                      type:"POST",
                                                      url:"adminGetHFC.jsp",
                                                      data:{state:str},
                                                      success:function(data){

                                                       document.getElementById("hfc_codeC").innerHTML=data;
                                                      } 
                                                  });
//                                                           }
                                                   <%
//                                                  }
                                                  %>
                                                }
                                        </script>
                                    <label class="control-label col-sm-2" for="state">State </label>
                                    <div class="col-sm-10"> 
                                        <select class="form-control" id="state_" name="state_code" onchange="showUser()" required>
                                            <option value="">Select State</option>
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
                                                        <option value="<%=stateCode%>" selected ><%=dataStateClinic.get(i).get(1)%></option>
                                                        <%}
                                                         else
                                                         {%>
                                                        <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                                                        <%}
                                                     }
                                                    %>
                                                    <script>
                                                       
                                                    showUser();
                                                    
                                                    </script><%
                                                 }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                                    <div id="hfc" class="col-sm-10">
                                        <select class="form-control" id="hfc_codeC" name="hfc_code" required>
                                           
                                            <%
                                            if(e7==null){
                                            %>
                                            <option></option> <%
                                            } else {
                                                
//                                                checkDropdown=true;
                                                String getHFCValue = " SELECT * FROM lookup_detail "
                                                        + "WHERE Master_Ref_code = '0081' AND Detail_Ref_code like '"+stateCode+"%'";
                                                ArrayList<ArrayList<String>> dataGetHFCValue = Conn.getData(getHFCValue);  
                                                
                                                if(dataGetHFCValue.size() > 0) {
                                                    for(int i = 0; i < dataGetHFCValue.size(); i++){
                                                        if(e7.equals(dataGetHFCValue.get(i).get(2))){
                                                           %><option selected value="<%=dataGetHFCValue.get(i).get(1)%>" ><%=dataGetHFCValue.get(i).get(2)%></option> <%
                                                        } else {
                                                            %><option value="<%=dataGetHFCValue.get(i).get(1)%>" ><%=dataGetHFCValue.get(i).get(2)%></option> <%
                                                        }
                                                    }
                                                } else{
                                                    %> <option>No Healthcare Facility Exist</option><%
                                                }
                                                        
                                            } 
                                            %>
                                        </select>
                                        
                                        <input type="hidden" name="hfcBefore" id="hfcBefore">
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="discipline">Discipline </label>
                                    <div class="col-sm-10"> 
                                        <select class="form-control" id="discipline" name="discipline" required>
                                            <option></option>
                                            <%  String sql5 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072';";
                                                ArrayList<ArrayList<String>> dataDicClinic = Conn.getData(sql5);
                                               if (dataDicClinic.size() > 0) 
                                                    {
                                                        for (int i = 0; i < dataDicClinic.size(); i++) 
                                                        {%>
                                                            <option value="<%=dataDicClinic.get(i).get(0)%>"><%=dataDicClinic.get(i).get(1)%></option>
                                                     <% }
                                                    }
                                                    %>
                                        </select>
                                        <input type="hidden" name="disciplineBefore" id="disciplineBefore">
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="subdiscipline">Subdiscipline </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="subdiscipline" name="subdiscipline" required>
                                            <option></option>
                                            <%  String sql6 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0071';";
                                                ArrayList<ArrayList<String>> dataSubClinic = Conn.getData(sql6);
                                                 if (dataSubClinic.size() > 0) 
                                                    {
                                                        for (int i = 0; i < dataSubClinic.size(); i++) 
                                                        {%>
                                            <option value="<%=dataSubClinic.get(i).get(0)%>"><%=dataSubClinic.get(i).get(1)%></option>
                                            <%}
                                          }%>

                                        </select>
                                        <input type="hidden" name="subdisciplineBefore" id="subdisciplineBefore">
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="state">Clinic Day </label>
                                    <div class="col-sm-10"> 
                                        <input type="hidden" name="dayBefore"  id="dayBefore">
                                        <select class="form-control" id="clinicDay" name="day" required>
                                            <option></option>

                                            <option value="Monday">Monday</option>
                                            <option value="Tuesday">Tuesday</option>
                                            <option value="Wednesday">Wednesday</option>
                                            <option value="Thursday">Thursday</option>
                                            <option value="Friday">Friday</option>
                                            <option value="Saturday">Saturday</option>
                                            <option value="Sunday">Sunday</option>

                                        </select>
                                    </div>
                                </div>                                   
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="starttime">Start Time</label>  
                                    <div class="col-sm-10">   

                                        <input  name="starttime" type="time-local" class="form-control" id="startdateC" onfocus="(this.type = 'time')" onblur="(this.type = 'time')" placeholder="" required>

                                    </div>
                                </div>   
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="endtime">End Time</label>  
                                    <div class="col-sm-10">   

                                        <input  name="endtime" type="time-local" class="form-control" id="enddateC" onfocus="(this.type = 'time')" onblur="(this.type = 'time')" placeholder="" required>
       
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="status">Clinic Status </label>
                                    <div class="col-sm-10">  
                                        <select class="form-control" id="status" name="status" required>

                                            <option value="">Please Select Your Status</option>
                                            <option value="active">active</option>
                                            <option value="inactive">inactive</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button  class="btn btn-success" id="addClinicDay">Add</button>
                                        <button  class="btn btn-success" id="updateClinicDay">Update</button>
                                        <button  class="btn btn-success" id="cancelClinicDay">Cancel</button>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="clinicDayTable">
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
                                                        <input type="hidden" id="clinicData<%=i%>" value="<%=dataClinicDay.get(i).get(8)%>|<%=dataClinicDay.get(i).get(9)%>|<%=dataClinicDay.get(i).get(10)%>|<%=dataClinicDay.get(i).get(11)%>|<%=dataClinicDay.get(i).get(2)%>|<%=dataClinicDay.get(i).get(5)%>|<%=dataClinicDay.get(i).get(6)%>|<%=dataClinicDay.get(i).get(7)%>">
                                                      
                                                          <button class="btn btn-xs btn-primary clinic-editBtn" id="clinicDay|<%=i%>">Edit</button>
                                                          <button class="btn btn-xs btn-danger" onClick="myFunctions('<%=dataClinicDay.get(i).get(1)%>','<%=dataClinicDay.get(i).get(3)%>','<%=dataClinicDay.get(i).get(4)%>','<%=dataClinicDay.get(i).get(2)%>')">Delete</button>
                                                      <script>
                                                      function myFunctions(hfcCode,disc,subdisc,day)
                                                      {
    
                                                          var dataDelete = {
                                                              hfc_code:hfcCode,
                                                              discipline:disc,
                                                              subdiscipline:subdisc,
                                                              day:day       
                                                          };
                                                          //console.log(data);
                                                          var result = confirm("Are you sure to delete the selected clinic day data?");
                                                          if(result === true)
                                                          {
                                                              $.ajax({
                                                                  url:'deleteClinicDay.jsp',
                                                                  method:'post',
                                                                  timeout:10000,
                                                                  data:dataDelete,
                                                                  success:function(result){
                                                                      console.log(result);
                                                                      result = result.replace(";","");
                                                                     if(result.trim()==='success'){
                                                                         $('#clinicDayTable').load('adminAppointmentAjax.jsp #clinicDayTable');
                                                                         alert('Clinic day deleted');
                                                                     }else{
                                                                         alert('Error while deleted');
                                                                     }
                                                                  },
                                                                  error:function(e){
                                                                      console.log(e);
                                                                  }
                                                              });
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
                                                <%
                                                }
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="maintainroster" class="tab-pane fade">
                            <h3 class="headerTitle">Maintain Staff Roster</h3>
                            <form class="form-horizontal"> 
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="staffID">Health Facility Name </label>
                                    <div class="col-sm-10"> 
                                        <input  class="form-control" value="<%=hfc%>" type="text" id="hfcRoster" readonly>
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="staffID">Staff ID / Name / Title </label>
                                    <div class="col-sm-10"> 
                                        <select class="form-control" id="staffIDRoster" name="staffID">
                                            <option></option>
                                            <%   
                                                 String sql7 = "SELECT USER_ID, USER_NAME, OCCUPATION_CODE, HEALTH_FACILITY_CODE "
                                                    + "FROM adm_user "
                                                    + "WHERE (OCCUPATION_CODE = 'DOCTOR' OR OCCUPATION_CODE = 'NURSE') AND HEALTH_FACILITY_CODE = '"+hfc+"'";
                                                 ArrayList<ArrayList<String>> dataUserRoster = Conn.getData(sql7); 
                                

                                                     if(dataUserRoster.size()>0)
                                                     {
                                                         for(int i = 0; i < dataUserRoster.size(); i++)
                                                         {%>
                                            <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                            <%}
                                        }%>
                                
                                        </select>
                                        <input type="hidden" name="userIDBefore" value="" id="userIDBefore">
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="staffID">Shift </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="roster_category" name="roster_category" required>
                                            <option value="">Select  Shift</option>
                                            <option value="Morning">Morning</option>
                                            <option value="Afternoon">Afternoon</option>
                                            <option value="Night">Night</option>
                                            <option value="Day off">Day off</option>
                                            <option value="Public Holiday">Public Holiday</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="startDate">Start Date </label>
                                    <input type="hidden" name="startDateBeforeRoster" value="" id="startDateBeforeRoster">
                                    <div class="col-sm-10">
                                        <input  class="form-control" name="startDateRoster" value="" type="date" id="startDateRoster">
                                    
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="endDate">End Date </label>
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="end_date" value="" type="date" id="endDateRoster">
                                      
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="startTime">Start Time </label>
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="startTimeRoster" value="" type="time" id="startTimeRoster">
                                      
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="endTime">End Time </label>
                                    <div class="col-sm-10">
                                        
                                        <input  class="form-control" name="endTimeRoster" value="" type="time" id="endTimeRoster">
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="status">Roster Status </label>
                                    <div class="col-sm-10">  
                                        <select class="form-control" id="statusRoster" name="statusRoster" >

                                            <option value="">Select Your Status</option>
                                            <option value="active">active</option>
                                            <option value="inactive">inactive</option>
                                        
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button  class="btn btn-success" id="addRoster">Add</button>
                                        <button  class="btn btn-success" id="updateRoster">Update</button>
                                        <button  class="btn btn-success" id="cancelRoster">Cancel</button>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="rosterTable">
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
                                                        <td><center> <%=dataClinicRoster.get(i).get(7)%></center></td>
                                                        <td><center> <%=dataClinicRoster.get(i).get(8)%></center></td>
                                                        <td><center>
                                                            <input type="hidden" id="rosterData<%=i%>" value=" <%=dataClinicRoster.get(i).get(1)%>|<%=dateStart%>|<%=dateEnd%>|<%=dataClinicRoster.get(i).get(5)%>|<%=dataClinicRoster.get(i).get(6)%>|<%=dataClinicRoster.get(i).get(7)%>|<%=dataClinicRoster.get(i).get(8)%>">
                                                            <button class="btn btn-xs btn-primary roster-editBtn"  id="roster-editBtn|<%=i%>">Edit</button>
                                                                <button class="btn btn-xs btn-danger" onClick="myFunctionsr('<%=dataClinicRoster.get(i).get(1)%>','<%=hfc%>','<%=dataClinicRoster.get(i).get(3)%>')">Delete</button>
                                                            <script>
                                                            function myFunctionsr(staffId,hfc,startDate)
                                                            {
                                                                var dataDelRoster = {
                                                                    staffId:staffId,
                                                                    hfc:hfc,
                                                                    startDate:startDate
                                                                };
                                                                var result = confirm("Are you sure to delete the selected roster data?");
                                                                if(result === true)
                                                                {
                                                                    $.ajax({
                                                                        url:'deleteRosterAjax.jsp',
                                                                        method:'post',
                                                                        data:dataDelRoster,
                                                                        timeout:10000,
                                                                        success:function(result){
                                                                            console.log(result);
                                                                            result = result.replace(";","");
                                                                            if(result.trim()==="success"){
                                                                                alert('Roster are successful deleted');
                                                                                $('#rosterTable').load('adminAppointmentAjax.jsp #rosterTable');
                                                                            }
                                                                            else{
                                                                                alert('Data Roster does not exist');
                                                                            }
                                                                        },
                                                                        error:function(err){
                                                                            console.log(err);
                                                                        }
                                                                    });
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
                                <table class="table table-bordered table-hover" id="maintainStaffLeave">
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

                                                                <button disabled="disabled" id="disableButton" class="btn btn-xs btn-primary">Approve</button>

                                                            <button disabled="disabled" class="btn btn-xs btn-primary" id="disableButton">Not Approve</button>
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
                                                            <input type="hidden" id="dataStaffLeave<%=i%>" value="<%=dataStaffLeave.get(i).get(0)%>|<%=dataStaffLeave.get(i).get(1)%>|<%=dataStaffLeave.get(i).get(3)%>">
                                                            
                                                                <button id="approveLeave|<%=i%>" class="btn btn-xs btn-primary approve-leave">Approve</button>

                                                            <button class="btn btn-xs btn-primary notApprove-leave" id="notApproveLeave|<%=i%>">Not Approve</button>
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
                            <div class="form-horizontal"> 
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                                    <div class="col-sm-10"> 


                                        <input  class="form-control" value="<%=hfc%>" type="text" id="hfcNameL" readonly>


                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="staffID">Staff Name </label>
                                    <div class="col-sm-10"> 

                                        <input  class="form-control" value="<%=adminUsername%>" name="staffID" type="text" id="staffNameL" readonly>

                                    </div>
                                </div>  
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="startLeave">Start Leave </label>
                                    <input type="hidden" name="startLeaveBefore" value="" id="startLeaveBefore">
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="start_leave" value="" type="date" id="startDateLeave" required>
                                       
                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="endLeave">End Leave </label>
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="end_leave" value="" type="date" id="endDateLeave" required>
                                     
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2 col-md-2" for="description">Leave Reason</label>  
                                    <div class="col-sm-10">

                                        <textarea class="form-control" name="leave_reason"  rows="5" id="descLeave" value="" required></textarea>
                                    
                                    </div>
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-success" id="applyLeave">Apply</button>
                                        <!--<button type="submit" class="btn btn-success" formaction="updateLeave.jsp">Update</button>-->
                                        <button  class="btn btn-success" id="cancelLeave">Cancel</button>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="leaveTable">
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
                                    <form>
                                        <!--<div class="form-inline" >-->
                                        <div class="form-group">
                                            <input type="date" name="searchDateAvailability"  id="dateDoctorA" class="form-control" placeholder="Search Appointment Date" required="required"/>
                                        </div>
                                        <div class="form-group"> 
                                            <!--<div class="col-sm-10">--> 
                                            <select class="form-control" id="selectDoctorA" placeholder="Search Doctor Name"  name="searchDoctorAvailability" required>
                                                <option></option>
                                                <%   String sqlDctorAvailability = "SELECT doc.*,pdr.start_date,pdr.end_date "
                                                        + "from pms_duty_roster pdr, "
                                                        + "(SELECT USER_ID,USER_NAME,OCCUPATION_CODE "
                                                        + "FROM adm_user  "
                                                        + "WHERE OCCUPATION_CODE = 'DOCTOR')doc "
                                                        + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                                        + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date)";
                                                     ArrayList<ArrayList<String>> dataDctorAvailability = Conn.getData(sqlDctorAvailability);

//                                                        DateTime dt = DateTime.now();
//                                                        String todaysDate =(String) dt.toString("dd/MM/yyyy");
                                                        
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
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-xs btn-success" id="searchDoctor">Search</button>
                                        </div>
                                        <!--</div>-->
                                    </form>
                                
                                            <button class="btn btn-info" id="todaySearch">Today's Availability</button>

                                </div>
                            </div>
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
                                    <tbody><%
                                        for (int i = 0; i < dataDoctorAvailable.size(); i++) {
                                            Date today = new Date();
                                            String expectedPattern = "yyyy-MM-dd";
                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                            String startDateFromDB = dataDoctorAvailable.get(i).get(3);
                                            String endDateFromDB = dataDoctorAvailable.get(i).get(4);
                                            Date startDateDB = formatter.parse(startDateFromDB);
                                            Date endDateDB = formatter.parse(endDateFromDB);

                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                            String dateStart = DATE_FORMAT.format(startDateDB);
                                            String dateEnd = DATE_FORMAT.format(endDateDB);%>
                                            <tr id="doctorRow">
                                            <td><center><%out.print(i + 1);%></center></td>
                                    <td><left><%=dataDoctorAvailable.get(i).get(1)%></left></td>
                                        <%
                                            String doctorId = dataDoctorAvailable.get(i).get(0);
                                            String doctorAvailablity = "select * from pms_staff_leave "
                                                    + "where status='approve' AND "
                                                    + "DATE(now()) BETWEEN DATE(start_leave_date) "
                                                    + "AND DATE(end_leave_date) AND user_id='" + doctorId + "' ";
                                            ArrayList<ArrayList<String>> dataDoctorAvailablity = Conn.getData(doctorAvailablity);

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
                                                    + "WHERE date(appointment_date) = date(now()) AND userid = '" + doctorId + "' AND status = 'active'";
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
                                    <% }%>

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
                                    <form>
                                        <div class="row" style="padding: 1%; margin-bottom: 2%; background-color: #d9d9d9">
                                            <input type="hidden" name="canceledReason" value="-">
                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>PMI No :</label>
                                                    <input type="text" name="pmiNo" id="pmiNoSearch" class="form-control" placeholder=""/>
                                                    
                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>IC No :</label>
                                                    <input type="text" name="icNo" id="icNoSearch" class="form-control" placeholder=""/>
                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>ID No :</label>
                                                    <input type="text" name="idNo" id="idNoSearch" class="form-control" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-xs btn-success" id="adminSearchPatient" style="margin-bottom: 3%">Search</button>
                                    </form>
                                    <p style="color: red"> *** Please make sure that you have check the availability and also view the holiday before make an appointment</p>
                                    <p>Patient Details :</p>
                                    <form class="form-horizontal">
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
                           
                        
                                            String sql = "SELECT * "
                                                    + "FROM pms_patient_biodata "
                                                    + "WHERE PMI_NO='"+pmiNO+"' OR NEW_IC_NO = '"+icNo+"' OR ID_NO = '"+idNo+"'";
                                            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql);
                //                            
       
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
                                                  <input type="hidden" name="role" value="<%=title%>" id="role">
                                                  <input type="hidden" name="disciple" value="<%=discipline%>" id="disciple">
                                                  <input type="hidden" name="subdiscipline" value="<%=subdiscipline%>" id="subdisciplineAppointment">
                                                  <input type="hidden" name="HFCCode" value="<%=hfc%>" id="HFCCode">
                                                <input name="pmiNo" value=""  id="pmiNo" type="text" class="form-control" readonly>
                                                <input type="hidden" name="ic"  id="ic">
                                    
               
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="patientName">Patient Name : </label>  
                                            <div class="col-sm-10">   


                                                <input type="text" name="patientName" id="patientName" value="" class="form-control" readonly> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="idNo">ID No : </label>  
                                            <div class="col-sm-10">   

                                       
                                                <input name="idNo" value="" type="text" id="idNo" class="form-control" readonly> 
                                        
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
                                
                                                            if (dataDoctor.size() > 0) 
                                                            {
                                                                for (int i = 0; i < dataDoctor.size(); i++) 
                                                                {%>
                                                                    <option value="<%=dataDoctor.get(i).get(0)%>"><%=dataDoctor.get(i).get(3)%></option>
                                                            <% }
                                                          }%>
                                             
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="appDate">*Appointment Date : </label>  
                                            <div class="col-sm-10">   
                                                <%if(appDate == null)
                            {%>
                                                <input  name="appDate" type="date" id="datepicker" class="form-control" required>
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
                                                <select class="form-control" id="timepicker" name="appTime" required>
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
                                                <select class="form-control" id="typeAppointment" name="appType" required>
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
                                                <button class="btn btn-xs btn-success"  value="Check" id="check" style="margin-bottom: 6%">Check</button>
                                        <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>

                                    </form>


                                </div>
                            </div>
                        </div>
                        <div id="viewAppointment" class="tab-pane fade">
                            <h3 class="headerTitle">View Patient Appointment</h3>
                            <form method="post" name="myform" role="form" action="sendReminder.jsp">
                                <button id="sendReminder" class="btn btn-primary">Send Appointment Reminder</button>
                            </form><br>
                            <span id="showMessage" ></span>
                            <%
                           String sqlReminder = "SELECT w.*,ld.Description AS state_name "
                                + "FROM lookup_detail ld, "
                                + "(SELECT t.* "
                                + "FROM "
                                + "(SELECT pa.pmi_no, pa.hfc_cd, DATE(pa.appointment_date) AS appDate, TIME(pa.start_time) AS start_time, "
                                + "pb.MOBILE_PHONE, DATEDIFF(pa.appointment_date, NOW()) as DiffDate, pb.PATIENT_NAME, pb.EMAIL_ADDRESS "
                                + "FROM pms_appointment pa, pms_patient_biodata pb "
                                + "WHERE pa.pmi_no = pb.PMI_NO AND pa.status = 'active' AND remarks = 'pending' AND (DATEDIFF(pa.appointment_date, NOW())>1 ))t "
                                + "WHERE t.DiffDate<3)w "
                                + "WHERE w.hfc_cd = ld.Detail_Ref_code AND ld.Master_Ref_code = '0081'  AND w.hfc_cd= '"+hfcCD+"'";
                            ArrayList<ArrayList<String>> dataReminder = Conn.getData(sqlReminder);

                            if(dataReminder.size() > 0)
                            {%>
                                <script>
//                                
                                   $("#sendReminder").click(); 
                                    $("#showMessage").html("System already send the appointment reminder"); 
                               
                                </script> <%
                            }
                            else
                            {%>
                                <script>
                                
                                   $("#sendReminder").hide(); 
                               
                                </script> <%

                            }
                            
                            %>
                            
                            <p>Search Appointment Area:</p>                     
                            <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="date" name="searchAppointmentDate"  id="searchAppointmentDate" class="form-control" placeholder="Search Appointment Date"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchDateView">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="text" name="searchAppointmentPatient" id="searchAppointmentPatient"class="form-control" placeholder="Search Patient Name"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchPatientView" >Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDoctor.jsp">
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="text" name="searchAppointmentDoctor"  id="searchAppointmentDoctor" class="form-control" placeholder="Search Doctor Name"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchDoctorView">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    
                                    <button class="btn btn-info" id="viewAllAppointment">View All Appointment</button>

                                </div>
                            </div>
                            <p>Display Patient Appointment :</p>
                            <table class="table table-bordered table-hover" id="viewAppointment">
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
                            <div class="table-responsive"  id="viewAppointmentTable">
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
                                    <td>
                                    <center>
                                        <button disabled="disabled" class="btn btn-xs btn-primary">Cancel</button>
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
                                    <td><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                    <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                    <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                    <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
                                    <td>
                                    <center>
                                        <button disabled="disabled" class="btn btn-xs btn-primary" >Cancel</button>
                                    </center>
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
        <script src="<%=Config.getBase_url(request) %>jsfile/MakeAppointment.js"></script>             
        <script src="<%=Config.getBase_url(request) %>jsfile/ViewHoliday.js"></script> 
        <script src="<%=Config.getBase_url(request) %>jsfile/SearchPatient.js"></script>       
        <script src="<%=Config.getBase_url(request) %>jsfile/ApplyLeave.js"></script>    
        <script src="<%=Config.getBase_url(request) %>jsfile/ViewAppointment.js"></script> 
        <script src="<%=Config.getBase_url(request) %>jsfile/CancelAppointment.js"></script>
        <script src="<%=Config.getBase_url(request) %>jsfile/DoctorAvaibility.js"></script>
        
        <script type="text/javascript">
            
            function holidayEmptyField(){
                $('#state').val('');
                $('#startdate').val('');
                $('#desc').val('');
                $('#appTo').val('');
            }
            
            function selectHFC(data){
                $.ajax({
                    url:'adminGetUpdateHFC.jsp',
                    method:'post',
                    timeout:10000,
                    data:data,
                    success: function(result){
                         document.getElementById("hfc_codeC").innerHTML=result;
                          console.log($('#hfc_codeC').val());
                    },
                    error:function(err){
                        console.log("d");
                    }
                });
            }
           
            $(document).ready(function(){
                
                $('#updateBtn').prop('disabled', true);
                $('#updateClinicDay').prop('disabled', true);
                $('#updateRoster').prop('disabled', true);
                
              
                
                
                
                $('#maintainStaffLeave').on('click','.notApprove-leave',function(e){
                    e.preventDefault();
                    var idBtn = $(this).get(0).id;
                    idBtn = idBtn.split("|");
                    var dataStaffLeave = $('#dataStaffLeave'+idBtn[1]).val();
                    dataStaffLeave = dataStaffLeave.split("|");
                    var dataStaffAjax = {
                        hfcCode:dataStaffLeave[0],
                        userId:dataStaffLeave[1],
                        leaveDate:dataStaffLeave[2]
                    };
                    console.log(dataStaffAjax);
                    $.ajax({
                        url:'updateLeaveNotApprove.jsp',
                        method:'post',
                        data:dataStaffAjax,
                        timeout:10000,
                        success:function(result){
                            if(result.trim()==='success'){
                                $('#maintainStaffLeave').load('adminAppointmentAjax.jsp #maintainStaffLeave');
                                alert('Successfully disapproved this staff leave application');
                            } else if(result.trim()==='notallow'){
                                alert('You are not allow to disapprove leave for yourself as you are admin. Please ask other admin to do so');
                            } else if(result.trim()==='nodata'){
                                alert('Data not exist');
                            }else{
                                alert('error ajax');
                            }
                            console.log(result);
                        },
                        error:function(err){
                            console.log(err);
                        }
                    });
                });
                
                $('#cancelLeave').click(function(e){
                    e.preventDefault();
                    $('#startDateLeave').val('');
                    $('#endDateLeave').val('');
                    $('#descLeave').val('');
                });
                
                $('#maintainStaffLeave').on('click','.approve-leave',function(e){
                    e.preventDefault();
                   var idbtn = $(this).get(0).id;
                   idbtn = idbtn.split('|');
                   
                   var dataStaffLeave = $('#dataStaffLeave'+idbtn[1]).val();
                   dataStaffLeave = dataStaffLeave.split('|');
                   
                   var dataLeaveAjax = {
                       hfcCode:dataStaffLeave[0],
                       userId:dataStaffLeave[1],
                       dateLeave:dataStaffLeave[2]
                   };
                   $.ajax({
                       url:'updateLeaveApprove.jsp',
                       method:'post',
                       data:dataLeaveAjax,
                       timeout:10000,
                       success:function(result){
                           if(result.trim()==='success'){
                               alert('Successfully approved this staff leave application');
                               $('#maintainStaffLeave').load('adminAppointmentAjax.jsp #maintainStaffLeave');
                           } else if(result.trim()==='nodata'){
                               alert('data not exist');
                           } else if(result.trim()==='notallow'){
                               alert('You are not allow to approve leave for yourself as you are admin. Please ask other admin to do so');
                           } else{
                               alert('err');
                               console.log(result.trim());
                           }
                       },
                       error:function(error){
                           console.log(error);
                       }
                   });
                   
                });
                
            
                
                $('#cancelRoster').click(function(e){
                    e.preventDefault();
                    $('#updateRoster').prop('disabled', true);
                    $('#addRoster').prop('disabled', false);
                    $('#staffIDRoster').val('');
                    $('#userIDBefore').val('');
                    $('#roster_category').val('');
                    $('#startDateBeforeRoster').val('');
                    $('#startDateRoster').val('');
                    $('#endDateRoster').val('');
                    $('#startTimeRoster').val('');
                    $('#endTimeRoster').val('');
                    $('#statusRoster').val('');     
                });
                
                $('#updateRoster').click(function(e){
                    e.preventDefault(e);
                    var dataURoster = {
                        hfcCode:$('#hfcRoster').val(),
                        staffId:$('#staffIDRoster').val(),
                        userIdBefore:$('#userIDBefore').val(),
                        roster_category:$('#roster_category').val(),
                        startDateBefore:$('#startDateBeforeRoster').val(),
                        startDate:$('#startDateRoster').val(),
                        endDate:$('#endDateRoster').val(),
                        startTime:$('#startTimeRoster').val(),
                        endTime:$('#endTimeRoster').val(),
                        status:$('#statusRoster').val()
                    };
                    console.log(dataURoster);
                    
                    $.ajax({
                        url:'updateRosterAjax.jsp',
                        method:'post',
                        data:dataURoster,
                        timeout:10000,
                        success:function(result){
                            console.log(result);
                            if(result.trim() === 'success'){
                                alert('Update roster successful');
                                $('#rosterTable').load('adminAppointmentAjax.jsp #rosterTable');
                            }
                            else{
                                alert('Update roster fail due to the roster data does not exist');
                            }
                        },
                        error:function(error){
                            console.log(error);
                        }
                    });
                });
                
                $('#rosterTable').on('click', '.roster-editBtn',function(e){
                    e.preventDefault();
                    $('#updateRoster').prop('disabled', false);
                    $('#addRoster').prop('disabled', true);
                    $('html,body').animate({
                        scrollTop:$("#maintainroster").offset().top 
                     },500);
                     
                     var idName = $(this).get(0).id;
                     var id =idName.split("|");
                      var dataRoster = $('#rosterData'+id[1]).val();
                     var dataRArry = dataRoster.split("|");
                     
                     var startDate = dataRArry[1].split('/');
                     var endDate = dataRArry[2].split('/');
                     var startDate = startDate[2]+'-'+startDate[1]+'-'+startDate[0];
                     var endDate = endDate[2]+'-'+endDate[1]+'-'+endDate[0];
                     
                   $('#staffIDRoster').val(dataRArry[0].trim());
                   $('#userIDBefore').val(dataRArry[0].trim());
                   $('#roster_category').val(dataRArry[5]);
                   $('#startDateRoster').val(startDate);
                   $('#startDateBeforeRoster').val(startDate);
                   $('#endDateRoster').val(endDate);
                   $('#startTimeRoster').val(dataRArry[3]);
                   $('#endTimeRoster').val(dataRArry[4]);
                   $('#statusRoster').val(dataRArry[6]);
                     
                });
                
                $('#addRoster').click(function(e){
                    e.preventDefault();
                    
                    var dataRoster = {
                       hfcRoster: $('#hfcRoster').val(),
                       staffIDRoster:$('#staffIDRoster').val(),
                       roster_category: $('#roster_category').val(),
                       startDateRoster:$('#startDateRoster').val(),
                       endDateRoster:$('#endDateRoster').val(),
                       startTimeRoster:$('#startTimeRoster').val(),
                       endTimeRoster:$('#endTimeRoster').val(),
                       statusRoster:$('#statusRoster').val()
                    };
                    
                    console.log(dataRoster);
                    $.ajax({
                        url:'addRosterAjax.jsp',
                        method:'post',
                        timeout:10000,
                        data:dataRoster,
                        success: function(result){
                            console.log(result);
                            if(result.trim() === 'fail'){
                                alert('Fail to add staff roster due to the roster period still active');
                            }
                            else if(result.trim() === 'success'){
                                alert('Insert Roster Successful');
                                $('#rosterTable').load('adminAppointmentAjax.jsp #rosterTable');
                            }
                            else {
                                alert('error on ajax');
                            }
                        },
                        error:function(err){
                            console.log(err);
                        }
                    });
                });
                
                $('#cancelClinicDay').click(function(e){
                    e.preventDefault();
                    $('#updateClinicDay').prop('disabled', true);
                    $('#addClinicDay').prop('disabled', false);

                    $('#state_').val('');
                    $('#hfc_codeC').val('');
                    $('#hfcBefore').val('');
                    $('#discipline').val('');
                    $('#disciplineBefore').val('');
                    $('#subdisciplineBefore').val('');
                    $('#subdiscipline').val('');
                    $('#clinicDay').val('');
                    $('#dayBefore').val('');
                     $('#startdateC').val('');
                     $('#enddateC').val('');
                     $('#status').val('');
                });
                
                $('#updateClinicDay').click(function(e){
                    e.preventDefault();
                    var _state = $('#state_').val();
                    var _hfc  = $('#hfc_codeC').val();
                    var _hfcBefore = $('#hfcBefore').val();
                    var _discipline = $('#discipline').val();
                    var _disBefore = $('#disciplineBefore').val();
                    var _subdisBefore = $('#subdisciplineBefore').val();
                    var _subdiscipline = $('#subdiscipline').val();
                    var _clinicDay = $('#clinicDay').val();
                    var _dayBefore = $('#dayBefore').val();
                    var _starttime = $('#startdateC').val();
                    var _endtime = $('#enddateC').val();
                    var _status = $('#status').val();
                    
                    var uClinicData = {
                       state:_state,
                       hfcCode:_hfc,
                       hfcBefore:_hfcBefore,
                       discipline:_discipline,
                       disciplineBefore:_disBefore,
                       subdiscipline:_subdiscipline,
                       subdisciplineBefore:_subdisBefore,
                       clinicDay:_clinicDay,
                       starttime:_starttime,
                       endtime:_endtime,
                       daybefore:_dayBefore,
                       status:_status
                    };
                    
                    $.ajax({
                        url:'updateClinicDayAjax.jsp',
                        method:'post',
                        data:uClinicData,
                        timeout:10000,
                        success:function(result){
                            console.log(result);
                            if(result.trim() === 'success'){
                                alert('Clinic day updated');
                                $('#clinicDayTable').load('adminAppointmentAjax.jsp #clinicDayTable');
                            }else{
                                alert('Error');
                            }
                        }
                    });
                    console.log(uClinicData);
                });

                $('#clinicDayTable').on('click','.clinic-editBtn', function(e){
                      
                    e.preventDefault();
                     $('#updateClinicDay').prop('disabled', false);
                     $('#addClinicDay').prop('disabled', true);
                     
                     $('html,body').animate({
                        scrollTop:$("#maintainclinicday").offset().top 
                     },500);
                     
                     var idName = $(this).get(0).id;
                     var id =idName.split("|");
                      var dataCA = $('#clinicData'+id[1]).val();
                     var dataArry = dataCA.split("|");
                     console.log(dataArry);
                     
                      
                     $('#state_  option').filter(function() { 
                            return ($(this).text() === dataArry[0]); //To select Blue
                        }).prop('selected', true);
                      
                      showUser();
                      
                     var  hfcData = {
                         state:$('#state_').val(),
                         hfcName:dataArry[1]
                     };
                     
                      selectHFC(hfcData);
                      
                      
                      $('#discipline  option').filter(function() { 
                            return ($(this).text() === dataArry[2]); //To select Blue
                        }).prop('selected', true);
                        
                        $('#subdiscipline  option').filter(function() { 
                            return ($(this).text() === dataArry[3]); //To select Blue
                        }).prop('selected', true);
                      


                      $('#clinicDay').val(dataArry[4]);
                      $('#startdateC').val(dataArry[5]);
                       $('#enddateC').val(dataArry[6]);
                       $('#status').val(dataArry[7]);
                       
                       $('#hfcBefore').val(dataArry[1]);
                       $('#disciplineBefore').val(dataArry[2]);
                       $('#subdisciplineBefore').val(dataArry[3]);
                       $('#dayBefore').val(dataArry[4]);

                });
                
                $('#addClinicDay').click(function(e){
                   e.preventDefault();
                   var _state = $('#state_').val();
                   var _hfc = $('#hfc_codeC').val();
                   var _discipline = $('#discipline').val();
                   var _subdiscipline = $('#subdiscipline').val();
                   var _clinicDay = $('#clinicDay').val();
                   var _startTime = $('#startdateC').val();
                   var _endTime = $('#enddateC').val();
                   var _clinicStatus = $('#status').val();
                   
                   var dataC = {
                       state:_state,
                       hfc:_hfc,
                       discipline:_discipline,
                       subdiscipline:_subdiscipline,
                       clinic:_clinicDay,
                       startTime:_startTime,
                       endTime:_endTime,
                       status:_clinicStatus
                   };
                   console.log(dataC);
                   $.ajax({
                       url:'addClinicDay.jsp',
                       method:'post',
                       timeout:10000,
                       data:dataC,
                       success:function(result){
                           var resultTrim = result.replace(";","");
                           var response = resultTrim.trim();
                           if(response === "success"){
                               alert('Clinic Day added');
                               $('#clinicDayTable').load('adminAppointmentAjax.jsp #clinicDayTable');
                           }
                           else{
                               alert('error');
                           }
                       },
                       error:function(err){
                           alert('Ajax error');
                       }
                   });
                });
                

       
                $('#holidayTable').on('click','.editBtn',function(){                    
                    $('#updateBtn').prop('disabled', false);
                    $('html, body').animate({
                         scrollTop: $("#maintainholiday").offset().top
                     }, 500);
                    
                     var idName = $(this).get(0).id;
                     var id = idName.split("|");
                     console.log(id);
                     
                     var data = $('#holidayData'+id[1]).val();
                     var dataArry = data.split("|");
                     console.log(dataArry);
                     
                     $('#state').val(dataArry[0]);
                     $('#stateBefore').val(dataArry[0]);
                     $('#startdate').val(dataArry[1]);
                     $('#dateBefore').val(dataArry[1]);
                     $('#desc').val(dataArry[2]);
                     $('#appTo').val(dataArry[3]);
                     $('#holidayStatus').val(dataArry[4]);
                     $('#addHoliday').prop('disabled', true);
                });
                
               $('#updateBtn').click(function(e){
                   e.preventDefault();
                   alert('updateBtn');
                   
                   var _uState = $('#state').val();
                   var _uStateBefore = $('#stateBefore').val();
                   var _uDate = $('#startdate').val();
                   var _uDesc = $('#desc').val();
                   var _uAppTo = $('#appTo').val();
                   var _uStatus = $('#holidayStatus').val();
                   var _uDateBefore = $('#dateBefore').val();
                   
                   var _upData = {
                      state: _uState,
                      stateBefore: _uStateBefore,
                      dateBefore: _uDateBefore,
                      date: _uDate,
                      desc: _uDesc,
                      appTo: _uAppTo,
                      status: _uStatus
                   };
                   
                   $.ajax({
                       url: 'updateHoliday.jsp',
                       type: 'post',
                       data: _upData,
                       timeout: 10000,
                       success: function(result){
                           var resultTrim = result.replace(";","");
                           var response = resultTrim.trim();
                           if(response === 'success'){
                               alert('Holiday has successful update');
                                $('#holidayTable').load('adminAppointmentAjax.jsp #holidayTable');
                           }
                           else if(response === 'fail'){
                               alert('Update holiday fail due to the holiday data does not exist');
                           }
                           else if(response === 'notSuccess'){
                               alert('Error occur, Holiday not be update');
                           }
                       },
                       error: function(err){
                           alert('error');
                       }
                   });   
               });
               
               $('#cancelBtn').click(function(e){
                   e.preventDefault();
                   holidayEmptyField();
                   $('#addHoliday').prop('disabled', false);
                   $('#updateBtn').prop('disabled', true);
               });
               
               $('#addHoliday').click(function(e){
                  e.preventDefault();
                  var _state = $('#state').val();
                  var _date = $('#startdate').val();
                  var _desc = $('#desc').val();
                  var _appTo = $('#appTo').val();
                  
                  var data = {
                      state:_state,
                      date:_date,
                      desc:_desc,
                      appTo:_appTo
                  };
                  
                  $.ajax({
                     url:'addHolidayAjax.jsp',
                     type:'post',
                     data:data,
                     timeout: 10000,
                     success: function(result){
                         console.log(result);
                         result = result.trim();
                         if(result === "success"){
                             alert('Holiday successful added');
                             $('#holidayTable').load('adminAppointmentAjax.jsp #holidayTable');
                         }
                         else if(result === "error")
                         {
                             alert('The Holiday already added');
                         }
                         else {
                             alert('error');
                         }       
                     },
                     error:function(err){
                         console.log(err);
                     }
                  });
               }); 
            });
        </script>
    </body>
</html>
