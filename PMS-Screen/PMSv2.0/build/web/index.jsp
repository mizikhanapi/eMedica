<%@page import="Config.Config"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/loading.css">
        <!-- header -->
    <div w3-include-html="libraries/header.html"></div>
    <!-- header -->
</head>

<body>
    <!-- menu top -->
    <div w3-include-html="libraries/topMenus.html"></div>
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
                        <div class="tabbable-line" >
                            <ul class="nav nav-tabs" id="ulTabs">
                                <li class="active" id="t1"> <a href="#tab_default_1" data-toggle="tab" >Outpatient Registration </a> </li>
                                <li id="t2"> <a href="#tab_default_2" data-toggle="tab"> Patient Master Index </a> </li>
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
                                        <div w3-include-html="family (2).html"></div>
                                    </div>
                                    
                                    <!--
                                        medical insurance tab
                                    -->
                                    <div class="tab-pane" id="tab_default_6">
                                        <div w3-include-html="medical-insurance (2).html"></div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <script src="http://www.w3schools.com/lib/w3data.js"></script> 
    <script>
        var patientDOM = [];
        
        //load page to the div
        $("#registration").load("registrationV2.jsp");
        $("#patientMasterIndex").load("patient-master-indexV2.jsp");
        $("#employment").load("EmploymentV2.jsp");
        $("#nextOfKin").load("kinV2.jsp");
        $("#sidemenus").load("libraries/sideMenus.jsp");
        
        w3IncludeHTML();
    </script>
    

</body>
</html>