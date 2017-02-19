<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
    Author     : Shammugam
--%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ATC MEDICINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD ATC</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New ATC Code</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Code</label>
                        <div class="col-md-8">
                            <input id="atcCode" name="atcCode" type="text" placeholder="ATC Code" class="form-control input-md" maxlength="15" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Description</label>
                        <div class="col-md-8">
                            <textarea id="atcDesc" name="atcDesc" class="form-control" rows="4" placeholder="ATC Description" maxlength="200" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="category" name="category" type="text" placeholder="Category Code" class="form-control input-md" maxlength="50" required>
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="addButton">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="addReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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

        function reset() {
            document.getElementById("atcCode").value = "";
            document.getElementById("atcDesc").value = "";
            document.getElementById("category").value = "";
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;
        }

        $('#addReset').on('click', function () {
            reset();
        });

        $('#addButton').on('click', function () {
            var atcCode = $('#atcCode').val();
            var atcDesc = $('#atcDesc').val();
            var category = $('#category').val();
            var status = $('input[name="status"]:checked').val();

            if (atcCode === "" || atcCode === null) {
                bootbox.alert("Please Insert ATC Code Name");
            } else if (atcDesc === "" || atcDesc === null) {
                bootbox.alert("Please Insert ATC Code Description");
            } else if (category === "" || category === null) {
                bootbox.alert("Please Insert ATC Code Category");
            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Please Select Any Status");
            } else {

                var data = {
                    atcCode: atcCode,
                    atcDesc: atcDesc,
                    category: category,
                    status: status
                };

                $.ajax({
                    url: "atcInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentATCTable').load('atcTableLoop.jsp');
                            $('#detail').modal('hide');
                            bootbox.alert({
                                message: "ATC Code is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "ATC Code Duplication Detected. Please use diffrerent ATC code",
                                title: "Process Result",
                                backdrop: true
                            });
                            
                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "ATC Code Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#detail').modal('hide');
                            reset();

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

