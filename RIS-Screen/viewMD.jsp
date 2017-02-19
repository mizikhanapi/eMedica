<%-- 
    Document   : viewMD
    Created on : Jan 14, 2017, 1:42:27 PM
    Author     : Huda Athirah
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<table id="MD"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        String query1 = "select modality_cd,modality_name,status";
        ArrayList<ArrayList<String>> q1 = connect.getData(query1);
    %>
    <thead>
        <tr>
            <th class="col-sm-1">Modality Code</th>
            <th class="col-sm-1">Modality Name</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Update</th>
            <th class="col-sm-1">Cancel</th>
        </tr>
    </thead>
    <tbody>

        <%
            if (q1.size() > 0) {
                for (int i = 0; i < q1.size(); i++) {

        %>
        <tr>
            <td><%=q1.get(i).get(0)%></td>
            <td><%=q1.get(i).get(1)%></td>
            <td><%=q1.get(i).get(2)%></td>
            <td><%=q1.get(i).get(3)%></td>
            <td><%=q1.get(i).get(4)%></td>

            <td>
                <button  class='btn btn-primary btn-xs' data-toggle="modal" data-target="#basicModal_<%=i%>">Update</button>

                <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&amp;times;</button>
                                <h4 class="modal-title" id="myModalLabel">Edit</h4>
                            </div>
                            <div class="modal-body">
                                <!--form name="myForm" action="" method="post">-->
                                <div class="form-group">
                                    <label>Modality Code</label>
                                    <input class="form-control" type="text" id="modality_cd_<%=i%>" value="<%=q1.get(i).get(1)%>" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Modality Name</label>
                                    <input type="text" name="testCatName"  class="form-control" id="modality_name_<%=i%>" value="<%=q1.get(i).get(0)%>" required="required"/ readonly="">
                                </div>
                                <div class="form-group" id="dstatus">
                                    <label>Status</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active" <% if (q1.get(i).get(2).equals("Active")) {
                                                    out.print("selected");
                                                } %>>Active</option>
                                        <option value="Inactive" <% if (q1.get(i).get(2).equals("Inactive")) {
                                                    out.print("selected");
                                                }%>>Inactive</option>
                                    </select>
                                </div>
                                <!--/form>-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btn_update_<%=i%>">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <button id='btn_delete_<%=i%>' class='btn btn-danger btn-xs'>Delete</button>

                <script type="text/javascript" charset="utf-8">
                    $(document).ready(function () {
                        $("#btn_update_<%=i%>").click(function () {
                           // var ccode = $("#ccode_<%=i%>").val();
                            var modality_cd = $("#modality_cd_<%=i%>").val();
                            var modality_name = $("#modality_name_<%=i%>").val();
                            var status = $("#status_<%=i%>").val();

                            $.ajax({
                                url: "tDetailUpdate.jsp",
                                type: "post",
                                data: {
                                    modality_cd: modality_cd,
                                    modality_name: modality_name,
                                    status: status
                                },
                                timeout: 10000,
                                success: function (data) {
                                    var d = data.split("|");
                                    if (d[1] == '1') {
                                        $("#viewMDpage").load("viewMD.jsp");
                                        $(".modal-backdrop").hide();
                                    } else {
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
        </tr>
        <% }
            }
        %>
    </tbody>
</table>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MD').DataTable();
    });
</script>
