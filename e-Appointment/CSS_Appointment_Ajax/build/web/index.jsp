<%-- 
    Document   : index
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<!DOCTYPE html>
<html>
    <title>e-Appointment Home Page</title>
    <%@include file="header.jsp"%>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1" style="margin-top: 2%; margin-bottom: 2%">
            <img src="image/posterHeader.jpg" width="1600" height="345">
        </div>
    </div>
<!--    <div class="row" id="rowSignInUp">
        <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">    
            <h3><em>e-Appointment</em></h3>
        </div>
        <div class="col-md-2 col-md-offset-3 col-sm-6 col-xs-6" id="right_column_signinup">
            <button class="btn btn-info buttonAuthenticate" onclick="window.location.href='login.jsp'">Sign In</button>
            <button class="btn btn-info buttonAuthenticate" onclick="window.location.href='register.jsp'">Sign Up</button>
        </div>
    </div>  -->
    <div class="row">
        <div class=" col-md-5 col-md-offset-1 " style="padding-top: 0.5%;">
            <marquee direction="left"><p><b>Welcome to Electronic Appointment [e-Appointment]</b><p></marquee>
        </div>
        <div class="col-md-5 text-right">
            <button class="btn btn-info buttonAuthenticate" onclick="window.location.href='login.jsp'">Sign In</button>
            <button class="btn btn-info buttonAuthenticate" onclick="window.location.href='register.jsp'">Sign Up</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
            <h3 class="headerTitle">Categories</h3>
            <ul class="headerUL">
                <li><a href="login.jsp" onClick="login();" class="bodyUL"> Holiday </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL"> Clinic Day </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL"> Roster   </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL"> Leave   </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL"> Appointment </a></li>
            </ul>
<!--            <h3 class="headerTitle">Details</h3>
            <ul class="headerUL">
                <li><a href="login.jsp" onClick="login();" class="bodyUL">About Us </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL">Contact Us </a><hr></li>
                <li><a href="login.jsp" onClick="login();" class="bodyUL">Our Location </a><hr></li>
            </ul>-->
            <%@include file="clock.jsp"%>
            <script type="text/javascript" language="JavaScript">obj=new Object;obj.clockfile="5025-white.swf";obj.TimeZone="Malaysia_KualaLumpur"; obj.width=180;obj.height=180;obj.wmode="transparent";showClock(obj);</script>
        </div>
        <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
            <h3 class="headerTitle">What is e-Appointment</h3>
            <p style="text-align: justify"><strong>e-Appointment is a Web Bases application that is used to manage the patient appointment record by using a web based. 
                    As this web based application is designed in a responsive form so that it is also will be able to be opened in any mobile devices. User will be using 
                    a web browser to open the application then perform the booking appointment activities. Before performing an appointment user need to check the doctor 
                    availability and also view a holiday. First time user need to attend to the clinic in order to use the system but sign up is needed before user can 
                    proceed to sign in into the system.
            </strong></p>
            <h3 class="headerTitle" style="margin-top: 3%;">How to use the system ?</h3>
            <p><strong>Step 1: Patients need to attend to the clinic/hospital as a First Time User in order to use the system</strong></p>
            <p><strong>Step 2: Patients need to Sign Up and fill in the Register Form </strong></p>
            <p><strong>Step 3: Patients can use the system by Signing in into the system</strong></p>
            <p><strong>Step 4: Patients have option to  check the doctor availability and view holiday before make an appointment or directly make an appointment</strong></p>
            <p><strong>Step 5: Patients can view their previous appointment at the View Appointment tab</strong></p>
            <h3 class="headerTitle" style="margin-top: 3%;">Our Location</h3>

            <div class="google_map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                    e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
            View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
        </div>
   </div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 footer ">
            Copyright &copy; BIOCORE 2016
    </div>
</div>
</div>
</body>
</html>
