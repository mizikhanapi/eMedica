<%-- 
    Document   : login_process
    Created on : Mar 28, 2016, 10:46:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    
    String username = request.getParameter("userID");
    String password = request.getParameter("password");
    
    
    String sql2 = "SELECT * FROM adm_user WHERE USER_ID = '"+username+"' ";
    ArrayList<ArrayList<String>> dataStaff = Conn.getData(sql2);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
    
    
    if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
        for(int i=0; i<dataStaff.size(); i++)
        {          
            if(dataStaff.get(i).get(4).equals("DOCTOR"))                            //doctor
            {   
                if(dataStaff.get(i).get(2).equals(password))
                {
                    session.setAttribute("username", username);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                    String name = dataStaff.get(0).get(3) ;
                    session.setAttribute("USER_NAME", name);
                    String title = dataStaff.get(0).get(4) ;
                    session.setAttribute("OCCUPATION_CODE", title);
                    out.print(LOGIN);
                    return;
                    //response.sendRedirect("facility.jsp");
                }
                else
                {
                   out.print(WRONG_PASSWORD);
                   return;
                }
            }
            else if(dataStaff.get(i).get(4).equals("SYSTEM ADMINISTRATOR"))         //admin
            {
                if(dataStaff.get(i).get(2).equals(password))
                {
                    session.setAttribute("username", username);
                    String name = dataStaff.get(0).get(3) ;
                    session.setAttribute("USER_NAME", name);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
    //                session.setAttribute("newSession", "success");
                    //response.sendRedirect("facility.jsp");  
                    out.print(LOGIN);
                    return;
                }
                else
                {
                   out.print(WRONG_PASSWORD);
                   return;
                }
                
            }
            else                                                                    //nurse
            {
                if(dataStaff.get(i).get(2).equals(password))
                {
                    session.setAttribute("username", username);
                    String name = dataStaff.get(0).get(3) ;
                    session.setAttribute("USER_NAME", name);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                    String title = dataStaff.get(0).get(4) ;
                    session.setAttribute("OCCUPATION_CODE", title);
                    //response.sendRedirect("facility.jsp");
                    out.print(LOGIN);
                    return;
                }
                else
                {
                   out.print(WRONG_PASSWORD);
                   return;
                }
            }
        }
    }
    else
    {
        out.print(NO_USER);
        return;
    }
%>
