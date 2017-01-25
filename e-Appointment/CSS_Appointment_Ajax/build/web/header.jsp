<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<head>
        <title>e-Appointment</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<%=Config.getBase_url(request) %>bootstrap-3.3.6-dist/css/bootstrap.min.css" />
        <script src="<%=Config.getBase_url(request) %>bootstrap-3.3.6-dist/js/jquery.min.js"></script>
        <script src="<%=Config.getBase_url(request) %>bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <link href="<%=Config.getBase_url(request) %>default.css" rel="stylesheet" type="text/css" />
        <link href="<%=Config.getBase_url(request) %>authenticate.css" rel="stylesheet" type="text/css" />
        
        
        <script src="<%=Config.getBase_url(request) %>js/jquery.bootpag.js"></script>
        <script src="<%=Config.getBase_url(request) %>js/login.js"></script>
        <script src="<%=Config.getBase_url(request) %>js/passwordValidation.js"></script>
        <script src="<%=Config.getBase_url(request) %>js/onKeyPress.js"></script>
        <script src="<%=Config.getBase_url(request) %>js/allowAlphabet.js"></script>
 
        
        
        
        <%
        Config.getFile_url(session);
        Conn co = new Conn();
        %>

        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
        
        <!--for calendar js-->
<!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>-->
        <!--<script src="js/datepicker.js"></script>-->
</head>