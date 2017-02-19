<%-- 
    Document   : system_table
    Created on : Feb 7, 2017, 12:37:09 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_systemTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="width: 15% ">System Code</th>
    <th>System Name</th>
    <th style="width: 5% ">Status</th>
    <th style="width: 5% ">Update</th>
    <th style="width: 5% ">Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT system_code, system_name, status FROM adm_system";
        ArrayList<ArrayList<String>> dataSystem = conn.getData(sql);

        int size = dataSystem.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="ST_hidden" type="hidden" value="<%=String.join("|", dataSystem.get(i))%>">
        <td><%= dataSystem.get(i).get(0)%></td>
        <td><%= dataSystem.get(i).get(1)%></td>
        <td><%if(dataSystem.get(i).get(2).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td>

            <!-- Update Part Start -->
            <a id="ST_btnUpdate" data-toggle="modal" data-target="#ST_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td>
            <!-- Delete Button Start -->
            <a id="ST_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="ST_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update System Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Code</label>
                        <div class="col-md-8">
                            <input id="ST_systemCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Name</label>
                        <div class="col-md-8">
                            <input type="text" id="ST_systemName" class="form-control" maxlength="100" >
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="ST_status">
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
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="ST_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="ST_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->


<script type="text/javascript" charset="utf-8">
    
    $('#systemTable').off('click', '#THE_systemTable #ST_btnUpdate').on('click', '#THE_systemTable #ST_btnUpdate', function (e) {
        e.preventDefault();
  
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#ST_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var systemCode = arrayData[0], systemName = arrayData[1], status = arrayData[2];
        //set value in input on the top
        $('#ST_systemCode').val(systemCode);
        $('#ST_systemName').val(systemName);
        
        if(status === '1')
            $('#ST_status').val(1);
        else
            $('#ST_status').val(0);
          
        
        
        console.log(arrayData);
    });
    
    $("#ST_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
        var systemCode = $("#ST_systemCode").val();
        var systemName = $("#ST_systemName").val();
        var status = $("#ST_status").val();

       if(systemName === "" || systemName === null){
            bootbox.alert("Fill in the system name");
            $("#ST_systemName").focus();
            
        }
        else if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                systemCode : systemCode,
                systemName : systemName,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "system_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#systemTable').load('system_table.jsp');
                            $(".modal-backdrop").hide();
                            //alert("Update Success");
                            
                            bootbox.alert({
                                    message: "System detail is updated",
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
        
    
     $('#systemTable').off('click', '#THE_systemTable #ST_btnDelete').on('click', '#THE_systemTable #ST_btnDelete', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#ST_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var systemCode = arrayData[0];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + systemCode,
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
                    systemCode: systemCode 
                };

                $.ajax({
                    url: "system_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#systemTable').load('system_table.jsp');
                            //alert("Delete Success");
                            
                            bootbox.alert({
                                    message: "A system information is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed!");
                            
                        } else{
                            bootbox.alert(datas.trim());
                            
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
        $('#THE_systemTable').DataTable();
    });
</script>
