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
<table  id="THE_masterTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Master Code</th>
    <th>Master Name</th>
    <th>Source</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT Master_Reference_code, description, IFNULL(status, 'N/A'), source_indicator FROM adm_lookup_master ";
        ArrayList<ArrayList<String>> dataMaster = conn.getData(sql);

        int size = dataMaster.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="MLT_hidden" type="hidden" value="<%=String.join("|", dataMaster.get(i))%>">
        <td><%= dataMaster.get(i).get(0)%></td>
        <td><%= dataMaster.get(i).get(1)%></td>
        <td><%= dataMaster.get(i).get(3)%></td>
        <td><%if(dataMaster.get(i).get(2).equals("1"))
                out.print("Active"); 
              else
                out.print("Inactive"); %></td>


        <td style="width: 5% ">

            <!-- Update Part Start -->
            <a id="MLT_btnUpdate" data-toggle="modal" data-target="#detail2_" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td style="width: 5% ">
            <!-- Delete Button Start -->
            <a id="deleteButton_" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="detail2_" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Master Code Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master Code</label>
                        <div class="col-md-8">
                            <input id="masterCode_" name="textinput" type="text" placeholder="Master Code" class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master Code Name</label>
                        <div class="col-md-8">
                            <input type="text" id="masterDesc_" class="form-control" maxlength="100"  >
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Source</label>
                        <div class="col-md-8">
                            <input id="masterSource_" name="textinput" type="text" placeholder="Source Indicator" class="form-control input-md" maxlength="30">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="status_">
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
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="MLT_btn_update_">Update</button>
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


<script type="text/javascript" charset="utf-8">
    
    $('#masterTable').off('click', '#THE_masterTable #MLT_btnUpdate').on('click', '#THE_masterTable #MLT_btnUpdate', function (e) {
        e.preventDefault();
        
        //go to the top
//        $('html,body').animate({
//            scrollTop: $("#maintainFam").offset().top
//        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0], masterDesc = arrayData[1], status = arrayData[2], masterSource = arrayData[3];
        //set value in input on the top
        $('#masterCode_').val(masterCode);
        $('#masterDesc_').val(masterDesc);
        $('#masterSource_').val(masterSource);
        
        if(status === '1')
            $('#status_').val(1);
        else
            $('#status_').val(0);
          
        
        
        console.log(arrayData);
    });
    
    $("#MLT_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
        var masterCode = $("#masterCode_").val();
        var masterDesc = $("#masterDesc_").val();
        var masterSource = $("#masterSource_").val();
        var status = $("#status_").val();

        if(masterCode === "" || masterCode === null){
            alert("Fill in the master code");
        }
        else if(masterDesc === "" || masterDesc === null){
            alert("Fill in the master name");
        }
        else if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                masterCode : masterCode,
                masterDesc : masterDesc,
                masterSource : masterSource,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "master_lookup_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#masterTable').load('master_lookup_table_1.jsp');
                             $(".modal-backdrop").hide();
                            alert("Update Success");
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
        
    
     $('#masterTable').off('click', '#THE_masterTable #deleteButton_').on('click', '#THE_masterTable #deleteButton_', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0];
        console.log(arrayData);
         
          var conf = confirm('Are you sure want to delete?' + masterCode);
            if (conf) {

                var data = {
                    masterCode: masterCode 
                };

                $.ajax({
                    url: "master_lookup_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#masterTable').load('master_lookup_table_1.jsp');
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
    

</script>  





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_masterTable').DataTable();
    });
</script>
