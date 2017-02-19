<%-- 
    Document   : module_main
    Created on : Feb 7, 2017, 11:16:22 AM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MODULE CODE MANAGEMENT
    <span class="pull-right">
        <button id="MM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#MM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Module</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="MM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Module</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Name</label>
                        <div class="col-md-8">
                            <input id="MM_systemName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="120">
                             <div id="MM_match">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Name</label>
                        <div class="col-md-8">
                            <input id="MM_moduleName"  type="text" placeholder="Code required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Code</label>
                        <div class="col-md-8">
                            <input id="MM_moduleCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->

<script type="text/javascript">

    
    $(document).ready(function () {

        var isSysCodeExist = false;
        var strSystem;
        
        function MM_reset() {
            
            document.getElementById("MM_systemName").value = "";
            document.getElementById("MM_moduleName").value = "";
            document.getElementById("MM_moduleCode").value = "";
                       
        }

        $('#MM_btnReset').on('click', function () {
            MM_reset();
            
        });

        $('#MM_btnAddNew').on('click', function () {
            
            isSysCodeExist = false;
            MM_reset();

        });

        $('#MM_btnAdd').on('click', function () {
            
            var systemCode = $('#MM_systemName').val();
            var moduleName = $('#MM_moduleName').val();
            var moduleCode = $('#MM_moduleCode').val();
            var status = $('#MM_status').val();

            if (systemCode === "" || systemCode === null) {
                bootbox.alert("Fill in the system name");
                $('#MM_systemName').focus();

            } else if (moduleName === "") {
                bootbox.alert("Fill in the module name");
                $('#MM_moduleName').focus();

            } else if (moduleCode === "") {
                bootbox.alert("Fill in the module code");
                $('#MM_moduleCode').focus();

            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");

            } else if (isSysCodeExist === false || strSystem !== systemCode) {
                bootbox.alert("Please choose existing system");
                $('#MM_systemName').val("");
                $('#MM_systemName').focus();
                
            }else {

                var arrayData = $('#MM_systemName').val().split("|");
                systemCode = arrayData[0].trim();
               

                var data = {
                    systemCode: systemCode,
                    moduleName: moduleName,
                    moduleCode: moduleCode,
                    status: status
                };

                $.ajax({
                    url: "module_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 5000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#moduleTable').load('module_table.jsp');
                            $('#MM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                    message: "New module is added",
                                    title: "Process Result",
                                    backdrop: true
                                });
                          

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            $('#MM_detail').modal('hide');
                          

                        } else {
                            
                            //alert(datas.trim());
                            bootbox.alert({
                                    message: datas.trim(),
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                             $('#MM_moduleCode').val("");
                             $('#MM_moduleCode').focus();    
                                
//                            if(datas.trim().toString().includes("discipline")){
//                                $('#MM_systemCode').val("");
//                                $('#MM_systemCode').focus();
//                                
//                            }else{
//                                
//                                $('#MM_moduleCode').val("");
//                                $('#MM_moduleCode').focus();
//                            }    
                            
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success: ");
                    }

                });
            }

        });

        $("#MM_systemName").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#MM_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="MM_match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "MM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#MM_match').html(dataBack); // Return data (UL list) and insert it in the <div id="MM_match"></div>
                        $('#MM_matchList li').on('click', function () { // When click on an element in the list
                            //$('#MM_systemCode').text($(this).text()); // Update the field with the new element
                            $('#MM_systemName').val($(this).text());
                            $('#MM_match').text(''); // Clear the <div id="MM_match"></div>
                            var arrayData = $('#MM_systemName').val().split("|");
                            isSysCodeExist = true;
                            strSystem = $('#MM_systemName').val();
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#MM_match').text('Problem!');
                    }
                });
            } else {
                $('#MM_match').text(''); // If less than 2 characters, clear the <div id="MM_match"></div>
            }
        });



    });



</script>

