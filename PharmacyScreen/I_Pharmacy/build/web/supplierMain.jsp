<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    SUPPLIER MEDICINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#supplierAddModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD SUPPLIER</button>
    </span>
</h4>
<!-- Add Button End -->
<div class="modal fade" id="supplierAddModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add Supplier</h3>
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
                                    <input id="addSupplier_ID" type="text" class="form-control" placeholder="Supplier ID" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier Name:</label>
                                <div class="col-md-8">
                                    <input id="addSupplier_Name" type="text" class="form-control" placeholder="Supplier Name" maxlength="100" >
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Office No:</label>
                                <div class="col-md-8">
                                    <input id="addOffice_Tel_No" type="text" class="form-control" placeholder="Office No" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email:</label>
                                <div class="col-md-8">
                                    <input id="addEmail" type="text" class="form-control" placeholder="Email" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 1:</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS1" type="text" class="form-control"  placeholder="Address 1 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 2:</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS2" type="text" class="form-control" placeholder="Address 2 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 3:</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS3" type="text" class="form-control" placeholder="Address 3 (Optional)" maxlength="100">
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District Code:</label>
                                <div class="col-md-8">
                                    <input id="addDISTRICT_CODE" type="text" class="form-control" placeholder="District Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town Code:</label>
                                <div class="col-md-8">
                                    <input id="addTOWN_CODE" type="text" class="form-control" placeholder="Town Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode:</label>
                                <div class="col-md-8">
                                    <input id="addPOSTCODE" type="text" class="form-control" placeholder="Postcode (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State Code:</label>
                                <div class="col-md-8">
                                    <input id="addSTATE_CODE" type="text" class="form-control" placeholder="State Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Country Code:</label>
                                <div class="col-md-8">
                                    <input id="addCOUNTRY_CODE" type="text" class="form-control" placeholder="Country Code (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Mobile No:</label>
                                <div class="col-md-8">
                                    <input id="addMobile_No" type="text" class="form-control" placeholder="Mobile No (Optional)" maxlength="30">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No:</label>
                                <div class="col-md-8">
                                    <input id="addFax_No" type="text" class="form-control" placeholder="Fax No (Optional)" maxlength="30">
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
                        <button type="submit" id="addSupplierButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="addSupplierReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->


<script>

    w3IncludeHTML();

    $(document).ready(function () {


        function reset() {
            document.getElementById("addSupplier_ID").value = "";
            document.getElementById("addSupplier_Name").value = "";
            document.getElementById("addOffice_Tel_No").value = "";
            document.getElementById("addEmail").value = "";
            document.getElementById("addADDRESS1").value = "";
            document.getElementById("addADDRESS2").value = "";
            document.getElementById("addADDRESS3").value = "";

            document.getElementById("addDISTRICT_CODE").value = "";
            document.getElementById("addTOWN_CODE").value = "";
            document.getElementById("addPOSTCODE").value = "";
            document.getElementById("addSTATE_CODE").value = "";
            document.getElementById("addCOUNTRY_CODE").value = "";
            document.getElementById("addMobile_No").value = "";
            document.getElementById("addFax_No").value = "";
        }

        $('#addSupplierReset').on('click', function () {
            reset();
        });

        $('#addSupplierButton').on('click', function () {

            var Supplier_ID = $('#addSupplier_ID').val();
            var Supplier_Name = $('#addSupplier_Name').val();
            var Office_Tel_No = $('#addOffice_Tel_No').val();
            var Email = $('#addEmail').val();
            var ADDRESS1 = $('#addADDRESS1').val().trim();
            var ADDRESS2 = $('#addADDRESS2').val();
            var ADDRESS3 = $('#addADDRESS3').val();

            var DISTRICT_CODE = $('#addDISTRICT_CODE').val();
            var TOWN_CODE = $('#addTOWN_CODE').val();
            var POSTCODE = $('#addPOSTCODE').val();
            var STATE_CODE = $('#addSTATE_CODE').val();
            var COUNTRY_CODE = $('#addCOUNTRY_CODE').val();
            var Mobile_No = $('#addMobile_No').val();
            var Fax_No = $('#addFax_No').val();

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

                $.ajax({
                    url: "supplierInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentSupplierTable').load('supplierTableLoop.jsp');
                            $('#supplierAddModal').modal('hide');
                            $('#detail').modal('hide');
                            bootbox.alert({
                                message: "Supllier is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Supplier ID Duplication Detected. Please use diffrerent Supplier ID",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Supplier Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#supplierAddModal').modal('hide');
                            reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });
            }

        });


    });



</script>

