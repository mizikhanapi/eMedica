<%-- 
    Document   : module_table
    Created on : Feb 7, 2017, 2:59:55 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<table  id="THE_moduleTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>System Code</th>
    <th>System Name</th>
    <th>Module Code</th>
    <th>Module Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT s.system_code, system_name, module_code, module_name, m.status "
                + " FROM adm_system s join adm_module m using (system_code)";
        ArrayList<ArrayList<String>> dataModule = conn.getData(sql);

        int size = dataModule.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="MT_hidden" type="hidden" value="<%=String.join("|", dataModule.get(i))%>">
<td><%= dataModule.get(i).get(0)%></td> <!-- system code -->   
<td><%= dataModule.get(i).get(1)%></td> <!-- system name  --> 
<td><%= dataModule.get(i).get(2)%></td> <!-- module code  --> 
<td><%= dataModule.get(i).get(3)%></td> <!-- module name  --> 
<td style="width: 5%"><%if(dataModule.get(i).get(4).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td> <!--status --> 

<td style="width: 5% ">

    <!-- Update Part Start -->
    <a id="MT_btnUpdate" data-toggle="modal" data-target="#MT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5% ">
    <!-- Delete Button Start -->
    <a id="MT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>



<%
    }
%>

</tbody>
</table>

<!-- Modal Update -->
<div class="modal fade" id="MT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Module</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Code</label>
                        <div class="col-md-8">
                            <input id="MT_systemCode" name="textinput" type="text" class="form-control input-md" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Code</label>
                        <div class="col-md-8">
                            <input id="MT_moduleCode"  type="text"  class="form-control input-md" readonly>
                        </div>
                    </div>    

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Name</label>
                        <div class="col-md-8">
                            <input id="MT_moduleName" class="form-control" maxlength="100"  >
                        </div>
                    </div>

                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MT_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MT_btnUpdateConfirm">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset"  class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->
<!-- Update Part End -->

<!-- Delete Part Start -->


<script type="text/javascript" charset="utf-8">

    $('#moduleTable').off('click', '#THE_moduleTable #MT_btnUpdate').on('click', '#THE_moduleTable #MT_btnUpdate', function (e) {
        e.preventDefault();
        
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#MT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var systemCode = arrayData[0], moduleCode = arrayData[2], moduleName = arrayData[3], status = arrayData[4];
        //set value in input on the top
        $('#MT_systemCode').val(systemCode);
        $('#MT_moduleCode').val(moduleCode);
        $('#MT_moduleName').val(moduleName);
        
        if (status === '1')
            $('#MT_status').val(1);
        else
            $('#MT_status').val(0);



        console.log(arrayData);
    });


    $('#MT_btnUpdateConfirm').on('click', function () {

        var systemCode = $('#MT_systemCode').val();
        var moduleCode = $('#MT_moduleCode').val();
        var moduleName = $('#MT_moduleName').val();
        var status = $('#MT_status').val();

        if (moduleName === "" || moduleName === null) {
            alert("Please fill in the name");
            $('#MT_moduleName').focus();

        } else if (status !== '1' && status !== '0') {
            alert("Please choose the status");
            $('#MT_status').focus();

        } else {

            var data = {
                systemCode: systemCode,
                moduleCode: moduleCode,
                moduleName: moduleName,
                status: status
            };

            $.ajax({
                url: "module_update.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    console.log(datas.trim());
                    if (datas.trim() === 'Success') {
                        $('#moduleTable').load('module_table.jsp');
                        $(".modal-backdrop").hide();
                        //alert("Update Success");
                        
                        bootbox.alert({
                                    message: "Module is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                        
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert("Update failed!");

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });
        }



    });

    $('#moduleTable').off('click', '#THE_moduleTable #MT_btnDelete').on('click', '#THE_moduleTable #MT_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#MT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var systemCode = arrayData[0], moduleCode = arrayData[2];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + systemCode + "-" + moduleCode,
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
                        moduleCode: moduleCode,
                        systemCode: systemCode
                    };

                    $.ajax({
                        url: "module_delete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#moduleTable').load('module_table.jsp');
                                //alert("Delete Success");
                                 bootbox.alert({
                                    message: "A module information is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                            } else if (datas.trim() === 'Failed') {
                                alert("Delete failed!");
                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion failed!!");
                        }

                    });
                    
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

       

    });



</script>  


<!-- Delete Part Start -->




<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_moduleTable').DataTable();

        
    });
</script>


