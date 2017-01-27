<%-- 
    Document   : testRMI
    Created on : Jan 26, 2017, 7:32:34 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            RMIConnector rmic = new RMIConnector();
           
            //
            Conn conn = new Conn();
            out.print(conn.HOST + " : " + conn.PORT);
            String pmino = rmic.getPMI(conn.HOST, conn.PORT, "950607015242");
            out.print(pmino);
        %>
    </body>
</html>
