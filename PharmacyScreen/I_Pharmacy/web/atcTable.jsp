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
    <th>ATC Code</th>
    <th>ATC Code Description</th>
    <th>Category Code</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT UD_ATC_Code, UD_ATC_Desc, Category_Code,Status FROM pis_atc ";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= dataATC.get(i).get(3)%></td>

        <td>

            <!-- Update Part Start -->
            <a data-toggle="modal" data-target="#detail2_<%=i%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

        <!-- Modal Update -->
<div class="modal fade" id="detail2_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
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
                            <input id="atcCode_<%=i%>" name="textinput" type="text" class="form-control input-md" value='<%=dataATC.get(i).get(0)%>' maxlength="15" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Description</label>
                        <div class="col-md-8">
                            <textarea id="atcDesc_<%=i%>" class="form-control" rows="4" maxlength="200" value='<%=dataATC.get(i).get(1)%>' ><%=dataATC.get(i).get(1)%></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="category_<%=i%>" name="textinput" type="text" maxlength="50" class="form-control input-md" value='<%=dataATC.get(i).get(2)%>'>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="status_<%=i%>">
                                <option value="1" <% if (dataATC.get(i).get(3).equals("1")) {
                                        out.print("selected");
                                    } %>>Active</option>
                                <option value="0" <% if (dataATC.get(i).get(3).equals("0")) {
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btn_update_<%=i%>">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                    
                    </td>
<!-- Modal Update -->
<!-- Update Part End -->

<!-- Delete Part Start -->
<td>
    <!-- Delete Button Start -->
    <a id="deleteButton_<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->


    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            $("#deleteButton_<%=i%>").click(function () {

                var conf = confirm('Are you sure want to delete?');
                if (conf) {

                    var data = {
                        iditem: "<%=dataATC.get(i).get(0)%>"
                    };

                    $.ajax({
                        url: "atcDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentATCTable').load('atcTable.jsp');
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

            $("#btn_update_<%=i%>").click(function () {

                var atcCode = $("#atcCode_<%=i%>").val();
                var atcDesc = $("#atcDesc_<%=i%>").val();
                var category = $("#category_<%=i%>").val();
                var status = $("#status_<%=i%>").val();

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
                            $('#contentATCTable').load('atcTable.jsp');
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
<!-- Delete Part End -->


</tr>

<%
    }
%>

</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#atcTable').DataTable();
    });
</script>