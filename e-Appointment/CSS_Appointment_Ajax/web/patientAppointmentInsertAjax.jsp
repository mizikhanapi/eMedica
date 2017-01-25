<%-- 
    Document   : patientAppointmentInsertAppointmentData
    Created on : Aug 5, 2016, 12:01:01 AM
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
  try{
    String pmiNo = request.getParameter("pmiNo");
    String dataUserId = request.getParameter("dataUserId");
    String patientName = request.getParameter("patientName");
    String ic = request.getParameter("ic");
    String discipline = request.getParameter("discipline");
    String subdiscipline = request.getParameter("subdiscipline");
    String doctor = request.getParameter("doctor");
    String dateAppointment = request.getParameter("dateAppointment");
    String timeAppointment = request.getParameter("timeAppointment");
    String datetimeAppoinment = dateAppointment + " " + timeAppointment;
    String typeAppointment = request.getParameter("typeAppointment");
    String hfcCode = request.getParameter("HfcCode");
    
//    out.print(e27);
    
    RMIConnector rmic = new RMIConnector();
    String sqlInsert = "INSERT INTO pms_appointment (pmi_no, hfc_cd, appointment_date, module_cd, hfc_to, txn_date, location_cd, userid, encounter_date, episode_date, order_no, appointment_type, register_status, status, remarks, start_time, end_time, discipline, subdiscipline, created_by, created_date) "
            + "VALUES ('"+pmiNo+"' , '"+hfcCode+"','"+dateAppointment+"','-','-','0000-00-00','-','"+dataUserId+"','0000-00-00','0000-00-00','-','"+typeAppointment+"','-','active','pending','"+datetimeAppoinment+"','0000-00-00','"+discipline+"','"+subdiscipline+"','"+ic+"',now())";

    boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
    
    if (isInsert) {
           out.print("-|1");
           return;
       } else {
           out.print("-|-1");
           return;
       }
     }
  catch(Exception e){
      out.println(e.getMessage());
  }
    //response.sendRedirect("patientAppointmentAjax.jsp");
//    response.sendRedirect("adminAppointment.jsp?e27=out.print(e27)&e31=out.print(e31)&e30=out.print(e30)");
   %>
