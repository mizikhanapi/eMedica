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
<%
    String sqlDisplayHoliday = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY ld.`Description` ASC, pmsh.holiday_date ASC, pmsh.status DESC";
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
            + "WHERE t.state_code=ld.`Detail_Ref_code` AND ld.`Master_Ref_code` = '0002')b "
            + "WHERE hfc.Master_Ref_Code='0081' AND hfc.Detail_Ref_code = b.hfc_cd)c "
            + "WHERE al.`Master_Ref_code`='0072' AND al.`Detail_Ref_code` = c.discipline_cd)d "
            + "WHERE sub.`Master_Ref_code` = '0071' AND sub.`Detail_Ref_code` = d.subdiscipline_cd "
            + "ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sqlDisplayRoster =  "SELECT ad.USER_NAME, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status "
            + "FROM adm_user ad, pms_duty_roster dr "
            + "WHERE ad.USER_ID = dr.user_id";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);
    
    String sqlStaffLeave = "SELECT sl.hfc_cd, au.USER_ID, au.USER_NAME, date(sl.start_leave_date), date(sl.end_leave_date), sl.leave_reason, sl.status "
            + "FROM pms_staff_leave sl, adm_user au " 
            + "WHERE (sl.status = 'process' OR sl.status = 'approve' OR status = 'not approve') AND au.USER_ID = sl.user_id "
            + "ORDER BY au.USER_NAME DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);  
    
//    out.print(sqlStaffLeave);
    
    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, "
            + "lookSub.staff_name ,lookSub.discipline_name, lds.Description AS subdipline_name, lookSub.appointment_type, lookSub.ID_NO "
            + "FROM lookup_detail lds, "
            + "(SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, "
            + "lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, lookDis.subdiscipline, lookDis.appointment_type, lookDis.ID_NO "
            + "FROM lookup_detail ld, "
            + "(SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, pb.PATIENT_NAME, au.USER_NAME, pa.discipline, pa.subdiscipline, pa.appointment_type, pb.ID_NO "
            + "FROM pms_appointment pa, pms_patient_biodata pb, adm_user au "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID "
            + "ORDER BY pa.appointment_date ASC) lookDis "
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
    e28 = request.getParameter("e28");
    e29 = request.getParameter("e29");
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
%>


    <script>
      var input = document.getElementById("dateField");
      var today = new Date();
      var day = today.getDate();
      // Set month to string to add leading 0
      var mon = new String(today.getMonth()+1); //January is 0!
      var yr = today.getFullYear();
      
        if(mon.length < 2) { mon = "0" + mon; }
      
        var date = new String( yr + '-' + mon + '-' + day );
      
      input.disabled = false; 
      input.setAttribute('min', date);
    
    </script>
            
<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <%  String username = (String)session.getAttribute("username"); 
        String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
        String discipline = (String)session.getAttribute("DISCIPLINE_CODE");
        String subdiscipline = (String)session.getAttribute("SUBDISCIPLINE_CODE");
    %>
    
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 col_image" >
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" id="UTeMImage">
        </div>
    </div> 
    <div class="row" id="rowSignInUp">
        <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">
            <h3><em>E-Health Appointment</em></h3>
        </div>
        <div class="col-md-2 col-md-offset-3 col-sm-6 col-xs-6" id="right_column_signinup">
            <ul id="menu">
                <li style="margin-right: 4%; color: white;">Hello <%=username%></li> 
            <!--<button class="btn btn-info buttonAuthenticate"> </button>-->
            <li><button class="btn btn-info buttonAuthenticate" onclick="window.location.href='index.jsp'">Log out</button></li>
            </ul>
        </div>
            <div class="col-md-3"></div>
    </div>  
    <div class="row">
        <div class="col-md-8 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
            <div class="tab-content">
            <div id="home" class="tab-pane active">
                <h3 class="headerTitle">Welcome to E-Health Appointment System</h3>
                <p style="text-align: justify"><strong>Web Bases Patient Appointment Management System  is used to manage patient record the appointment data patient,
                            doctor choose by  patient, appointment date, treatment package by using web based. Laptop and  mobile or any electronic system
                            that contain web-browser software also can open  the e-health of website, so that it is take convenience to user for book  appointment.
                            User can use internet by web browser go to the website for booking  appointment with sign in user first. User can choose the doctor
                            which user may  want to meet and the system will let user to choose the available booking time  and date. After the user has choose 
                            the time and date, the information of data  will record into database and it may wont lost. This system save a lot time of 
                            the appointment process and it is secure.
                </strong></p>
                <h3 class="headerTitle">Objective</h3>
                <p><strong>1)	To provide a fast, reliable and convenient way in keeping track of patients make appointments.</strong></p>
                <p><strong>2)	To reduce time-taken for staffs and dentists to check on their patients book appointments and treatments to perform on a particular patient. </strong></p>
                <p><strong>3)	To record of type of treatment that given to the patients all the appointments.</strong></p>
                <p><strong>4)	To provide the backup and recovery mechanism when the system is down on all database. By using this system, it allow user to make a copy of data. It can help user to protecting the files that make up on database from crash.</strong></p>
                <h3 class="headerTitle">Our Location</h3>

                <div class="google_map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                        e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
                View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
            </div>
            <div id="holiday" class="tab-pane fade">
                <h3 class="headerTitle">Maintain Holiday</h3>
                <form class="form-horizontal" role="form" method="post" action="addHoliday.jsp">
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">State </label>
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
                        <label class="control-label col-sm-2" for="type">Type </label>
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
                    <div class="form-group">
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
                    </div>
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
                            <th><center>State</center></th>
                            <th><center>Date</center></th>
                            <th><center>Description</center></th>
                            <th><center>Type</center></th>
                            <th><center>Status</center></th>
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
                                        <td><center><%=data.get(i).get(8)%></center></td>
                                        <td><center><%=date%></center></td>
                                        <td><center><%=data.get(i).get(5)%></center></td>
                                        <td><center><%=data.get(i).get(6)%></center></td>
                                        <td><center><%=data.get(i).get(7)%></center></td>
                                        <td><center>
                                            <a href="admin.jsp?e1=<%=data.get(i).get(3)%>&e2=<%=data.get(i).get(4)%>&e3=<%=data.get(i).get(5)%>&e4=<%=data.get(i).get(6)%>&e5=<%=data.get(i).get(7)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='deleteHoliday.jsp?e1=<%=data.get(i).get(3)%>&e2=<%=data.get(i).get(4)%>'">Delete</button>
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
              <div id="clinicday" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Clinic Day</h3>
                    <form class="form-horizontal" role="form" method="post" action="addClinicDay.jsp">    
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">State </label>
                        <div class="col-sm-10"> 
                        <select class="form-control" id="state" name="state_code" required>
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
                        <div class="col-sm-10">
                            <select class="form-control" id="hfc_code" name="hfc_code" required>
                            <option></option>
                            <%  String sql4 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0081'";
                                ArrayList<ArrayList<String>> dataHFCClinic = Conn.getData(sql4);

                                if (e7 == null) 
                                {
                                    if (dataHFCClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataHFCClinic.size(); i++) 
                                        {%>
                                                <option value="<%=dataHFCClinic.get(i).get(0)%>"><%=dataHFCClinic.get(i).get(0)%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                } 
                                else 
                                {
                                    String sqlHFCCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0081' AND  Description ='"+e7+"'";
                                    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);  

                                    HFCCode = dataHFCCode.get(0).get(0);

                                    for (int i = 0; i < dataHFCClinic.size(); i++) 
                                    {
                                        if (HFCCode.equals(dataHFCClinic.get(i).get(0))) 
                                        {%> 
                                            <option value="<%=HFCCode%>" selected><%=dataHFCClinic.get(i).get(0)%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <%} 
                                        else 
                                        {%>
                                            <option value="<%=dataHFCClinic.get(i).get(0)%>"><%=dataHFCClinic.get(i).get(0)%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <% }
                                    }
                                }%>

                            </select>
                            <input type="hidden" name="hfcBefore" value="<%=HFCCode%>">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="discipline">Discipline </label>
                        <div class="col-sm-10"> 
                            <select class="form-control" id="discipline" name="discipline" required>
                            <option></option>
                            <%  String sql5 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072'";
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
                        <label class="control-label col-sm-2" for="status">Status </label>
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
                            <th><center>Status</center></th>
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
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=dataClinicDay.get(i).get(8)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(9)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(10)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(11)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(2)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(7)%></center></td>
                                        <td><center>
                                            <a href="admin.jsp?e6=<%=dataClinicDay.get(i).get(8)%>&e7=<%=dataClinicDay.get(i).get(9)%>&e8=<%=dataClinicDay.get(i).get(10)%>&e9=<%=dataClinicDay.get(i).get(11)%>&e10=<%=dataClinicDay.get(i).get(2)%>&e11=<%=dataClinicDay.get(i).get(5)%>&e12=<%=dataClinicDay.get(i).get(6)%>&e13=<%=dataClinicDay.get(i).get(7)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='deleteClinicDay.jsp?e7=<%=dataClinicDay.get(i).get(1)%>&e8=<%=dataClinicDay.get(i).get(3)%>&e9=<%=dataClinicDay.get(i).get(4)%>&e10=<%=dataClinicDay.get(i).get(2)%>'">Delete</button>
                                         </center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="roster" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Roster</h3>
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
                        <label class="control-label col-sm-2" for="staffID">Roster Category </label>
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
                               <input  class="form-control" name="start_date" value="<%= e17%>" type="date" id="startDate">
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
                        <label class="control-label col-sm-2" for="status">Status </label>
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
                            <th><center> Roster Category</center></th>
                            <th><center> Status</center></th>
                            <th><center> Action</center></th>
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
                                        <td><center> 
                                            <%
                                               out.print(i+1);
                                            %>
                                         </center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(0)%></center></td>
                                        <td><center> <%=dateStart%></center></td>
                                        <td><center> <%=dateEnd%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(5)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(6)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(7)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(8)%></center></td>
                                        <td><center>
                                            <a href="admin.jsp?e14=<%=dataClinicRoster.get(i).get(1)%>&e15=<%=hfc%>&e16=<%=dataClinicRoster.get(i).get(7)%>&e17=<%=dataClinicRoster.get(i).get(3)%>&e18=<%=dataClinicRoster.get(i).get(4)%>&e19=<%=dataClinicRoster.get(i).get(5)%>&e20=<%=dataClinicRoster.get(i).get(6)%>&e21=<%=dataClinicRoster.get(i).get(8)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='deleteRoster.jsp?e15=<%=dataClinicRoster.get(i).get(2)%>&e14=<%=dataClinicRoster.get(i).get(1)%>&e17=<%=dataClinicRoster.get(i).get(3)%>'">Delete</button>
                                         </center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                    </table>
                  </div>
            </div>
            <div id="leave" class="tab-pane fade">
                <h3 class="headerTitle">Maintain Leave</h3>
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
                            <th><center>Status</center></th>
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
                                    
//                                    RMIConnector rmic = new RMIConnector();
                                    String sqlTotalDay = "SELECT DATEDIFF('"+endLeaveDateFromDB+"', '"+startLeaveDateFromDB+"') AS TotalDay "
                                            + "FROM pms_staff_leave "
                                            + "WHERE user_id = '"+staffIDFromDB+"'";
                                    ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
//                                    boolean isSelect = rmic.setQuerySQL("ecss.utem.edu.my", 1099, sqlTotalDay);
//                                    out.print(sqlTotalDay);
//                                    out.print(isSelect);
                                    int plusOneDay = 1;
                                    int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                    int totalDay = dayFromDBCalculation + plusOneDay;
                                    
                                    %>
                                    <tr>
                                        <td>
                                            <center> 
                                                <%
                                                    out.print(i+1);
                                                %>
                                            </center>
                                        </td>
                                        <td><center><%=dataStaffLeave.get(i).get(2)%></center></td>
                                        <td><center><%=startLeave%></center></td>
                                        <td><center><%=endLeave%></center></td>
                                        <td><center><%=dataStaffLeave.get(i).get(5)%></center></td>
                                        <td><center><%=totalDay%></center></td>
                                        <td><center><%=dataStaffLeave.get(i).get(6)%></center></td>
                                        <td>
                                            <center>
                                            <a href="updateLeaveApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>"> 
                                                <button class="btn btn-xs btn-primary">Approve</button>
                                            </a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='updateLeaveNotApprove.jsp?e22=<%=dataStaffLeave.get(i).get(0)%>&e23=<%=dataStaffLeave.get(i).get(1)%>&e24=<%=dataStaffLeave.get(i).get(3)%>'">Not Approve</button>
                                            </center>
                                        </td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="addAppointment" class="tab-pane fade">
            <h3 class="headerTitle">Add Patient Appointment</h3>
            <div class="row myform">
               <div class="col-md-8 col-md-offset-2">
                  <p>Search Patient : <b><i>Please choose only one</i></b></p>
                  <form method="post" name="myform" role="form" action="admin.jsp">
                    <div class="form-inline" style="padding-bottom: 3%; padding-top: 2%; padding-left: 2%; margin-bottom: 2%; background-color: #d9d9d9">
                        <div class="form-group">
                           <label>PMI No :</label>
                           <input type="text" name="pmiNo" id="pmiNo" class="form-control" placeholder=""/>
                        </div>
                        <div class="form-group">
                           <label>IC No :</label>
                           <input type="text" name="icNo" id="icNo" class="form-control" placeholder=""/>
                        </div>
                        <div class="form-group">
                           <label>ID No :</label>
                           <input type="text" name="idNo" id="idNo" class="form-control" placeholder=""/>
                        </div>
                    </div>
                    <button class="btn btn-xs btn-success" style="margin-bottom: 6%">Search</button>
                  </form>
                  
               <!--<div class="col-md-8 col-md-offset-2" >-->
                    <p>Patient Details :</p>
                    <form class="form-horizontal" role="form" method="post">
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
                                    + "WHERE PMI_NO='"+pmiNO+"' OR NEW_IC_NO = '"+icNo+"' OR ID_TYPE = '"+idType+"' OR ID_NO = '"+idNo+"'";
                            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql);
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
                            <%if(pmiNO == null)
                            {%>
                                <input  name="pmiNo" type="text" class="form-control" readonly>
                            <%}
                            else
                            {%>
                                <input name="pmiNo" value="<%= dataPatient.get(0).get(0) %>" type="text" class="form-control" readonly>
                            <%}%>
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
                            if(idNo == null)
                            {%>
                                <input  name="idNo" type="text" class="form-control" readonly>
                            <%}
                            else
                            {%>
                                <input name="idNo" value="<%= dataPatient.get(0).get(7) %>" type="text" class="form-control" readonly>
                            <%}%>
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
                            <%if(appTime == null)
                            {%>
                                <input  name="appTime" type="time" id="dateField"  class="form-control" required>
                            <%}
                            else
                            {%>
                                <input name="appTime" value="<%= appTime %>" type="date" class="form-control" required>
                            <%}%>
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
                    <button onclick="alertbox()" class="btn btn-xs btn-success" type="button" style="margin-bottom: 6%">Save</button>
                    <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>
                    <button class="btn btn-xs btn-success" type="submit" formaction="checkAppointment.jsp" value="Check" style="margin-bottom: 6%">Check</button>
                  
                    </form>
                <!--</div>-->
               </div>
            </div>
            </div>
                <script>
                    function alertbox()
                    {
                        alert("You have to fill up all the information and click on Check button to check the availability of appointment date, time and doctor");
                    }
                </script>
            <div id="viewAppointment" class="tab-pane fade">
                <h3 class="headerTitle">View Patient Appointment</h3>
                <p>Search Appointment Area:</p>
                <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDate.jsp">
                        <div class="form-inline" >
                            <div class="form-group">
                               <!--<label>PMI No :</label>-->
                               <input type="text" name="searchAppointmentDate" id="datepicker" class="form-control" placeholder="Search Appointment Date"/>
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
                    <form method="post" name="myform" role="form" action="admin.jsp">
                        <button class="btn btn-info">View All Appointment</button>
                    </form>
                    </div>
                </div>
                <script>
                    function showDiv() 
                    {
                        document.getElementById('editAppointment').style.display = "block";
                    }
                </script>
                <p>Display Patient Appointment :</p>
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
                                        <td>
                                            <center> 
                                                <%
                                                    out.print(i+1);
                                                %>
                                            </center>
                                        </td>
                                        <td><center><%=appointmentDate%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(3)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(4)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                        <td>
                                            <center>
                                            <a href="admin.jsp?e38=<%=dataAppointment.get(i).get(2)%>&e40=<%=dataAppointment.get(i).get(8)%>&e39=<%=dataAppointment.get(i).get(3)%>&e41=<%=dataAppointment.get(i).get(0)%>&e42=<%=dataAppointment.get(i).get(1)%>&e43=<%=dataAppointment.get(i).get(4)%>&e44=<%=dataAppointment.get(i).get(5)%>&e45=<%=dataAppointment.get(i).get(6)%>&e46=<%=dataAppointment.get(i).get(7)%>"> 
                                                <button class="btn btn-xs btn-primary" value="Show Div" onclick="showDiv()">Edit</button>
                                            </a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href=''">Cancel</button>
                                            </center>
                                        </td>
                                    </tr>
                                <%
                                }
                            }
                            %>
                    </tbody>
                </table>
                </div>
                    <div id="editAppointment"  style="display:visible;" >
                    <p>Edit Appointment Area :</p>
                    <form class="form-horizontal" role="form" method="post">
                        <%   
                            String sql1 = "SELECT * "
                                    + "FROM pms_patient_biodata "
                                    + "WHERE PMI_NO='"+e38+"' OR NEW_IC_NO = '"+e47+"' OR ID_NO = '"+e40+"'";
                            ArrayList<ArrayList<String>> dataPatient1 = Conn.getData(sql1);
                            
                            String sqlPatientApp1 = "SELECT * "
                                    + "FROM pms_appointment";
                            ArrayList<ArrayList<String>> dataPatientApp1 = Conn.getData(sqlPatientApp1);
                            
//                            out.print(sql);
                        %>
                    <div class="form-group" >
                        <label class="control-label col-sm-2" for="pmiNo">PMI No : </label>  
                        <div class="col-sm-10">   
                            <%if(e38 == null)
                            {%>
                                <input  name="pmiNo" type="text" class="form-control" readonly>
                            <%}
                            else
                            {%>
                                <input name="pmiNo" value="<%= dataPatient1.get(0).get(0) %>" type="text" class="form-control" readonly>
                            <%}%>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="patientName">Patient Name : </label>  
                        <div class="col-sm-10">   
                        <% 
                            if(dataPatient1.size() > 0)
                            {
                                if(dataPatient1.get(0).get(2) == null)
                                {
                                    %><input type="text" name="patientName" value="" class="form-control" readonly> <%
                                }
                                else
                                {
                                    if(dataPatient1.get(0).get(2).equals(e39))
                                    {
                                        %><input type="text" name="patientName" value="<%=dataPatient1.get(0).get(2)%>" class="form-control" readonly> <%
                                    }
                                    else
                                    {                   
                                        %><input type="text" name="patientName" value="<%=dataPatient1.get(0).get(2)%>" class="form-control" readonly> <%
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
                            if(e40 == null)
                            {%>
                                <input  name="idNo" type="text" class="form-control" readonly>
                            <%}
                            else
                            {%>
                                <input name="idNo" value="<%= dataPatient1.get(0).get(7) %>" type="text" class="form-control" readonly>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDate">*Appointment Date : </label>  
                        <input type="hidden" name="dateAppointmentBefore" value="<%=e41%>">
                        <div class="col-sm-10">   
                            <%if(e41 == null)
                            {%>
                                <input  name="appDate" type="date"  class="form-control" required>
                            <%}
                            else
                            {%>
                                <input name="appDate" value="<%= e41 %>" type="date"  class="form-control" required>
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
                            <%if(e42 == null)
                            {%>
                                <input  name="appTime" type="time" id="dateField"  class="form-control" required>
                            <%}
                            else
                            {%>
                                <input name="appTime" value="<%= e42 %>" type="time" class="form-control" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDoc">*Doctor : </label>  
                        <div class="col-sm-10">   
                         <select class="form-control" id="doctorApp" name="appDoc" required>
                             <option></option>
                            <%  
//                                out.print("Hai");
                                String sqlDoc1 = "SELECT * "
                                        + "FROM adm_user "
                                        + "WHERE HEALTH_FACILITY_CODE = '"+hfc+"' AND OCCUPATION_CODE = 'DOCTOR'";
                                ArrayList<ArrayList<String>> dataDoctor1 = Conn.getData(sqlDoc1);
                                out.print(sqlDoc1);
                                if(e43 == null)
                                {
                                    if (dataDoctor1.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDoctor1.size(); i++) 
                                        {
                                            if(dataDoctor1.get(i).get(3) != e43)
                                            {
                                                 %>
                                                <option value="<%=dataDoctor1.get(i).get(3)%>"><%=dataDoctor1.get(i).get(3)%></option><%
                                            }
                           
                                      }
                                    }
                                }
                                else
                                {

                                    for (int i = 0; i < dataDoctor1.size(); i++) 
                                    {
                                        if(e43.equals(dataDoctor1.get(i).get(3)))
                                        {%>
                                            <option value="<%=dataDoctor1.get(i).get(3)%>" selected><%=dataDoctor1.get(i).get(3)%></option> <%
                                        }
                                        else
                                        {%>
                                            <option value="<%=dataDoctor1.get(i).get(3)%>"><%=dataDoctor1.get(i).get(3)%></option> <%
                                        }
                                    } 
                                }%>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="disApp">Discipline : </label>  
                        <div class="col-sm-10">  
                           <option></option>
                            <% 
                                if (e44 == null) 
                                {
                                    %><input type="text" name="disApp" value="" class="form-control" readonly> <% 
                                } 
                                else 
                                {
                                    %><input type="text" name="disApp" value="<%=e44%>" class="form-control" readonly> <% 
                                }%>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="subDisApp">Subdicipline : </label>  
                        <div class="col-sm-10">   
                            <% 
                                if (e45 == null) 
                                {
                                    %><input type="text" name="subDisApp" value="" class="form-control" readonly> <% 
                                } 
                                else 
                                {
                                    %><input type="text" name="subDisApp" value="<%=e45%>" class="form-control" readonly> <% 
                                }%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appType">Appointment Type : </label>  
                        <div class="col-sm-10">   
                            <% 
                                if (e46 == null) 
                                {
                                    %><input type="text" name="appType" value="" class="form-control" readonly> <% 
                                } 
                                else 
                                {
                                    %><input type="text" name="appType" value="<%=e46%>" class="form-control" readonly> <% 
                                }%>
                        </div>
                    </div>
                    <button onclick="alertbox()" class="btn btn-xs btn-success" type="button" style="margin-bottom: 6%">Save</button>
                    <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>
                    <button class="btn btn-xs btn-success" type="submit" formaction="checkAppointmentUpdate.jsp" value="Check" style="margin-bottom: 6%">Check</button>
                  
                    </form>
                    </div>
            </div>
            <div id="about" class="tab-pane fade">
                    <h3 class="headerTitle">About Us</h3>
            </div>
            <div id="contact" class="tab-pane fade">
                    <h3 class="headerTitle">Contact Us</h3>
            </div>
            <div id="location" class="tab-pane fade">
                    <h3 class="headerTitle">Our Location</h3>
            </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12 bodyContent">
            <script>
                $(function() 
                { 
                    $('a[data-toggle="tab"]').on('shown.bs.tab', function () 
                    s{
                        //save the latest tab; use cookies if you like 'em better:
                        localStorage.setItem('lastTab', $(this).attr('href'));
                    });
                        //go to the latest tab, if it exists:
                        var lastTab = localStorage.getItem('lastTab');
                    if (lastTab) 
                    {
                        $('a[href=' + lastTab + ']').tab('show');
                    }
                    else
                    {
                        // Set the first tab if cookie do not exist
                        $('a[data-toggle="tab"]:first').tab('show');
                    }
                });
            </script>
            <h3 class="headerTitle">Categories</h3>
            <ul class="nav navbar-brand"  style="margin-bottom: 110%;" >
                    <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#holiday">Maintain Holiday</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#clinicday">Maintain Clinic Day</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#roster">Maintain Roster</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#leave">Maintain Leave</a></li> 
                    <!--<li id="tab"><a data-toggle="tab" class="dropdown" href="#appointment">Maintain Appointment</a></li>-->
                    <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Maintain Appointment<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a data-toggle="tab" class="dropdown-item" href="#addAppointment">Add Patient Appointment</a></li>
                          <!--<li><a data-toggle="tab" class="dropdown-item" href="#checkAppointment">Check Patient Appointment</a></li>-->
                          <li><a data-toggle="tab" class="dropdown-item" href="#viewAppointment">View Patient Appointment</a></li>
                        </ul>
                    </li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#about">About Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#contact">Contact Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#location">Our Location</a></li>
           </ul> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                Copyright &copy; 2016 FTMK
        </div>
    </div>
</div>
</body>
</html>
