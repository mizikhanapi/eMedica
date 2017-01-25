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
       String state_code = request.getParameter("state");
        String hfc_code = request.getParameter("hfcCode");
        String discipline = request.getParameter("discipline");
        String subdiscipline = request.getParameter("subdiscipline");
        String day = request.getParameter("clinicDay");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String status = request.getParameter("status");
        String hfcBefore = request.getParameter("hfcBefore");
        String disciplineBefore = request.getParameter("disciplineBefore"); 
        String subdisciplineBefore = request.getParameter("subdisciplineBefore"); 
        String dayBefore = request.getParameter("daybefore");
        String username = (String)session.getAttribute("username");

        
        String sqlGetClinic = "SELECT * FROM lookup_detail  WHERE `Description`='"+hfcBefore+"'";
        ArrayList<ArrayList<String>>getClinic = Conn.getData(sqlGetClinic);
       hfcBefore = getClinic.get(0).get(1);
       
        String sqlGetDis = "SELECT * FROM lookup_detail  WHERE `Description`='"+disciplineBefore+"'";
        ArrayList<ArrayList<String>>getDis = Conn.getData(sqlGetDis);
       disciplineBefore = getDis.get(0).get(1);
       
        String sqlGetSub = "SELECT * FROM lookup_detail  WHERE `Description`='"+subdisciplineBefore+"'";
        ArrayList<ArrayList<String>>getSubDis = Conn.getData(sqlGetSub);
       subdisciplineBefore = getSubDis.get(0).get(1);
                
        
        String sqlDisplayClinic = "SELECT * FROM pms_clinic_day "
                + "WHERE hfc_cd='" + hfcBefore + "' AND discipline_cd='" + disciplineBefore + "' AND subdiscipline_cd='" + subdisciplineBefore + "' AND day_cd='" + dayBefore + "'";
        ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayClinic);
        
        if(data.size() == 0)
        {
            out.print("notData");
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
                out.print("success");
            } else 
            {
                out.print("sqlError");
            }
        }
        
      
       
%>
