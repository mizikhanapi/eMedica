<%-- 
    Document   : assignDiscipline_main
    Created on : Feb 13, 2017, 7:16:22 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ASSIGN DISCIPLINE TO HEALTH FACILITY
    <span class="pull-right">
        <button id="ADM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#ADM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>New Assignment</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="ADM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">New Discipline Assignment</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="ADM_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Health Facility</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADM_hfc" placeholder="Health Facility">
                            <div id="ADM_hfc_match">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline</label>
                        <div class="col-md-8">
                             <input type="text"  class="form-control" id="ADM_discipline" placeholder="Discipline">
                            <div id="ADM_discipline_match">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline</label>
                        <div class="col-md-8">
                             <input type="text"  class="form-control" id="ADM_subdiscipline" placeholder="Subdiscipline">
                            <div id="ADM_subdiscipline_match">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>
                     
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="ADM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="ADM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="ADM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            var isHFCSelected = false;
            var selectedHFC = "";
            var isDisciplineSelected = false;
            var selectedDiscipline = "";
            var isSubdisciplineSelected = false;
            var selectedSubdiscipline = "";
            
            function ADM_reset() {
//               $('#ADM_select_HFC').val('0');
//               $('#ADM_select_discipline').val('0');
//               $('#ADM_select_subdiscipline').val('0');
//               $('#ADM_status').val('0');
                 document.getElementById("ADM_addForm").reset();
            }

            $('#ADM_btnReset').on('click', function () {
                ADM_reset();
            });
            
            $('#ADM_btnAddNew').on('click', function(){
                ADM_reset();
                isHFCSelected = false;
                selectedHFC = "";
                isDisciplineSelected = false;
                selectedDiscipline = "";
                isSubdisciplineSelected = false;
                selectedSubdiscipline = "";
            });

            $('#ADM_btnAdd').on('click', function () {
                               
                var hfc = $('#ADM_hfc').val();
                var discipline = $('#ADM_discipline').val();
                var subdiscipline = $('#ADM_subdiscipline').val();
                var status = $('#ADM_status').val();

                if (hfc === "") {
                    bootbox.alert("Fill in the health facility");
                    $('#ADM_hfc').focus();
                    
                } else if (discipline === "") {
                    bootbox.alert("Fill in the discipline");
                    $('#ADM_discipline').focus();
                    
                }else if (subdiscipline === "") {
                    bootbox.alert("Fill in the subdiscipline");
                    $('#ADM_subdiscipline').focus();
                    
                } else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                    $('#ADM_status').focus();
                    
                } else if (isHFCSelected === false || hfc !== selectedHFC) {
                    bootbox.alert("Choose existing health facility");
                    $('#ADM_hfc').val("");
                    
                }else if (isDisciplineSelected === false || discipline !== selectedDiscipline) {
                    bootbox.alert("Choose existing discipline");
                    $('#ADM_discipline').val("");
                    
                }else if (isSubdisciplineSelected === false || subdiscipline !== selectedSubdiscipline) {
                    bootbox.alert("Choose existing subdiscipline");
                    $('#ADM_subdiscipline').val("");
                    
                } else {
                    
                    var array1 = hfc.split("|");
                    hfc = array1[0].trim();
                    
                    var array2 = discipline.split("|");
                    discipline = array2[0].trim();
                    
                    var array3 = subdiscipline.split("|");
                    subdiscipline = array3[0].trim();

                    var data = {
                        hfcCode : hfc,
                        disciplineCode : discipline,
                        subdisciplineCode : subdiscipline,
                        status : status
                    };

                    $.ajax({
                        url: "assignDiscipline_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#assignDisciplineTable').load('assignDiscipline_table.jsp');
                                $('#ADM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "Discipline is successfully assigned to a health facility",
                                title: "Process Result",
                                backdrop: true
                            });
                                ADM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                //$('#ADM_detail').modal('hide');
                                ADM_reset();
                                
                            } else{
                                bootbox.alert(datas.trim());
                                $('#ADM_subdiscipline').val("");
                                $('#ADM_subdiscipline').focus();
                            }
                            
                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success");
                        }

                    });
                }

            });
            
            
            $('#ADM_hfc').on('keyup', function(){
                
                var input = $(this).val(); // We take the input value
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
                    $('#ADM_hfc_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                    var dataFields = {input : input, process : "hfc"}; // We pass input argument in Ajax
                    $.ajax({
                        type: "POST",
                        url: "ADM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 5000,
                        success: function (dataBack) { // If success
                            $('#ADM_hfc_match').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                            $('#ADM_hfc_matchlist li').on('click', function () { // When click on an element in the list
                               // Update the field with the new element
                                $('#ADM_hfc').val($(this).text());
                                $('#ADM_hfc_match').text(''); // Clear the <div id="PM_match_system"></div>
                                
                                isHFCSelected = true;
                                selectedHFC = $('#ADM_hfc').val();
                               
                            });
                        },
                        error: function () { // if error
                            $('#ADM_hfc_match').text('Problem!');
                        }
                    });
            } else {
                $('#ADM_hfc_match').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
                
        });
        
        
        $('#ADM_discipline').on('keyup', function(){
                
                var input = $(this).val(); // We take the input value
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
                    $('#ADM_discipline_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                    var dataFields = {input : input, process : "discipline"}; // We pass input argument in Ajax
                    $.ajax({
                        type: "POST",
                        url: "ADM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 5000,
                        success: function (dataBack) { // If success
                            $('#ADM_discipline_match').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                            $('#ADM_discipline_matchlist li').on('click', function () { // When click on an element in the list
                               // Update the field with the new element
                                $('#ADM_discipline').val($(this).text());
                                $('#ADM_discipline_match').text(''); // Clear the <div id="PM_match_system"></div>
                                
                                isDisciplineSelected = true;
                                selectedDiscipline = $('#ADM_discipline').val();
                               
                            });
                        },
                        error: function () { // if error
                            $('#ADM_discipline_match').text('Problem!');
                        }
                    });
            } else {
                $('#ADM_discipline_match').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
                
        });
        
        
        $("#ADM_subdiscipline").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            
            var discipline = $('#ADM_discipline').val();
            
            if(discipline === "" || isDisciplineSelected === false){
                
                bootbox.alert("Fill in discipline first!");
                $('#ADM_discipline').focus();
                $("#ADM_subdiscipline").val("");
            
            }else if(discipline !== selectedDiscipline || selectedDiscipline === "" || selectedDiscipline === null){
                
                bootbox.alert("Please choose existing discipline first!");
                $('#ADM_discipline').focus();
            
            }else if (input.length >= 1) { // Minimum characters = 2 (you can change)
                
                var arrayX = discipline.split("|");
                var disciplineCodeX = arrayX[0].trim();
                
                
                $('#ADM_subdiscipline_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                var dataFields = {input : input, process : "subdiscipline", disciplineCode : disciplineCodeX}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "ADM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#ADM_subdiscipline_match').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                        $('#ADM_subdiscipline_matchlist li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#ADM_subdiscipline').val($(this).text());
                            $('#ADM_subdiscipline_match').text(''); // Clear the <div id="PM_match_system"></div>
                           
                            isSubdisciplineSelected = true;
                            selectedSubdiscipline = $('#ADM_subdiscipline').val();
                           
                        });
                    },
                    error: function () { // if error
                        $('#ADM_subdiscipline_match').text('Problem!');
                    }
                });
            } else {
                $('#ADM_subdiscipline_match').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
        });



    });



    </script>

