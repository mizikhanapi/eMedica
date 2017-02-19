<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            table.myTable { border-collapse:collapse; }
            table.myTable td, table.myTable th { border:1px solid black;padding:5px; }
        </style>

    </head>
    <body>

        <%
            String exportToExcel = request.getParameter("exportToExcel");
            if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-Disposition", "inline; filename=" + "Clinical_Audit_Report.xls");
            }
        %>
        <div id="MyExportTable">
            <table class="myTable">

                <%
                    Connection conn = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica", "root", "qwerty");
                    ResultSetMetaData rsmd;
                    ResultSet rs1 = null;
                    ResultSet rsnew = null;
                    PreparedStatement ps1 = null;
                    String st = "select * from pis_atc";
                    try {%>
                <tr><%
                    ps1 = conn.prepareStatement(st);
                    rsnew = ps1.executeQuery();
                    rs1 = rsnew;
                    rsmd = rs1.getMetaData();
                    int cou = rsmd.getColumnCount();
                    for (int i = 1; i <= cou; i++) {
                    %>

                    <td><b>
                            <%=rsmd.getColumnName(i)%>
                            <%
                                }
                            %> </td></tr>
                        <%
                            while (rs1.next()) {
                        %>
                <tr>
                    <td><%= rs1.getString(1)%></td>
                    <td><%= rs1.getString(2)%></td>
                    <td><%= rs1.getString(3)%></td>
                    <td><%= rs1.getString(4)%></td>

                    
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </table> </div>
            <%
                if (exportToExcel == null) {
            %>
        <a href="export.jsp?exportToExcel=YES">Export to Excel</a>
        <%
            }
        %>
    </body>
</html>