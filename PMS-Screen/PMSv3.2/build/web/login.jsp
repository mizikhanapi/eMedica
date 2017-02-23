<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="Dashboard_files\jquery.min.js.download"></script>
        <!-- header -->
    <div w3-include-html="libraries/header.html"></div>
    <link href="assets/css/login.css" rel="stylesheet">
    <!-- header -->
</head> 
<body>
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <div class="profile-img-card">
                <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
            </div>
            <h2 style="text-align: center;">eMedica</h2>
            <p id="profile-name" class="profile-name-card">Clinical Support System</p>
            <form class="form-signin" id="leForm" >
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputUserID" class="form-control" placeholder="User ID" name="username" required autofocus>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>

            </form><!-- /form -->
            <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
            <a href="forgot-pwd.html" class="forgot-password">
                Forgot the password?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <div w3-include-html="libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>

    <script>
        w3IncludeHTML();
        $(document).ready(function () {

            $(document).bind('keypress', pressed);
        });

        function pressed(e)
        {
            if (e.keyCode === 13)
            {
                //alert('enter pressed');
                login();
                //put button.click() here
            }
        }

        $('#btnSign').on('click', function () {

            login();

        });

        function login() {

            var userID = $("#inputUserID").val();
            var password = $("#inputPassword").val();

            if (userID === "") {
                alert("Fill in the User ID");
                $("#inputUserID").focus();
            } else if (password === "") {
                alert("Fill in the password");
                $("#inputPassword").focus();
            } else {

                $.ajax({
                    url: "login_process1.jsp",
                    type: "post",
                    data: {userID: userID,
                        password: password
                    },
                    timeout: 3000,
                    success: function (data) {
                        var num = parseInt(data);

                        if (num === 2)
                            window.location = "facility.jsp";
                        else if (num === 1)
                            alert("Wrong password");
                        else if (num === 0)
                            alert("User ID does not exist");
                        else
                            alert("Error");
                    },
                    error: function (err) {
                        alert("error :" + err.toString());
                    }

                });
            }
        }
    </script>
</body>
</html>
