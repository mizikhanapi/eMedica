<%-- 
    Document   : insert_register
    Created on : Mar 21, 2016, 9:36:49 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    
            //Check The Existance of Data in DB.
            //out.print(data.size()); 
            //if (true) { return; }

        String ic_no = request.getParameter("ic_no");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile_no = request.getParameter("mobile_no");
//        String name = request.getParameter("name");
//        String birth_date = request.getParameter("birth_date");
//        String idtype = request.getParameter("idtype");
//        String idno = request.getParameter("idno");
//        String sex_code = request.getParameter("sex_code");
//        String mobile_no = request.getParameter("mobile_no");

        
        String sql = "SELECT PATIENT_NAME "
                + "FROM emedica.pms_patient_biodata "
                + "WHERE NEW_IC_NO = '" + ic_no + "'";
        ArrayList<ArrayList<String>> data = Conn.getData(sql);
        
//        out.print(sql);
//        out.print("|"+sql+"|");
//        if (true) { return; }
            
        if (data.size() > 0) 
        { 
            String sql1 = "SELECT st.ic_no "
                    + "FROM emedica.adm_signup_tbl st "
                    + "WHERE st.ic_no = '" + ic_no + "'";
            ArrayList<ArrayList<String>> data1 = Conn.getData(sql1);
            
            //already registered
            if (data1.size() > 0) 
            {%>
                <script>
                    alert("You already a registered user and just login into the system");  
                    window.location.href="login.jsp";
                </script>                
                <%    
            } 
            else 
            {
                String sql2 = "SELECT username, mobile_no, email "
                         + "FROM emedica.adm_signup_tbl";
                ArrayList<ArrayList<String>> data2 = Conn.getData(sql2);
                
                boolean uname = false;
                boolean mobile = false;
                boolean mail = false;
                boolean insert = true;

                for(int i=0; i<data2.size(); i++)
                {
                    if(data2.get(i).get(0).equals(username))
                    {
                        uname = true;
                        insert = false;
                    } 
                    else
                    {
                        if(data2.get(i).get(1).equals(mobile_no))
                        {
                            mobile = true;  
                            insert = false;
                        } 
                        else
                        {
                            if(data2.get(i).get(2).equals(email))
                            {
                                mail = true;   
                                insert = false;
                            } 
//                            else
//                            {
////                                insert = true;
//                            }
                        }
                    } 

                }

                if(insert)
                {
                    RMIConnector rmic = new RMIConnector();
                    String sqlInsertSgt = "INSERT INTO emedica.adm_signup_tbl (ic_no, username,password, email, mobile_no) "
                              + "VALUES ('" + ic_no + "' , '" + username + "','" + password + "','" + email + "','"+mobile_no+"')";

                    boolean isInsertSgt = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsertSgt);

                    String sqlInsertPb = "UPDATE emedica.pms_patient_biodata "
                            + "SET MOBILE_PHONE = '"+mobile_no+"', EMAIL_ADDRESS = '"+email+"' "
                            + "WHERE NEW_IC_NO = '"+ic_no+"'";

                    boolean isInsertPb = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsertPb);

                    if(isInsertSgt) 
                    {%>
                        <script>
                            alert("You have successfully register!!!");  
                            window.location.href="login.jsp";
                        </script>
                <% } 
                }
                else
                {
                    if(uname)
                    {
                        %><script language='javascript'>
                            alert("Register fail! Username has been used..");  
                            window.location.href="register.jsp";
                        </script> <% 
                    }
                    else if(mobile)
                    {
                        %><script language='javascript'>
                            alert("The mobile no has been registered. You have to used other mobile no");  
                            window.location.href="register.jsp";
                        </script> <%
                    }
                    else
                    {
                        %><script language='javascript'>
                            alert("The email has been registered. You have to used other email account");  
                            window.location.href="register.jsp";
                        </script> <%
                    }
                }

                
            }
        } 
        else   
        {%>
            <script>
                alert("You have to register yourself at the UTeM Clinic as First Registration!");  
                 window.history.back();
            </script>
       <% }
%>   


