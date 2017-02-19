
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    
    String wclass, wid, wdiscipline, wwardname, wcitizenrates, wcitizendeposit, wcitizendiscount, wnoncitizenrates, wnoncitizendeposit,
            wnoncitizendiscount, wpensionerdeposit, wpensionerrates, wpensionerdiscount, wnobed, wbathroom, wtoilet, wtelevision, wtelephone, wstatus;
    
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
    wpensionerdeposit = request.getParameter("PensionerDeposit");
    wpensionerdiscount = request.getParameter("PensionerDiscount");
    wpensionerrates = request.getParameter("PensionerRates");
    wnobed = request.getParameter("NoOfBed");
    wbathroom = request.getParameter("bathroom");
    wtoilet = request.getParameter("toilet");
    wtelevision = request.getParameter("televison");
    wtelephone = request.getParameter("telephone");
    wstatus = request.getParameter("status");
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_ward_name SET ward_class_code = '" + wclass + "',ward_id = '" + wid + "',ward_name = '" + wwardname + "',citizen_room_cost = '" + wcitizenrates + "', citizen_deposit = '" + wcitizendeposit + "',"
            + "citizen_discount = '" + wcitizendiscount + "', non_citizen_room_cost = '" + wnoncitizenrates + "', non_citizen_deposit = '" + wnoncitizendeposit + "', non_citizen_discount = '" + wnoncitizendiscount + "',"
            + " pensioner_deposit = '" + wpensionerdeposit + "',pensioner_discount = '" + wpensionerdiscount + "', pensioner_room_cost = '" + wpensionerrates + "',"
            + "no_of_bed = '" + wnobed + "', attach_bathroom_tiolet = '" + wbathroom + "',attach_toilet = '" + wtoilet + "',include_television = '" + wtelevision + "',include_telephone = '" + wtelephone + "',"
            + "ward_status = '" + wstatus + "',discipline_cd = '" + wdiscipline + "' WHERE ward_class_code = '" + wclass + "' ";

         
            
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>