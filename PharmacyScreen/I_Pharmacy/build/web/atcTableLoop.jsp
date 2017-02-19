<%-- 
    Document   : atcTable
    Created on : Jan 24, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>


<table  id="atcTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>ATC CODE</th>
    <th>ATC CODE DESCRIPTION</th>
    <th>CATEGORY CODE</th>
    <th>STATUS</th>
    <th>UPDATE</th>
    <th>DELETE</th>
</thead>
<tbody>

    <%
        String sql = " SELECT UD_ATC_Code, UD_ATC_Desc, Category_Code,Status FROM pis_atc ";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="dataATChidden" type="hidden" value="<%=String.join("|", dataATC.get(i))%>">
<td><%= dataATC.get(i).get(0)%></td>
<td><%= dataATC.get(i).get(1)%></td>
<td><%= dataATC.get(i).get(2)%></td>
<td><%if (dataATC.get(i).get(3).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    } %></td> <!--status 3 --> 
<td>
    <!-- Update Part Start -->
    <a id="updateTButton" data-toggle="modal" data-target="#atcUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="deleteTButton" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>


<!-- Modal Update -->
<div class="modal fade" id="atcUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update ATC Code Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Code</label>
                        <div class="col-md-8">
                            <input id="updateatcCode" name="textinput" type="text" placeholder="ATC Code" class="form-control input-md" maxlength="15" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Description</label>
                        <div class="col-md-8">
                            <textarea id="updateatcDesc" class="form-control" rows="4" placeholder="ATC Description" maxlength="200" ></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="updatecategory" name="textinput" type="text" placeholder="Category Code" maxlength="50" class="form-control input-md" >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="updatestatus">
                                <option value="1" >Active</option>
                                <option value="0" >Inactive</option>
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
<!-- Modal Update -->

<script type="text/javascript" >

    $('#contentATCTable').off('click', '#atcTable #updateTButton').on('click', '#atcTable #updateTButton', function (e) {
        e.preventDefault();

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataATChidden").val();

        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var atcCode = arrayData[0];
        var atcDesc = arrayData[1];
        var category = arrayData[2];
        var status = arrayData[3];


        //set value to the modal 
        $("#updateatcCode").val(atcCode);
        $("#updateatcDesc").val(atcDesc);
        $("#updatecategory").val(category);

        if (status === '1')
            $('#updatestatus').val(1);
        else
            $('#updatestatus').val(0);


    });

    $("#updateModalButton").off('click').on('click', function (e) {

        e.preventDefault();

        var atcCode = $("#updateatcCode").val();
        var atcDesc = $("#updateatcDesc").val();
        var category = $("#updatecategory").val();
        var status = $("#updatestatus").val();

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
                url: "atcUpdate.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    if (datas.trim() === 'Success') {
                        $('#contentATCTable').load('atcTableLoop.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert({
                            message: "ATC Code is Updated Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert({
                            message: "ATC Code Update Failed",
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


    $('#contentATCTable').off('click', '#atcTable #deleteTButton').on('click', '#atcTable #deleteTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataATChidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var iditem = arrayData[0];


        bootbox.confirm({
            message: "Are you sure want to delete this item?",
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
                        url: "atcDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentATCTable').load('atcTableLoop.jsp');
                                bootbox.alert({
                                    message: "ATC Code is Deleted Successful",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "ATC Code Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            }

                        },
                        error: function (err) {
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
        $('#atcTable').DataTable();

    });
</script>

