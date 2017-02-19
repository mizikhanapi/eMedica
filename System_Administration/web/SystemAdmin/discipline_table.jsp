<%-- 
    Document   : master_lookup_table
    Created on : Jan 25, 2017, 4:43:13 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_disciplineTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Discipline Code</th>
    <th>Discipline Name</th>
    <th>Group Code</th>
    <th>Category Code</th>
    <th>Specialty Code</th>
    <th style="width: 5% ">Status</th>
    <th style="width: 5% ">Update</th>
    <th style="width: 5% ">Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT discipline_cd, discipline_name, discipline_group_cd, discipline_category_cd, discipline_specialty_cd, discipline_status FROM adm_discipline ";
        ArrayList<ArrayList<String>> dataDiscipline = conn.getData(sql);

        int size = dataDiscipline.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="DT_hidden" type="hidden" value="<%=String.join("|", dataDiscipline.get(i))%>">
        <td><%= dataDiscipline.get(i).get(0)%></td>
        <td><%= dataDiscipline.get(i).get(1)%></td>
        <td><%= dataDiscipline.get(i).get(2)%></td>
        <td><%= dataDiscipline.get(i).get(3)%></td>
        <td><%= dataDiscipline.get(i).get(4)%></td>
        <td><%if(dataDiscipline.get(i).get(5).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td>

            <!-- Update Part Start -->
            <a id="DT_btnUpdate" data-toggle="modal" data-target="#DT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td>
            <!-- Delete Button Start -->
            <a id="DT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="DT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Discipline Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code</label>
                        <div class="col-md-8">
                            <input id="DT_disciplineCode" name="textinput" type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Name</label>
                        <div class="col-md-8">
                            <input type="text" id="DT_disciplineName" class="form-control" maxlength="100" >
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Group Code</label>
                        <div class="col-md-8">
                            <input id="DT_groupCode" name="textinput" type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="DT_categoryCode" name="textinput" type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specialty Code</label>
                        <div class="col-md-8">
                            <input id="DT_specialtyCode" name="textinput" type="text" placeholder="Optional" class="form-control input-md" maxlength="30">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="DT_status">
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
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="DT_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="DT_updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->


<script type="text/javascript" charset="utf-8">
    
    $('#disciplineTable').off('click', '#THE_disciplineTable #DT_btnUpdate').on('click', '#THE_disciplineTable #DT_btnUpdate', function (e) {
        e.preventDefault();
  
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#DT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var disciplineCode = arrayData[0], disciplineName = arrayData[1], groupCode = arrayData[2], categoryCode = arrayData[3], specialtyCode = arrayData[4], status = arrayData[5];
        //set value in input on the top
        $('#DT_disciplineCode').val(disciplineCode);
        $('#DT_disciplineName').val(disciplineName);
        $('#DT_groupCode').val(groupCode);
        $('#DT_categoryCode').val(categoryCode);
        $('#DT_specialtyCode').val(specialtyCode);
        
        if(status === '1')
            $('#DT_status').val(1);
        else
            $('#DT_status').val(0);
          
        
        
        console.log(arrayData);
    });
    
    $("#DT_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
        var disciplineCode = $("#DT_disciplineCode").val();
        var disciplineName = $("#DT_disciplineName").val();
        var groupCode = $("#DT_groupCode").val();
        var categoryCode = $('#DT_categoryCode').val();
        var specialtyCode = $('#DT_specialtyCode').val();
        var status = $("#DT_status").val();

        if(disciplineCode === "" || disciplineCode === null){
            alert("Fill in the discipline code");
        }
        else if(disciplineName === "" || disciplineName === null){
            alert("Fill in the discipline name");
            $("#DT_disciplineName").focus();
            
        }
        else if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                disciplineCode : disciplineCode,
                disciplineName : disciplineName,
                groupCode : groupCode,
                categoryCode : categoryCode,
                specialtyCode : specialtyCode,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "discipline_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#disciplineTable').load('discipline_table.jsp');
                            $(".modal-backdrop").hide();
                            //alert("Update Success");
                            
                            bootbox.alert({
                                    message: "Discipline is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            alert("Update failed!");
                        }

                },
                error: function (err) {
                    alert("Error! Deletion failed!!");
                }

            });
        }   


    });
        
    
     $('#disciplineTable').off('click', '#THE_disciplineTable #DT_btnDelete').on('click', '#THE_disciplineTable #DT_btnDelete', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#DT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var disciplineCode = arrayData[0];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete this item?" + disciplineCode,
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
                    disciplineCode: disciplineCode 
                };

                $.ajax({
                    url: "discipline_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#disciplineTable').load('discipline_table.jsp');
                            //alert("Delete Success");
                            
                            bootbox.alert({
                                    message: "A discipline is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed!");
                            
                        }else{
                            
                            bootbox.alert(datas.trim());
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





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_disciplineTable').DataTable();
    });
</script>
