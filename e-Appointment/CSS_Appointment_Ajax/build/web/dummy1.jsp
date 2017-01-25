
<%@include file="header.jsp"%>
<%@page import="main.SMSService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<div id="papar">haha</div>

<script>
    $(document).ready(function() {
        var url = "http://10.73.32.200:8084/Testing/SendEmail2.jsp";
        $.post(url, {
            email: "muhd.asyraf.isa@gmail.com",
            subject: "adoiyai",
            message: "adoiyai"
        }).done(function (data) {
            $("#papar").html(data);
        });
    });
</script>