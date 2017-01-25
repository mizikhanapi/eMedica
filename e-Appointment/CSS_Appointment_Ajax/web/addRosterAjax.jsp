<%-- 
    Document   : addRoster
    Created on : Apr 6, 2016, 10:41:42 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String staffID = request.getParameter("staffIDRoster");
    String roster_category = request.getParameter("roster_category");
    String startDate = request.getParameter("startDateRoster");
    String end_date = request.getParameter("endDateRoster");
    String start_time = request.getParameter("startTimeRoster");
    String end_time = request.getParameter("endTimeRoster");
    String status = request.getParameter("statusRoster");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String username = (String)session.getAttribute("username");
     
    String startDateTime = startDate +  " " + start_time;
    String endDateTime = end_date +  " " + end_time;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Date d1 = df.parse(startDate);
    
    //Choosen date/day
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
    String chosenDayDate = sdf.format(d1);
//    out.print(chosenDayDate);

                            

    String sqlgetHoliday1 = "SELECT Detail_Ref_code from lookup_detail WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataGetHFC = Conn.getData(sqlgetHoliday1);
    String dataHFC = dataGetHFC.get(0).get(0);
                                
    String sqlgetHoliday2 = "SELECT state_code, day_cd, discipline_cd, subdiscipline_cd, hfc_cd FROM pms_clinic_day WHERE hfc_cd = '"+dataHFC+"'";
    ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlgetHoliday2);
    String dataStates = dataGetStates.get(0).get(0);
    String dataDiscipline = dataGetStates.get(0).get(2);
    String dataSubdiscipline = dataGetStates.get(0).get(3);

    String sqlCheckActiveRoster = "SELECT * FROM pms_duty_roster WHERE user_id = '"+staffID+"' And status = 'active'";
    ArrayList<ArrayList<String>> dataCheckActiveRoster = Conn.getData(sqlCheckActiveRoster);  
    if(dataCheckActiveRoster.size() > 0)
    {
        //Fail to add staff roster due to the roster period still active
        out.print("fail");
    }
    else
    {
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "INSERT INTO pms_duty_roster (hfc_cd, user_id,start_date, discipline_cd, subdiscipline_cd, roster_category, end_date, start_time, end_time, shift_cd, location_cd, ward_cd, remarks, status, state_code, created_by, created_date) "
                     + "VALUES ('" + hfc + "' , '" + staffID + "','" + startDate + "','" + dataDiscipline + "','" + dataSubdiscipline + "','"+roster_category+"','"+end_date+"','"+startDateTime+"','"+endDateTime+"','-','-','-','-','active','"+dataStates+"', '" + username + "', now())";

        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
        if (isInsert) 
        { 
            out.print("success");
        }
    }
     

   %>