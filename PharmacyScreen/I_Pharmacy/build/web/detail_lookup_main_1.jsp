<%-- 
    Document   : detail_lookup_main
    Created on : Jan 26, 2017, 11:11:51 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    LOOKUP DETAIL MANAGEMENT
    <span class="pull-right">
        <button id="btnAddNewTest" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail2" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Lookup Detail</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg" style="color: red"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Lookup Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master code</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="masterCode2" placeholder="Master Code" maxlength="30">
                            <div id="match">
                                <!--for search area-->
                            </div>


                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail code</label>
                        <div class="col-md-8">
                            <input id="detailCode" maxlength="30" name="detailCode" type="text" placeholder="Lookup Detail Code" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Name</label>
                        <div class="col-md-8">
                            <input id="detailName" maxlength="200" name="detailName" type="text" placeholder="Lookup Detail Name" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Priority</label>
                        <div class="col-md-8">
                            <input id="DLM_priority"  type="number" maxlength="10" placeholder="Prority indicator" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Date</label>
                        <div class="col-md-8">
                            <input id="DLM_startDate" type="text" placeholder="Date(dd/mm/yyyy)" class="form-control input-md" readonly="true">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Date</label>
                        <div class="col-md-8">
                            <input id="DLM_endDate" type="text" placeholder="Date(dd/mm/yyyy)" class="form-control input-md" readonly="true">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status2" id="status2_1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status2" id="status2_2" value="0">
                                Inactive
                            </label>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnAdd2">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset2" class="btn btn-default btn-block btn-lg" role="button" >Reset</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


<script>

    w3IncludeHTML();

    $(document).ready(function () {

        var isMasterCodeExist = false;

        $('#DLM_startDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        $('#DLM_endDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        function reset() {
            document.getElementById("masterCode2").value = "";
            document.getElementById("detailCode").value = "";
            document.getElementById("detailName").value = "";
            document.getElementById("DLM_priority").value = "";
            document.getElementById("DLM_startDate").value = "";
            document.getElementById("DLM_endDate").value = "";
            document.getElementById("status2_1").checked = false;
            document.getElementById("status2_2").checked = false;
        }

        $('#btnReset2').on('click', function () {
            reset();
            $('#DLM_endDate').datepicker('option', 'minDate', null);
        });

        $('#btnAddNewTest').on('click', function () {

            reset();
            isMasterCodeExist = false;
            $('#DLM_endDate').datepicker('option', 'minDate', null);

        });

        $('#btnAdd2').on('click', function () {
            var masterCode = $('#masterCode2').val();
            var detailCode = $('#detailCode').val();
            var detailName = $('#detailName').val();
            var priority = $('#DLM_priority').val();
            var startDate = $('#DLM_startDate').val();
            var endDate = $('#DLM_endDate').val();
            var status = $('input[name="status2"]:checked').val();

            var startDateX = $('#DLM_startDate').datepicker('getDate');
            var endDateX = $('#DLM_endDate').datepicker('getDate');

            if (masterCode === "" || masterCode === "Select Master Code" || masterCode === null) {
                alert("Fill in the Master Code");
                $('#masterCode2').focus();

            } else if (isMasterCodeExist === false) {
                alert("Please choose existing master code");
                $('#masterCode2').focus();

            } else if (detailCode === "") {
                alert("Complete The Fields");
                $('#detailCode').focus();

            } else if (detailName === "") {
                alert("Complete The Fields");
                $('#detailName').focus();

            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");

            } else if (priority === "" || priority === null) {
                alert("Fill in the priority indicator");
                $('#DLM_priority').focus();

            } else if (startDate === "" || startDate === null) {
                alert("Select the start date");
                $('#DLM_startDate').focus();

            } else if (endDate === "" || endDate === null) {
                alert("Select the end date");
                $('#DLM_endDate').focus();

            } else if (startDateX > endDateX) {
                alert("End date must be later than start date");
                $('#DLM_endDate').datepicker('option', 'minDate', startDateX);
                $('#DLM_endDate').focus();

            } else {

                var arrayData = $('#masterCode2').val().split("|");
                masterCode = arrayData[0].trim();
                console.log(startDate + " " + endDate);

                var data = {
                    masterCode: masterCode,
                    detailCode: detailCode,
                    detailName: detailName,
                    priority: priority,
                    startDate: startDate,
                    endDate: endDate,
                    status: status
                };

                $.ajax({
                    url: "detail_lookup_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 5000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#detailTable').load('detail_lookup_table_1.jsp');
                            $('#detail2').modal('hide');
                            alert("Insertion Success");
                            reset();

                        } else if (datas.trim() === 'Failed') {

                            alert("Insertion failed!");
                            $('#detail2').modal('hide');
                            reset();

                        } else {

                            alert(datas.trim());
                            $('#detailCode').val("");
                            $('#detailCode').focus();
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success: ");
                    }

                });
            }

        });

        $("#masterCode2").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#match').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchList li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#masterCode2').val($(this).text());
                            $('#match').text(''); // Clear the <div id="match"></div>
                            isMasterCodeExist = true;
                            var arrayData = $('#masterCode2').val().split("|");
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#match').text('Problem!');
                    }
                });
            } else {
                $('#match').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }
        });



    });



</script>