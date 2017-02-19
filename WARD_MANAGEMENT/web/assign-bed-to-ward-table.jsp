<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page session="true" %>


<%
    Conn conn = new Conn();

%>




<table id="assignBedTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


    <thead>


    <th>Discipline</th>
    <th>Ward Class</th>
    <th>Ward Name</th>
    <th>Bed ID</th>
    <th>Bed Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%        String sqlbed = "SELECT discipline_cd, ward_class_code, ward_id, bed_id, bed_status FROM wis_bed_id";
        ArrayList<ArrayList<String>> databed = conn.getData(sqlbed);

        int size = databed.size();
        for (int i = 0; i < size; i++) {
    %>


    <tr>

<input id="dataAssignBedhidden" type="hidden" value="<%=String.join("|", databed.get(i))%>">
<td><%= databed.get(i).get(0)%></td>
<td><%= databed.get(i).get(1)%></td>
<td><%= databed.get(i).get(2)%></td>
<td><%= databed.get(i).get(3)%></td>
<td><%= databed.get(i).get(4)%></td>
<td>
    <!-- Update Part Start -->
    <a id="MW_edit" data-toggle="modal" data-target="#assignBedUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="BED_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }

%>
</tbody>
</table>
<!-- Modal Update -->
<div class="modal fade" id="assignBedUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Assign Bed Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discipline</label>
                        <div class="col-md-4">
                            <select id="updateDiscipline" name="selectbasic" class="form-control">
                                <option value="Select Discipline" >Select Discipline</option>


                                <%                                    String Discipline = "select * from lookup_detail where master_ref_code ='0072'";
                                    ArrayList<ArrayList<String>> dataDiscipline;
                                    dataDiscipline = conn.getData(Discipline);

                                    for (int i = 0; i < dataDiscipline.size(); i++) {%>
                                <option value="<%=dataDiscipline.get(i).get(2)%>"><%=dataDiscipline.get(i).get(2)%></option>
                                <%  }
                                %>

                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                        <div class="col-md-4">
                            <select id="updateWard_Class" name="selectbasic" class="form-control">
                                <option value="Ward Class" >Ward Class</option>

                                <%
                                    String sql1 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class";
                                    ArrayList<ArrayList<String>> dataClass = conn.getData(sql1);

                                    int size3 = dataClass.size();

                                    for (int i = 0; i < size3; i++) {
                                %>
                                <option value="<%= dataClass.get(i).get(0)%>"><%= dataClass.get(i).get(0)%> ( <%= dataClass.get(i).get(1)%> )</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward ID/Name</label>
                        <div class="col-md-4">
                            <select id="updateWard_ID" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Ward ID/Name</option>
                                <%
                                    String sql2 = "SELECT ward_id, ward_name FROM wis_ward_name";
                                    ArrayList<ArrayList<String>> dataID = conn.getData(sql2);

                                    int size2 = dataID.size();

                                    for (int i = 0; i < size2; i++) {
                                %>
                                <option value="<%= dataID.get(i).get(0)%>"><%= dataID.get(i).get(0)%> ( <%= dataID.get(i).get(1)%> ) </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>   

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Bed ID</label>
                        <div class="col-md-8">
                            <textarea id="updateBedID" class="form-control" rows="3" maxlength="200" placeholder="Generic Name"></textarea>
                        </div>
                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Bed Status</label>
                        <div class="col-md-4">
                            <select class="form-control" name="status" id="updatestatus">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateModalButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script type="text/javascript">

    $(document).ready(function () {
        //function to edit facility type from table
        $('#AssignBedTable').off('click', '#assignBedTable #MW_edit').on('click', '#assignBedTable #MW_edit', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataAssignBedhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val

            var Disicipline = arrayData[0];
            var Ward_Class = arrayData[1];
            var Ward_ID = arrayData[2];
            var BedID = arrayData[3];
            var status = arrayData[4];
            $("#updateDisicipline").val(Disicipline);
            $("#updateWard_Class").val(Ward_Class);
            $("#updateWard_ID").val(Ward_ID);
            $("#updateBedID").val(BedID);
            if (status === '1')
                $('#updatestatus').val(1);
            else
                $('#updatestatus').val(0);
        });

        $("#updateModalButton").off('click').on('click', function (e) {

            e.preventDefault();
            var Disicipline = $("#updateDisicipline").val();
            var Ward_Class = $("#updateWard_Class").val();
            var Ward_ID = $("#updateWard_ID").val();
            var BedID = $("#updateBedID").val();
            var status = $("#updatestatus").val();
            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Disicipline === "" || Disicipline === null) {
                alert("Complete The Fields");
            } else if (Ward_Class === "" || Ward_Class === null) {
                alert("Complete The Fields");
            } else if (Ward_ID === "" || Ward_ID === null) {
                alert("Complete The Fields");
            } else if (BedID === "" || BedID === null) {
                alert("Complete The Fields");
            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");
            } else {

                var data = {
                    Disicipline: Disicipline,
                    Ward_Class: Ward_Class,
                    Ward_ID: Ward_ID,
                    BedID: BedID,
                    status: status
                };
                $.ajax({
                    url: "assignBedUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#AssignBedTable').load("assign-bed-to-ward-table.jsp");
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Successfully updated",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        }

                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            }
        });
    });
//delete function when click delete on next of kin
    $('#AssignBedTable').off('click', '#assignBedTable #BED_delete').on('click', '#assignBedTable #BED_delete', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataAssignBedhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        //assign into seprated val
        var iditem = arrayData[0];
        bootbox.confirm({
            message: "Are you sure want to delete information?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {

                    var data = {
                        iditem: iditem

                    };
                    $.ajax({
                        type: "post",
                        url: "assignBedDelete.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#AssignBedTable').load('assign-bed-to-ward-table.jsp');
                                bootbox.alert({
                                    message: "Successfully deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "Delete Failed",
                                    title: "Process Result",
                                    backdrop: true

                                });
                            }


                        }, error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }
            }
        });
    });
</script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#assignBedTable').DataTable();

    });
</script>

