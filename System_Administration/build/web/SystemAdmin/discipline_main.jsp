<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    DISCIPLINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#DM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Discipline</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="DM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Discipline</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Name</label>
                        <div class="col-md-8">
                            <input id="disciplineName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code</label>
                        <div class="col-md-8">
                            <input id="disciplineCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Group Code</label>
                        <div class="col-md-8">
                            <input id="groupCode"  type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="categoryCode"  type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specialty Code</label>
                        <div class="col-md-8">
                            <input id="specialtyCode"  type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="DM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="DM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="DM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            function DM_reset() {
                document.getElementById("disciplineName").value = "";
                document.getElementById("disciplineCode").value = "";
                document.getElementById("groupCode").value = "";
                
            }

            $('#DM_btnReset').on('click', function () {
                DM_reset();
            });

            $('#DM_btnAdd').on('click', function () {
                               
                var disciplineName = $('#disciplineName').val();
                var disciplineCode = $('#disciplineCode').val();
                var groupCode = $('#groupCode').val();
                var categoryCode = $('#categoryCode').val();
                var specialtyCode = $('#specialtyCode').val();
                var status = $('#DM_status').val();

                if (disciplineName === "") {
                    alert("Fill in the Discipline name");
                    $('#disciplineName').focus();
                    
                } else if (disciplineCode === "") {
                    alert("Fill in the discipline code");
                    $('#disciplineCode').focus();
                    
                } else if (status !== "1" && status !== "0") {
                    alert("Select Any Status");
                    $('#DM_status').focus();
                } else {

                    var data = {
                        disciplineName : disciplineName,
                        disciplineCode : disciplineCode,
                        groupCode : groupCode,
                        categoryCode : categoryCode,
                        specialtyCode : specialtyCode,
                        status: status
                    };

                    $.ajax({
                        url: "discipline_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#disciplineTable').load('discipline_table.jsp');
                                $('#DM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "New discipline is added",
                                title: "Process Result",
                                backdrop: true
                            });
                                DM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                //$('#DM_detail').modal('hide');
                                DM_reset();
                                
                            } else{
                                alert(datas.trim());
                                $('#disciplineCode').val("");
                                $('#disciplineCode').focus();
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
