<%-- 
    Document   : patientOrderListBasicInfo
    Created on : Feb 7, 2017, 2:44:32 PM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4>Basic Info</h4>
    <hr/>
    <form class="form-horizontal" name="patientOrderDetailContentBasicInfoForm" id="patientOrderDetailContentBasicInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient PMI No.</label>
                    <div class="col-md-8">
                        <input id="patientpmino" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient Name</label>
                    <div class="col-md-8">
                        <input id="patientName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient New IC No.</label>
                    <div class="col-md-8">
                        <input id="patientnic" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient Gender</label>
                    <div class="col-md-8">
                        <input id="patientGender" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient Birthday Date</label>
                    <div class="col-md-8">
                        <input id="patientBdate" name="patientBdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Patient Blood Type</label>
                    <div class="col-md-8">
                        <input id="patientBtype" name="patientBtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
</div>



<div class="thumbnail">
    <h4>Order Info</h4>
    <hr/>
    <form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Received No.</label>
                    <div class="col-md-8">
                        <input id="patientOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Received Date</label>
                    <div class="col-md-8">
                        <input id="patientOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Location Code</label>
                    <div class="col-md-8">
                        <input id="patientOrderLocationCode" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
</div>


<div class="thumbnail">
    <h4>List of Order</h4>
    <div id="patientOrderDetailsListTableDiv" class="form-group">


        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
            <thead>
            <th>Order No</th>
            <th>Code</th>
            <th>Description</th>
            <th>Strength</th>
            <th>Frequency</th>
            <th>Duration</th>
            <th>Duration Type</th>
            <th>Dose</th>
            <th>Ordered Qty</th>
            <th>Stock Qty</th>
            <th>Dispense Qty</th>
            <th>Price/Pack</th>
            <th>Total Price</th>
            <th>Status</th>
            <th>Action</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>



<div class="thumbnail">
    <h4>List of Drug Order To Be Dispensed</h4>
    <div id="patientOrderDetailsListDispenseTableDiv" class="form-group">

        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListDispenseTable">
            <thead>
            <th>Order No</th>
            <th>Code</th>
            <th>Description</th>
            <th>Strength</th>
            <th>Frequency</th>
            <th>Duration</th>
            <th>Duration Type</th>
            <th>Dose</th>
            <th>Ordered Qty</th>
            <th>Stock Qty</th>
            <th>Dispense Qty</th>
            <th>Price/Pack</th>
            <th>Total Price</th>
            <th>Status</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>

    <div class="text-center" id="patientOrderDetailsListDispenseButtonDiv"> 
        <button class="btn btn-success " type="button" id="btnOrderDetailDispense" name="btnOrderDetailDispense" > <i class="fa fa- fa-lg"></i>&nbsp; Dispense</button>
        <button class="btn btn-primary " type="button" id="btnOrderDetailPrescribe" name="btnOrderDetailPrescribe" > <i class="fa fa-tablet fa-lg"></i>&nbsp; Prescribe</button>
        <button class="btn btn-primary " type="button" id="test" name="btnOrderDetailPrescribe" onclick="test()"> <i class="fa fa-tablet fa-lg"></i>&nbsp; Prescribe</button>
    </div>
</div>


<div class="thumbnail">
    <div class="text-center"> 
        <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnClearOrderDetailDispense" > <i class="fa fa-ban fa-lg"></i>&nbsp; Clear Screen</button>
    </div>
</div>

<script>


    // Move to Order Details Fetch Details
    $('#patientOrderListContent').off('click', '#patientOrderListTable #moveToOrderDetailsTButton').on('click', '#patientOrderListTable #moveToOrderDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var patientpmino = arrayData[1];
        var patientName = arrayData[15];
        var patientnic = arrayData[16];
        var patientGender = arrayData[18];
        var patientBdate = arrayData[17];
        var patientBtype = arrayData[19];
        var patientOrderNo = arrayData[0];
        var patientOrderDate = arrayData[5];
        var patientOrderLocationCode = arrayData[2];


        //Set value to the Second Tab 
        $("#patientpmino").val(patientpmino);
        $("#patientName").val(patientName);
        $("#patientnic").val(patientnic);
        $("#patientGender").val(patientGender);
        $("#patientBdate").val(patientBdate);
        $("#patientBtype").val(patientBtype);
        $("#patientOrderNo").val(patientOrderNo);
        $("#patientOrderDate").val(patientOrderDate);
        $("#patientOrderLocationCode").val(patientOrderLocationCode);

        loadOrder(patientOrderNo);

    });



    // Move to Order Details Load Table Data
    function loadOrder(orderNo) {

        var data = {
            orderNo: orderNo
        };

        $.ajax({
            url: "patientOrderListDetails.jsp",
            type: "post",
            data: data,
            timeout: 3000,
            success: function (returnOrderDetailsTableHTML) {
                //console.log(returnOrderDetailsTableHTML);
                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                $('.nav-tabs a[href="#tab_default_2"]').tab('show');

            }
        });
    }



    // Move to Dispense Details Fetch Details
    $('#patientOrderDetailContent').off('click', '#patientOrderDetailsListTable #moveToOrderDispenseDetailsTButton').on('click', '#patientOrderDetailsListTable #moveToOrderDispenseDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        var orderNo = arrayData[0];
        var orderProductCode = arrayData[1];

        dispenceDetail(orderNo, orderProductCode);

    });



    // Move to Dispence Details Load Table Data
    function dispenceDetail(orderNo, orderProductCode) {

        var data = {
            orderNo: orderNo,
            orderProductCode: orderProductCode
        };

        $.ajax({
            url: "patientOrderListDetailsDespense.jsp",
            type: "post",
            data: data,
            timeout: 3000,
            success: function (returnOrderDetailsTableHTML) {
                //console.log(returnOrderDetailsTableHTML);
                $('#patientOrderDetailsListDispenseTable').html(returnOrderDetailsTableHTML);
                //reloadOrderListTable(orderNo, orderProductCode);
            }
        });
    }


    // Reload Table Function
    function reloadOrderListTable(orderNo, orderProductCode) {
        console.log(orderNo);
        console.log(orderProductCode);

        var data = {
            orderNo: orderNo,
            orderProductCode: orderProductCode
        };

        $.ajax({
            url: "patientOrderListDetailsReloadTable.jsp",
            type: "post",
            data: data,
            timeout: 3000,
            success: function (returnOrderDetailsTableHTML) {
                console.log(returnOrderDetailsTableHTML);
                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
            }
        });
    }


    // Get Order Data
    $('#patientOrderDetailContent').off('click', '#patientOrderDetailsListDispenseTable #updateDispenseDetailsTButton').on('click', '#patientOrderDetailsListDispenseTable #updateDispenseDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderDetailsListDispensehidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        var updateOrderNo = arrayData[0];
        var updateDrugCode = arrayData[1];
        var updateOrderedQuantity = parseInt(arrayData[11]);
        var updateDispensedQuantity = parseInt(arrayData[14]);

        $("#updateOrderNo").val(updateOrderNo);
        $("#updateDrugCode").val(updateDrugCode);
        $("#updateOrderedDrugQuantity").val(updateOrderedQuantity);
        $("#updateDispensedDrugQuantity").val(updateDispensedQuantity);

    });



    // Update Order Data
    $('#updateDispenceOrder').on('click', '#updateOrderMButton', function (e) {

        e.preventDefault();

        var ORDER_NO = $("#updateOrderNo").val();
        var DRUG_ITEM_CODE = $("#updateDrugCode").val();
        var QTY_ORDERED = $("#updateOrderedDrugQuantity").val();
        var QTY_DISPENSED = $("#updateDispensedDrugQuantity").val();

        var data = {
            ORDER_NO: ORDER_NO,
            DRUG_ITEM_CODE: DRUG_ITEM_CODE,
            QTY_ORDERED: QTY_ORDERED,
            QTY_DISPENSED: QTY_DISPENSED
        };

        var dataOrderNo = {
            orderNo: ORDER_NO
        };

        var dataDispence = {
            orderNo: ORDER_NO,
            orderProductCode: DRUG_ITEM_CODE
        };

        console.log(data);
        console.log(dataOrderNo);
        console.log(dataDispence);

        $.ajax({
            url: "patientOrderListDetailsDispenceUpdate.jsp",
            type: "post",
            data: data,
            timeout: 3000,
            success: function (datas) {
                if (datas.trim() === 'Success') {

                    $.ajax({
                        url: "patientOrderListDetails.jsp",
                        type: "post",
                        data: dataOrderNo,
                        timeout: 3000,
                        success: function (returnOrderDetailsTableHTML) {

                            $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                            $.ajax({
                                url: "patientOrderListDetailsDespense.jsp",
                                type: "post",
                                data: dataDispence,
                                timeout: 3000,
                                success: function (returnOrderDetailsTableHTML) {
                                    $('#patientOrderDetailsListDispenseTable').html(returnOrderDetailsTableHTML);
                                    $('#updateDispenceOrder').modal('hide');
                                }
                            });

                        }
                    });

                } else if (datas.trim() === 'Failed') {
                    alert("Update Failed");
                }
            },
            error: function (err) {
                alert("Error update!");
            }

        });

    });



    // Dispense Order Data
    $('#patientOrderDetailsListDispenseButtonDiv').on('click', '#btnOrderDetailDispense', function (e) {

        e.preventDefault();

        var row = $("#patientOrderDetailsListDispenseTable");
        var rowData = row.find("#dataPatientOrderDetailsListDispensehidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        var patientpmino = $("#patientpmino").val();
        var patientName = $("#patientName").val();
        var patientnic = $("#patientnic").val();
        var patientGender = $("#patientGender").val();
        var patientBdate = $("#patientBdate").val();
        var patientBtype = $("#patientBtype").val();

        var patientOrderNo = $("#patientOrderNo").val();
        var patientOrderDate = $("#patientOrderDate").val();
        var patientOrderLocationCode = $("#patientOrderLocationCode").val();

        var data = {
            patientpmino: patientpmino,
            patientName: patientName,
            patientnic: patientnic,
            patientGender: patientGender,
            patientBdate: patientBdate,
            patientBtype: patientBtype,
            patientOrderNo: patientOrderNo,
            patientOrderDate: patientOrderDate,
            patientOrderLocationCode: patientOrderLocationCode
        };

        console.log(data);

    });



    // Prescribe Order Data
    $('#patientOrderDetailsListDispenseButtonDiv').on('click', '#btnOrderDetailPrescribe', function (e) {

        e.preventDefault();

        var row = $("#patientOrderDetailsListDispenseTable");
        var rowData = row.find("#dataPatientOrderDetailsListDispensehidden").val();
        console.log(rowData);
        var arrayData = rowData.split("|");
        console.log(arrayData);


    });


    function test() {
        var pmhType = "PMI_NO";
        var pmhInput = "9509140262903";
        window.open("print.jsp?pmhType=" + pmhType + '&amp;pmhInput=' + pmhInput);
    }

    // Reset Fields    
    $('#patientOrderDetailContent').on('click', '#btnClearOrderDetailDispense', function (e) {
        document.getElementById("patientOrderDetailContentBasicInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#patientOrderDetailContent #patientOrderDetailsListTableDiv").load("patientOrderListBasicInfo.jsp #patientOrderDetailsListTableDiv");
        $("#patientOrderDetailContent #patientOrderDetailsListDispenseTableDiv").load("patientOrderListBasicInfo.jsp #patientOrderDetailsListDispenseTableDiv");
    });



</script>