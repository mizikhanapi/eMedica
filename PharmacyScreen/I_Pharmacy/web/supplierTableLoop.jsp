<%-- 
    Document   : atcTable
    Created on : Jan 25, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
%>


<table  id="supplierTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Id</th>
    <th>Name</th>  
    <th>Office No.</th>
    <th>Email</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT Supplier_ID, Supplier_Name,Office_Tel_No,IFNULL(Email,''),IFNULL(Mobile_No,''),IFNULL(Fax_No,''),IFNULL(ADDRESS1,''),IFNULL(ADDRESS2,''),IFNULL(ADDRESS3,''),IFNULL(DISTRICT_CODE,''),IFNULL(TOWN_CODE,''),IFNULL(POSTCODE,''),IFNULL(STATE_CODE,''),IFNULL(COUNTRY_CODE,'') FROM pis_supplier_info";
        ArrayList<ArrayList<String>> dataSupplier = conn.getData(sql);

        int size = dataSupplier.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="dataSupplierhidden" type="hidden" value="<%=String.join("|", dataSupplier.get(i))%>">
<td><%= dataSupplier.get(i).get(0)%></td>
<td><%= dataSupplier.get(i).get(1)%></td>
<td><%= dataSupplier.get(i).get(2)%></td>
<td><%= dataSupplier.get(i).get(3)%></td>
<td>
    <!-- Update Part Start -->
    <a id="supplierUpdateTButton" data-toggle="modal" data-target="#supplierUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="supllierDeleteTButton" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>



<!-- Modal Update Supplier New Start -->
<div class="modal fade" id="supplierUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog"  style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Supplier</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" >
                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier ID:</label>
                                <div class="col-md-8">
                                    <input id="updateSupplier_ID" type="text" class="form-control" placeholder="Supplier ID" readonly maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier Name:</label>
                                <div class="col-md-8">
                                    <input id="updateSupplier_Name" type="text" class="form-control" placeholder="Supplier NAME" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Office No:</label>
                                <div class="col-md-8">
                                    <input id="updateOffice_Tel_No" type="text" class="form-control" placeholder="Office No" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email:</label>
                                <div class="col-md-8">
                                    <input id="updateEmail" type="text" class="form-control" placeholder="Email" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 1:</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS1" type="text" class="form-control" placeholder="Address 1 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 2:</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS2" type="text" class="form-control" placeholder="Address 2 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 3:</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS3" type="text" class="form-control" placeholder="Address 3 (Optional)" maxlength="100">
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District Code:</label>
                                <div class="col-md-8">
                                    <input id="updateDISTRICT_CODE" type="text" class="form-control" placeholder="District Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town Code:</label>
                                <div class="col-md-8">
                                    <input id="updateTOWN_CODE" type="text" class="form-control" placeholder="Town Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode:</label>
                                <div class="col-md-8">
                                    <input id="updatePOSTCODE" type="text" class="form-control" placeholder="Postcode (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State Code:</label>
                                <div class="col-md-8">
                                    <input id="updateSTATE_CODE" type="text" class="form-control" placeholder="State Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Country Code:</label>
                                <div class="col-md-8">
                                    <input id="updateCOUNTRY_CODE" type="text" class="form-control" placeholder="Country Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Mobile No:</label>
                                <div class="col-md-8">
                                    <input id="updateMobile_No" type="text" class="form-control" placeholder="Mobile No (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No:</label>
                                <div class="col-md-8">
                                    <input id="updateFax_No" type="text" class="form-control" placeholder="Fax No (Optional)" maxlength="30">
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
                        <button type="submit" id="updateSupplierModalButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="updateSupplierReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update Supplier New End -->



<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#supplierTable').DataTable();
    });


    $('#contentSupplierTable').off('click', '#supplierTable #supplierUpdateTButton').on('click', '#supplierTable #supplierUpdateTButton', function (e) {
        e.preventDefault();

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataSupplierhidden").val();

        var arrayData = rowData.split("|");
        console.log(arrayData);

        var Supplier_ID = arrayData[0];
        var Supplier_Name = arrayData[1];
        var Office_Tel_No = arrayData[2];
        var Email = arrayData[3];
        var ADDRESS1 = arrayData[6];
        var ADDRESS2 = arrayData[7];
        var ADDRESS3 = arrayData[8];

        var DISTRICT_CODE = arrayData[9];
        var TOWN_CODE = arrayData[10];
        var POSTCODE = arrayData[11];
        var STATE_CODE = arrayData[12];
        var COUNTRY_CODE = arrayData[13];
        var Mobile_No = arrayData[4];
        var Fax_No = arrayData[5];


        $('#updateSupplier_ID').val(Supplier_ID);
        $('#updateSupplier_Name').val(Supplier_Name);
        $('#updateOffice_Tel_No').val(Office_Tel_No);
        $('#updateEmail').val(Email);
        $('#updateADDRESS1').val(ADDRESS1);
        $('#updateADDRESS2').val(ADDRESS2);
        $('#updateADDRESS3').val(ADDRESS3);

        $('#updateDISTRICT_CODE').val(DISTRICT_CODE);
        $('#updateTOWN_CODE').val(TOWN_CODE);
        $('#updatePOSTCODE').val(POSTCODE);
        $('#updateSTATE_CODE').val(STATE_CODE);
        $('#updateCOUNTRY_CODE').val(COUNTRY_CODE);
        $('#updateMobile_No').val(Mobile_No);
        $('#updateFax_No').val(Fax_No);

    });


    $("#updateSupplierModalButton").off('click').on('click', function (e) {

        e.preventDefault();

        var Supplier_ID = $('#updateSupplier_ID').val();
        var Supplier_Name = $('#updateSupplier_Name').val();
        var Office_Tel_No = $('#updateOffice_Tel_No').val();
        var Email = $('#updateEmail').val();
        var ADDRESS1 = $('#updateADDRESS1').val();
        var ADDRESS2 = $('#updateADDRESS2').val();
        var ADDRESS3 = $('#updateADDRESS3').val();

        var DISTRICT_CODE = $('#updateDISTRICT_CODE').val();
        var TOWN_CODE = $('#updateTOWN_CODE').val();
        var POSTCODE = $('#updatePOSTCODE').val();
        var STATE_CODE = $('#updateSTATE_CODE').val();
        var COUNTRY_CODE = $('#updateCOUNTRY_CODE').val();
        var Mobile_No = $('#updateMobile_No').val();
        var Fax_No = $('#updateFax_No').val();

        if (Supplier_ID === "") {
            bootbox.alert("Please Insert The Supplier ID");
        } else if (Supplier_Name === "") {
            bootbox.alert("Please Insert The Supplier Name");
        } else if (Office_Tel_No === "") {
            bootbox.alert("Please Insert The Supplier Office Number");
        } else if (Email === "") {
            bootbox.alert("Please Insert The Supplier Email");
        } else {

            var data = {
                Supplier_ID: Supplier_ID,
                Supplier_Name: Supplier_Name,
                Office_Tel_No: Office_Tel_No,
                Email: Email,
                ADDRESS1: ADDRESS1,
                ADDRESS2: ADDRESS2,
                ADDRESS3: ADDRESS3,
                DISTRICT_CODE: DISTRICT_CODE,
                TOWN_CODE: TOWN_CODE,
                POSTCODE: POSTCODE,
                STATE_CODE: STATE_CODE,
                COUNTRY_CODE: COUNTRY_CODE,
                Mobile_No: Mobile_No,
                Fax_No: Fax_No
            };

            console.log(data);

            $.ajax({
                url: "supplierUpdate.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    if (datas.trim() === 'Success') {
                        $('#contentSupplierTable').load('supplierTableLoop.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert({
                            message: "Supplier is Updated Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert({
                            message: "Supplier Update Failed",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                },
                error: function (err) {
                    alert("Error Ajax Update!");
                }

            });

        }
    });



    $('#contentSupplierTable').off('click', '#supplierTable #supllierDeleteTButton').on('click', '#supplierTable #supllierDeleteTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataSupplierhidden").val();
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
                        url: "supplierDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentSupplierTable').load('supplierTableLoop.jsp');
                                bootbox.alert({
                                    message: "Supplier is Deleted Successful",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "Supplier Delete Failed",
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

    $("#updateSupplierButton").click(function () {
        alert("In Update");

    });
</script>
