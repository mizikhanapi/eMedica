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
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    String sql1 ="SELECT st.* "
            + "FROM adm_signup_tbl st "
            + "WHERE st.username = '"+username+"' ";
    ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql1);
    
//    out.print(sql1); if (true) { return; };
 
    String sql2 = "SELECT adUser.* "
            + "FROM adm_user adUser "                                              
            + "WHERE adUser.USER_ID= '" + username + "'";
    ArrayList<ArrayList<String>> dataStaff = Conn.getData(sql2);

    
    if(dataPatient.size() > 0)                                                      //login patient
    { 
        for(int index=0; index<dataPatient.size(); index++)
        {
            if(dataPatient.get(index).get(2).equals(password))
            {
                session.setAttribute("username", username);
                String ic = dataPatient.get(index).get(0) ;
                String val1 = dataPatient.get(index).get(1) ;
                String val2 = dataPatient.get(index).get(2) ;
                String val3 = dataPatient.get(index).get(3) ;
                String val4 = dataPatient.get(index).get(4) ;
                session.setAttribute("ic", ic);
                session.setAttribute("val1", val1);
                session.setAttribute("val2", val2);
                session.setAttribute("val3", val3);
                session.setAttribute("val4", val4);

                response.sendRedirect("patientSelectHFC.jsp");
            }
            else
            {
                %><script language='javascript'>
                    alert("The password you have entered is incorrect");
                    window.location= 'login.jsp';
                </script> <%
            }
        }
        
    }
    else if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
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
                    response.sendRedirect("medicalStaffDoctor.jsp");
                }
                else
                {
                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                }
            }
            else if(dataStaff.get(i).get(4).equals("SYSTEM ADMINISTRATOR"))         //admin
            {
                if(dataStaff.get(i).get(2).equals(password))
                {
                    session.setAttribute("username", username);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
    //                session.setAttribute("newSession", "success");
                    response.sendRedirect("adminAppointment.jsp");          
                }
                else
                {
                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
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
                    response.sendRedirect("medicalStaffNurse.jsp");
                }
                else
                {
                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                }
            }
        }
    }
    else
    {%>
        <script language='javascript'>
            alert("Your account does not exist. Please register or contact your admin");
            window.location= 'login.jsp';
        </script> <%
    }
%>
