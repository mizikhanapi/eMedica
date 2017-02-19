<%-- 
    Document   : healthFacility_update
    Created on : Feb 10, 2017, 10:56:35 AM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    Conn conn = new Conn();
    String hfcName = request.getParameter("hfcName");
    String hfcCode = request.getParameter("hfcCode");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String address3 = request.getParameter("address3");
    String state = request.getParameter("state");
    String district = request.getParameter("district");
    String town = request.getParameter("town");
    String postcode = request.getParameter("postcode");
    String faxNo = request.getParameter("faxNo");
    String telNo = request.getParameter("telNo");
    String email = request.getParameter("email");
    String contactPerson = request.getParameter("contactPerson");
    String ipNo = request.getParameter("IP_NO");
    String server = request.getParameter("server");
    String category = request.getParameter("category");
    String reportTo = request.getParameter("reportTo");
    String type = request.getParameter("type");
    String subtype = request.getParameter("subtype");
    String director = request.getParameter("director");
    String status = request.getParameter("status");
    String establishDate = request.getParameter("establishDate");
    
         
    RMIConnector rmic = new RMIConnector();
    
    if(!establishDate.equalsIgnoreCase("")){
       
        establishDate = DateFormatter.formatDate(establishDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        
        String sqlInsert = "UPDATE adm_health_facility SET hfc_type='"+type+"', hfc_name='"+hfcName+"', address1='"+address1+"', address2='"+address2+"', address3='"+address3+"', state_cd='"+state+"', district_cd='"+district+"',"
                + " town_cd='"+town+"', country_cd='001', postcode='"+postcode+"', telephone_no='"+telNo+"', fax_no='"+faxNo+"', email='"+email+"', hfc_server='"+server+"', hfc_report='"+reportTo+"', established_date='"+establishDate+"',"
                + " director_name='"+director+"', hfc_category_cd='"+category+"', hfc_sub_type='"+subtype+"', contact_person='"+contactPerson+"', hfc_status='"+status+"', hfc_ip='"+ipNo+"' "
                + "WHERE hfc_cd = '"+hfcCode+"'";
        
        
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }
    else if(establishDate.equalsIgnoreCase("")){
    
        String sqlInsert = "UPDATE adm_health_facility SET hfc_type='"+type+"', hfc_name='"+hfcName+"', address1='"+address1+"', address2='"+address2+"', address3='"+address3+"', state_cd='"+state+"', district_cd='"+district+"',"
                + " town_cd='"+town+"', country_cd='001', postcode='"+postcode+"', telephone_no='"+telNo+"', fax_no='"+faxNo+"', email='"+email+"', hfc_server='"+server+"', hfc_report='"+reportTo+"',"
                + " director_name='"+director+"', hfc_category_cd='"+category+"', hfc_sub_type='"+subtype+"', contact_person='"+contactPerson+"', hfc_status='"+status+"', hfc_ip='"+ipNo+"' "
                + "WHERE hfc_cd = '"+hfcCode+"'";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    
    
    
    }
%>
