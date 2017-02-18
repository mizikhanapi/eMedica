<%-- 
    Document   : manageMiscellaneous
    Created on : Jan 1, 2017, 1:36:08 AM
    Author     : Mike Ho
--%><%@page import="dbConn.Conn"%>


<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String action = request.getParameter("action");
   String itemCode = request.getParameter("itemCode");
   
    if (action.equalsIgnoreCase("add") || action.equalsIgnoreCase("update")){
        String itemName = request.getParameter("itemName");
        String sellPrice = request.getParameter("sellPrice");
        String buyPrice = request.getParameter("buyPrice");

        String query = "";
        if (action.equalsIgnoreCase("add")){
            query = 
                "INSERT into far_miscellaneous_item (item_code, item_desc, buying_price, selling_price)"
                    + "VALUES ('"+ itemCode +"','"+ itemName +"','"+ buyPrice +"','"+ sellPrice +"')";
        } else if (action.equalsIgnoreCase("update")) {        
            query = 
                "UPDATE far_miscellaneous_item "
                    + "SET item_desc = '"+ itemName +"', buying_price = '"+ buyPrice +"', selling_price = '"+ sellPrice +"' "
                    + "WHERE item_code = '" + itemCode + "'";         
        }
        
        if (Conn.setData(query)){
            out.print("-|1");
            return;
        } else {
            out.print("-|-1");
            return;
        }
             
    } else if (action.equalsIgnoreCase("delete")){
        
        if (itemCode.equals("RG00001") || itemCode.equals("RG00002") || itemCode.equals("RG00003")){
            out.print("-|Failed.\nDefault item cannot be delete.");
            return;
        } else {
            String query = "DELETE FROM far_miscellaneous_item "
                                    + "WHERE item_code='" + itemCode + "'";
            
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