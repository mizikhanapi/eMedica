<%-- 
    Document   : test
    Created on : Jan 23, 2017, 9:30:40 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    </head>

    
    
    <body>
        <!-- header -->
        <div w3-include-html="libraries/pharmacyHeader.jsp"></div>
        <!-- header -->
        
        <!-- menu top -->
        <div w3-include-html="libraries/pharmacyTopMenus.jsp"></div>
        <!-- menu top -->

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		
                <div w3-include-html="libraries/pharmacySideMenus.jsp"></div>
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
                                                    ATC CODE MANAGEMENT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    MDC CODE MANAGEMENT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    SUPPLIER MANAGEMENT </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="contentATC">

                                                    <div id="contentATCMain">
                                                    </div>
                                                    <div id="contentATCTable">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="contentMDC">
                                                    <div id="contentMDCMain">
                                                    </div>
                                                    <div id="contentMDCTable">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_3">

                                                <div id="contentSup">

                                                    <div id="contentSupplierMain">
                                                    </div>
                                                    <div id="contentSupplierTable">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        
        
        <script>
            w3IncludeHTML();

            $(document).ready(function () {
                $("#contentATCMain").load("atcMain.jsp");
                $("#contentATCTable").load("atcTableLoop.jsp");
                
                $("#contentMDCMain").load("mdcMain.jsp");
                $("#contentMDCTable").load("mdcTableLoop.jsp");

                $("#contentSupplierMain").load("supplierMain.jsp");
                $("#contentSupplierTable").load("supplierTableLoop.jsp");     
            });

        </script>

    </body>

</html>