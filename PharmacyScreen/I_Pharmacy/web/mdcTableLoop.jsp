<%-- 
    Document   : atcTable
    Created on : Jan 26, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<table  id="mdcTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>MDC CODE</th>
    <th>ATC CODE</th>
    <th>TRADE NAME</th>
    <th>GNR NAME</th>
    <th>ROUTE_CODE</th>
    <th>FORM CODE</th>
    <th>STRENGTH</th>
    <th>ADVISORY CODE</th>
    <th>STOCK QTY</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sqlMain = " SELECT UD_MDC_CODE,UD_ATC_CODE,D_TRADE_NAME,D_GNR_NAME,D_ROUTE_CODE,D_FORM_CODE,D_STRENGTH,D_ADVISORY_CODE,D_STOCK_QTY,D_QTY,D_QTYT,D_DURATION,D_DURATIONT,D_FREQUENCY,D_CAUTION_CODE,D_EXP_DATE,D_CLASSIFICATION,STATUS,D_LOCATION_CODE,D_SELL_PRICE,D_COST_PRICE,D_PACKAGING,D_PACKAGINGT,D_PRICE_PPACK FROM pis_mdc2 ";
        ArrayList<ArrayList<String>> dataMTC = conn.getData(sqlMain);

        int sizeMain = dataMTC.size();
        for (int s = 0; s < sizeMain; s++) {
    %>
    <%
        if (Integer.parseInt(dataMTC.get(s).get(8)) < 100) {    %>
    <tr style="font-weight:bolder; color:red;" >
        <% } else {   %>
    <tr >
        <%   }%>

<input id="dataMDChidden" type="hidden" value="<%=String.join("|", dataMTC.get(s))%>">
<td><%= dataMTC.get(s).get(0)%></td>
<td><%= dataMTC.get(s).get(1)%></td>
<td><%= dataMTC.get(s).get(2)%></td>
<td><%= dataMTC.get(s).get(3)%></td>
<td><%= dataMTC.get(s).get(4)%></td>
<td><%= dataMTC.get(s).get(5)%></td>
<td><%= dataMTC.get(s).get(6)%></td>
<td><%= dataMTC.get(s).get(7)%></td>
<td><%= dataMTC.get(s).get(8)%></td>
<td>
    <!-- Update Button Start -->
    <a id="mdcUpdateTButton" data-toggle="modal" data-target="#mdcUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Button End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="mdcDeleteTButton" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>

</tbody>
</table>


<!-- Modal Update MTC End -->
<div class="modal fade" id="mdcUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update MTC Code</h3>
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
                                    <input id="updateUD_MDC_CODE" name="textinput" type="text" placeholder="Drug Code" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">ATC Drug Code</label>
                                <div class="col-md-8">
                                    <select id="updateUD_ATC_CODE" name="selectbasic" class="form-control">
                                        <option value="Select ATC Code">Select ATC Code</option>
                                        <%
                                            String sql = "SELECT UD_ATC_CODE, UD_ATC_Desc FROM pis_atc";
                                            ArrayList<ArrayList<String>> listofATCCode = conn.getData(sql);

                                            int size = listofATCCode.size();

                                            for (int i = 0;
                                                    i < size;
                                                    i++) {
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
                                    <input id="updateD_TRADE_NAME" name="textinput" type="text" placeholder="Product Name" class="form-control input-md" maxlength="200">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Generic Name</label>
                                <div class="col-md-8">
                                    <textarea id="updateD_GNR_NAME" class="form-control" rows="3" maxlength="500"></textarea>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Drug Route</label>
                                <div class="col-md-8">
                                    <select id="updateD_ROUTE_CODE" name="selectbasic" class="form-control">
                                        <option value="Select Drug Route">Select Drug Route</option>
                                        <%
                                            String sql2 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0066' ";
                                            ArrayList<ArrayList<String>> listOfDRoute = conn.getData(sql2);

                                            int size2 = listOfDRoute.size();

                                            for (int i = 0;
                                                    i < size2;
                                                    i++) {
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
                                    <select id="updateD_FORM_CODE" name="selectbasic" class="form-control">
                                        <option value="Select Dosage Form">Select Dosage Form</option>
                                        <%
                                            String sql3 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0067' ";
                                            ArrayList<ArrayList<String>> listOfDForm = conn.getData(sql3);

                                            int size3 = listOfDForm.size();

                                            for (int i = 0;
                                                    i < size3;
                                                    i++) {
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
                                    <input id="updateD_STRENGTH" name="textinput" type="text" placeholder="Strength" class="form-control input-md" maxlength="50">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateD_STOCK_QTY" name="textinput" type="number" step="0.01" placeholder="Stock Qty" class="form-control input-md" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Location Code</label>
                                <div class="col-md-8">
                                    <input id="updateD_LOCATION_CODE" name="textinput" type="text" placeholder="Location Code" class="form-control input-md" maxlength="4">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Status</label>
                                <div class="col-md-8">
                                    <select id="updateSTATUS" name="addSTATUS" class="form-control">
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
                                    <input id="updateD_PACKAGING" name="textinput" type="text" placeholder="Packaging" class="form-control input-md" maxlength="60">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Price per Pack</label>
                                <div class="col-md-8">
                                    <input id="updateD_PRICE_PPACK" name="textinput" type="text" placeholder="Price per Pack" class="form-control input-md" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Purchase Price</label>
                                <div class="col-md-8">
                                    <input id="updateD_COST_PRICE" name="textinput" type="text" placeholder="Purchase Price" class="form-control input-md" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Sell Price</label>
                                <div class="col-md-8">
                                    <input id="updateD_SELL_PRICE" name="textinput" type="text" placeholder="Sell Price" class="form-control input-md" maxlength="20">
                                </div>
                            </div>


                            <h4>Label Information</h4>
                            <hr/>
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dose</label>
                                <div class="col-md-4">
                                    <input id="updateD_QTY" name="textinput" type="text" class="form-control input-md" step="0.01" maxlength="20">
                                </div>
                                <div class="col-md-4">
                                    <select id="updateD_QTYT" name="addD_QTYT" class="form-control">
                                        <option value="No Dose">No Dose</option>
                                        <%
                                            String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0025' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);

                                            int size4 = listOfDUOM.size();

                                            for (int i = 0;
                                                    i < size4;
                                                    i++) {
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
                                    <select id="updateD_FREQUENCY" name="addD_FREQUENCY" class="form-control">
                                        <option value="No Frequency">No Frequency</option>
                                        <%
                                            String sql5 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0088' ";
                                            ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);

                                            int size5 = listOfDFreq.size();

                                            for (int i = 0;
                                                    i < size5;
                                                    i++) {
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
                                    <input id="updateD_DURATION" name="textinput" type="number" class="form-control input-md" step="0.01" maxlength="60">
                                </div>
                                <div class="col-md-4">
                                    <select id="updateD_DURATIONT" name="addD_DURATIONT" class="form-control">
                                        <option value="No Duration">No Duration</option>
                                        <%
                                            String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089' ";
                                            ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                            int size6 = listOfDDura.size();

                                            for (int i = 0;
                                                    i < size6;
                                                    i++) {
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
                                    <select id="updateD_ADVISORY_CODE" name="addD_ADVISORY_CODE" class="form-control">
                                        <option value="No Instruction">No Instruction</option>
                                        <%
                                            String sql7 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0087' ";
                                            ArrayList<ArrayList<String>> listOfDInst = conn.getData(sql7);

                                            int size7 = listOfDInst.size();

                                            for (int i = 0;
                                                    i < size7;
                                                    i++) {
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
                                    <textarea id="updateD_CAUTIONARY_CODE" class="form-control" rows="3" placeholder="Drug Cautionary" maxlength="150"></textarea>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Expire Date</label>
                                <div class="col-md-8">
                                    <input id="updateD_EXP_DATE" name="updateD_EXP_DATE" type="text" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Classification</label>
                                <div class="col-md-8">
                                    <select id="updateD_CLASSIFICATION" name="updateD_CLASSIFICATION" class="form-control">
                                        <option value="No Classification">No Classification</option>
                                        <%
                                            String sql8 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0091' ";
                                            ArrayList<ArrayList<String>> listOfDClass = conn.getData(sql8);

                                            int size8 = listOfDClass.size();

                                            for (int i = 0;
                                                    i < size8;
                                                    i++) {
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
                        <button type="submit" id="updateMDCButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="updateMDCReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update MTC End -->


<script type="text/javascript">

    $("#updateD_EXP_DATE").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        minDate: '0'
    });


    $('#contentMDCTable').off('click', '#mdcTable #mdcDeleteTButton').on('click', '#mdcTable #mdcDeleteTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataMDChidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var iditem = arrayData[0];
        console.log(iditem);


        bootbox.confirm({
            message: "Are you sure want to delete this item?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {
                    var data = {
                        iditem: iditem
                    };

                    $.ajax({
                        url: "mdcDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentMDCTable').load('mdcTableLoop.jsp');
                                bootbox.alert({
                                    message: "MDC Code is Deleted Successful",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "MDC Code Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

    });


    $('#contentMDCTable').off('click', '#mdcTable #mdcUpdateTButton').on('click', '#mdcTable #mdcUpdateTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataMDChidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var UD_MDC_CODE = arrayData[0];
        var UD_ATC_CODE = arrayData[1];
        var D_TRADE_NAME = arrayData[2];
        var D_GNR_NAME = arrayData[3];
        var D_ROUTE_CODE = arrayData[4];
        var D_FORM_CODE = arrayData[5];
        var D_STRENGTH = arrayData[6];
        var D_STOCK_QTY = arrayData[8];
        var D_LOCATION_CODE = arrayData[18];
        var STATUS = arrayData[17];

        var D_PACKAGING = arrayData[21];
        var D_PRICE_PPACK = arrayData[23];
        var D_COST_PRICE = arrayData[20];
        var D_SELL_PRICE = arrayData[19];
        var D_QTY = arrayData[9];
        var D_QTYT = arrayData[10];
        var D_FREQUENCY = arrayData[13];
        var D_DURATION = arrayData[11];
        var D_DURATIONT = arrayData[12];
        var D_ADVISORY_CODE = arrayData[7];
        var D_CAUTIONARY_CODE = arrayData[14];
        var D_EXP_DATE = arrayData[15];
        var D_CLASSIFICATION = arrayData[16];


        $("#updateUD_MDC_CODE").val(UD_MDC_CODE);
        $("#updateUD_ATC_CODE").val(UD_ATC_CODE);
        $("#updateD_TRADE_NAME").val(D_TRADE_NAME);
        $("#updateD_GNR_NAME").val(D_GNR_NAME);
        $("#updateD_ROUTE_CODE").val(D_ROUTE_CODE);
        $("#updateD_FORM_CODE").val(D_FORM_CODE);
        $("#updateD_STRENGTH").val(D_STRENGTH);
        $("#updateD_STOCK_QTY").val(D_STOCK_QTY);
        $("#updateD_LOCATION_CODE").val(D_LOCATION_CODE);
        $("#updateSTATUS").val(STATUS);

        $("#updateD_PACKAGING").val(D_PACKAGING);
        $("#updateD_PRICE_PPACK").val(D_PRICE_PPACK);
        $("#updateD_COST_PRICE").val(D_COST_PRICE);
        $("#updateD_SELL_PRICE").val(D_SELL_PRICE);
        $("#updateD_QTY").val(D_QTY);
        $("#updateD_QTYT").val(D_QTYT);
        $("#updateD_FREQUENCY").val(D_FREQUENCY);
        $("#updateD_DURATION").val(D_DURATION);
        $("#updateD_DURATIONT").val(D_DURATIONT);
        $("#updateD_ADVISORY_CODE").val(D_ADVISORY_CODE);
        $("#updateD_CAUTIONARY_CODE").val(D_CAUTIONARY_CODE);
        $("#updateD_EXP_DATE").val(D_EXP_DATE);
        $("#updateD_CLASSIFICATION").val(D_CLASSIFICATION);

    });


    $("#updateMDCButton").off('click').on('click', function (e) {

        e.preventDefault();

        var UD_MDC_CODE = $("#updateUD_MDC_CODE").val();
        var UD_ATC_CODE = $("#updateUD_ATC_CODE").val();
        var D_TRADE_NAME = $("#updateD_TRADE_NAME").val();
        var D_GNR_NAME = $("#updateD_GNR_NAME").val();
        var D_ROUTE_CODE = $("#updateD_ROUTE_CODE").val();
        var D_FORM_CODE = $("#updateD_FORM_CODE").val();
        var D_STRENGTH = $("#updateD_STRENGTH").val();
        var D_STOCK_QTY = $("#updateD_STOCK_QTY").val();
        var D_LOCATION_CODE = $("#updateD_LOCATION_CODE").val();
        var STATUS = $("#updateSTATUS").val();

        var D_PACKAGING = $("#updateD_PACKAGING").val();
        var D_PRICE_PPACK = $("#updateD_PRICE_PPACK").val();
        var D_COST_PRICE = $("#updateD_COST_PRICE").val();
        var D_SELL_PRICE = $("#updateD_SELL_PRICE").val();
        var D_QTY = $("#updateD_QTY").val();
        var D_QTYT = $("#updateD_QTYT").val();
        var D_FREQUENCY = $("#updateD_FREQUENCY").val();
        var D_DURATION = $("#updateD_DURATION").val();
        var D_DURATIONT = $("#updateD_DURATIONT").val();
        var D_ADVISORY_CODE = $("#updateD_ADVISORY_CODE").val();
        var D_CAUTIONARY_CODE = $("#updateD_CAUTIONARY_CODE").val();
        var D_EXP_DATE = $("#updateD_EXP_DATE").val();
        var D_CLASSIFICATION = $("#updateD_CLASSIFICATION").val();

        if (UD_MDC_CODE === "") {
            bootbox.alert("Please Insert MDC Code");
        } else if (UD_ATC_CODE === "Select ATC Code" || UD_ATC_CODE === null) {
            bootbox.alert("Select Any ATC Code");
        } else if (D_TRADE_NAME === "") {
            bootbox.alert("Please Insert Drug Trade Name");
        } else if (D_GNR_NAME === "") {
            bootbox.alert("Please Insert Drug Generic Name");
        } else if (D_ROUTE_CODE === "Select Drug Route" || D_ROUTE_CODE === null) {
            bootbox.alert("Select Any Route");
        } else if (D_FORM_CODE === "Select Dosage Form" || D_FORM_CODE === null) {
            bootbox.alert("Select Any Form");
        } else if (D_STRENGTH === "") {
            bootbox.alert("Please Insert Drug Strength");
        } else if (D_STOCK_QTY === "") {
            bootbox.alert("Please Insert Drug Stock Quantity");
        } else if (D_LOCATION_CODE === "") {
            bootbox.alert("Please Insert Drug Location Code");
        } else if (STATUS === "No Status" || STATUS === null) {
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
        } else if (D_QTYT === "No Dose" || D_QTYT === null) {
            bootbox.alert("Select Any Dose");
        } else if (D_FREQUENCY === "No Frequency" || D_FREQUENCY === null) {
            bootbox.alert("Select Any Frequency");
        } else if (D_DURATION === "") {
            bootbox.alert("Please Insert Drug Duration");
        } else if (D_DURATIONT === "No Duration" || D_DURATIONT === null) {
            bootbox.alert("Select Any Duration");
        } else if (D_ADVISORY_CODE === "No Instruction" || D_ADVISORY_CODE === null) {
            bootbox.alert("Select Any Instruction");
        } else if (D_CAUTIONARY_CODE === "") {
            bootbox.alert("Please Insert Drug Cautionary Code");
        } else if (D_EXP_DATE === "") {
            bootbox.alert("Please Insert Drug Expire Date");
        } else if (D_CLASSIFICATION === "No Classification" || D_CLASSIFICATION === null) {
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
                url: "mdcUpdate.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    if (datas.trim() === 'Success') {
                        $('#contentMDCTable').load('mdcTableLoop.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert({
                            message: "MDC Code is Updated Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert({
                            message: "MDC Code Update Failed",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });

        }
    });

</script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#mdcTable').DataTable();
    });
</script>