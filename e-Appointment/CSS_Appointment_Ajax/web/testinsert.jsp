<%-- 
    Document   : connectDB
    Created on : Nov 24, 2016, 2:35:33 PM
    Author     : user
--%>
<%@ page import ="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

        <%
           
                Conn Conn = new Conn();
                String pmiNo = request.getParameter("pmiNo");
                String dataUserId = request.getParameter("dataUserId");
                String ic = request.getParameter("ic");
                //String discipline = request.getParameter("discipline");
                //String subdiscipline = request.getParameter("subdiscipline");
                String doctor = request.getParameter("doctor");
                String dateAppointment = request.getParameter("dateAppointment");
                String timeAppointment = request.getParameter("timeAppointment");
                String datetimeAppoinment = dateAppointment + " " + timeAppointment;
                String typeAppointment = request.getParameter("typeAppointment");
                //String hfcCode = request.getParameter("HfcCode");
                
                
                String hfcCode;
                String hfc = (String)session.getAttribute("sessionHFC");
                //out.print(hfc);
                
                String discipline;
                String subdiscipline;
                
                String id = null;
                
                //out.print(hfc);
                //out.print("Time Appointment : "+timeAppointment);
                //out.print("Date Appointment : " + dateAppointment + "\n");
                //out.print("Doctor : " + doctor);
                
               Date today = new Date();
               String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
               SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
               
               SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("HH:mm:ss");
               String date = DATE_FORMAT.format(today);
               
               String newAppDate = dateAppointment + " "+ date;
               String newAppTime = timeAppointment +":00";
               String appDateTime = dateAppointment +  " " + timeAppointment;
               SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
               
//               out.print(newAppDate);
//               out.print(newAppTime);
//               out.print(appDateTime);
               Date d1 = df.parse(dateAppointment);
//
                //Choosen date/day
                SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
                String chosenDayDate = sdf.format(d1);
//                
//                out.println("new app date : "+newAppDate+"\n");   
//                out.print("new app time : " + newAppTime+"\n");  
//                out.print("new date time : " + appDateTime+"\n");  
//                out.print("new d1 : " + d1+"\n");  
//                out.print("new sdf : " + sdf+"\n"); 
//                out.print("chosenDate : " + chosenDayDate+"\n");
//                out.print("HFC Session : " + hfc+"\n");
////                
               
                String sqlGetHFCCode = "SELECT Detail_Ref_code "
                + "FROM lookup_detail "
                + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
                
                ArrayList<ArrayList<String>> dataGetHFCCode = Conn.getData(sqlGetHFCCode);
                
              if(dataGetHFCCode.size() > 0)
                {
                     hfcCode = dataGetHFCCode.get(0).get(0);
                }
                else
                {
                      hfcCode = null;
                }

                //out.print("HFC Code : " + hfcCode+"\n");
//                
//                
                String sqlGetClinicDay = "SELECT day_cd, discipline_cd, subdiscipline_cd, hfc_cd, state_code "
                + "FROM pms_clinic_day "
                + "WHERE hfc_cd = '"+hfcCode+"' AND status = 'active' AND day_cd = '"+chosenDayDate+"' AND ('"+timeAppointment+"' BETWEEN start_time AND end_time)";
                ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlGetClinicDay);
                //out.print(sqlGetClinicDay);

//
                String dataStates;

                if(dataGetStates.size() > 0)
                {
                     dataStates = dataGetStates.get(0).get(4);
                }
                else
                {
                      dataStates = null;
                 }
       

                
                String sqlHoliday = "SELECT holiday_date "
                + "FROM pms_holiday "
                + "WHERE (state_code = '"+dataStates+"' OR state_code = '00') AND status = 'active' AND holiday_date = '"+dateAppointment+"'";
                ArrayList<ArrayList<String>> dataGetHoliday = Conn.getData(sqlHoliday);
                
            //      QUERY VALIDATE DUTY ROSTER (staff yg sedang bekerja - status > active (Doctor only))
                  String sqlDutyRoster = "SELECT * "
                          + "FROM pms_duty_roster "
                          + "WHERE hfc_cd = '"+hfc+"' AND user_id = '"+doctor+"' AND status = 'active' AND ('"+dateAppointment+"' BETWEEN start_date AND end_date)";
                  ArrayList<ArrayList<String>> dataGetRoster = Conn.getData(sqlDutyRoster);
                  
                  //out.print(sqlDutyRoster+ "\n");
                  
                  //      QUERY VALIDATE LEAVE (staff not in leave - allowed (Doctor only)) date entered compare ngan tarikh end leave dan status yg active
                String sqlGetLeaveStatus = "SELECT user_id, start_leave_date, end_leave_date, status "
                        + "FROM pms_staff_leave "
                        + "WHERE user_id = '"+doctor+"' AND status = 'approve' AND ('"+dateAppointment+"' BETWEEN start_leave_date AND end_leave_date)";
                ArrayList<ArrayList<String>> dataGetLeaveStatus  = Conn.getData(sqlGetLeaveStatus);
                
                //out.print(sqlGetLeaveStatus + "\n");
                 String sqlCheckAppPast = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS app_date, userid, appointment_type, status  "
                                        + "FROM pms_appointment "
                                        + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+dateAppointment+"' AND hfc_cd = '"+hfcCode+"' AND status = 'active'";
                 ArrayList<ArrayList<String>> dataCheckAppPastActive = Conn.getData(sqlCheckAppPast);
                
                   //out.print(sqlCheckAppPast + "\n");
                    String sqlValidateAppointment = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS appointment_date, userid, appointment_type, status, "
                        + "TIME(start_time) AS start_time, created_by, DATE(created_date) AS created_date, canceled_by, DATE(canceled_date) AS canceled_date "
                        + "FROM pms_appointment "
                        + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+dateAppointment+"' AND (status = 'canceled' OR status = 'active' OR status = 'inactive') ";
                        ArrayList<ArrayList<String>> dataCheckApp  = Conn.getData(sqlValidateAppointment);
                        
                       // out.print(sqlValidateAppointment);

                String sqlCheckExistDate = "SELECT DATE(appointment_date) AS appointment_date, userid, TIME(start_time) AS start_time, status "
                        + "FROM pms_appointment "
                        + "WHERE DATE(appointment_date) = '"+dateAppointment+"' AND userid = '"+doctor+"' AND TIME(start_time) = '"+timeAppointment+"' AND status = 'active'";
                ArrayList<ArrayList<String>> dataCheckExistDate  = Conn.getData(sqlCheckExistDate);
                
                //out.print(sqlCheckExistDate + "\n");
                
                        if(dataCheckExistDate.size()> 0)  //check date for everyone
        {
                            //The slot has been picked. Please choose other date or same date with different time
                            out.print("slotPicked");

        }
        else
        {  
            if(dataCheckAppPastActive.size()>0) // check date for the inserted patient and check wheather the slot is active
            { //It seems that the date you pick already be picked by you. Please view your appointment schedule
                out.print("datePicked");

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
                            subdiscipline = dataGetRoster.get(0).get(4);

                            if(dataGetLeaveStatus.size() == 0)
                            {
                                //out.print("dataGetLeaveStatus");
                                boolean statusCanceled = false;
                                boolean statusActive = false;
                                boolean statusInactive = false;

                                for(int index = 0; index < dataCheckApp.size(); index++)
                                {
                                    //out.print("dataCheckApp");

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
                                    if(statusCanceled) //The chosen date has been canceled before. Click Ok if you want to proceed with make the appointment on that date
                                    {
                                        out.print("appointmentInsertstatusCanceled");                     

                                    }
                                    else if(statusActive || statusInactive)//By clicking OK you are directly Save the info
                                    {

                                       out.print("appointmentInsertstatusActivestatusInactive");

                                    }
                                    else // for patient who the data does not exist in appointment table
                                    { //By clicking OK you are directly Save the info

                                        out.print("appointmentAlreadyInsert");
                                    }
                            }
                            else
                            {
                                //The doctor is on leave. Please choose other doctor
                                out.print("doctorOnLeave");

                            }
                        }
                        else
                        {
                            //The doctor is not in their duty. Please choose other doctor
                               out.print("doctorNotDuty");
                        }
                    }
                    else
                    {   //The clinic is off. Please pick other date
                        out.print("clinicOff");
                    }
                }
                else
                {   //The picked date is Holiday. Please view holiday in the View Holiday tab
                    out.print("holiday");

                }
            }
        }  


            
               
          
        %>
