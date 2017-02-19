<%-- 
    Document   : system_main
    Created on : Feb 7, 2017, 10:58:34 AM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    SYSTEM CODE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#SM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD System</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="SM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New System</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Name</label>
                        <div class="col-md-8">
                            <input id="systemName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Code</label>
                        <div class="col-md-8">
                            <input id="systemCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="SM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="SM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="SM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            function SM_reset() {
                document.getElementById("systemName").value = "";
                document.getElementById("systemCode").value = "";
                
                
            }

            $('#SM_btnReset').on('click', function () {
                SM_reset();
            });

            $('#SM_btnAdd').on('click', function () {
                               
                var systemName = $('#systemName').val();
                var systemCode = $('#systemCode').val();
                var status = $('#SM_status').val();

                if (systemName === "") {
                    bootbox.alert("Fill in the system name");
                    $('#systemName').focus();
                    
                } else if (systemCode === "") {
                    bootbox.alert("Fill in the system code");
                    $('#systemCode').focus();
                    
                } else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                    $('#SM_status').focus();
                } else {

                    var data = {
                        systemName : systemName,
                        systemCode : systemCode,
                        status: status
                    };

                    $.ajax({
                        url: "system_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#systemTable').load('system_table.jsp');
                                $('#SM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "New system is added",
                                title: "Process Result",
                                backdrop: true
                            });
                                SM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                bootbox.alert("Insertion failed!");
                                //$('#SM_detail').modal('hide');
                                SM_reset();
                                
                            } else{
                                bootboxalert(datas.trim());
                                $('#systemCode').val("");
                                $('#systemCode').focus();
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

