<%-- 
    Document   : master_lookup_update
    Created on : Jan 25, 2017, 6:35:07 PM
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
    
    String disciplineCode = request.getParameter("disciplineCode");
    String disciplineName = request.getParameter("disciplineName");
    String groupCode = request.getParameter("groupCode");
    String categoryCode = request.getParameter("categoryCode");
    String specialtyCode = request.getParameter("specialtyCode");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_discipline SET discipline_name = '"+disciplineName+"', discipline_group_cd = '"+groupCode+"', discipline_category_cd = '"+categoryCode+"', discipline_specialty_cd = '"+specialtyCode+"', discipline_status = '"+status+"'"+
                        " WHERE discipline_cd = '"+disciplineCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>

