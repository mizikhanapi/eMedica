package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.sql.*;
import dBConn.Conn;
import main.RMIConnector;

public final class medicalStaffNurseCheckAppointment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

        String username = (String)session.getAttribute("username");
        String pmiNo = request.getParameter("pmiNo");
        String patientName = request.getParameter("patientName");
        String idNo = request.getParameter("idNo");
        String appDate= request.getParameter("appDate");
        String appTime = request.getParameter("appTime");
        String appDoc = request.getParameter("appDoc");
        String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
        String disApp = request.getParameter("disApp");
        String subDisApp = request.getParameter("subDisApp");
        String appType = request.getParameter("appType");
        String discipline;
        String subdicipline;
        String id = null;
        

        
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
        
//        out.print(sqlGetClinicDay);
        
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
        
        String sqlGetStaffID = "SELECT * "
                + "FROM adm_user "
                + "WHERE USER_NAME = '"+appDoc+"'";
        ArrayList<ArrayList<String>> dataGetStaffID  = Conn.getData(sqlGetStaffID);
        
        String dataStaffID = dataGetStaffID.get(0).get(0);
        
        
        String sqlCheckAppPast = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS app_date, userid, appointment_type, status  "
                + "FROM pms_appointment "
                + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+appDate+"' AND hfc_cd = '"+dataHFCCode+"' AND status = 'active'";
        ArrayList<ArrayList<String>> dataCheckAppPastActive = Conn.getData(sqlCheckAppPast);
        
        String sqlValidateAppointment = "SELECT pmi_no, hfc_cd, DATE(appointment_date) AS appointment_date, userid, appointment_type, status, "
                + "TIME(start_time) AS start_time, created_by, DATE(created_date) AS created_date, canceled_by, DATE(canceled_date) AS canceled_date "
                + "FROM pms_appointment "
                + "WHERE pmi_no = '"+pmiNo+"' AND DATE(appointment_date) = '"+appDate+"' AND (status = 'canceled' OR status = 'active' OR status = 'inactive')";
        ArrayList<ArrayList<String>> dataCheckApp  = Conn.getData(sqlValidateAppointment);
        
        String sqlCheckExistDate = "SELECT DATE(appointment_date) AS appointment_date, userid, TIME(start_time) AS start_time, status "
                + "FROM pms_appointment "
                + "WHERE DATE(appointment_date) = '"+appDate+"' AND userid = '"+dataUserID+"' AND TIME(start_time) = '"+appTime+"' AND status = 'active'";
        ArrayList<ArrayList<String>> dataCheckExistDate  = Conn.getData(sqlCheckExistDate);
        
        
        if(dataCheckExistDate.size()> 0)  //check date for everyone
        {
            
      out.write("<script language='javascript'>\r\n");
      out.write("                alert('The slot has been picked. Please choose other date or same date with different time'); \r\n");
      out.write("                window.location= 'medicalStaffDoctor.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("            </script> ");

        }
        else
        {  
            if(dataCheckAppPastActive.size()>0) // check date for the inserted patient and check wheather the slot is active
            {
                
      out.write("<script language='javascript'>\r\n");
      out.write("                    alert('It seems that this patient already have appointment for this date. Please view the appointment schedule'); \r\n");
      out.write("                    window.location= 'medicalStaffNurse.jsp';\r\n");
      out.write("                </script> ");

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
                                        
      out.write("<script language='javascript'>\r\n");
      out.write("                                            var result = confirm(\"The chosen date has been canceled before. Click Ok if you want to proceed with make the appointment on that date\");\r\n");
      out.write("                                            if(result == true)\r\n");
      out.write("                                            { \r\n");
      out.write("                                                window.location= 'medicalStaffNurseInsertAppointmentData.jsp?e27=");
      out.print(pmiNo);
      out.write("&e30=");
      out.print(dataUserID);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e32=");
      out.print(newAppDate);
      out.write("&e33=");
      out.print(appDateTime);
      out.write("&e34=");
      out.print(username);
      out.write("&e35=");
      out.print(discipline);
      out.write("&e36=");
      out.print(subdicipline);
      out.write("&e46=");
      out.print(appType);
      out.write("&e48=");
      out.print(dataHFCCode);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                            else\r\n");
      out.write("                                            {\r\n");
      out.write("                                                window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                        </script> ");
 
                                    }
                                    else if(statusActive || statusInactive)
                                    {
                                        
      out.write("<script language='javascript'>\r\n");
      out.write("                                            var result = confirm(\"By clicking OK you are directly Save the info\");\r\n");
      out.write("                                            if(result == true)\r\n");
      out.write("                                            { \r\n");
      out.write("                                                window.location= 'medicalStaffNurseInsertAppointmentData.jsp?e27=");
      out.print(pmiNo);
      out.write("&e30=");
      out.print(dataUserID);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e32=");
      out.print(newAppDate);
      out.write("&e33=");
      out.print(appDateTime);
      out.write("&e34=");
      out.print(username);
      out.write("&e35=");
      out.print(discipline);
      out.write("&e36=");
      out.print(subdicipline);
      out.write("&e46=");
      out.print(appType);
      out.write("&e48=");
      out.print(dataHFCCode);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                            else\r\n");
      out.write("                                            {\r\n");
      out.write("                                                window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                        </script> ");
  
                                    }
                                    else        // for patient who the data does not exist in appointment table
                                    {
                                        
      out.write("<script language='javascript'>\r\n");
      out.write("                                            var result = confirm(\"By clicking OK you are directly Save the info\");\r\n");
      out.write("                                            if(result == true)\r\n");
      out.write("                                            { \r\n");
      out.write("                                                window.location= 'medicalStaffNurseInsertAppointmentData.jsp?e27=");
      out.print(pmiNo);
      out.write("&e30=");
      out.print(dataUserID);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e32=");
      out.print(newAppDate);
      out.write("&e33=");
      out.print(appDateTime);
      out.write("&e34=");
      out.print(username);
      out.write("&e35=");
      out.print(discipline);
      out.write("&e36=");
      out.print(subdicipline);
      out.write("&e46=");
      out.print(appType);
      out.write("&e48=");
      out.print(dataHFCCode);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                            else\r\n");
      out.write("                                            {\r\n");
      out.write("                                                window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                                            }\r\n");
      out.write("                                        </script> ");
 
                                    }
                            }
                            else
                            {
                                
      out.write("<script language='javascript'>\r\n");
      out.write("                                    alert('The doctor is on leave. Please choose other doctor'); \r\n");
      out.write("                                    window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                                 </script> ");

                            }
                        }
                        else
                        {
                            
      out.write("<script language='javascript'>\r\n");
      out.write("                                alert('The doctor is not in their duty. Please choose other doctor'); \r\n");
      out.write("                                window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                            </script> ");

                        }
                    }
                    else
                    {
                        
      out.write("<script language='javascript'>\r\n");
      out.write("                            alert('The clinic is off. Please pick other date'); \r\n");
      out.write("                            window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                        </script> ");

                    }
                }
                else
                {
                    
      out.write("<script language='javascript'>\r\n");
      out.write("                        alert('The picked date is Holiday. Please view holiday in the View Holiday tab'); \r\n");
      out.write("                        window.location= 'medicalStaffNurse.jsp?e27=");
      out.print(pmiNo);
      out.write("&e31=");
      out.print(patientName);
      out.write("&e30=");
      out.print(idNo);
      out.write("&e32=");
      out.print(appDate);
      out.write("&e33=");
      out.print(appTime);
      out.write("&e34=");
      out.print(appDoc);
      out.write("&e35=");
      out.print(disApp);
      out.write("&e36=");
      out.print(subDisApp);
      out.write("';\r\n");
      out.write("                    </script> ");

                }
            }
        }   

      out.write('\r');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
