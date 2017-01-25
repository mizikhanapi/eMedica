<%-- 
    Document   : login
    Created on : Mar 28, 2016, 8:05:22 PM
    Author     : user
--%>


<%@page import="sun.security.krb5.Confounder"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<%
//
//    String validateSession = request.getParameter("newSession");
//    out.print(validateSession);
//if(validateSession.equals(null))
//{
//    response.sendRedirect("login.jsp");
//}
//else
//{
//    response.sendRedirect("login.jsp");
//} 
    
//    Config.getFile_url(session);
//    Properties prop = Conn.getIpCall();
//    String host_server = Conn.getIpCall().getProperty(Conn.STR_HOST);
//    int host_port = 1099;
//    try {
//        host_port = Integer.parseInt(Conn.getIpCall().getProperty(Conn.STR_PORT));
//    } catch (Exception e) {
//    }
//    String error = Conn.getIpCall().getProperty(Conn.STR_ERROR);
//    out.print("|" + host_server + "|" + host_port + "|" + error + "|");
//    
//    if (true) { return; }
    
%>

<!DOCTYPE html>
<html>
    <title>Login page</title>
    <%@include file="header.jsp"%>
    <body class="bodyAuthenticate">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 login_area"> 
                    <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
                    <h3>Login</h3>
                    <hr>
                    <form role="form" method="post" action="login_process.jsp">
                        <div class="form-group">
                            <label for="ic_no">Login Id</label>
                            <input type="text" class="form-control"  name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Password</label> 
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <p style="padding-bottom: 2%"><a href="register.jsp">You have no account?</a></p>
                        <button type="submit" class="btn btn-success">Login</button>
                        <button type="reset" class="btn btn-success ">Reset</button>
                        <button type="reset" class="btn btn-primary buttonMainPage" onclick="window.location.href = 'index.jsp'" >Back</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
