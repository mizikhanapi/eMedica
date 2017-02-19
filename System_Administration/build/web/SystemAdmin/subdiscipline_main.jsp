<%-- 
    Document   : subdiscipline_main
    Created on : Feb 5, 2017, 10:25:54 PM
    Author     : user
--%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    SUBDISCIPLINE MANAGEMENT
    <span class="pull-right">
        <button id="SDM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#SDM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Subdiscipline</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="SDM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg" style="color: red"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Subdiscipline</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline code</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="SDM_disciplineCode" placeholder="Discipline Code" maxlength="30">
                            <div id="SDM_match">
                                <!--for search area-->
                            </div>


                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Name</label>
                        <div class="col-md-8">
                            <input id="SDM_subdisciplineName" maxlength="100"  type="text" placeholder="Subdiscipline Name" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Code</label>
                        <div class="col-md-8">
                            <input id="SDM_subdisciplineCode" maxlength="30" type="text" placeholder="Subdiscipline Code" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Type</label>
                        <div class="col-md-8">
                            <input id="SDM_type"  type="text" maxlength="30" placeholder="Subdiscipline Type" class="form-control input-md">
                        </div>
                    </div>

                   
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" id="SDM_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="SDM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="SDM_btnReset" class="btn btn-default btn-block btn-lg" role="button" >Reset</button>
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

        var isDisCodeExist = false;
        
        function SDM_reset() {
            
            document.getElementById("SDM_disciplineCode").value = "";
            document.getElementById("SDM_subdisciplineName").value = "";
            document.getElementById("SDM_subdisciplineCode").value = "";
            document.getElementById("SDM_type").value = "";
            
        }

        $('#SDM_btnReset').on('click', function () {
            SDM_reset();
            
        });

        $('#SDM_btnAddNew').on('click', function () {
            
            isDisCodeExist = false;
            SDM_reset();

        });

        $('#SDM_btnAdd').on('click', function () {
            
            var disciplineCode = $('#SDM_disciplineCode').val();
            var subdisciplineName = $('#SDM_subdisciplineName').val();
            var subdisciplineCode = $('#SDM_subdisciplineCode').val();
            var type = $('#SDM_type').val();
            var status = $('#SDM_status').val();

            if (disciplineCode === "" || disciplineCode === "Select Discipline Code" || disciplineCode === null) {
                alert("Fill in the Discipline Code");
                $('#SDM_disciplineCode').focus();

            } else if (subdisciplineName === "") {
                alert("Fill in the subdiscipline name");
                $('#SDM_subdisciplineName').focus();

            } else if (subdisciplineCode === "") {
                alert("Fill in the subdiscipline code");
                $('#SDM_subdisciplineCode').focus();

            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");

            } else if (isDisCodeExist === false) {
                alert("Please choose existing discipline");
                $('#SDM_disciplineCode').val("");
                $('#SDM_disciplineCode').focus();
                
            } else {

                var arrayData = $('#SDM_disciplineCode').val().split("|");
                disciplineCode = arrayData[0].trim();
               

                var data = {
                    disciplineCode: disciplineCode,
                    subdisciplineName: subdisciplineName,
                    subdisciplineCode: subdisciplineCode,
                    type: type,
                    status: status
                };

                $.ajax({
                    url: "subdiscipline_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 5000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#subdisciplineTable').load('subdiscipline_table.jsp');
                            $('#SDM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                    message: "New subdiscipline is added",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            reset();

                        } else if (datas.trim() === 'Failed') {

                            alert("Insertion failed!");
                            $('#SDM_detail').modal('hide');
                            reset();

                        } else {
                            
                            //alert(datas.trim());
                            bootbox.alert({
                                    message: datas.trim(),
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                            if(datas.trim().toString().includes("subdiscipline")){
                                 $('#SDM_subdisciplineCode').val("");
                                $('#SDM_subdisciplineCode').focus();
                                
                            }else if(datas.trim().toString().includes("discipline")){
                                                               
                                $('#SDM_disciplineCode').val("");
                                $('#SDM_disciplineCode').focus();
                            }    
                            
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success: ");
                    }

                });
            }

        });

        $("#SDM_disciplineCode").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#SDM_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="SDM_match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "SDM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#SDM_match').html(dataBack); // Return data (UL list) and insert it in the <div id="SDM_match"></div>
                        $('#SDM_matchList li').on('click', function () { // When click on an element in the list
                            //$('#SDM_disciplineCode').text($(this).text()); // Update the field with the new element
                            $('#SDM_disciplineCode').val($(this).text());
                            $('#SDM_match').text(''); // Clear the <div id="SDM_match"></div>
                            var arrayData = $('#SDM_disciplineCode').val().split("|");
                            isDisCodeExist = true;
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#SDM_match').text('Problem!');
                    }
                });
            } else {
                $('#SDM_match').text(''); // If less than 2 characters, clear the <div id="SDM_match"></div>
            }
        });



    });



</script>
