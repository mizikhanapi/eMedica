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

                
                String discipline;
                String subdiscipline;
                
                String id = null;
                
                
               Date today = new Date();
               String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
               SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
               
               SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("HH:mm:ss");
               String date = DATE_FORMAT.format(today);
               
               String newAppDate = dateAppointment + " "+ date;
               String newAppTime = timeAppointment +":00";
               String appDateTime = dateAppointment +  " " + timeAppointment;
               SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
               

               Date d1 = df.parse(dateAppointment);
//
                //Choosen date/day
                SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
                String chosenDayDate = sdf.format(d1);
    
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
                
                discipline = dataGetRoster.get(0).get(3);
                subdiscipline = dataGetRoster.get(0).get(4);

                  
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
                
                
                RMIConnector rmic = new RMIConnector();
                String sqlInsert = "INSERT INTO pms_appointment (pmi_no, hfc_cd, appointment_date, module_cd, hfc_to, txn_date, location_cd, userid, encounter_date, episode_date, order_no, appointment_type, register_status, status, remarks, start_time, end_time, discipline, subdiscipline, created_by, created_date) "
                                    + "VALUES ('"+pmiNo+"' , '"+hfcCode+"','"+datetimeAppoinment+"','-','-','0000-00-00','-','"+doctor+"','0000-00-00','0000-00-00','-','"+typeAppointment+"','active','pending','-','"+datetimeAppoinment+"','0000-00-00','"+discipline+"','"+subdiscipline+"','"+ic+"',now())";

                rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                out.print("appointmentInsert");
                

               
          
        %>
