<%-- 
    Document   : test
    Created on : Jan 23, 2017, 9:30:40 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%

    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    </head>



    <body>
        <!-- header -->
        <div w3-include-html="libraries/pharmacyHeader.jsp"></div>
        <!-- header -->

        <!-- menu top -->
        <div w3-include-html="libraries/pharmacyTopMenus.jsp"></div>
        <!-- menu top -->

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		
                <div w3-include-html="libraries/pharmacySideMenus.jsp"></div>
                <!-- menu side -->	

                <!-- main -->		
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                    <div class="row">
                        <div class="col-md-12">

                            <div id="orderDrugSearch">

                            </div>

                            <div id="orderDrugBasicInfo">
                                
                            </div>
                            <div class="thumbnail">
                                <h4>Basic Info</h4>
                                <hr/>
                                <form class="form-horizontal" name="myForm2" id="myForm2">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                                                <div class="col-md-8">
                                                    <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">   
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Name</label>
                                                <div class="col-md-8">
                                                    <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                                                <div class="col-md-8">
                                                    <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                                                </div>
                                            </div>

                                            <!--Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                                                <div class="col-md-8">
                                                    <input id="pbtype" name="pbtype" type="text" readonly placeholder="" class="form-control input-md">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-4">

                                            <!--Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                                                <div class="col-md-8">
                                                    <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                                                </div>
                                            </div>

                                            <!--Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Birthday Date</label>
                                                <div class="col-md-8">
                                                    <input id="pbdate" name="pbdate" type="text" readonly placeholder="" class="form-control input-md">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="thumbnail">
                                <h4>
                                    Drug Order Details
                                    <div class="pull-right">
                                        <button id="button1id" name="button1id" class="btn btn-primary" data-toggle="modal" data-target="#squarespaceModa20"><i class="fa fa-plus fa-lg"></i>&nbsp; New Order</button>
                                        <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-plus fa-lg"></i>&nbsp; New Order List</button>
                                        <button id="button2id" name="button2id" class="btn btn-default"><i class="fa fa-file-text fa-lg"></i>&nbsp; Prescribe</button>
                                    </div>
                                </h4>



                                <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">
                                    <thead>
                                    <th>Drug Code</th>
                                    <th>Trade Name</th>
                                    <th>Frequency</th>
                                    <th>Route</th>
                                    <th>Drug Form</th>
                                    <th>Strength</th>
                                    <th>Dose</th>
                                    <th>Order OUM</th>
                                    <th>Duration</th>
                                    <th>Qty Order</th>
                                    <th>Qty Supply</th>
                                    <th>Dispense Qty</th>
                                    <th>Status</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                    </thead>
                                    <tbody>
                                        <tr data-status="pagado">
                                            <td>yyyy/mm/dd</td>
                                            <td>ABC!@#</td>
                                            <td>Description goes here...</td>
                                            <td>50</td>
                                            <td>50</td>
                                            <td>50</td>
                                            <td>40.00</td>
                                            <td>80.00</td>
                                            <td>80.00</td>
                                            <td>80.00</td>
                                            <td>80.00</td>
                                            <td>80.00</td>
                                            <td>80.00</td>
                                            <td><a href="javascript:;" class="star">
                                                    <a href="#" data-toggle="modal" data-target="#squarespaceModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;" ></i></a>
                                                </a></td>
                                            <td><a href="javascript:;" class="star">
                                                    <a href="#" data-toggle="modal" data-target="#squarespaceModal"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                                                </a></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>


                        </div>

                    </div>
                </div>
                <!-- main -->
            </div>
        </div>


        <!-- Add Modal Start -->
        <div class="modal fade" id="addOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:60%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Add New Order</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->

                        <form class="form-horizontal" >
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Choose Drug</h4>
                                    <hr/>
                                    <!-- Select Basic -->
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Search Drug</label>
                                        <div class="col-md-8">
                                            <input class="form-control input-lg" type="text" name="problem"  id="pproblem11" placeholder="Search Drug..." tabindex="4">
                                            <div id="match13"></div>                 
                                        </div>
                                    </div>

                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">ATC Drug Code</label>
                                        <div class="col-md-8">
                                            <select id="addUD_ATC_CODE" name="selectbasic" class="form-control">
                                                <option value="Select ATC Code">Select MDC Code</option>
                                                <%                                            String sql = "SELECT UD_MDC_CODE, D_TRADE_NAME FROM pis_mdc2";
                                                    ArrayList<ArrayList<String>> listofMDCCode = conn.getData(sql);

                                                    int size = listofMDCCode.size();

                                                    for (int i = 0; i < size; i++) {
                                                %>
                                                <option value="<%= listofMDCCode.get(i).get(0)%>"><%= listofMDCCode.get(i).get(1)%> </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                        <div class="col-md-8">
                                            <input id="textinput" name="textinput" type="text" placeholder="Total Stock Quantity"  class="form-control input-md">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Trade Name</label>
                                        <div class="col-md-8">
                                            <input id="textinput" name="textinput" type="text" placeholder="Drug Name" class="form-control input-md">
                                        </div>
                                    </div>

                                    <br/>
                                </div>

                                <div class="col-md-6">
                                    <h4>Drug Details</h4>
                                    <hr/>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Strength</label>
                                        <div class="col-md-8">
                                            <input id="textinput" name="textinput" type="text" placeholder="Drug Strength" class="form-control input-md">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Quantity</label>
                                        <div class="col-md-8">
                                            <input id="textinput" name="textinput" type="text" placeholder="Drug Quantity" class="form-control input-md">
                                        </div>
                                    </div>


                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Frequency</label>
                                        <div class="col-md-8">
                                            <select id="addD_FREQUENCY" name="addD_FREQUENCY" class="form-control">
                                                <option value="No Frequency">No Frequency</option>
                                                <%                                            String sql5 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0088' ";
                                                    ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);

                                                    int size5 = listOfDFreq.size();

                                                    for (int i = 0; i < size5; i++) {
                                                %>
                                                <option value="<%= listOfDFreq.get(i).get(2)%>"><%= listOfDFreq.get(i).get(1)%> - <%= listOfDFreq.get(i).get(2)%> </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Duration</label>
                                        <div class="col-md-4">
                                            <input id="addD_DURATION" name="textinput" type="number" class="form-control input-md" step="0.01" maxlength="12">
                                        </div>
                                        <div class="col-md-4">
                                            <select id="addD_DURATIONT" name="addD_DURATIONT" class="form-control">
                                                <option value="No Duration">No Duration</option>
                                                <%
                                                    String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089' ";
                                                    ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                                    int size6 = listOfDDura.size();

                                                    for (int i = 0; i < size6; i++) {
                                                %>
                                                <option value="<%= listOfDDura.get(i).get(2)%>"><%= listOfDDura.get(i).get(1)%> - <%= listOfDDura.get(i).get(2)%> </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>


                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Instruction</label>
                                        <div class="col-md-8">
                                            <select id="addD_ADVISORY_CODE" name="addD_ADVISORY_CODE" class="form-control">
                                                <option value="No Instruction">No Instruction</option>
                                                <%
                                                    String sql7 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0087' ";
                                                    ArrayList<ArrayList<String>> listOfDInst = conn.getData(sql7);

                                                    int size7 = listOfDInst.size();

                                                    for (int i = 0; i < size7; i++) {
                                                %>
                                                <option value="<%= listOfDInst.get(i).get(2)%>"><%= listOfDInst.get(i).get(1)%> - <%= listOfDInst.get(i).get(2)%> </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Cautionary</label>
                                        <div class="col-md-8">
                                            <textarea id="addD_CAUTIONARY_CODE" class="form-control" rows="3" placeholder="Drug Cautionary" maxlength="150"></textarea>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="addButton">Add</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="reset" id="addReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal End -->    


        <!--Modal add Drug Order Ahmed-->
        <div class="modal fade" id="squarespaceModa20" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Drug Order Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="form-group">
                            <input type="hidden" name="DTO" id="codeDTO" class="form-control input-lg" value="DTO" tabindex="4">
                        </div>

                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="problem"  id="problem11" placeholder="Search Drug..." tabindex="4">
                            <div id="match12" ></div>
                        </div>
                    </div>
                    <div class="modal-header">
                        <h3 class="modal-title" id="lineModalLabel">Drug Details</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="dtoCode"  id="dtoCode" placeholder="Drug Code..." tabindex="4" readonly="">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="qty" id="qty" placeholder="Stock Quantity" readonly="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="pro" id="pro" placeholder="Product Name (GNR_Name)" readonly="">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="pack" id="pack" placeholder="Packaging Type" readonly="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="d_strength" id="d_strength" placeholder="Drug Strength">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="d_strength1" id="d_strength1" placeholder="Drug Strength">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="text" name="dose" id="dose" placeholder="Dose">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="freq" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Frequency [Select]</option>
                                        <option value="Once">Once</option>
                                        <option value="In the morning">In the morning</option>
                                        <option value="At night">At night</option>
                                        <option value="Daily">Daily</option>
                                        <option value="Twice a day">Twice a day</option>
                                        <option value="3 times a day">3 times a day</option>
                                        <option value="4 times a day">4 times a day</option>
                                        <option value="2 hourly">2 hourly</option>
                                        <option value="4 hourly">4 hourly</option>
                                        <option value="6 hourly">6 hourly</option>
                                        <option value="8 hourly">8 hourly</option>
                                        <option value="Immediately">Immediately</option>
                                        <option value="As needed">As needed</option>     
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input class="form-control input-lg" type="number" name="dur1" id="dur1" placeholder="Duration" max = "31" min="1">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="ddwwmm" class="form-control input-lg">
                                        <option value="Day">Day</option>
                                        <option value="Week">Week</option>
                                        <option value="Month">Month</option>     
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <select name="inst" id="inst" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Instruction</option>
                                <option value="If required">If required</option>
                                <option value="As directed">As directed</option>
                                <option value="Before meats">Before meats</option>
                                <option value="Every second day">Every second day</option>
                                <option value="Left side">Left side</option>
                                <option value="Right side">Right side</option>
                                <option value="To both side">To both sides</option>
                                <option value="Other">Other</option> 
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment11" class="form-control input-lg" placeholder="cautionary" tabindex="3"></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptBtn12" role="button">Accept</button>
                            </div>
                            <div class="btn-group btn-delete hidden" role="group">
                                <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End add Drug Order Ahmed -->


        <!-- Bootstrap core JavaScript
         ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="SearchDTO.js" type="text/javascript" ></script>
        <script src="SearchDTO_cd.js" type="text/javascript" ></script>

        <script>
            w3IncludeHTML();

            $('#orderDrugSearch').load('searchPatient.jsp');

//            $('#searchPatient').click(function () {
//                var opt = $('#idType option[disabled]:selected').val();
//
//                if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
//                    bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
//                } else if (opt === "-") {
//                    bootbox.alert('Please select ID Type first.');
//                } else {
//
//                    var idType = $('#idType').find(":selected").val();
//                    var idInput = $('#idInput').val();
//
//                    console.log(idType);
//                    console.log(idInput);
//
//                    var data = {
//                        idType: idType,
//                        idInput: idInput
//                    };
//
//                    console.log(data);
//
//                    $.ajax({
//                        url: "drugOrderSearchPatient.jsp",
//                        type: "post",
//                        data: data,
//                        timeout: 10000,
//                        success: function (datas) {
//
//                            if (datas.trim() === 'No Data') {
//
//                                alert("No Data");
//
//                            } else {
//
//                                var array_data = String(datas).split("|");
//                                console.log(array_data);
//
//                                var pmiNo = array_data[0];
//                                var name = array_data[2];
//                                var icno = array_data[4];
//                                var blood = array_data[16];
//                                var oldicno = array_data[5];
//                                var bdate = array_data[10];
//
//                                $('#idInput').prop('readonly', true);
//                                $('#pmino').val($.trim(pmiNo));
//                                $('#pname').val($.trim(name));
//                                $('#pnic').val($.trim(icno));
//                                $('#pbtype').val($.trim(blood));
//                                $('#poic').val($.trim(oldicno));
//                                $('#pbdate').val($.trim(bdate));
//
//                            }
//
//
//
//                        },
//                        error: function (err) {
//                            console.log("Ajax Is Not Success");
//                        }
//
//                    });
//                }
//            });

//            $(function () {
//                $("#orderSearchMDCCode").on('keyup', function () { // everytime keyup event
//                    var input = $(this).val(); // We take the input value
//                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
//
//                        var dataFields = {
//                            'input': input
//                        }; // We pass input argument in Ajax
//                        
//                        
//                        $.ajax({
//                            type: "POST",
//                            url: "searchMDCCodeOrder.jsp", // call the php file ajax/tuto-autocomplete.php
//                            data: dataFields, // Send dataFields var
//                            timeout: 3000,
//                            success: function (dataBack) { // If success
//                                $('#match18').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
//                                $('#matchList li').on('click', function () { // When click on an element in the list
//                                    $('#orderSearchMDCCode').val($(this).text()); // Update the field with the new element
//                                    $('#match18').text(''); // Clear the <div id="match"></div>
//                                });
//                            },
//                            error: function () { // if error
//                                $('#match18').text('Problem!');
//                            }
//                        });
//                    } else {
//                        $('#match18').text(''); // If less than 2 characters, clear the <div id="match"></div>
//                    }
//                });
//
//
//            });


        </script>

    </body>

</html>