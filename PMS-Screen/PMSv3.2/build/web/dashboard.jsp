<%-- 
    Document   : dashboard
    Created on : Jan 19, 2017, 12:13:13 PM
    Author     : user
--%>
<% if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("index.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
    <div w3-include-html="libraries/header.html"></div>
    <!-- header -->

</head>

<body>
    <!-- menu top -->
    <div w3-include-html="libraries/topMenus.jsp"></div>
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row">       
            <!-- menu side -->		
            <div w3-include-html="libraries/sideMenus.html"></div>
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-users" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Human Resources</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-calendar" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Appointment</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-stethoscope" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Medical Checkup</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-cogs" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>SNOMED Maintenance</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-credit-card" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Billing System</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="PMS/index.jsp" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-user" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Management System</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-user-md" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Consultation</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-medkit" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Pharmacy Info System</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-file-text" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Reports</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-database" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Data Management</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-bed" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Admit, Discharge & Transfer System</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="SystemAdmin/Lookup-Maintenance.jsp" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-desktop" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>System Administration</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-check-square-o" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Procedure Order System</h3>
                            </div>
                        </a>
                    </div>
                </div>

            </div>

        </div>
        <!-- main -->		

    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<div w3-include-html="libraries/script.html"></div>

<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script type ="text/javascript">
    w3IncludeHTML();

</script>
</body>
</html>
