<%-- 
    Document   : cancelAppointment
    Created on : Jul 30, 2016, 12:20:57 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%       
    String username = (String) session.getAttribute("username");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String e27 = request.getParameter("e27");
    String e32 = request.getParameter("e32");
    String e48 = request.getParameter("e48");
    String canceledReason = request.getParameter("canceledReason");
    
//    out.print(username);
//    out.print(e27);
//    out.print(e32);
//    out.print(e48);
//    out.print(canceledReason);
    
            RMIConnector rmic = new RMIConnector();
            String sqlUpdate = "UPDATE pms_appointment "
                    + "SET status='canceled', canceled_by='" + username + "', canceled_date=now(), canceled_reason='" + canceledReason + "' "
                    + "WHERE pmi_no='" + e27 + "' AND hfc_cd='" + e48 + "' AND DATE(appointment_date)='" + e32 + "'";
            boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);

 
            String sqlCheckUser = "SELECT * FROM adm_user WHERE HEALTH_FACILITY_CODE = '"+hfc+"' AND USER_ID = '"+username+"'";
            ArrayList<ArrayList<String>> dataCheckUser = Conn.getData(sqlCheckUser);
            
            String user = dataCheckUser.get(0).get(4);
            
            if(isUpdate && user.equals("NURSE"))
            {
                response.sendRedirect("medicalStaffNurse.jsp");
            }
            else if(isUpdate && user.equals("DOCTOR"))
            {
                response.sendRedirect("medicalStaffDoctor.jsp");
            }
            else if(isUpdate && user.equals("SYSTEM ADMINISTRATOR"))
            {
                response.sendRedirect("adminAppointment.jsp");
            }
            else
            {
            }
%>