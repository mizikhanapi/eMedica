<%-- 
    Document   : updateDeliveredReminder
    Created on : Aug 12, 2016, 1:12:42 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.commons.io.IOUtils"%>


<%
    Conn Conn = new Conn();
        String pmi_no = request.getParameter("email");
        String hfc_cd = request.getParameter("subject");
        String app_date = request.getParameter("message");
         String jsonString = IOUtils.toString(request.getInputStream());
         JSONObject json = new JSONObject(jsonString);
            
            String email = json.getString("email");
            String subject = json.getString("subject");
            String message = json.getString("message");
        
        out.print(email);
        out.print("******");
        out.print(subject);
        out.print("******");
        out.print(message);
        out.print("******");
        
//        RMIConnector rmic = new RMIConnector();
//        String sqlInsert = "UPDATE pms_appointment "
//                + "SET remarks='delivered' "
//                + "WHERE pmi_no='" + pmi_no + "' AND hfc_cd='" + hfc_cd + "' AND DATE(appointment_date) = '"+app_date+"'";
//
//        boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
//
//        
////                 out.print(sqlInsert);
////                  out.print("|"+isInsert+"|");
////                  if (true) { return; }
//        if (isUpdate) 
//        {
////             response.sendRedirect("adminAppointment.jsp");
//            %>
//                <script language='javascript'>
//                    alert('Reminder has been sent'); 
//                    window.location= 'adminAppointment.jsp';
//                </script> 
//            <%
//        } else 
//        {
//            response.sendRedirect("data not update");
//        }

        
%>
