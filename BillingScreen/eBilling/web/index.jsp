<%--
    Document   : Main
    Created on : Dec 24, 2016, 2:19:32 PM
    Author     : Mike Ho
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file = "includes/header.html" %>
    <body>
        <div class="container-fluid">
            <%@include file = "includes/topMenu.html" %>
            <div class="row">
                <div class="col-lg-2">
                    <div id="cssmenu">
                        <ul>
                            <li class="active"><a href="index.jsp"><span>Billing</span></a></li>
                            <li><a href="bill.jsp"><span>Manage Bill</span></a></li>
                            <li><a href="miscellaneous.jsp"><span>Miscellaneous</span></a></li>
                            <li><a href="parameter.jsp"><span>Bill Parameter</span></a></li>
                            <li><a href="report.jsp"><span>Report</span></a></li>
                            <li><a href="closing.jsp"><span>Closing</span></a></li>
                        </ul>
                    </div>
                </div>

                <!--body-->
                <div class="col-lg-10">
                    <div class="thumbnail">
                        <div id="generateBill">
                            <h4><b>Patient Information</b></h4>
                            <div id="custom-search-input">
                                <div class="input-group ">
                                    <input id="ic" type="text" class="  search-query form-control" placeholder="IC No." />
                                    <span class="input-group-btn">
                                        <button id="searchPatient" class="btn btn-success pull-right" type="button">Search</button>
                                    </span>
                                </div>
                            </div>

                            <div id="patientDetails">
                                <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
                                    <thead>
                                        <th>Episode Date</th>
                                        <th>Order No.</th>
                                        <th>PMI No.</th>
                                        <th>IC No.</th>
                                        <th>Other ID</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>Phone No.</th>
                                        <th></th>
                                    </thead>
                                </table>
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
            $(document).ready(function(){
              $('#searchPatient').click(function(){
                  var ic = document.getElementById('ic').value;
                  
                  if (ic === "") {
                  } else {
                      $.ajax({
                          url: "searchPatient.jsp",
                          type: "post",
                          data: {
                              ic: ic
                          },
                          timeout: 10000,
                          success: function(data) {
                            $('#patientDetails').html(data);
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
