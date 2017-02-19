<%-- 
    Document   : pmhMain
    Created on : Feb 19, 2017, 12:21:52 AM
    Author     : User
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Patient Medical History</title>
    </head>
    <body>
        <!-- navigation bar -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">iHIS </a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="MainMenu.jsp">Home</a></li>

                    <li class="pull-right"><a> Welcome </a></li>
                </ul>
            </div>
        </nav>

        <!-- navigation bar -->
        <div class="form-group">

            <h3 style="text-align: center"> Patient Medical History </h3>

            <div id="SearchPatientdiv">
            </div>

            <div id="pmhTablediv">
            </div>

            <div id="pmhTableSelecteddiv">
            </div>
        </div>

    </body>
</html>


<script>
    $(document).ready(function () {
        $("#SearchPatientdiv").load("searchPatient.jsp");
        $("#pmhTablediv").load("pmhTable.jsp");
        $("#pmhTableSelecteddiv").load("chiefComplaintRow.jsp");
        
        $(document).ready(function () {
                $.ajax({
                    type: "post",
                    url: "pmhTable.jsp",
                    timeout: 3000,
                    success: function (returnHtml) {
                        //console.log(returnHtml);
                        $('#contentpmhTablediv').html(returnHtml);

                    }, error: function (jqXHR, textStatus, errorThrown) {

                        console.log("ERROR: " + errorThrown);
                    }
                });
            });

    });
</script>
