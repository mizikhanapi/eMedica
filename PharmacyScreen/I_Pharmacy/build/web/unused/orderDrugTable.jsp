<%-- 
    Document   : orderDrugTable
    Created on : Feb 13, 2017, 11:23:16 AM
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


<div class="thumbnail" id="orderAddDetailsListTableDiv">

    <h4>
        Drug Order Details
        <div class="pull-right">
            <button id="orderDrugTableAddDrugTButton" name="orderDrugTableAddDrugTButton" class="btn btn-primary" data-toggle="modal" data-target="#addOrderDrug"><i class="fa fa-plus fa-lg"></i>&nbsp; New Order</button>
            <button id="orderDrugTableNewListTButton" name="button1id" class="btn btn-default"><i class="fa fa-plus fa-lg"></i>&nbsp; New Order List</button>
            <button id="orderDrugTablePrescribeTButton" name="button2id" class="btn btn-default"><i class="fa fa-file-text fa-lg"></i>&nbsp; Prescribe</button>
        </div>
    </h4>

    <table id="orderAddDetailsListTable" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">
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

        </tbody>
    </table>

</div>



<!-- Add Modal Start -->
<div class="modal fade" id="addOrderDrug" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
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

                            <h4>Order Details</h4>
                            <hr/>
                            <%     String query1 = "SELECT MAX(item_code) FROM far_miscellaneous_item";
                                ArrayList<ArrayList<String>> data1 = conn.getData(query1);
                                String itemCode = data1.get(0).get(0);
                                itemCode = itemCode.replaceAll("[^0-9]", "");
                                itemCode = String.valueOf(Integer.parseInt(itemCode) + 1);

                                String code = "RG";
                                for (int i = 0; itemCode.length() < 5; i++) {
                                    itemCode = "0" + itemCode;
                                }
                                code = code + itemCode;
                            %>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Order ID</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDetailsID" name="orderDrugDetailsID" type="text" placeholder="Drug Order ID" value="<%= code %>"  class="form-control input-md">
                                </div>
                            </div> 

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Order Date</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDetailsDate" name="orderDrugDetailsDate" type="text" placeholder="Drug Order Date"  class="form-control input-md">
                                </div>
                            </div>

                            <br/>



                            <h4>Choose Drug</h4>
                            <hr/>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Search Drug</label>
                                <div class="col-md-8">
                                    <input id="orderDrugSearchInput" name="orderDrugSearchInput" type="text" placeholder="Search Drug"  class="form-control input-md">
                                    <div id="orderDrugSearchInputDisplayResult"></div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Search Drug</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayDrugCode" name="orderDrugDisplayDrugCode" type="text" placeholder="Drug Code"  class="form-control input-md" readonly>
                                </div>
                            </div>                           

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Trade Name</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayTradeName" name="orderDrugDisplayStockQuantity" type="text" placeholder="Drug Name" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayStockQuantity" name="orderDrugDisplayStockQuantity" type="text" placeholder="Total Stock Quantity"  class="form-control input-md" readonly>
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


<script type="text/javascript">

    //$("#orderAddDetailsListTableDiv").hide();


//js Search in add drug
    $(function () {
        $("#orderDrugSearchInput").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#orderDrugSearchInputDisplayResult').html('<img src="LoaderIcon.gif"/>'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {'input': input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#orderDrugSearchInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#orderDrugSearchInputDisplayResult li').on('click', function () { // When click on an element in the list
                            $('#orderDrugSearchInput').val($(this).text()); // Update the field with the new element
                            $('#orderDrugSearchInputDisplayResult').text(''); // Clear the <div id="match"></div>
                        });
                    },
                    error: function () { // if error
                        $('#orderDrugSearchInputDisplayResult').text('No Eecord Found !');
                    }
                });
            } else {
                $('#orderDrugSearchInputDisplayResult').text('Problem!'); // If less than 2 characters, clear the <div id="match"></div>
            }
        });
    });
//End js Search in add drug


//Start js Search Select drug
    $('#orderDrugSearchInputDisplayResult').on('click', function () {
        var id = $('#orderDrugSearchInput').val();
        $.ajax({
            type: 'post',
            url: 'SearchDTO_cd.jsp',
            data: {'id': id},
            success: function (reply_data) {
                var array_data = String(reply_data).split("|");
                var dtoCode = array_data[0];
                var dtoGnr = array_data[1];
                var dtoQty = array_data[2];
                var dtoPackage = array_data[3];
                console.log(dtoCode);

                $('#orderDrugDisplayDrugCode').val(dtoCode);
                $('#orderDrugDisplayTradeName').val(dtoGnr);
                $('#orderDrugDisplayStockQuantity').val(dtoQty);
                $('#pack').val(dtoPackage);

            }
        });
    });
    //End js Search Select drug


// Add Button Function

</script>