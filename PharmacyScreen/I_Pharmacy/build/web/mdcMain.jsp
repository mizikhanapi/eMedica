<%-- 
    Document   : atcMain
    Created on : Jan 26, 2017, 9:59:32 AM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>


<%
    Conn conn = new Conn();
%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MDC MEDICINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#mdcAddModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD MDC CODE</button>
    </span>
</h4>
<!-- Add Button End -->
<!-- Modal Add MTC Start -->
<div class="modal fade" id="mdcAddModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New MTC Code</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" >
                    <div class="row">
                        <div class="col-md-6">
                            <h4>Drug Information</h4>
                            <hr/>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">MDC Drug Code</label>
                                <div class="col-md-8">
                                    <input id="addUD_MDC_CODE" name="textinput" type="text" placeholder="Drug Code" class="form-control input-md" maxlength="25" >
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">ATC Drug Code</label>
                                <div class="col-md-8">
                                    <select id="addUD_ATC_CODE" name="selectbasic" class="form-control">
                                        <option value="Select ATC Code">Select ATC Code</option>
                                        <%
                                            String sql = "SELECT UD_ATC_CODE, UD_ATC_Desc FROM pis_atc";
                                            ArrayList<ArrayList<String>> listofATCCode = conn.getData(sql);

                                            int size = listofATCCode.size();

                                            for (int i = 0; i < size; i++) {
                                        %>
                                        <option value="<%= listofATCCode.get(i).get(0)%>"><%= listofATCCode.get(i).get(0)%> - <%= listofATCCode.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Product Name</label>
                                <div class="col-md-8">
                                    <input id="addD_TRADE_NAME" name="textinput" type="text" placeholder="Product Name" class="form-control input-md" maxlength="200">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Generic Name</label>
                                <div class="col-md-8">
                                    <textarea id="addD_GNR_NAME" class="form-control" rows="3" maxlength="500" placeholder="Generic Name"></textarea>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Drug Route</label>
                                <div class="col-md-8">
                                    <select id="addD_ROUTE_CODE" name="selectbasic" class="form-control">
                                        <option value="Select Drug Route">Select Drug Route</option>
                                        <%
                                            String sql2 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0066' ";
                                            ArrayList<ArrayList<String>> listOfDRoute = conn.getData(sql2);

                                            int size2 = listOfDRoute.size();

                                            for (int i = 0; i < size2; i++) {
                                        %>
                                        <option value="<%= listOfDRoute.get(i).get(2)%>"><%= listOfDRoute.get(i).get(1)%> - <%= listOfDRoute.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dosage Form</label>
                                <div class="col-md-8">
                                    <select id="addD_FORM_CODE" name="selectbasic" class="form-control">
                                        <option value="Select Dosage Form">Select Dosage Form</option>
                                        <%
                                            String sql3 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0067' ";
                                            ArrayList<ArrayList<String>> listOfDForm = conn.getData(sql3);

                                            int size3 = listOfDForm.size();

                                            for (int i = 0; i < size3; i++) {
                                        %>
                                        <option value="<%= listOfDForm.get(i).get(2)%>"><%= listOfDForm.get(i).get(1)%> - <%= listOfDForm.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Strength</label>
                                <div class="col-md-8">
                                    <input id="addD_STRENGTH" name="textinput" type="text" placeholder="Drug Strength" class="form-control input-md" maxlength="50">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="addD_STOCK_QTY" name="textinput" type="number" placeholder="Stock Qty" class="form-control input-md" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Location Code</label>
                                <div class="col-md-8">
                                    <input id="addD_LOCATION_CODE" name="textinput" type="text" placeholder="Location Code" class="form-control input-md" maxlength="4">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Status</label>
                                <div class="col-md-8">
                                    <select id="addSTATUS" name="addSTATUS" class="form-control">
                                        <option value="No Status">No Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>     
                                    </select>
                                </div>
                            </div>


                        </div>


                        <div class="col-md-6">

                            <h4>Purchase</h4>
                            <hr/>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Packaging</label>
                                <div class="col-md-8">
                                    <input id="addD_PACKAGING" name="textinput" type="number" placeholder="Packaging" class="form-control input-md" step="0.01" maxlength="60">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Price per Pack</label>
                                <div class="col-md-8">
                                    <input id="addD_PRICE_PPACK" name="textinput" type="number" placeholder="Price per Pack" class="form-control input-md" step="0.01" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Purchase Price</label>
                                <div class="col-md-8">
                                    <input id="addD_COST_PRICE" name="textinput" type="number" placeholder="Purchase Price" class="form-control input-md" step="0.01" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Sell Price</label>
                                <div class="col-md-8">
                                    <input id="addD_SELL_PRICE" name="textinput" type="number" placeholder="Sell Price" class="form-control input-md" step="0.01" maxlength="20">
                                </div>
                            </div>


                            <h4>Label Information</h4>
                            <hr/>
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dose</label>
                                <div class="col-md-4">
                                    <input id="addD_QTY" name="textinput" type="number" class="form-control input-md" step="0.01" maxlength="20">
                                </div>
                                <div class="col-md-4">
                                    <select id="addD_QTYT" name="addD_QTYT" class="form-control">
                                        <option value="No Dose">No Dose</option>
                                        <%
                                            String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0025' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);

                                            int size4 = listOfDUOM.size();

                                            for (int i = 0; i < size4; i++) {
                                        %>
                                        <option value="<%= listOfDUOM.get(i).get(2)%>"><%= listOfDUOM.get(i).get(1)%> - <%= listOfDUOM.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Frequency</label>
                                <div class="col-md-8">
                                    <select id="addD_FREQUENCY" name="addD_FREQUENCY" class="form-control" >
                                        <option value="No Frequency">No Frequency</option>
                                        <%
                                            String sql5 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0088' ";
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
                                    <input id="addD_DURATION" name="textinput" type="number" class="form-control input-md" step="0.01" maxlength="60">
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

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Expire Date</label>
                                <div class="col-md-8">
                                    <input id="addD_EXP_DATE" name="addD_EXP_DATE" type="text"class="form-control input-md" placeholder="Expire Date" readonly>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Classification</label>
                                <div class="col-md-8">
                                    <select id="addD_CLASSIFICATION" name="addD_CLASSIFICATION" class="form-control">
                                        <option value="No Classification">No Classification</option>
                                        <%
                                            String sql8 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0091' ";
                                            ArrayList<ArrayList<String>> listOfDClass = conn.getData(sql8);

                                            int size8 = listOfDClass.size();

                                            for (int i = 0; i < size8; i++) {
                                        %>
                                        <option value="<%= listOfDClass.get(i).get(2)%>"><%= listOfDClass.get(i).get(1)%> - <%= listOfDClass.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
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
                        <button type="submit" id="addMDCButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="addMDCReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add MTC End -->
<!-- Add Part End -->


<script>

    w3IncludeHTML();

    $(document).ready(function () {

        $("#addD_EXP_DATE").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            minDate: '0'
        });

        function reset() {
            console.log("In reset");
            document.getElementById("addUD_MDC_CODE").value = "";
            document.getElementById("addUD_ATC_CODE").value = "Select ATC Code";
            document.getElementById("addD_TRADE_NAME").value = "";
            document.getElementById("addD_GNR_NAME").value = "";
            document.getElementById("addD_ROUTE_CODE").value = "Select Drug Route";
            document.getElementById("addD_FORM_CODE").value = "Select Dosage Form";
            document.getElementById("addD_STRENGTH").value = "";
            document.getElementById("addD_STOCK_QTY").value = "";
            document.getElementById("addD_LOCATION_CODE").value = "";
            document.getElementById("addSTATUS").value = "No Status";

            document.getElementById("addD_PACKAGING").value = "";
            document.getElementById("addD_PRICE_PPACK").value = "";
            document.getElementById("addD_COST_PRICE").value = "";
            document.getElementById("addD_SELL_PRICE").value = "";
            document.getElementById("addD_QTY").value = "";
            document.getElementById("addD_QTYT").value = "No Dose";
            document.getElementById("addD_FREQUENCY").value = "No Frequency";
            document.getElementById("addD_DURATION").value = "";
            document.getElementById("addD_DURATIONT").value = "No Duration";
            document.getElementById("addD_ADVISORY_CODE").value = "No Instruction";
            document.getElementById("addD_CAUTIONARY_CODE").value = "";
            document.getElementById("addD_EXP_DATE").value = "";
            document.getElementById("addD_CLASSIFICATION").value = "No Classification";
        }

        $('#addMDCReset').on('click', function () {
            reset();
        });

        $('#addMDCButton').on('click', function () {

            console.log("In add");
            var UD_MDC_CODE = document.getElementById("addUD_MDC_CODE").value;
            var UD_ATC_CODE = document.getElementById("addUD_ATC_CODE").value;
            var D_TRADE_NAME = document.getElementById("addD_TRADE_NAME").value;
            var D_GNR_NAME = document.getElementById("addD_GNR_NAME").value;
            var D_ROUTE_CODE = document.getElementById("addD_ROUTE_CODE").value;
            var D_FORM_CODE = document.getElementById("addD_FORM_CODE").value;
            var D_STRENGTH = document.getElementById("addD_STRENGTH").value;
            var D_STOCK_QTY = document.getElementById("addD_STOCK_QTY").value;
            var D_LOCATION_CODE = document.getElementById("addD_LOCATION_CODE").value;
            var STATUS = document.getElementById("addSTATUS").value;

            var D_PACKAGING = document.getElementById("addD_PACKAGING").value;
            var D_PRICE_PPACK = document.getElementById("addD_PRICE_PPACK").value;
            var D_COST_PRICE = document.getElementById("addD_COST_PRICE").value;
            var D_SELL_PRICE = document.getElementById("addD_SELL_PRICE").value;
            var D_QTY = document.getElementById("addD_QTY").value;
            var D_QTYT = document.getElementById("addD_QTYT").value;
            var D_FREQUENCY = document.getElementById("addD_FREQUENCY").value;
            var D_DURATION = document.getElementById("addD_DURATION").value;
            var D_DURATIONT = document.getElementById("addD_DURATIONT").value;
            var D_ADVISORY_CODE = document.getElementById("addD_ADVISORY_CODE").value;
            var D_CAUTIONARY_CODE = document.getElementById("addD_CAUTIONARY_CODE").value;
            var D_EXP_DATE = document.getElementById("addD_EXP_DATE").value;
            var D_CLASSIFICATION = document.getElementById("addD_CLASSIFICATION").value;



            if (UD_MDC_CODE === "") {
                bootbox.alert("Please Insert MDC Code");
            } else if (UD_ATC_CODE === "Select ATC Code") {
                bootbox.alert("Select Any ATC Code");
            } else if (D_TRADE_NAME === "") {
                bootbox.alert("Please Insert Drug Trade Name");
            } else if (D_GNR_NAME === "") {
                bootbox.alert("Please Insert Drug Generic Name");
            } else if (D_ROUTE_CODE === "Select Drug Route") {
                bootbox.alert("Select Any Route");
            } else if (D_FORM_CODE === "Select Dosage Form") {
                bootbox.alert("Select Any Form");
            } else if (D_STRENGTH === "") {
                bootbox.alert("Please Insert Drug Strength");
            } else if (D_STOCK_QTY === "") {
                bootbox.alert("Please Insert Drug Stock Quantity");
            } else if (D_LOCATION_CODE === "") {
                bootbox.alert("Please Insert Drug Location Code");
            } else if (STATUS === "No Status") {
                bootbox.alert("Select Any Status");

            } else if (D_PACKAGING === "") {
                bootbox.alert("Please Insert Drug Packaging");
            } else if (D_PRICE_PPACK === "") {
                bootbox.alert("Please Insert Drug Per Pack Price");
            } else if (D_COST_PRICE === "") {
                bootbox.alert("Please Insert Drug Cost Price");
            } else if (D_SELL_PRICE === "") {
                bootbox.alert("Please Insert Drug Sell Price");
            } else if (D_QTY === "") {
                bootbox.alert("Please Insert Drug Quantity");
            } else if (D_QTYT === "No Dose") {
                bootbox.alert("Select Any Dose");
            } else if (D_FREQUENCY === "No Frequency") {
                bootbox.alert("Select Any Frequency");
            } else if (D_DURATION === "") {
                bootbox.alert("Please Insert Drug Duration");
            } else if (D_DURATIONT === "No Duration") {
                bootbox.alert("Select Any Duration");
            } else if (D_ADVISORY_CODE === "No Instruction") {
                bootbox.alert("Select Any Instruction");
            } else if (D_CAUTIONARY_CODE === "") {
                bootbox.alert("Please Insert Drug Cautionary Code");
            } else if (D_EXP_DATE === "") {
                bootbox.alert("Please Insert Drug Expire Date");
            } else if (D_CLASSIFICATION === "No Classification") {
                bootbox.alert("Select Any Classification");
            } else {

                var data = {
                    UD_MDC_CODE: UD_MDC_CODE,
                    UD_ATC_CODE: UD_ATC_CODE,
                    D_TRADE_NAME: D_TRADE_NAME,
                    D_GNR_NAME: D_GNR_NAME,
                    D_ROUTE_CODE: D_ROUTE_CODE,
                    D_FORM_CODE: D_FORM_CODE,
                    D_STRENGTH: D_STRENGTH,
                    D_STOCK_QTY: D_STOCK_QTY,
                    D_LOCATION_CODE: D_LOCATION_CODE,
                    STATUS: STATUS,
                    D_PACKAGING: D_PACKAGING,
                    D_PRICE_PPACK: D_PRICE_PPACK,
                    D_COST_PRICE: D_COST_PRICE,
                    D_SELL_PRICE: D_SELL_PRICE,
                    D_QTY: D_QTY,
                    D_QTYT: D_QTYT,
                    D_FREQUENCY: D_FREQUENCY,
                    D_DURATION: D_DURATION,
                    D_DURATIONT: D_DURATIONT,
                    D_ADVISORY_CODE: D_ADVISORY_CODE,
                    D_CAUTIONARY_CODE: D_CAUTIONARY_CODE,
                    D_EXP_DATE: D_EXP_DATE,
                    D_CLASSIFICATION: D_CLASSIFICATION
                };
                console.log(data);

                $.ajax({
                    url: "mdcInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentMDCTable').load('mdcTableLoop.jsp');
                            $('#mdcAddModal').modal('hide');
                            bootbox.alert({
                                message: "MDC Code is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "MDC Code Duplication Detected. Please use diffrerent MDC code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "MDC Code Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#mdcAddModal').modal('hide');
                            reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });



    });



</script>

