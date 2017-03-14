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
            <div class="row">      
            <%@include file = "includes/sideMenu.html" %>
                <!-- main -->		

                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                    
                <%@include file = "includes/topMenu.html" %>
                    <div class="row">
                        <!--body-->
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <div id="loadBill">
                                    <div style="margin-bottom: 50px">
                                        <h4><b>Manage Bill</b></h4>
                                        <form class="form-horizontal" name="myForm" id="myForm">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Bill Status</label>
                                                <div class="col-sm-7 col-md-7" style="margin-bottom: 10px">
                                                    <div class="input-group">
                                                        <div id="rbStatus" class="btn-group">
                                                                <a class="btn btn-primary btn-sm active" data-toggle="status" data-title="U">UNPAID</a>
                                                                <a class="btn btn-primary btn-sm" data-toggle="status" data-title="P">PAID</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="custom-search-input">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="textinput">IC No.</label>
                                                    <div class="col-md-4">
                                                        <input type="text" class="form-control input-md" id="ic" placeholder="IC No.">
                                                    </div>
                                                    <button class="btn btn-primary" type="button" id="searchBill" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div id="billDetails">
                                        <table id="tableBill" class="table table-filter table-striped table-bordered">
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
            </div>
        </div>
            
        <%@include file = "includes/message.html" %>                    
        
        <!--js-->
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script type="text/javascript">
            $(document).ready(function(){
                $('#ic').keypress(function(event) {
                    if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                        event.preventDefault();
                    }
                });     
                
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
                            var d = data.split("|");
                            $('#billDetails').html(d[0]);
                            if (d[1] == '-1') {
                                document.getElementById('messageHeader').innerHTML = "No record!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                            }
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