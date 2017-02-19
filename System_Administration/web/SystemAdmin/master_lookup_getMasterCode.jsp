<%-- 
    Document   : master_lookup_getMasterCode
    Created on : Feb 13, 2017, 11:21:26 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn  = new Conn();
    
    String sql = "SELECT MAX(master_reference_code) FROM adm_lookup_master LIMIT 1";
    
    ArrayList<ArrayList<String>> data = conn.getData(sql);
    
    String strNum = data.get(0).get(0);
    
    int intNum = Integer.parseInt(strNum);
    
    intNum = intNum + 1;
    
    if(intNum < 10){
        strNum = "000" + intNum;
        
    }else if(intNum < 100){
        strNum = "00" + intNum;
        
    }else if(intNum < 1000){
        strNum = "0" + intNum;
        
    }else{
        strNum = Integer.toString(intNum);
    }
    
    out.print(strNum);
    
    
    

%>
