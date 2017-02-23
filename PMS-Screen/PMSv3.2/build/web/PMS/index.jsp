<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="../assets/datepicker/jqueru-ui.css">-->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css">
<!--         Custom styles for this template -->
        <link href="../assets/css/dashboard.css" rel="stylesheet">
        <link href="../assets/css/Line-tabs.css" rel="stylesheet">

        <link rel="stylesheet" href="../assets/css/loading.css">
        <link href="../assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="../assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/datepicker/jquery-ui.js"></script>
        <script src="../assets/js/form-validator.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script> 
        <script src="../assets/js/w3data.js"></script>
        <script src="../assets/js/bootbox.min.js"></script>     
        <!-- header -->
    <div  id="headerindex"></div>
    <!-- header -->

</head>

<body>
    <%
        //String hfc = "04010101";
        String dataSystemStatus = "1";
        //session.setAttribute("HFC", hfc);
        session.setAttribute("SYSTEMSTAT", dataSystemStatus);
        Config.getFile_url(session);
        Config.getBase_url(request);
        Conn conn = new Conn();

        //out.println("--------------------------------------------------------------------ipcall: " + conn.getIpCall() + " ");
        //out.println(Config.getFile_url(session));
%>
    <!-- menu top -->
    <div  id="topmenuindex"></div>
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row"> 
            <!-- menu side -->
            <div id="sidemenus"></div>
            <!-- menu side --> 

            <!-- main -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;" >

                <div class="row" >
                    <div class="col-md-12" >
                        <div class="tabbable-line" id="navDiv">
                            <ul class="nav nav-tabs" id="ulTabs">
                                <li class="active"> <a href="#tab_default_1" data-toggle="tab" >Outpatient Registration </a> </li>
                                <li> <a href="#tab_default_2" data-toggle="tab"> Patient Master Index </a> </li>
                                <li> <a href="#tab_default_3" data-toggle="tab"> Employment </a> </li>
                                <li> <a href="#tab_default_4" data-toggle="tab"> Next of Kin </a> </li>
                                <li> <a href="#tab_default_5" data-toggle="tab"> Family </a> </li>
                                <li> <a href="#tab_default_6" data-toggle="tab"> Medical Insurance </a> </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <!-- Tab Menu -->

                        <div class="tabbable-panel">
                            <div class="tabbable-line">
                                <!-- tab content -->
                                <div class="tab-content">
                                    <!--
                                        search and registation tab
                                    -->
                                    <div class="tab-pane active" id="tab_default_1">
                                        <div id="registration"></div>
                                    </div>

                                    <!--
                                        PMI master index  tab
                                    -->
                                    <div class="tab-pane" id="tab_default_2">
                                        <div id="patientMasterIndex"></div>
                                    </div>

                                    <!--
                                        Employment tab
                                    -->
                                    <div class="tab-pane" id="tab_default_3">
                                        <div id="employment"></div>
                                    </div>

                                    <!--
                                        next of kin tab
                                    -->
                                    <div class="tab-pane" id="tab_default_4">
                                        <div id="nextOfKin"></div>
                                    </div>

                                    <!--
                                        list of family tab tab
                                    -->
                                    <div class="tab-pane" id="tab_default_5">
                                        <div id="family"></div>
                                    </div>

                                    <!--
                                        medical insurance tab
                                    -->
                                    <div class="tab-pane" id="tab_default_6">
                                        <div id="medical"></div>
                                    </div>

                                    <!--
                                        medical insurance tab
                                    -->
                                    <div class="tab-pane" id="tab_default_7">
                                        <div id="test"></div>
                                    </div>


                                </div>
                            </div>
                        </div>

                        <!-- Tab Menu --> 
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script src="http://www.w3schools.com/lib/w3data.js"></script> -->
    <!--    <script src="assets/js/jquery.min.js"></script>    
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>-->

    <!--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>-->


    <script>
        var patientDOM = [];

        //load page to the div
        $("#headerindex").load("../libraries/PMS/header.html");
        $("#topmenuindex").load("../libraries/PMS/topMenus.html");
        $("#registration").load("registrationV2.jsp");
        $("#patientMasterIndex").load("patient-master-indexV2.jsp");
        $("#employment").load("EmploymentV2.jsp");
        $("#nextOfKin").load("kinV2.jsp");
        $("#family").load("familyV2.jsp");
        $("#medical").load("medical-insuranceV2.jsp");
////        $("#test").load("dummy.html");
        $("#sidemenus").load("../libraries/PMS/sideMenus.jsp");

        $('a[data-toggle="tab"]').click(function (e) {
            // $('#tab_a').find('a').removeAttr('data-toggle');
            var target = $(e.target).attr("href");
            e.preventDefault();
            var areYouSure = confirm('If you sure you wish to leave this tab?  Any data entered will NOT be saved.  To save information,press cancel and use the Save buttons in the main page.');
            if (areYouSure === true) {
                $(this).tab('show');
            } else {
                // do other stuff
                return false;
            }
        });

        w3IncludeHTML();
    </script>


</body>
</html>