<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="libraries/PMSassets/css/loading.css">
        <link href="libraries/PMSassets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="libraries/PMSassets/js/jquery.min.js"></script>
        <script src="libraries/PMSassets/datepicker/jquery-ui.js"></script>
        <script src="libraries/PMSassets/js/form-validator.min.js"></script>
        <script src="libraries/PMSassets/js/bootstrap.min.js"></script> 
        <script src="libraries/PMSassets/js/bootbox.min.js"></script> 
        <!-- header -->
    <div><%@include file = "../assets/header.html" %></div>
    <!-- header -->

</head>

<body>
    <%

        Config.getFile_url(session);
        Config.getBase_url(request);
        Conn conn = new Conn();

        //out.println("--------------------------------------------------------------------ipcall: " + conn.getIpCall() + " ");
        //out.println(Config.getFile_url(session));
%>
    <!-- menu top -->
    
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row"> 
            <!-- menu side -->
            <div><%@include file = "libraries/sideMenus.jsp" %></div>
            <!-- menu side --> 

            <!-- main -->
            <div class="main" style="background: #f2f4f8;" >
                <div><%@include file = "libraries/topMenus.html" %></div>
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
                                        <div id="registration"><%@include file = "registrationV2.jsp" %></div>
                                    </div>

                                    <!--
                                        PMI master index  tab
                                    -->
                                    <div class="tab-pane" id="tab_default_2">
                                        <div id="patientMasterIndex"><%@include file = "patient-master-indexV2.jsp" %></div>
                                    </div>

                                    <!--
                                        Employment tab
                                    -->
                                    <div class="tab-pane" id="tab_default_3">
                                        <div id="employment"><%@include file = "EmploymentV2.jsp" %></div>
                                    </div>

                                    <!--
                                        next of kin tab
                                    -->
                                    <div class="tab-pane" id="tab_default_4">
                                        <div id="nextOfKin"><%@include file = "kinV2.jsp" %></div>
                                    </div>

                                    <!--
                                        list of family tab tab
                                    -->
                                    <div class="tab-pane" id="tab_default_5">
                                        <div id="family"><%@include file = "familyV2.jsp" %></div>
                                    </div>

                                    <!--
                                        medical insurance tab
                                    -->
                                    <div class="tab-pane" id="tab_default_6">
                                        <div id="medical"><%@include file = "medical-insuranceV2.jsp" %></div>
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


    <script>
        var patientDOM = [];

//        //load page to the div
//        $("#registration").load("registrationV2.jsp");
//        $("#patientMasterIndex").load("patient-master-indexV2.jsp");
//        $("#employment").load("EmploymentV2.jsp");
//        $("#nextOfKin").load("kinV2.jsp");
//        $("#family").load("familyV2.jsp");
//        $("#medical").load("medical-insuranceV2.jsp");
//////        $("#test").load("dummy.html");
//        $("#sidemenus").load("../libraries/PMS/sideMenus.jsp");

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
    </script>


</body>
</html>