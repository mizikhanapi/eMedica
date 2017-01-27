<%-- 
    Document   : updateClinicDay
    Created on : Apr 6, 2016, 11:00:26 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%   
    Conn Conn = new Conn();
        String state_code = request.getParameter("state_code");
        String hfc_code = request.getParameter("hfc_code");
        String discipline = request.getParameter("discipline");
        String subdiscipline = request.getParameter("subdiscipline");
        String day = request.getParameter("day");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String status = request.getParameter("status");
        String hfcBefore = request.getParameter("hfcBefore");
        String disciplineBefore = request.getParameter("disciplineBefore"); 
        String subdisciplineBefore = request.getParameter("subdisciplineBefore"); 
        String dayBefore = request.getParameter("dayBefore");
        String username = (String)session.getAttribute("username");
                
        
        String sqlDisplayClinic = "SELECT * FROM pms_clinic_day "
                + "WHERE hfc_cd='" + hfc_code + "' AND discipline_cd='" + discipline + "' AND subdiscipline_cd='" + subdiscipline + "' AND day_cd='" + day + "'";
        ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayClinic);
        
        if(data.size() == 0)
        {
        %>
            <script language='javascript'>
                window.location= 'adminAppointment.jsp?error=Update clinic day fail due to the clinic day data does not exist';
            </script> 
        <%
        }
        else
        {
            RMIConnector rmic = new RMIConnector();
            String sqlInsert = "UPDATE pms_clinic_day "
                    + "SET state_code='" + state_code + "',hfc_cd='" + hfc_code + "',discipline_cd='" + discipline + "',subdiscipline_cd='" + subdiscipline + "',day_cd='" + day + "' ,start_time='" + starttime + "',end_time='" + endtime + "',status='" + status + "', created_by='" + username + "', created_date= now() "
                    + "WHERE hfc_cd='" + hfcBefore + "' AND discipline_cd='" + disciplineBefore + "' AND subdiscipline_cd='" + subdisciplineBefore + "' AND day_cd='" + dayBefore + "'";

            boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);


            if (isInsert) 
            {
                    %><script language='javascript'>
                        window.location= 'adminAppointment.jsp?error=Update clinic day succesful';
                    </script> <%
            } else 
            {
                response.sendRedirect("data x update");
            }
        }
        
      
       
%>
