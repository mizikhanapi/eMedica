<%-- 
    Document   : healthFacility_insert
    Created on : Feb 9, 2017, 4:19:34 PM
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
    
    
    String sqlCheck = "SELECT hfc_cd from adm_health_facility WHERE hfc_cd = '"+hfcCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
     RMIConnector rmic = new RMIConnector();
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the code is already used. Please enter different code.");
    }
    else if(!establishDate.equalsIgnoreCase("")){
       
        establishDate = DateFormatter.formatDate(establishDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        
        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, established_date, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip) "+
                            "VALUES('"+hfcCode+"', '"+type+"', '"+hfcName+"', '"+address1+"', '"+address2+"', '"+address3+"', '"+state+"', '"+district+"', '"+town+"', '001', '"+postcode+"', '"+telNo+"', '"+faxNo+"', '"+email+"', '"+server+"', '"+reportTo+"', '"+establishDate+"', '"+director+"', '"+category+"', '"+subtype+"', '"+contactPerson+"', '"+status+"', '"+ipNo+"')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }
    else if(establishDate.equalsIgnoreCase("")){
    
        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip) "+
                            "VALUES('"+hfcCode+"', '"+type+"', '"+hfcName+"', '"+address1+"', '"+address2+"', '"+address3+"', '"+state+"', '"+district+"', '"+town+"', '001', '"+postcode+"', '"+telNo+"', '"+faxNo+"', '"+email+"', '"+server+"', '"+reportTo+"', '"+director+"', '"+category+"', '"+subtype+"', '"+contactPerson+"', '"+status+"', '"+ipNo+"')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    
    
    
    }
%>