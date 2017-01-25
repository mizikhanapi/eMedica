<%-- 
    Document   : addLeave
    Created on : May 5, 2016, 4:54:15 PM
    Author     : Asyraf
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%
        String staffName = request.getParameter("staffName");
        String startLeave= request.getParameter("startDate");
        String endLeave = request.getParameter("endDate"); 
        String leaveReason = request.getParameter("desc");
        String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");

        String sqlAdminName = "SELECT USER_ID from adm_user WHERE USER_NAME = '"+staffName+"' ";
        ArrayList<ArrayList<String>> dataAdminID = Conn.getData(sqlAdminName);
        
        //out.print(sqlAdminName);
        String staffID = dataAdminID.get(0).get(0);

        
        String sqlGetHFCCode = "SELECT Detail_Ref_code from lookup_detail WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"' ";
        ArrayList<ArrayList<String>> dataGetHFCCode = Conn.getData(sqlGetHFCCode);
        String dataHFCCode = dataGetHFCCode.get(0).get(0);
        //out.print(sqlGetHFCCode);
        
        String sqlgetHoliday2 = "SELECT day_cd, discipline_cd, subdiscipline_cd, hfc_cd FROM pms_clinic_day WHERE hfc_cd = '"+dataHFCCode+"' ";
        ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlgetHoliday2);
        String dataDiscipline = dataGetStates.get(0).get(1);
        String dataSubdiscipline = dataGetStates.get(0).get(2);
        //out.print(sqlgetHoliday2);
        
        String sqlStaffID = "SELECT USER_ID, USER_NAME FROM adm_user WHERE USER_ID = '"+staffID+"' ";
        ArrayList<ArrayList<String>> dataGetStaffID = Conn.getData(sqlStaffID);
        String dataStaffID = dataGetStaffID.get(0).get(0);
        //out.print(sqlStaffID);
        
        String sqlLatestPreviousEndDate = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataStaffID+"' AND status = 'approve' "
                + "ORDER BY end_leave_date DESC ";
        ArrayList<ArrayList<String>> dataLatestPreviousEndDate  = Conn.getData(sqlLatestPreviousEndDate);
        
        String dataLatestEndDate;
        
        //out.print(sqlLatestPreviousEndDate);
        
        if(dataLatestPreviousEndDate.size() > 0)
        {
            dataLatestEndDate = dataLatestPreviousEndDate.get(0).get(2);
        }
        else
        {
            dataLatestEndDate = null;
        }
        
               // out.print(dataLatestEndDate);

        String sqlCheckProcessStatus = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataStaffID+"' AND status = 'process'";
        ArrayList<ArrayList<String>> dataProcessStatus  = Conn.getData(sqlCheckProcessStatus);

        String sql2 = "select user_id, status from pms_staff_leave WHERE user_id = '"+dataStaffID+"'  AND '"+startLeave+"' <= '"+dataLatestEndDate+"'";
        ArrayList<ArrayList<String>> dataGetStatus = Conn.getData(sql2);

          // out.print(sql2);
        if(dataProcessStatus.size() > 0)
        {
            out.print("process");
        }
         else
        {
            RMIConnector rmic = new RMIConnector();
            String sqlInsert = "INSERT INTO pms_staff_leave (user_id, hfc_cd, start_leave_date, discipline_cd, subdiscipline_cd, end_leave_date, leave_type, leave_reason, status, applied_by, applied_date, approved_by, approved_date) "
                        + "VALUES ('"+dataStaffID+"','"+dataHFCCode+"','"+startLeave+"','"+dataDiscipline+"','"+dataSubdiscipline+"','"+endLeave+"','-','"+leaveReason+"','process','"+dataStaffID+"',now(),'-','0000-00-00')";

            boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);

            if (isInsert) 
            {
               out.print("success");
            } 

        }
     
%>

