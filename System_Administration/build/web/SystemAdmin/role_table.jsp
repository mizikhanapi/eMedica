<%-- 
    Document   : role_table
    Created on : Feb 16, 2017, 11:52:00 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_roleTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Role Code</th>
    <th>Role Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT role_code, role_name, status FROM adm_role";
        ArrayList<ArrayList<String>> dataRole = conn.getData(sql);

        int size = dataRole.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="RT_hidden" type="hidden" value="<%=String.join("|", dataRole.get(i))%>">
        <td><%= dataRole.get(i).get(0)%></td>
        <td><%= dataRole.get(i).get(1)%></td>
        <td><%if(dataRole.get(i).get(2).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td>

            <!-- Update Part Start -->
            <a id="RT_btnUpdate" data-toggle="modal" data-target="#RT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td>
            <!-- Delete Button Start -->
            <a id="RT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="RT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Role</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Code</label>
                        <div class="col-md-8">
                            <input id="RT_roleCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Name</label>
                        <div class="col-md-8">
                            <input type="text" id="RT_roleName" class="form-control" maxlength="100" >
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="RT_status">
                                <option value="0" >Active</option>
                                <option value="1" >Inactive</option>
                                
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="RT_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="RT_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->


<script type="text/javascript" charset="utf-8">
    
    $('#roleTable').off('click', '#THE_roleTable #RT_btnUpdate').on('click', '#THE_roleTable #RT_btnUpdate', function (e) {
        e.preventDefault();
  
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#RT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var roleCode = arrayData[0], roleName = arrayData[1], status = arrayData[2];
        //set value in input on the top
        $('#RT_roleCode').val(roleCode);
        $('#RT_roleName').val(roleName);
        
        if(status === '1')
            $('#RT_status').val(1);
        else
            $('#RT_status').val(0);
          
        
    });
    
    $("#RT_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
        var roleCode = $("#RT_roleCode").val();
        var roleName = $("#RT_roleName").val();
        var status = $("#RT_status").val();

       if(roleName === "" || roleName === null){
            bootbox.alert("Fill in the system name");
            $("#RT_roleName").focus();
            
        }
        else if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                roleCode : roleCode,
                roleName : roleName,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "role_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#roleTable').load('role_table.jsp');
                            $(".modal-backdrop").hide();
                            //alert("Update Success");
                            
                            bootbox.alert({
                                    message: "Role is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Update failed!");
                        }

                },
                error: function (err) {
                    bootbox.alert("Error! Ajax failed!!");
                }

            });
        }   


    });
        
    
     $('#roleTable').off('click', '#THE_roleTable #RT_btnDelete').on('click', '#THE_roleTable #RT_btnDelete', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#RT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var roleCode = arrayData[0];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + roleCode,
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
                    roleCode : roleCode 
                };

                $.ajax({
                    url: "role_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#roleTable').load('role_table.jsp');
                            //alert("Delete Success");
                            
                            bootbox.alert({
                                    message: "A role is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed!");
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error! Deletion failed!!");
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
        $('#THE_roleTable').DataTable();
    });
</script>

