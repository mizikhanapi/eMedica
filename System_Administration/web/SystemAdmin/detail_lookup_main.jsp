<%-- 
    Document   : detail_lookup_main
    Created on : Jan 26, 2017, 11:11:51 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    LOOKUP DETAIL MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail2" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Lookup Detail</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Lookup Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master code</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="masterCode2">
                                <option value="Select Master Code">Select Master Code</option>
                                <%
                                    String sql = "SELECT master_reference_code, description FROM adm_lookup_master";
                                    ArrayList<ArrayList<String>> listOfMasterCode = Conn.getData(sql); 
                                    
                                    int size = listOfMasterCode.size();
                                    
                                    for(int i = 0; i < size; i++)
                                    {
                                %>
                                <option value="<%= listOfMasterCode.get(i).get(0) %>"><%= listOfMasterCode.get(i).get(0)%> - <%= listOfMasterCode.get(i).get(1)%> </option>
                                <%
                                    }
                                %>
                                
                            </select>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail code</label>
                        <div class="col-md-8">
                            <input id="detailCode" name="detailCode" type="text" placeholder="Lookup Detail Code" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Name</label>
                        <div class="col-md-8">
                            <input id="detailName" name="detailName" type="text" placeholder="Lookup Detail Name" class="form-control input-md">
                        </div>
                    </div>

                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status2" id="status2_1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status2" id="status2_2" value="0">
                                Inactive
                            </label>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnAdd2">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset2" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


 <script>

        w3IncludeHTML();

        $(document).ready(function () {
            
            function reset () {
                document.getElementById("masterCode2").value = "";
                document.getElementById("detailCode").value = "";
                document.getElementById("detailName").value = "";
                document.getElementById("status2_1").checked = false;
                document.getElementById("status2_2").checked = false;
            }

            $('#btnReset2').on('click', function () {
                reset();
            });

            $('#btnAdd2').on('click', function () {
                var masterCode = $('#masterCode2').val();
                var detailCode = $('#detailCode').val();
                var detailName = $('#detailName').val();
                var status = $('input[name="status2"]:checked').val();

                if (masterCode === "" || masterCode === "Select Master Code" || masterCode === null) {
                    alert("Fill in the Master Code");
                    $('#masterCode2').focus();
                    
                } else if (detailCode === "") {
                    alert("Complete The Fields");
                    $('#detailCode').focus();
                    
                } else if (detailName === "") {
                    alert("Complete The Fields");
                    $('#detailName').focus();
                    
                }else if (status !== "1" && status !== "0") {
                    alert("Select Any Status");
                } else {

                    var data = {
                        masterCode : masterCode,
                        detailCode : detailCode,
                        detailName : detailName,
                        status: status
                    };

                    $.ajax({
                        url: "detail_lookup_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 5000,
                        success: function (datas) {
                            
                            console.log(datas);

                            if (datas.trim() === 'Success') {

                                $('#detailTable').load('detail_lookup_table.jsp');
                                $('#detail2').modal('hide');
                                alert("Insertion Success");
                                reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                $('#detail2').modal('hide');
                                reset();
                                
                            }else{
                                
                                alert(datas.trim());
                                reset();
                            }

                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success: ");
                        }

                    });
                }

            });
            
            
            
        });



    </script>