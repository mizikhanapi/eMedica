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
            <div class="row">      
            <%@include file = "includes/sideMenu.html" %>
                <!-- main -->		

                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                    
                <%@include file = "includes/topMenu.html" %>
                    <div class="row">
                        <!--body-->
                        <div class="col-md-12">
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
            </div>
        </div>

        <!--js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script src="http://www.w3schools.com/lib/w3data.js"></script> 
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#ic').keypress(function(event) {
                    if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                        event.preventDefault();
                    }
                });                     
                
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
