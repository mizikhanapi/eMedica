<%-- 
    Document   : ShowPDF
    Created on : Jan 31, 2017, 10:32:50 AM
    Author     : user
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%


            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

                // String sql = " SELECT  where PMI_NO = '" + PMI_NO + "' ";
                // ArrayList<ArrayList<String>> dataAdmittedPatient = Conn.getData(sql);
                File reportFile = new File(application.getRealPath("//report//report1.jasper"));

                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, conn);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }


        %>

        <script>
            w3IncludeHTML();

            $(document).ready(function () {
                $("#contentLAdmittedPatientTable").load("LAdmittedPatientTable.jsp");
            });

            function validateForm() {
                var PMI_NO = document.forms["myForm"]["PMI_NO"].value;
                if (PMI_NO == "PMI_NO") {
                    alert("PMI must be filled out");
                    return false;
                }
            }

        </script>


    </body>
</html>
