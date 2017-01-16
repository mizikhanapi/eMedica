<%-- 
    Document   : medicalStaffNurseInsertAppointmentData
    Created on : Aug 4, 2016, 11:50:46 PM
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
    
    String e27 = request.getParameter("e27");
    String e30 = request.getParameter("e30");
    String e31 = request.getParameter("e31");
    String e32 = request.getParameter("e32");
    String e33 = request.getParameter("e33");
    String e34 = request.getParameter("e34");
    String e35 = request.getParameter("e35");
    String e36 = request.getParameter("e36");
    String e46 = request.getParameter("e46");
    String e48 = request.getParameter("e48");
    
//    out.print(e27);
    
    RMIConnector rmic = new RMIConnector();
    String sqlInsert = "INSERT INTO pms_appointment (pmi_no, hfc_cd, appointment_date, module_cd, hfc_to, txn_date, location_cd, userid, encounter_date, episode_date, order_no, appointment_type, register_status, status, remarks, start_time, end_time, discipline, subdiscipline, created_by, created_date) "
            + "VALUES ('"+e27+"' , '"+e48+"','"+e32+"','-','-','0000-00-00','-','"+e30+"','0000-00-00','0000-00-00','-','"+e46+"','-','active','pending','"+e33+"','0000-00-00','"+e35+"','"+e36+"','"+e34+"',now())";

    boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
    
    response.sendRedirect("medicalStaffNurse.jsp");
//    response.sendRedirect("adminAppointment.jsp?e27=out.print(e27)&e31=out.print(e31)&e30=out.print(e30)");
   %>
