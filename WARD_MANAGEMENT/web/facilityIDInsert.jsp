<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String wclass, wid, wdiscipline, wwardname, wcitizenrates, wcitizendeposit, wcitizendiscount, wnoncitizenrates, wnoncitizendeposit,
            wnoncitizendiscount, wpensionerdeposit,wpensionerdiscount, wpensionerrates,wnobed, wbathroom, wtoilet, wtelevision, wtelephone, wstatus;
    
    wclass = request.getParameter("WardClass");
    wid = request.getParameter("WardID");
    wdiscipline = request.getParameter("Discipline");
    wwardname = request.getParameter("WardName");
    wcitizenrates = request.getParameter("CitizenRates");
    wcitizendeposit = request.getParameter("CitizenDeposit");
    wcitizendiscount = request.getParameter("CitizenDiscount");
    wnoncitizenrates = request.getParameter("NonCitizenRates");
    wnoncitizendeposit = request.getParameter("NonCitizenDeposit");
    wnoncitizendiscount = request.getParameter("NonCitizenDiscount");
    wpensionerrates = request.getParameter("PensionerDeposit");
    wpensionerdiscount = request.getParameter("PensionerDeposit");
    wpensionerdeposit = request.getParameter("PensionerDeposit");
    wnobed = request.getParameter("NoOfBed");
    wbathroom = request.getParameter("bathroom");
    wtoilet = request.getParameter("toilet");
    wtelevision = request.getParameter("televison");
    wtelephone = request.getParameter("telephone");
    wstatus = request.getParameter("status");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    String createdby = "Izzlyn Izzaty";

    String sqlInsert = "INSERT INTO wis_ward_name (ward_class_code, hfc_cd, ward_id, discipline_cd, ward_name, subdiscipline_cd,"
            + "citizen_room_cost, citizen_deposit, citizen_discount,non_citizen_room_cost,non_citizen_deposit, non_citizen_discount, pensioner_deposit, pensioner_room_cost, pensioner_discount, "
            + "no_of_bed, attach_bathroom_tiolet,attach_toilet, include_television, include_telephone, ward_status, created_by, created_date) "
            + "VALUES ('" + wclass + "','1','" + wid + "','" + wdiscipline + "','" + wwardname + "','a',"
            + "'" + wcitizenrates + "','" + wcitizendeposit + "','" + wcitizendiscount + "','" + wnoncitizenrates + "','" + wnoncitizendeposit + "','" + wnoncitizendiscount + "','" + wpensionerdeposit + "','" + wpensionerrates + "','" + wpensionerdiscount + "',"
            + "'" + wnobed + "','" + wbathroom + "','" + wtoilet + "','" + wtelevision + "','" + wtelephone + "','" + wstatus + "','" + createdby + "', now())";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>