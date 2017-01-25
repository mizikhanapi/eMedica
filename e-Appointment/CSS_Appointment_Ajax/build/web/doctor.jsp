<%-- 
    Document   : doctor
    Created on : Apr 2, 2016, 8:08:42 PM
    Author     : Asyraf
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!DOCTYPE html>
<html>
    <title>Doctor Page</title>
    <%@include file="header.jsp"%>
    <body>
        <%
            String username = (String)session.getAttribute("username");
            
//            String sql = " SELECT adUser.* FROM adm_user adUser WHERE adUser.USER_ID = '"+username+"' ";
//            ArrayList<ArrayList<String>> dataStaff = Conn.getData(sql);
//            
//            if(dataStaff.size() > 0)
//            {
//                for(int i=0; i<dataStaff.size(); i++)
//                {
//                    String user_name = dataStaff.get(i).get(3);
//                    session.setAttribute("USER_NAME", user_name);
//                    
//                    
//                    String occupation_code = dataStaff.get(i).get(4);
//                    String birth_date = dataStaff.get(i).get(5);
//
//                    
//                    out.print("| " + user_name + " | ");
//                    out.print("| " + occupation_code + " | ");
//                    out.print("| " + birth_date + " | ");
//                    
//                    if((username == null) || (username == ""))
//                    {
//                        out.print("no data");
//                    }
//                    else
//                    {
//                        out.print(" have data | ");
//                    }
//                }
//            }
//            else
//            {
//                out.print("no data");
//            }
        %>

                <%=username%>
    </body>
</html>
