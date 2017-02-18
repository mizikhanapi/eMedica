<%-- 
    Document   : manageParameter
    Created on : Dec 29, 2016, 2:38:51 AM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String action = request.getParameter("action");
   String paraCode = request.getParameter("paraCode");
   
   if (action.equalsIgnoreCase("add") || action.equalsIgnoreCase("update")){
       String paraName = request.getParameter("paraName");
       String value = request.getParameter("value");
       String enable = request.getParameter("enable");
       
        String query = "";
        if (action.equalsIgnoreCase("add")){
            query = 
                "INSERT INTO far_billing_parameter(param_code,"
                    + " param_name, param_value, enable) "
                    + "VALUES('"+ paraCode +"', '"+ paraName +"',"
                    + " '"+ value +"', '"+ enable +"')";
        } else if (action.equalsIgnoreCase("update")) {        
            query = 
                "UPDATE far_billing_parameter "
                    + "SET param_code = '"+ paraCode +"', param_name = '"+ paraName +"',"
                    + " param_value = '"+ value +"', enable = '"+ enable +"' "
                    + "WHERE param_code = '"+ paraCode +"'";           
        }
        
        if (Conn.setData(query)){
            out.print("-|1");
            return;
        } else {
            out.print("-|-1");
            return;
        }
        
   } else if (action.equalsIgnoreCase("delete")){
        if(paraCode.equals("BP001") || paraCode.equals("BP002") || paraCode.equals("BP003")){
            out.print("-|Failed.\nDefault item cannot be delete.");
            return;
        } else {
            String query = "DELETE FROM far_billing_parameter "
                                        + "WHERE param_code = '"+ paraCode +"'";
            
            if (Conn.setData(query)){
                out.print("-|1");
                return;
            } else {
                out.print("-|-1");
                return;
            }
        }
    }
%>

