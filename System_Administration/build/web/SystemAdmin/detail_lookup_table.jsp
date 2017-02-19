<%-- 
    Document   : detail_lookup_table
    Created on : Jan 26, 2017, 11:35:09 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<table  id="THE_detailTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Master Code</th>
    <th>Detail Code</th>
    <th>Description</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT master_reference_code, detail_reference_code, description, IFNULL(status, 'N/A')  FROM adm_lookup_detail ";
        ArrayList<ArrayList<String>> dataDetail = Conn.getData(sql);

        int size = dataDetail.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <td><%= dataDetail.get(i).get(0)%></td>
        <td><%= dataDetail.get(i).get(1)%></td>
        <td><%= dataDetail.get(i).get(2)%></td>
        <td><%= dataDetail.get(i).get(3)%></td>

        <td>

            <!-- Update Part Start -->
            <a data-toggle="modal" data-target="#DLT_detail2_<%=i%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a></td>

        <!-- Modal Update -->
<div class="modal fade" id="DLT_detail2_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Lookup Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master Code</label>
                        <div class="col-md-8">
                            <input id="DLT_masterCode_<%=i%>" name="textinput" type="text" placeholder="ATC Code" class="form-control input-md" value='<%=dataDetail.get(i).get(0)%>' readonly>
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Code</label>
                        <div class="col-md-8">
                            <input id="detailCode_<%=i%>" name="textinput" type="text" placeholder="Detail Code" class="form-control input-md" value='<%=dataDetail.get(i).get(1)%>' readonly>
                        </div>
                    </div>    
                        
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Description</label>
                        <div class="col-md-8">
                            <textarea id="detailDesc_<%=i%>" class="form-control" rows="3" value='<%=dataDetail.get(i).get(2)%>' ><%=dataDetail.get(i).get(2)%></textarea>
                        </div>
                    </div>

                   
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="DLT_status_<%=i%>">
                                <option value="1" <% if (dataDetail.get(i).get(3).equals("1")) {
                                        out.print("selected");
                                    } %>>Active</option>
                                <option value="0" <% if (dataDetail.get(i).get(3).equals("0")) {
                                        out.print("selected");
                                    }%>>Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="DLT_btn_update_<%=i%>">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="DLT_updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->
<!-- Update Part End -->

<!-- Delete Part Start -->
<td>
    <!-- Delete Button Start -->
    <a id="DLT_deleteButton_<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->


    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            $("#DLT_deleteButton_<%=i%>").click(function () {

                var conf = confirm('Are you sure want to delete?');
                if (conf) {

                    var data = {
                        detailCode : "<%=dataDetail.get(i).get(1)%>",
                        masterCode : "<%=dataDetail.get(i).get(0)%>"
                    };

                    $.ajax({
                        url: "detail_lookup_delete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#detailTable').load('detail_lookup_table.jsp');
                                alert("Delete Success");
                            } else if (datas.trim() === 'Failed') {
                                alert("Delete failed!");
                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion failed!!");
                        }

                    });

                }

            });

            $("#DLT_btn_update_<%=i%>").click(function () {

                var masterCode = $("#DLT_masterCode_<%=i%>").val();
                var detailCode = $("#detailCode_<%=i%>").val();
                var detailDesc = $("#detailDesc_<%=i%>").val();
                var status = $("#DLT_status_<%=i%>").val();

                var data = {
                    masterCode : masterCode,
                    detailCode : detailCode,
                    detailDesc : detailDesc,
                    status : status
                };

                $.ajax({
                    url: "detail_lookup_update.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {
                        console.log(datas);
                        if (datas.trim() === 'Success') {
                            $('#detailTable').load('detail_lookup_table.jsp');
                            $(".modal-backdrop").hide();
                            alert("Update Success");
                        } else if (datas.trim() === 'Failed') {
                            alert("Update failed!");

                        }
                    },
                    error: function (err) {
                        alert("Error update!");
                    }

                });
            });
        });
    </script>  

</td>
<!-- Delete Part Start -->


</tr>

<%
    }
%>

</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_detailTable').DataTable();
        
    });
</script>
