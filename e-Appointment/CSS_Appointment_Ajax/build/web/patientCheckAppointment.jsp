<%-- 
    Document   : checkAppointment
    Created on : May 21, 2016, 1:28:37 PM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
        String ic = (String)session.getAttribute("ic");
        String appDate= request.getParameter("appDate");
        String appTime = request.getParameter("appTime");
        String appDoc = request.getParameter("appDoc");
        String hfc = (String)session.getAttribute("sessionHFC");
        String disApp = request.getParameter("disApp");
        String subDisApp = request.getParameter("subDisApp");
        String appType = request.getParameter("appType");
        String discipline;
        String subdicipline;
        String id = null;
        
        out.print("appDate "+appDate);
        out.print("appTime "+appTime);

        String pmiNo = (String)session.getAttribute("pmiToBeUsed");
        String idNo = (String)session.getAttribute("idPatientToBeUsed");
        String patientName = (String)session.getAttribute("patientNameToBeUsed");
        
        Date today = new Date();
        String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
        SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);

        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("HH:mm:ss");
        String date = DATE_FORMAT.format(today);
        
        String newAppDate = appDate + " "+ date;
        String newAppTime = appTime +":00";
        String appDateTime = appDate +  " " + appTime;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = df.parse(appDate);

        //Choosen date/day
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        String chosenDayDate = sdf.format(d1);
//      out.print(chosenDayDate);
        

//      QUERY TO VALIDATE CLINIC DAY (hfc yg open - status > active - compare day) - message -> the clinic is off. Please choose other day
        String sqlGetHFCCode = "SELECT Detail_Ref_code "
                + "FROM lookup_detail "
                + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
        ArrayList<ArrayList<String>> dataGetHFCCode = Conn.getData(sqlGetHFCCode);
        
        String dataHFCCode; 
        
        
         if(dataGetHFCCode.size() > 0)
        {
             dataHFCCode = dataGetHFCCode.get(0).get(0);
        }
        else
        {
              dataHFCCode = null;
        }
        

        String sqlGetClinicDay = "SELECT day_cd, discipline_cd, subdiscipline_cd, hfc_cd, state_code "
                + "FROM pms_clinic_day "
                + "WHERE hfc_cd = '"+dataHFCCode+"' AND status = 'active' AND day_cd = '"+chosenDayDate+"' AND ('"+newAppTime+"' BETWEEN start_time AND end_time)";
        ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlGetClinicDay);
        
        
        String dataStates;
        
        if(dataGetStates.size() > 0)
        {
             dataStates = dataGetStates.get(0).get(4);
        }
        else
        {
              dataStates = null;
        }

        
//      QUERY VALIDATE HOLIDAY (hfc based on state yg active - allowed) - message -> 
        String sqlHoliday = "SELECT holiday_date "
                + "FROM pms_holiday "
                + "WHERE (state_code = '"+dataStates+"' OR state_code = '00') AND status = 'active' AND holiday_date = '"+appDate+"'";
        ArrayList<ArrayList<String>> dataGetHoliday = Conn.getData(sqlHoliday);
        
//        out.print(dataGetHoliday.size());
//        out.print("***");
        
//      GET DOCTOR ID FROM THE INPUT FORM TO SET UP FOR DOCTOR ROSTER AND DOCTOR LEAVE
        String sqlGetUserID = "SELECT * "
                + "FROM adm_user "
                + "WHERE USER_NAME = '"+appDoc+"'";
        ArrayList<ArrayList<String>> dataGetUserID  = Conn.getData(sqlGetUserID);
        String dataUserID = dataGetUserID.get(0).get(0);
        id=dataUserID;
        
        
//      QUERY VALIDATE DUTY ROSTER (staff yg sedang bekerja - status > active (Doctor only))
        String sqlDutyRoster = "SELECT * "
                + "FROM pms_duty_roster "
                + "WHERE hfc_cd = '"+hfc+"' AND user_id = '"+dataUserID+"' AND status = 'active' AND ('"+appDate+"' BETWEEN start_date AND end_date)";
        ArrayList<ArrayList<String>> dataGetRoster = Conn.getData(sqlDutyRoster);
//        out.print(sqlDutyRoster);
        
//      QUERY VALIDATE LEAVE (staff not in leave - allowed (Doctor only)) date entered compare ngan tarikh end leave dan status yg active
        String sqlGetLeaveStatus = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataUserID+"' AND status = 'approve' AND ('"+appDate+"' BETWEEN start_leave_date AND end_leave_date)";
        ArrayList<ArrayList<String>> dataGetLeaveStatus  = Conn.getData(sqlGetLeaveStatus);
        
//        out.print(sqlGetLeaveStatus);
        
        String sqlGetStaffID = "SELECT * "
                + "FROM adm_user "
                + "WHERE USER_NAME = '"+appDoc+"'";
        ArrayList<ArrayList<String>> dataGetStaffID  = Conn.getData(sqlGetStaffID);
        
        String dataStaffID = dataGetStaffID.get(0).get(0);
        
        
        String sqlCheckAppPast = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS app_date, userid, appointment_type, status  "
                + "FROM pms_appointment "
                + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+appDate+"' AND hfc_cd = '"+dataHFCCode+"' AND status = 'active'";
        ArrayList<ArrayList<String>> dataCheckAppPastActive = Conn.getData(sqlCheckAppPast);
        
//        out.print(sqlCheckAppPast);
        
        String sqlValidateAppointment = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS appointment_date, userid, appointment_type, status, "
                + "TIME(start_time) AS start_time, created_by, DATE(created_date) AS created_date, canceled_by, DATE(canceled_date) AS canceled_date "
                + "FROM pms_appointment "
                + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+appDate+"' AND (status = 'canceled' OR status = 'active' OR status = 'inactive') ";
        ArrayList<ArrayList<String>> dataCheckApp  = Conn.getData(sqlValidateAppointment);
        
        String sqlCheckExistDate = "SELECT DATE(appointment_date) AS appointment_date, userid, TIME(start_time) AS start_time, status "
                + "FROM pms_appointment "
                + "WHERE DATE(appointment_date) = '"+appDate+"' AND userid = '"+dataUserID+"' AND TIME(start_time) = '"+appTime+"' AND status = 'active'";
        ArrayList<ArrayList<String>> dataCheckExistDate  = Conn.getData(sqlCheckExistDate);
        
        
        if(dataCheckExistDate.size()> 0)  //check date for everyone
        {
            %><script language='javascript'>
                alert('The slot has been picked. Please choose other date or same date with different time'); 
                window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
            </script> <%
        }
        else
        {  
            if(dataCheckAppPastActive.size()>0) // check date for the inserted patient and check wheather the slot is active
            {
                %><script language='javascript'>
                    alert('It seems that the date you pick already be picked by you. Please view your appointment schedule'); 
                    window.location= 'patientAppointment.jsp';
                </script> <%
            }
            else
            {
                if(dataGetHoliday.size() == 0)
                {
                    if(dataGetStates.size() > 0)
                    {
                        if(dataGetRoster.size() > 0)
                        {
                            discipline = dataGetRoster.get(0).get(3);
                            subdicipline = dataGetRoster.get(0).get(4);

                            if(dataGetLeaveStatus.size() == 0)
                            {
                                boolean statusCanceled = false;
                                boolean statusActive = false;
                                boolean statusInactive = false;

                                for(int index = 0; index < dataCheckApp.size(); index++)
                                {
                                    if(dataCheckApp.get(index).get(5).equals("canceled"))
                                    {
                                        statusCanceled = true;
                                    }
                                    else if(dataCheckApp.get(index).get(5).equals("inactive"))
                                    {
                                        statusActive= true;
                                    }
                                    else
                                    {
                                        statusInactive= true;
                                    }
                                }
                                    if(statusCanceled)
                                    {
                                        %><script language='javascript'>
                                            var result = confirm("The chosen date has been canceled before. Click Ok if you want to proceed with make the appointment on that date");
                                            if(result == true)
                                            { 
                                                window.location= 'patientAppointmentInsertAppointmentData.jsp?e27=<%=pmiNo%>&e30=<%=dataUserID%>&e31=<%=patientName%>&e32=<%=newAppDate%>&e33=<%=appDateTime%>&e34=<%=ic%>&e35=<%=discipline%>&e36=<%=subdicipline%>&e46=<%=appType%>&e48=<%=dataHFCCode%>';
                                            }
                                            else
                                            {
                                                window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                                            }
                                        </script> <% 
                                    }
                                    else if(statusActive || statusInactive)
                                    {
                                        %><script language='javascript'>
                                            var result = confirm("By clicking OK you are directly Save the info");
                                            if(result == true)
                                            { 
                                                window.location= 'patientAppointmentInsertAppointmentData.jsp?e27=<%=pmiNo%>&e30=<%=dataUserID%>&e31=<%=patientName%>&e32=<%=newAppDate%>&e33=<%=appDateTime%>&e34=<%=ic%>&e35=<%=discipline%>&e36=<%=subdicipline%>&e46=<%=appType%>&e48=<%=dataHFCCode%>';
                                            }
                                            else
                                            {
                                                window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                                            }
                                        </script> <%  
                                           // out.print("pmiNo = "+pmiNo);
                                           // out.print("patientName = "+patientName);
                                           // out.print("idNo = "+idNo);
                                           // out.print("appDate = "+appDate);
                                           // out.print("appTime = "+appTime);
                                           // out.print("appDoc = "+appDoc);
                                           // out.print("disApp = "+disApp);
                                           // out.print("subDisApp = "+subDisApp);
                                            
                                    }
                                    else        // for patient who the data does not exist in appointment table
                                    {
                                        %><script language='javascript'>
                                            var result = confirm("By clicking OK you are directly Save the info");
                                            if(result == true)
                                            { 
                                                window.location= 'patientAppointmentInsertAppointmentData.jsp?e27=<%=pmiNo%>&e30=<%=dataUserID%>&e31=<%=patientName%>&e32=<%=newAppDate%>&e33=<%=appDateTime%>&e34=<%=ic%>&e35=<%=discipline%>&e36=<%=subdicipline%>&e46=<%=appType%>&e48=<%=dataHFCCode%>';
//                                                var pmiNo = "<%=pmiNo%>";
//                                                var dataUserID = "<%=dataUserID%>";
//                                                var patientName = "<%=patientName%>";
//                                                var newAppDate = "<%=newAppDate%>";
//                                                var appDateTime = "<%=appDateTime%>";
//                                                var ic = "<%=ic%>";
//                                                var discipline = "<%=discipline%>";
//                                                var subdicipline = "<%=subdicipline%>";
//                                                var dataHFCCode = "<%=dataHFCCode%>";
//                                                var appType = "<%=appType%>";
//                                                console.log(pmiNo);
//                                                console.log(dataUserID);
//                                                console.log(patientName);
//                                                console.log(newAppDate);
//                                                console.log(appDateTime);
//                                                console.log(ic);
//                                                console.log(discipline);
//                                                console.log(subdicipline);
//                                                console.log(dataHFCCode);
//                                                console.log(appType);
                                            }
                                            else
                                            {
                                                window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                                           }
                                        </script> <%
//                                            out.print("pmiNo = "+pmiNo);
//                                           out.print("patientName = "+patientName);
//                                            out.print("idNo = "+idNo);
 //                                           out.print("appDate = "+appDate);
  //                                          out.print("appTime = "+appTime);
   //                                         out.print("appDoc = "+appDoc);
     //                                       out.print("disApp = "+disApp);
  //                                          out.print("subDisApp = "+subDisApp);
                                    }
                            }
                            else
                            {
                                %><script language='javascript'>
                                    alert('The doctor is on leave. Please choose other doctor'); 
                                    window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                                 </script> <%
                            }
                        }
                        else
                        {
                            %><script language='javascript'>
                                alert('The doctor is not in their duty. Please choose other doctor'); 
                                window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                            </script> <%
                        }
                    }
                    else
                    {
                        %><script language='javascript'>
                            alert('The clinic is off. Please pick other date'); 
                            window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                        </script> <%
                    }
                }
                else
                {
                    %><script language='javascript'>
                        alert('The picked date is Holiday. Please view holiday in the View Holiday tab'); 
                        window.location= 'patientAppointment.jsp?e27=<%=pmiNo%>&e31=<%=patientName%>&e30=<%=idNo%>&e32=<%=appDate%>&e33=<%=appTime%>&e34=<%=appDoc%>&e35=<%=disApp%>&e36=<%=subDisApp%>';
                    </script> <%
                }
            }
        }  
%>
