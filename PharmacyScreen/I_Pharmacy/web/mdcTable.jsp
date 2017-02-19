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
        String sqlMain = " SELECT UD_MDC_CODE,UD_ATC_CODE,D_TRADE_NAME,D_GNR_NAME,D_ROUTE_CODE,D_FORM_CODE,D_STRENGTH,D_ADVISORY_CODE,D_STOCK_QTY,D_QTY,D_QTYT,D_DURATION,D_DURATIONT,D_FREQUENCY,D_CAUTION_CODE,D_EXP_DATE,D_CLASSIFICATION,STATUS,D_LOCATION_CODE,D_SELL_PRICE,D_COST_PRICE,D_PACKAGING,D_PACKAGINGT,D_PRICE_PPACK,MINIMUM_STOCK_LEVEL FROM pis_mdc2 ";
        ArrayList<ArrayList<String>> dataMTC = conn.getData(sqlMain);

        int sizeMain = dataMTC.size();
        for (int s = 0; s < sizeMain; s++) {
    %>

    <tr>
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

            <!-- Update Part Start -->
            <a data-toggle="modal" data-target="#mdcUpdateModal_<%=s%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>


            <!-- Modal Add MTC Start -->
            <div class="modal fade" id="mdcUpdateModal_<%=s%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
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
                                                <input id="updateUD_MDC_CODE_<%=s%>" name="textinput" type="text" placeholder="Drug Code" class="form-control input-md" value="<%=dataMTC.get(s).get(0)%>" readonly>
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">ATC Drug Code</label>
                                            <div class="col-md-8">
                                                <select id="updateUD_ATC_CODE_<%=s%>" name="selectbasic" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(1)%>"><%= dataMTC.get(s).get(1)%></option>
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
                                                <input id="updateD_TRADE_NAME_<%=s%>" name="textinput" type="text" placeholder="Product Name" class="form-control input-md" value="<%= dataMTC.get(s).get(2)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Generic Name</label>
                                            <div class="col-md-8">
                                                <textarea id="updateD_GNR_NAME_<%=s%>" class="form-control" rows="3"><%= dataMTC.get(s).get(3)%></textarea>
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Drug Route</label>
                                            <div class="col-md-8">
                                                <select id="updateD_ROUTE_CODE_<%=s%>" name="selectbasic" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(4)%>"><%= dataMTC.get(s).get(4)%></option>
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
                                                <select id="updateD_FORM_CODE_<%=s%>" name="selectbasic" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(5)%>"><%= dataMTC.get(s).get(5)%></option>
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
                                                <input id="updateD_STRENGTH_<%=s%>" name="textinput" type="text" placeholder="Strength" class="form-control input-md" value="<%= dataMTC.get(s).get(6)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                            <div class="col-md-8">
                                                <input id="updateD_STOCK_QTY_<%=s%>" name="textinput" type="number" step="0.01" placeholder="Stock Qty" class="form-control input-md" value="<%= dataMTC.get(s).get(8)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Location Code</label>
                                            <div class="col-md-8">
                                                <input id="updateD_LOCATION_CODE_<%=s%>" name="textinput" type="text" placeholder="Location Code" class="form-control input-md" value="<%= dataMTC.get(s).get(18)%>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Status</label>
                                            <div class="col-md-8">
                                                <select id="updateSTATUS_<%=s%>" name="addSTATUS" class="form-control">
                                                    <option value="1" <% if (dataMTC.get(s).get(17).equals("1")) {
                                                            out.print("selected");
                                                        } %>>Active</option>
                                                    <option value="0" <% if (dataMTC.get(s).get(17).equals("0")) {
                                                            out.print("selected");
                                                        }%>>Inactive</option>    
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Stock Minimum Quantity</label>
                                            <div class="col-md-8">
                                                <input id="updateMINIMUM_STOCK_LEVEL_<%=s%>" name="textinput" type="number" step="0.01" placeholder="Minimum Stock Qty" class="form-control input-md" value="<%= dataMTC.get(s).get(24)%>">
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
                                                <input id="updateD_PACKAGING_<%=s%>" name="textinput" type="text" placeholder="Packaging" class="form-control input-md" value="<%= dataMTC.get(s).get(21)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Price per Pack</label>
                                            <div class="col-md-8">
                                                <input id="updateD_PRICE_PPACK_<%=s%>" name="textinput" type="text" placeholder="Price per Pack" class="form-control input-md" value="<%= dataMTC.get(s).get(23)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Purchase Price</label>
                                            <div class="col-md-8">
                                                <input id="updateD_COST_PRICE_<%=s%>" name="textinput" type="text" placeholder="Purchase Price" class="form-control input-md" value="<%= dataMTC.get(s).get(20)%>">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Sell Price</label>
                                            <div class="col-md-8">
                                                <input id="updateD_SELL_PRICE_<%=s%>" name="textinput" type="text" placeholder="Sell Price" class="form-control input-md" value="<%= dataMTC.get(s).get(19)%>">
                                            </div>
                                        </div>


                                        <h4>Label Information</h4>
                                        <hr/>
                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Dose</label>
                                            <div class="col-md-4">
                                                <input id="updateD_QTY_<%=s%>" name="textinput" type="text" class="form-control input-md" value="<%= dataMTC.get(s).get(9)%>">
                                            </div>
                                            <div class="col-md-4">
                                                <select id="updateD_QTYT_<%=s%>" name="addD_QTYT" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(10)%>"><%= dataMTC.get(s).get(10)%></option>
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
                                                <select id="updateD_FREQUENCY_<%=s%>" name="addD_FREQUENCY" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(13)%>"><%= dataMTC.get(s).get(13)%></option>
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
                                                <input id="updateD_DURATION_<%=s%>" name="textinput" type="number" class="form-control input-md" value="<%= dataMTC.get(s).get(11)%>">
                                            </div>
                                            <div class="col-md-4">
                                                <select id="updateD_DURATIONT_<%=s%>" name="addD_DURATIONT" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(12)%>"><%= dataMTC.get(s).get(12)%></option>
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
                                                <select id="updateD_ADVISORY_CODE_<%=s%>" name="addD_ADVISORY_CODE" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(7)%>"><%= dataMTC.get(s).get(7)%></option>
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
                                                <textarea id="updateD_CAUTIONARY_CODE_<%=s%>" class="form-control" rows="3"><%= dataMTC.get(s).get(14)%></textarea>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Expire Date</label>
                                            <div class="col-md-8">
                                                <input id="updateD_EXP_DATE_<%=s%>" name="updateD_EXP_DATE" type="text" class="form-control input-md" value="<%= dataMTC.get(s).get(15)%>">
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Classification</label>
                                            <div class="col-md-8">
                                                <select id="updateD_CLASSIFICATION_<%=s%>" name="updateD_CLASSIFICATION" class="form-control">
                                                    <option value="<%= dataMTC.get(s).get(16)%>"><%= dataMTC.get(s).get(16)%></option>
                                                    <%
                                                        String sql8 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089' ";
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
                                    <button type="submit" id="updateMDCButton_<%=s%>" class="btn btn-success btn-block btn-lg" role="button">Add</button>
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
            <!-- Modal Add MTC End -->

        </td>
        <!-- Update Part End -->

        <!-- Delete Part Start -->
        <td>
            <!-- Delete Button Start -->
            <a id="mdcDeleteButton_<%=s%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
            <!-- Delete Button End -->

            <script type="text/javascript" charset="utf-8">

                $(document).ready(function () {

                    $("#updateD_EXP_DATE_<%=s%>").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'dd/mm/yy'
                    });

                    $("#mdcDeleteButton_<%=s%>").click(function () {
                        console.log("In delete");

                        var conf = confirm('Are you sure want to delete?');
                        if (conf) {

                            var data = {
                                iditem: "<%=dataMTC.get(s).get(0)%>"
                            };

                            console.log(data);

                            $.ajax({
                                url: "mdcDelete.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    if (datas.trim() === 'Success') {
                                        $('#contentMDCTable').load('mdcTable.jsp');
                                        alert("Delete Success");
                                    } else if (datas.trim() === 'Failed') {
                                        alert("Delete failed!");
                                    }

                                },
                                error: function (err) {
                                    alert("Error! Deletion failed!!");
                                }

                            });

                        }

                    });

                    $("#updateMDCButton_<%=s%>").click(function () {

                        console.log("In Update");
                        var UD_MDC_CODE = document.getElementById("updateUD_MDC_CODE_<%=s%>").value;
                        var UD_ATC_CODE = document.getElementById("updateUD_ATC_CODE_<%=s%>").value;
                        var D_TRADE_NAME = document.getElementById("updateD_TRADE_NAME_<%=s%>").value;
                        var D_GNR_NAME = document.getElementById("updateD_GNR_NAME_<%=s%>").value;
                        var D_ROUTE_CODE = document.getElementById("updateD_ROUTE_CODE_<%=s%>").value;
                        var D_FORM_CODE = document.getElementById("updateD_FORM_CODE_<%=s%>").value;
                        var D_STRENGTH = document.getElementById("updateD_STRENGTH_<%=s%>").value;
                        var D_STOCK_QTY = document.getElementById("updateD_STOCK_QTY_<%=s%>").value;
                        var D_LOCATION_CODE = document.getElementById("updateD_LOCATION_CODE_<%=s%>").value;
                        var STATUS = document.getElementById("updateSTATUS_<%=s%>").value;
                        var MINIMUM_STOCK_LEVEL = document.getElementById("updateMINIMUM_STOCK_LEVEL_<%=s%>").value;

                        var D_PACKAGING = document.getElementById("updateD_PACKAGING_<%=s%>").value;
                        var D_PRICE_PPACK = document.getElementById("updateD_PRICE_PPACK_<%=s%>").value;
                        var D_COST_PRICE = document.getElementById("updateD_COST_PRICE_<%=s%>").value;
                        var D_SELL_PRICE = document.getElementById("updateD_SELL_PRICE_<%=s%>").value;
                        var D_QTY = document.getElementById("updateD_QTY_<%=s%>").value;
                        var D_QTYT = document.getElementById("updateD_QTYT_<%=s%>").value;
                        var D_FREQUENCY = document.getElementById("updateD_FREQUENCY_<%=s%>").value;
                        var D_DURATION = document.getElementById("updateD_DURATION_<%=s%>").value;
                        var D_DURATIONT = document.getElementById("updateD_DURATIONT_<%=s%>").value;
                        var D_ADVISORY_CODE = document.getElementById("updateD_ADVISORY_CODE_<%=s%>").value;
                        var D_CAUTIONARY_CODE = document.getElementById("updateD_CAUTIONARY_CODE_<%=s%>").value;
                        var D_EXP_DATE = document.getElementById("updateD_EXP_DATE_<%=s%>").value;
                        var D_CLASSIFICATION = document.getElementById("updateD_CLASSIFICATION_<%=s%>").value;


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
                            MINIMUM_STOCK_LEVEL: MINIMUM_STOCK_LEVEL,
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
                                    $('#contentMDCTable').load('mdcTable.jsp');
                                    $(".modal-backdrop").hide();
                                    alert("Update Success");
                                } else if (datas.trim() === 'Failed') {
                                    alert("Update failed!");

                                }
                            },
                            error: function (err) {
                                alert("Error update!");
                            }

                        });
                    });


                });
            </script>  
        </td>
        <!-- Delete Part End -->


    </tr>

    <%
        }
    %>

</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#mdcTable').DataTable();
    });
</script>