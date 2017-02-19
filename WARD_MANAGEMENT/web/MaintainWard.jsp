<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link rel="stylesheet" href="assets/datepicker/jquery-ui.css">-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">

        <script src="assets/js/jquery.min.js"></script>

        <link href="assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <!-- Custom styles for this template -->
        <link href="assets/css/dashboard.css" rel="stylesheet">
        <link href="assets/css/Line-tabs.css" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
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


    <%  String hfc = "04010101";
        String dataSystemStatus = "1";
        String disc = "Inpatient";
        String subdis = "-";

        session.setAttribute("HFC", hfc);
        session.setAttribute("SYSTEMSTAT", dataSystemStatus);
        session.setAttribute("discipline", disc);
        session.setAttribute("subDicipline", subdis);

        Config.getFile_url(session);
        Config.getBase_url(request);
        Conn conn = new Conn();
    %>


    <!-- header -->
    <!-- menu top -->
    <div  id="topmenuindex"></div>
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row">       
            <!-- menu side -->		
            <div id="sidemenus"></div>
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">




                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">


                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Maintain Ward/ facility type </a>
                                        </li>
                                        <li>
                                            <a href="#tab_default_2" data-toggle="tab">
                                                Maintain Ward/ facility ID </a>
                                        </li>
                                        <li>
                                            <a href="#tab_default_3" data-toggle="tab">
                                                Assign bed to ward </a>
                                        </li>
                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">

                                            <div id="FaciltyType">

                                                <div id="FacilityTypeMain">
                                                </div>
                                                <div id="FacilityTypeTable">
                                                </div>
                                            </div>



                                        </div>
                                        <div class="tab-pane" id="tab_default_2">

                                            <div id="FacilityID">
                                                <div id="FacilityIDMain">
                                                </div>
                                                <div id="FacilityIDTable">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="tab-pane" id="tab_default_3">

                                            <div id="MWAssignBed">

                                                <div id="AssignBed">
                                                </div>
                                                <div id="AssignBedTable">
                                                </div>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu -->




                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- main -->		

    </div>





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://www.w3schools.com/lib/w3data.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
-->    <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>



    <script>
        w3IncludeHTML();

        $(document).ready(function () {
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");

            $("#FacilityTypeMain").load("facility-type.jsp");
            $("#FacilityTypeTable").load("facilityType-Table.jsp");

            $("#FacilityIDMain").load("facility-id.jsp");
            $("#FacilityIDTable").load("facilityID-Table.jsp");


            $("#AssignBed").load("assign-bed-to-ward.jsp");
            $("#AssignBedTable").load("assign-bed-to-ward-table.jsp");

        });

    </script>

</body>
</html>