<%-- 
    Document   : user_insert
    Created on : Feb 17, 2017, 8:35:31 PM
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
    String creator = session.getAttribute("USER_ID").toString();
    String name  = request.getParameter("name");
    String title  = request.getParameter("title");
    String icNo  = request.getParameter("icNo");
    String email  = request.getParameter("email");
    String userID  = request.getParameter("userID");
    String hfc  = request.getParameter("hfc");
    String password  = request.getParameter("password");
    String dob  = request.getParameter("dob");
    String gender  = request.getParameter("gender");
    String occupation  = request.getParameter("occupation");
    String nationality  = request.getParameter("nationality");
    String officeTel  = request.getParameter("officeTel");
    String homeTel  = request.getParameter("homeTel");
    String mobilePhone  = request.getParameter("mobilePhone");
    String faxNo  = request.getParameter("faxNo ");
    String userIDCategory  = request.getParameter("userIDCategory");
    String userType  = request.getParameter("userType");
    String userGroup  = request.getParameter("userGroup");
    String userClass  = request.getParameter("userClass");
    String startDate  = request.getParameter("startDate");
    String endDate  = request.getParameter("endDate");
    String userIDStatus  = request.getParameter("userIDStatus");
    
    
    
    String sqlCheck = "SELECT user_id from adm_users WHERE user_id = '"+userID+"' limit 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
     RMIConnector rmic = new RMIConnector();
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the User ID '"+userID+"' is already used. Please enter different ID.");
    }
    else {
        
        dob = DateFormatter.formatDate(dob, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        startDate = DateFormatter.formatDate(startDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
        endDate = DateFormatter.formatDate(endDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    
        String sqlInsert = "INSERT INTO adm_users (user_id, health_facility_code, user_name, password, occupation_code, birth_date, sex_code, new_icno, home_phone, office_phone, mobile_phone, fax_no, email, id_category_code, start_date, end_date, title, nationality_code, user_type, user_group, user_classification_code, status, created_by, created_date) "+
                            "VALUES('"+userID+"', '"+hfc+"', '"+name+"', '"+password+"', '"+occupation+"', '"+dob+"', '"+gender+"', '"+icNo+"', '"+homeTel+"', '"+officeTel+"', '"+mobilePhone+"', '"+faxNo+"', '"+email+"', '"+userIDCategory +"', '"+startDate +"', '"+endDate +"', '"+title +"', '"+nationality+"', '"+userType+"', '"+userGroup+"', '"+userClass+"', '"+userIDStatus+"', '"+creator+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    
    
    
    }
%>
