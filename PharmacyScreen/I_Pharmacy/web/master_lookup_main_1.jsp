<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    LOOKUP MASTER MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Lookup Master</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Lookup Master</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master code</label>
                        <div class="col-md-8">
                            <input id="masterCode" name="masterCode" type="text" placeholder="Master Lookup Code" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master Name</label>
                        <div class="col-md-8">
                            <input id="masterName" name="masterName" type="text" placeholder="Master Lookup Name" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Source</label>
                        <div class="col-md-8">
                            <input id="masterSource" name="masterName" type="text" placeholder="Source (optional)" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="0">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            function reset () {
                document.getElementById("masterCode").value = "";
                document.getElementById("masterName").value = "";
                document.getElementById("masterSource").value = "";
                document.getElementById("status1").checked = false;
                document.getElementById("status2").checked = false;
            }

            $('#btnReset').on('click', function () {
                reset();
            });

            $('#btnAdd').on('click', function () {
                               
                var masterCode = $('#masterCode').val();
                var masterName = $('#masterName').val();
                var masterSource = $('#masterSource').val();
                var status = $('input[name="status"]:checked').val();

                if (masterCode === "") {
                    alert("Fill in the Master Code");
                    $('#masterCode').focus();
                    
                } else if (masterName === "") {
                    alert("Complete The Fields");
                    $('#masterName').focus();
                    
                } else if (status !== "1" && status !== "0") {
                    alert("Select Any Status");
                } else {

                    var data = {
                        masterCode : masterCode,
                        masterName : masterName,
                        masterSource : masterSource,
                        status: status
                    };

                    $.ajax({
                        url: "master_lookup_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#masterTable').load('master_lookup_table_1.jsp');
                                $('#detail').modal('hide');
                                alert("Insertion Success");
                                reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                //$('#detail').modal('hide');
                                reset();
                                
                            } else{
                                alert(datas.trim());
                                document.getElementById("masterCode").value = "";
                                $('#masterCode').focus();
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
