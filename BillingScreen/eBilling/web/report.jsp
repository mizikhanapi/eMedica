<%-- 
    Document   : report
    Created on : Dec 24, 2016, 6:17:44 PM
    Author     : Mike Ho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file = "includes/header.html" %>
    <body onload="yearList()">
        <div class="container-fluid">
            <%@include file = "includes/topMenu.html" %>
            <div class="row">
                <div class="col-lg-2">                
                    <div id="cssmenu">
                        <ul>
                            <li><a href="index.jsp"><span>Billing</span></a></li>
                            <li><a href="bill.jsp"><span>Manage Bill</span></a></li>
                            <li><a href="miscellaneous.jsp"><span>Miscellaneous</span></a></li>
                            <li><a href="parameter.jsp"><span>Bill Parameter</span></a></li>
                            <li class="active"><a href="report.jsp"><span>Report</span></a></li>
                            <li><a href="closing.jsp"><span>Closing</span></a></li>
                        </ul>
                    </div>   
                </div>
        
                <!--body-->
                <div class="col-lg-10">
                    <div id="message"></div>
                    <div id="reportDetails" class="thumbnail">
                        <div style="margin-bottom: 250px">
                            <h4>Report</h4>
                            <div class="form-group" >
                                <label class="col-lg-2">Patient IC No.</label>
                                <div class="col-lg-10" style="margin-bottom: 10px">
                                    <input id="patientIC" type="text" class="form-control" placeholder="IC No.">
                                </div>
                                <label class="col-lg-2">Year</label>
                                <div class="col-lg-10" style="margin-bottom: 10px">
                                    <select id="year" class="form-control"></select>
                                </div>
                                <label class="col-lg-2">Month</label>
                                <div class="col-lg-10" style="margin-bottom: 10px">
                                    <select id="month" class="form-control">
                                        <option value="0" selected="true">All Month</option>
                                        <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                </div>
                                <label class="col-lg-2">Select a statement</label>
                                <div class="col-lg-10 pull-right" style="margin-bottom: 10px">
                                    <button id="yearlyStatement" class="btn btn-info" style="margin-bottom: 10px">Customer Yearly Account Statement</button><br>
                                    <button id="detailsStatement" class="btn btn-info" style="margin-bottom: 10px">Customer Details Account Statement</button><br>
                                    <button id="yearEndReport" class="btn btn-info" style="margin-bottom: 10px">Year End Processing Report</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
            
        <!--js-->
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script type="text/javascript">
            function yearList(){
                var year = new Date().getFullYear();
                var select = document.getElementById("year");
                for(var i = year-7; i <= year; ++i) {
                    var option = document.createElement('option');
                    option.text = option.value = i;
                    select.add(option, 0);
                }
               $('#year').val(year);
            }
            
            $(document).ready(function(){
                $('#patientIC').keypress(function(event) {
                    if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                        event.preventDefault();
                    }
                });              
              
              $('#yearlyStatement').click(function(){
                  var ic = document.getElementById('ic').value;
                  var year = document.getElementById('year').value;
                  var month = document.getElementById('month').value;
                    if (month.length !== 2){          
                        month = "0" + month;;
                    }
                    
                  if (ic === "") {
                      alert('Please fill in patient IC No.');
                  } else {
                      $.ajax({
                          url: "generateReport.jsp",
                          type: "post",
                          data: {
                              action:'yearlyStatement',
                              ic: ic,
                              year:year,
                              month:month
                          },
                          timeout: 10000,
                          success: function(data) {
                                var d = data.split("|");
                                if (d[1] == '1') {
                                 } else {
                                     alert(d[1]);
                                 }
                          },
                          error: function(err) {
                          }
                      });
                    }
                });
                
              $('#detailsStatement').click(function(){
                  var ic = document.getElementById('patientIC').value;
                  var year = document.getElementById('year').value;
                  var month = document.getElementById('month').value;
                  
                  if (month.length !== 2){          
                        month = "0" + month;
                  }
                    
                  if (ic === "") {
                      alert('Please fill in patient IC No.');
                  } else {
                      
                        var url = "/eBilling/PdfServlet?"
                        var action = "detailsStatement";
                        url += "action=" + action;
                        url += "&ic=" + ic;
                        url += "&year=" + year;
                        url += "&month=" + month;
                        
                        var win = window.open(url, '_blank');
                        win.focus();
                    }
                });
                
              $('#yearEndReport').click(function(){
                  var ic = document.getElementById('ic').value;
                  var year = document.getElementById('year').value;
                  var month = document.getElementById('month').value;
                    if (month.length !== 2){          
                        month = "0" + month;;
                    }
                    
                  if (ic === "") {
                      alert('Please fill in patient IC No.');
                  } else {
                      $.ajax({
                          url: "generateReport.jsp",
                          type: "post",
                          data: {
                              action:'yearEndReport'
                          },
                          timeout: 10000,
                          success: function(data) {
//                                var d = data.split("|");
//                                if (d[1] == '1') {
//                                 } else {
//                                     alert(d[1]);
//                                 }
                          },
                          error: function(err) {
                          }
                      });
                    }
                });
            });
        </script>
    </body>
</html>