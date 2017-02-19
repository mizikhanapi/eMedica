<%-- 
    Document   : login_process
    Created on : Mar 28, 2016, 10:46:43 PM
    Author     : user
--%>


<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    int status = 0;
    
    Conn conn = new Conn();
    
    String user_id = request.getParameter("userID");
    String password = request.getParameter("password");
      
    
    
    String sql2 = "SELECT a.*,b.* FROM adm_user a inner join adm_user_access_role b on b.user_id = a.user_id WHERE USER_ID = '"+user_id+"' ";
    String sql3 = "select a.*,b.* from adm_user a JOIN adm_user_access_role b ON b.`USER_ID` = a.`USER_ID` COLLATE latin1_swedish_ci where a.`USER_ID`='"+user_id+"' ;";
    ArrayList<ArrayList<String>> dataStaff = conn.getData(sql3);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
    
    
    if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
        for(int i=0; i<dataStaff.size(); i++)
        {    
            
            if(dataStaff.get(i).get(2).equals(password))
            {
                session.setAttribute("USER_ID", user_id);
                String hfc = dataStaff.get(0).get(1) ;
                session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                String name = dataStaff.get(0).get(3) ;
                session.setAttribute("USER_NAME", name);
                String title = dataStaff.get(0).get(4) ;
                session.setAttribute("OCCUPATION_CODE", title);
                String dis = dataStaff.get(0).get(22) ;
                session.setAttribute("DISCIPLINE_CODE", dis);
                String sub = dataStaff.get(0).get(23) ;
                session.setAttribute("SUB_DISCIPLINE_CODE", sub);
                

                status = LOGIN;
                //response.sendRedirect("facility.jsp");
            }
            else
            {
               status = WRONG_PASSWORD;
            }
            
           
        }
    }
    else
    {
       status = NO_USER;
    }
    
    out.print(status);
    
%>

<%--<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    int status = 0;
    
    Conn conn = new Conn();
    
    String user_id = request.getParameter("userID");
    String password = request.getParameter("password");
      
    
    
    String sql2 = "SELECT * FROM adm_user WHERE USER_ID = '"+user_id+"' ";
    ArrayList<ArrayList<String>> dataStaff = conn.getData(sql2);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
    
    
    if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
        for(int i=0; i<dataStaff.size(); i++)
        {    
            
            if(dataStaff.get(i).get(2).equals(password))
            {
                session.setAttribute("USER_ID", user_id);
                String hfc = dataStaff.get(0).get(1) ;
                session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                String name = dataStaff.get(0).get(3) ;
                session.setAttribute("USER_NAME", name);
                String title = dataStaff.get(0).get(4) ;
                session.setAttribute("OCCUPATION_CODE", title);

                status = LOGIN;
                //response.sendRedirect("facility.jsp");
            }
            else
            {
               status = WRONG_PASSWORD;
            }
            
           
        }
    }
    else
    {
       status = NO_USER;
    }
    
    out.print(status);
    
%>--%>
