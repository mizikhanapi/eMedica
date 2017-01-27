<%-- 
    Document   : updateLeaveNotApprove
    Created on : May 6, 2016, 1:28:29 AM
    Author     : user
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
    String hfcCode = request.getParameter("hfcCode");
    String userId = request.getParameter("userId");
    String leaveDate = request.getParameter("leaveDate");
    String username = (String)session.getAttribute("username");
    
//    String sqlCheckAdmin = "SELECT * FROM adm_user WHERE USER_ID = '"+e23+"' AND OCCUPATION_CODE = 'SYSTEM ADMINISTRATOR'";
//    ArrayList<ArrayList<String>> dataCheckAdmin  = Conn.getData(sqlCheckAdmin);
    
//    out.print(sqlCheckAdmin);
    
    
    if(userId.equals(username))
    {//You are not allow to disapprove leave for yourself as you are admin. Please ask other admin to do so
      out.print("notallow");
    }
    else
    {
        if(hfcCode.equals(hfcCode) && userId.equals(userId) && leaveDate.equals(leaveDate))
        {
            RMIConnector rmic = new RMIConnector();
            String sqlUpdate = "UPDATE pms_staff_leave "
                    + "SET status = 'not approve', approved_by = '" + username + "', approved_date = now() "
                    + "WHERE user_id='" + userId + "' AND hfc_cd='" + hfcCode + "' AND start_leave_date='" + leaveDate + "'";

            boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);


            if(isUpdate)
            {//Successfully disapproved this staff leave application
               out.print("success");
            }
        }
        else
        {//data not exist
          out.print("nodata");
        }
    }

%>
