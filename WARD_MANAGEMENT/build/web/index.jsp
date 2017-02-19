<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/datepicker/jqueru-ui.css">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <!-- Custom styles for this template -->
        <link href="assets/css/dashboard.css" rel="stylesheet">
        <link href="assets/css/Line-tabs.css" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        <!-- header -->
    <div  id="headerindex"></div>
    <!-- header -->
</head>

<body>
    <%
        String hfc = "04010101";
        String dataSystemStatus = "1";
        session.setAttribute("HFC", hfc);
        session.setAttribute("SYSTEMSTAT", dataSystemStatus);
        Config.getFile_url(session);
        Config.getBase_url(request);
        Conn conn = new Conn();

        //out.println("--------------------------------------------------------------------ipcall: " + conn.getIpCall() + " ");
        //out.println(Config.getFile_url(session));
    %>
    <!-- menu top -->
    <div  id="topmenuindex"></div>
    <!-- menu top --><body>
    <!-- menu

    -->    <div class="container-fluid">
        <div class="row"> <!--
            <!-- menu side -->
            <div id="sidemenus"></div>
            <!-- menu side --> 

            <!-- main -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">



            </div>

            <!-- main --> 
            <div>
                welcome
                <h4>Maintain Ward/Facility ID</h4>


            </div>
        </div>
    </div>


    <!-- Bootstrap core JavaScript
        ================================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <!-- Bootstrap core JavaScript
        ================================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script src="http://www.w3schools.com/lib/w3data.js"></script> -->


    <script>
        var patientDOM = [];

        //load page to the div
        $("#headerindex").load("libraries/header.html");
        $("#topmenuindex").load("libraries/topMenus.html");
        $("#maintainWardCode").load("MaintainWard.jsp");
        $("#inpatientRegistration").load("registrationV2.jsp");
        $("#wardOccupancy").load("WardOccupancy.jsp");
        $("#patientTransfer").load("PatientTransfer.jsp");
        $("#sidemenus").load("libraries/sideMenus.jsp");
        w3IncludeHTML();
    </script>


</body>
</html>