<%-- 
    Document   : register
    Created on : Mar 28, 2016, 8:56:09 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!DOCTYPE html>
<html>
    <title>Register Form</title>
    <%@include file="header.jsp"%>
    <body class="bodyAuthenticate">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_header">
                   <h3 style="color: white"><i>Welcome To Join Our Member!</i></h3>
                </div>
            </div>
        <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_area">
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
            <h3>Register Form</h3>
            <hr>
            <form role="myForm" name="frm" action="register_process.jsp" onSubmit="return passwordValidation()" method="post" >
                <div class="form-group">
                    <label for="ic_no">IC No / Passport No</label>
                    <input id="IC" type="text" class="form-control" onkeypress="return isNumberKey(event)" name="ic_no"  maxlength="12" placeholder="Identity No" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label> 
                    <input id="USERNAME" type="text" class="form-control" name="username" onkeyup="AllowAlphabet()" maxlength="10" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="PASSWORD" type="password" class="form-control" name="password" maxlength="20" placeholder="Password" required>
                </div>
                 <div class="form-group">
                    <label for="submit">Mobile No</label>
                    <input type="number" class="form-control" name="mobile_no" placeholder="Mobile No" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>
                <button type="submit" class="btn btn-success">Register</button>
                <button type="reset" class="btn btn-success ">Reset</button>
                <button type="reset" class="btn btn-primary" onclick="window.location.href='index.jsp'">Back</button>
            </form>
        </div>
        </div>
        </div>
    </body>
</html>
