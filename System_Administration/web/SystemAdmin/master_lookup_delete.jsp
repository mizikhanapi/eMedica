<%-- 
    Document   : master_lookup_delete
    Created on : Jan 25, 2017, 6:27:52 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();

    String id = request.getParameter("masterCode");

    RMIConnector rmic = new RMIConnector();
    
    String sqlSelect = "Select master_reference_code from adm_lookup_detail where master_reference_code = '"+id+"' LIMIT 1 ";
    
    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlSelect);
    
    if(dataUse.size() > 0){
    
        out.print("You can't delete this item because it is referrenced by lookup detail.");
        
    }else{
    
        String sql = "DELETE FROM adm_lookup_master WHERE master_reference_code = '" + id + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
        
    }
    
    
%>
