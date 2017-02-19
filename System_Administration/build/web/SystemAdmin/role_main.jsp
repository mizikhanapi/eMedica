<%-- 
    Document   : role_main
    Created on : Feb 16, 2017, 11:17:45 AM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ROLE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#RM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Role</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="RM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Role</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Name</label>
                        <div class="col-md-8">
                            <input id="RM_roleName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Code</label>
                        <div class="col-md-8">
                            <input id="RM_roleCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="RM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="RM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            function RM_reset() {
                document.getElementById("RM_roleName").value = "";
                document.getElementById("RM_roleCode").value = "";
                
                
            }

            $('#RM_btnReset').on('click', function () {
                RM_reset();
            });

            $('#RM_btnAdd').on('click', function () {
                               
                var roleName = $('#RM_roleName').val();
                var roleCode = $('#RM_roleCode').val();
                var status = $('#RM_status').val();

                if (roleName === "") {
                    bootbox.alert("Fill in the system name");
                    $('#RM_roleName').focus();
                    
                } else if (roleCode === "") {
                    bootbox.alert("Fill in the system code");
                    $('#RM_roleCode').focus();
                    
                } else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                    $('#RM_status').focus();
                } else {

                    var data = {
                        roleName : roleName,
                        roleCode : roleCode,
                        status : status
                    };

                    $.ajax({
                        url: "role_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#roleTable').load('role_table.jsp');
                                $('#RM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "New role is added",
                                title: "Process Result",
                                backdrop: true
                            });
                                RM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                bootbox.alert("Insertion failed!");
                                //$('#RM_detail').modal('hide');
                                RM_reset();
                                
                            } else{
                                bootboxalert(datas.trim());
                                $('#RM_roleCode').val("");
                                $('#RM_roleCode').focus();
                            }
                            
                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success");
                        }

                    });
                }

            });


        });



    </script>


