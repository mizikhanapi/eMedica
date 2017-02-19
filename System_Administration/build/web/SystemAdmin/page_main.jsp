<%-- 
    Document   : page_main
    Created on : Feb 7, 2017, 5:31:11 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PAGE CODE MANAGEMENT
    <span class="pull-right">
        <button id="PM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#PM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Page</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="PM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Page</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Name</label>
                        <div class="col-md-8">
                            <input id="PM_systemName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="110">
                             <div id="PM_match_system">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Name</label>
                        <div class="col-md-8">
                            <input id="PM_moduleName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="110">
                            <div id="PM_match_module">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Name</label>
                        <div class="col-md-8">
                            <input id="PM_pageName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Code</label>
                        <div class="col-md-8">
                            <input id="PM_pageCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="PM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
        var strSystem = "";
        
        var isModCodeExist = false;
        var strModule = "";
        
        function PM_reset() {
            
            document.getElementById("PM_systemName").value = "";
            document.getElementById("PM_moduleName").value = "";
            document.getElementById("PM_pageName").value = "";
            document.getElementById("PM_pageCode").value = "";
                       
        }

        $('#PM_btnReset').on('click', function () {
            PM_reset();
            
        });

        $('#PM_btnAddNew').on('click', function () {
            
            isSysCodeExist = false;
            isModCodeExist = false;
            PM_reset();

        });

        $('#PM_btnAdd').on('click', function () {
            
            var systemCode = $('#PM_systemName').val();
            var moduleCode = $('#PM_moduleName').val();
            var pageName = $('#PM_pageName').val();
            var pageCode = $('#PM_pageCode').val();
            var status = $('#PM_status').val();

            if (systemCode === "" || systemCode === null) {
                bootbox.alert("Fill in the system name");
                $('#PM_systemName').focus();

            } else if (moduleCode === "") {
                bootbox.alert("Fill in the module code");
                $('#PM_moduleName').focus();

            } else if (pageName === "") {
                bootbox.alert("Fill in the page name");
                $('#PM_pageName').focus();

            }else if (pageCode === "") {
                bootbox.alert("Fill in the page code");
                $('#PM_pageCode').focus();

            }  else if (status !== "1" && status !== "0") {
                alert("Select Any Status");

            } else if (isSysCodeExist === false || strSystem !== systemCode) {
                bootbox.alert("Please choose existing system");
                $('#PM_systemName').val("");
                $('#PM_systemName').focus();
                
            }else if (isModCodeExist === false || strModule !== moduleCode) {
                bootbox.alert("Please choose existing module");
                $('#PM_moduleName').val("");
                $('#PM_moduleName').focus();
                
            }else {

                var arrayData = $('#PM_systemName').val().split("|");
                systemCode = arrayData[0].trim();
                var arrayData2 = $('#PM_moduleName').val().split("|");
                moduleCode = arrayData2[0].trim();
               

                var data = {
                    systemCode : systemCode,
                    moduleCode : moduleCode,
                    pageName : pageName,
                    pageCode : pageCode,
                    status: status
                };

                $.ajax({
                    url: "page_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 5000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#pageTable').load('page_table.jsp');
                            $('#PM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                    message: "New page is added",
                                    title: "Process Result",
                                    backdrop: true
                                });
                          

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            $('#PM_detail').modal('hide');
                          

                        } else {
                            
                            //alert(datas.trim());
                            bootbox.alert({
                                    message: datas.trim(),
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                             $('#PM_pageCode').val("");
                             $('#PM_pageCode').focus();    
                                
                                                     
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success: ");
                    }

                });
            }

        });

        $("#PM_systemName").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#PM_match_system').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                var dataFields = {input : input, process : "system"}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "PM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#PM_match_system').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                        $('#PM_match_systemList li').on('click', function () { // When click on an element in the list
                            //$('#MM_systemCode').text($(this).text()); // Update the field with the new element
                            $('#PM_systemName').val($(this).text());
                            $('#PM_match_system').text(''); // Clear the <div id="PM_match_system"></div>
                            var arrayData = $('#PM_systemName').val().split("|");
                            isSysCodeExist = true;
                            strSystem = $('#PM_systemName').val();
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#PM_match_system').text('Problem!');
                    }
                });
            } else {
                $('#PM_match_system').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
        });
        
        
         $("#PM_moduleName").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            
            var systemNameMust = $('#PM_systemName').val();
            
            if(systemNameMust === "" || isSysCodeExist === false){
                
                bootbox.alert("Fill in system name first!");
                $('#PM_systemName').focus();
            
            }else if(systemNameMust !== strSystem || strSystem === "" || strSystem === null){
                
                bootbox.alert("Please choose existing system name first!");
                $('#PM_systemName').focus();
            
            }else if (input.length >= 1) { // Minimum characters = 2 (you can change)
                
                var arrayX = systemNameMust.split("|");
                var systemCodeX = arrayX[0].trim();
                console.log(systemCodeX);
                
                $('#PM_match_module').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                var dataFields = {input : input, process : "module", systemCode : systemCodeX}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "PM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#PM_match_module').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                        $('#PM_match_moduleList li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#PM_moduleName').val($(this).text());
                            $('#PM_match_module').text(''); // Clear the <div id="PM_match_system"></div>
                            var arrayData = $('#PM_moduleName').val().split("|");
                            isModCodeExist = true;
                            strModule = $('#PM_moduleName').val();
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#PM_match_module').text('Problem!');
                    }
                });
            } else {
                $('#PM_match_module').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
        });



    });



</script>


