<%-- 
    Document   : manage
    Created on : Dec 24, 2016, 6:17:18 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
                            <li><a href="index.jsp"><span>Billing</span></a></li>
                            <li class="active"><a href="bill.jsp"><span>Manage Bill</span></a></li>
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
                        <div id="loadBill">
                            <div style="margin-bottom: 50px">
                                <h4><b>Manage Bill</b></h4>
                                <div class="form-group">
                                    <label class="col-lg-2">Bill Status</label>
                                    <div class="col-sm-7 col-md-7" style="margin-bottom: 10px">
                                        <div class="input-group">
                                                <div id="rbStatus" class="btn-group">
                                                        <a class="btn btn-primary btn-sm active" data-toggle="status" data-title="U">UNPAID</a>
                                                        <a class="btn btn-primary btn-sm" data-toggle="status" data-title="P">PAID</a>
                                                </div>
                                                <input type="hidden" name="happy" id="status">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="custom-search-input">
                                <div class="input-group ">
                                    <input id="ic" type="text" class="  search-query form-control" placeholder="IC No." />
                                    <span class="input-group-btn">
                                        <button id="searchBill" class="btn btn-success pull-right" type="button">Search</button>
                                    </span>
                                </div>
                            </div>

                            <div id="billDetails">
                                <table id="tableBill" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
                                    <thead>
                                        <th>Transaction Date</th>
                                        <th>Bill No.</th>
                                        <th>Customer ID</th>
                                        <th>Name</th>
                                        <th>IC No.</th>
                                        <th>Other ID</th>
                                        <th>Phone No.</th>
                                        <th>Outstanding (RM)</th>
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
                $('#rbStatus a').on('click', function(){
                    var sel = $(this).data('title');
                    var tog = $(this).data('toggle');
                    $('#'+tog).prop('value', sel);

                    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
                    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
                });
                
                $('#searchBill').click(function(){
                  var ic = document.getElementById('ic').value;
                  var status = $('#rbStatus a.active').html();
                  status = String(status).toLowerCase();
                  
                  if (ic === "") {
                  } else {
                      $.ajax({
                          url: "searchBill.jsp",
                          type: "post",
                          data: {
                              ic: ic,
                              status: status
                          },
                          timeout: 10000,
                          success: function(data) {
                              $('#billDetails').html(data);
                          },
                          error: function(err) {
                          }
                      });
                    }
                });
            });
            $(".use-address").click(function() {
    var $row = $(this).closest("tr"),
        $tds = $row.find("td:nth-child(2)");

    $.each($tds, function() {
        console.log($(this).text());
    });
    
});
        </script>
    </body>
</html>