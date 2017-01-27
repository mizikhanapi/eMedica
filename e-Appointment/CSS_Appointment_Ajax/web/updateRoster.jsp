<%-- 
    Document   : updateRoster
    Created on : May 4, 2016, 11:27:07 AM
    Author     : Asyraf
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
    Conn Conn = new Conn();
    String staffID = request.getParameter("staffID");
    String roster_category = request.getParameter("roster_category");
    String startDate = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    String start_time = request.getParameter("start_time");
    String end_time = request.getParameter("end_time");
    String status = request.getParameter("status");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String staffIDBefore = request.getParameter("userIDBefore");
    String startDateBefore = request.getParameter("startDateBefore");
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
    
    
    String sqlCheckExistRoster = "SELECT * FROM pms_duty_roster WHERE hfc_cd = '"+hfc+"' AND user_id = '"+staffID+"' and DATE(start_date) = '"+startDate+"'";
    ArrayList<ArrayList<String>> datasqlCheckExistRoster = Conn.getData(sqlCheckExistRoster); 
    

    if(datasqlCheckExistRoster.size() == 0)
    {
        %>
            <script language='javascript'>
                window.location= 'adminAppointment.jsp?error=Update roster fail due to the roster data does not exist';
            </script> 
        <%
    }
    else
    {
        RMIConnector rmic = new RMIConnector();
        String sqlUpdateCliniDay = "UPDATE pms_duty_roster "
                + "SET hfc_cd='" + hfc + "',user_id='" + staffID + "',start_date='" + startDate + "',discipline_cd='" + dataDiscipline + "',subdiscipline_cd='" + dataSubdiscipline + "' ,roster_category='" + roster_category + "',end_date='" + end_date + "',start_time='" + startDateTime + "',end_time='" + endDateTime + "' ,shift_cd=' - ' ,location_cd=' - ' ,ward_cd=' - ' ,remarks=' - ' ,status='" + status + "' ,state_code='" + status + "', created_by='" + username + "', created_date= now()  "
                + "WHERE hfc_cd='" + hfc + "' AND user_id='" + staffIDBefore + "' AND start_date='" + startDateBefore + "'";

        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdateCliniDay);

        if (isInsert) 
        { %>
            <script language='javascript'>
                alert('Update roster successful'); 
                window.location= 'adminAppointment.jsp?e14=<%=staffID%>&e15=<%=hfc%>&e16=<%=roster_category%>&e17=<%=startDate%>&e18=<%=end_date%>&e19=<%=start_time%>&e20=<%=end_time%>&e21=<%=status%>';
            </script> 
        <%}
         else
        {
            %><script language='javascript'>
                window.location= 'adminAppointment.jsp?error=Update roster fail due to data may exist';
            </script> <%
        }
    }
      
   %>
