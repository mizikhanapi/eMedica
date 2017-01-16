<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String ic = (String)session.getAttribute("ic");
    String val1 = (String)session.getAttribute("val1");
    String val2 = (String)session.getAttribute("val2");
    String val3 = (String)session.getAttribute("val3");
    String val4 = (String)session.getAttribute("val4");
    String username = (String)session.getAttribute("username");
    String name = (String)session.getAttribute("USER_NAME");

%>
<!DOCTYPE html>
<html>
    <title>Patient Page</title>
    <%@include file="header.jsp"%>
<body>
<div class="container-fluid"> 
    <div class="row">
        <div class="col-md-8 col-md-offset-3 col-sm-12 col-xs-12 bodyContent">
                    <form class="form-inline" role="form" method="post" action="patientAppointment1.jsp">
                      <div class="form-group"> 
  
                        <label class="control-label" for="hfc">Please choose the hospital/clinic you are prefer </label>
                            <select class="form-control" id="hfc_code" name="hfc_name" required>
                            <option></option>
                            <%   
                                String sqlHFCCode = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0081'";
                                ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);

                          
                                    if (dataHFCCode.size() > 0) 
                                    {
                                        for (int i = 0; i < dataHFCCode.size(); i++) 
                                        {%>
                                                <option value="<%=dataHFCCode.get(i).get(1)%>"><%=dataHFCCode.get(i).get(1)%></option>
                                      <% }
                                    }
           
                                      %>
                            </select>

                    </div>
                    <button class="btn btn-info">Go to website</button>
                    </form>
        </div>
            <script>
                $(function() { 
                  $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                    //save the latest tab; use cookies if you like 'em better:
                    localStorage.setItem('lastTab', $(this).attr('href'));
                   });
                  //go to the latest tab, if it exists:
                  var lastTab = localStorage.getItem('lastTab');
                  if (lastTab) {
                     $('a[href=' + lastTab + ']').tab('show');
                  }
                  else
                  {
                    // Set the first tab if cookie do not exist
                    $('a[data-toggle="tab"]:first').tab('show');
                  }
                });
            </script>
   </div>
</div>
</body>
</html>
