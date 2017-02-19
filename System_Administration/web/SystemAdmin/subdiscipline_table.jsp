<%-- 
    Document   : subdiscipline_table
    Created on : Feb 5, 2017, 11:20:23 PM
    Author     : user
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<table  id="THE_subdisciplineTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Discipline Code</th>
    <th>Discipline Name</th>
    <th>Subdiscipline Code</th>
    <th>Subdiscipline Name</th>
    <th>Type</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT dc.discipline_cd, discipline_name, subdiscipline_cd, subdiscipline_name, subdiscipline_type, subdiscipline_status "
                + " FROM adm_discipline dc join adm_subdiscipline sdc using (discipline_cd)";
        ArrayList<ArrayList<String>> dataDetail = conn.getData(sql);

        int size = dataDetail.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="SDT_hidden" type="hidden" value="<%=String.join("|", dataDetail.get(i))%>">
<td><%= dataDetail.get(i).get(0)%></td> <!--discipline code  -->   
<td><%= dataDetail.get(i).get(1)%></td> <!--discipline name  --> 
<td><%= dataDetail.get(i).get(2)%></td> <!--sub code  --> 
<td><%= dataDetail.get(i).get(3)%></td> <!--sub name  --> 
<td><%= dataDetail.get(i).get(4)%></td> <!--Type  -->
<td><%if(dataDetail.get(i).get(5).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td> <!--status --> 

<td style="width: 5% ">

    <!-- Update Part Start -->
    <a id="SDT_btnUpdate" data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5% ">
    <!-- Delete Button Start -->
    <a id="SDT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>



<%
    }
%>

</tbody>
</table>

<!-- Modal Update -->
<div class="modal fade" id="SDT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Subdiscipline</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code</label>
                        <div class="col-md-8">
                            <input id="SDT_disciplineCode" name="textinput" type="text" class="form-control input-md" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Code</label>
                        <div class="col-md-8">
                            <input id="SDT_subdisciplineCode"  type="text"  class="form-control input-md" readonly>
                        </div>
                    </div>    

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Name</label>
                        <div class="col-md-8">
                            <input id="SDT_subdisciplineName" class="form-control" maxlength="100"  >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Type</label>
                        <div class="col-md-8">
                            <input id="SDT_type" class="form-control" type="text" placeholder="Subdiscipline type (Optional)" maxlength="30" >
                        </div>
                    </div>

                   
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="SDT_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="SDT_btnUpdateConfirm">Update</button>
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

    $('#subdisciplineTable').off('click', '#THE_subdisciplineTable #SDT_btnUpdate').on('click', '#THE_subdisciplineTable #SDT_btnUpdate', function (e) {
        e.preventDefault();
        
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#SDT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var disciplineCode = arrayData[0], subdisciplineCode = arrayData[2], subdisciplineName = arrayData[3], status = arrayData[5], type = arrayData[4];
        //set value in input on the top
        $('#SDT_disciplineCode').val(disciplineCode);
        $('#SDT_subdisciplineCode').val(subdisciplineCode);
        $('#SDT_subdisciplineName').val(subdisciplineName);
        $('#SDT_type').val(type);
       
        if (status === '1')
            $('#SDT_status').val(1);
        else
            $('#SDT_status').val(0);



        console.log(arrayData);
    });


    $('#SDT_btnUpdateConfirm').on('click', function () {

        var disciplineCode = $('#SDT_disciplineCode').val();
        var subdisciplineCode = $('#SDT_subdisciplineCode').val();
        var subdisciplineName = $('#SDT_subdisciplineName').val();
        var type = $('#SDT_type').val();
        var status = $('#SDT_status').val();

        if (subdisciplineName === "" || subdisciplineName === null) {
            alert("Please fill in the name");
            $('#SDT_subdisciplineName').focus();

        } else if (status !== '1' && status !== '0') {
            alert("Please choose the status");
            $('#SDT_status').focus();

        } else {

            var data = {
                disciplineCode: disciplineCode,
                subdisciplineCode: subdisciplineCode,
                subdisciplineName: subdisciplineName,
                type: type,
                status: status
            };

            $.ajax({
                url: "subdiscipline_update.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    console.log(datas.trim());
                    if (datas.trim() === 'Success') {
                        $('#subdisciplineTable').load('subdiscipline_table.jsp');
                        $(".modal-backdrop").hide();
                        //alert("Update Success");
                        
                        bootbox.alert({
                                    message: "Subdiscipline is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                        
                    } else if (datas.trim() === 'Failed') {
                        alert("Update failed!");

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });
        }



    });

    $('#subdisciplineTable').off('click', '#THE_subdisciplineTable #SDT_btnDelete').on('click', '#THE_subdisciplineTable #SDT_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#SDT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var disciplineCode = arrayData[0], subdisciplineCode = arrayData[2];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + disciplineCode + "-" + subdisciplineCode,
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
                        subdisciplineCode: subdisciplineCode,
                        disciplineCode: disciplineCode
                    };

                    $.ajax({
                        url: "subdiscipline_delete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#subdisciplineTable').load('subdiscipline_table.jsp');
                                //alert("Delete Success");
                                 bootbox.alert({
                                    message: "A subdiscipline is deleted",
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
        $('#THE_subdisciplineTable').DataTable();

        
    });
</script>

