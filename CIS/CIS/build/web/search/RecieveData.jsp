<%-- 
    Document   : RecieveData
    Created on : 19-Jan-2017, 16:43:33
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
//    String notes = request.getParameter("notes");
//    String pmino = request.getParameter("pmino");
//    String episodedate = request.getParameter("episodedate");
//    String status = request.getParameter("status");
//    String JSONData = request.getParameter("JSONData");
//    
    
    //out.print(JSONData);
    
    
//    
//    Conn conn = new Conn();
//    boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status) "
//            + "VALUES('"+pmino+"','"+episodedate+"','"+notes+"','"+status+"') ");
//    
//    if (stats) {
//        out.print("|1|");
//    } else {
//        out.print("|2|");
//    }
            
%>
<script src="../libraries/jquery-3.1.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var data = [{"Acode":"PMH","Problem1":"Human immunodeficiency virus [HIV] disease","pmhCode":"","Status":"Active","comment1":"asda"},{"Acode":"HPI","codeHPI":"HPI","details":"asdasd"}];
        //$('#JSONData').val(JSON.parse(data));
        //console.log(data);
        for(i=0;i<data.length; i++){
            if (data[i].Acode === "PMH"){
                console.log(data[i]);
            }
        }
        
    })
    </script>
<p id="JSONData"></p>