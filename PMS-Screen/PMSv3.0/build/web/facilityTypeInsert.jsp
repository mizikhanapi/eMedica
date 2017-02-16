<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String wclass, wtypeid, wstatus;
    wclass =request.getParameter("WardClass");
    wtypeid = request.getParameter("WardTypeID");
    wstatus = request.getParameter("status");
//    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
//    Date dateobj = new Date();
//    df.format(dateobj);
    String createdby = "Izzlyn Izzaty";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
    String sqlInsert = "INSERT INTO wis_ward_class(ward_class_code,ward_class_name,ward_class_status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('" + wclass + "','" + wtypeid + "','" + wstatus + "','25','52','1','" + createdby + "','0000-00-00')";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print(sqlInsert);
    }

%>