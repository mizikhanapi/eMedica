


<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>


<%
    session.getAttribute("hfc");
    session.getAttribute("discipline");
    session.getAttribute("subDicipline");
    //session.setAttribute("hfc", "hfc_test");
%>


<%
    Conn conn = new Conn();
%>

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MAINTAIN WARD/ FACILITY TYPE
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#beddetail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ASSIGN BED</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="beddetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Facility Type</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- session -->
                    <input id="hfc" type="hidden" value="<%= session.getAttribute("hfc")%>">
                    <input id="discipline" type="hidden" value="<%= session.getAttribute("discipline")%>">
                    <input id="sub" type="hidden" value="<%= session.getAttribute("subDicipline")%>">

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discipline</label>
                        <div class="col-md-4">
                            <select id="Discipline" name="selectbasic" class="form-control">
                                <option value="Select Discipline" >Select Discipline</option>


                                        <%
                                            String sql2 = "SELECT  discipline_cd FROM adm_hfc_discipline";
                                            ArrayList<ArrayList<String>> dataDiscipline = conn.getData(sql2);

                                            int size2 = dataDiscipline.size();

                                            for (int i = 0; i < size2; i++) {
                                        %>
                                        <option value="<%= dataDiscipline.get(i).get(0)%>"><%= dataDiscipline.get(i).get(0)%> </option>
                                        <%
                                            }
                                        %>

                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                        <div class="col-md-4">
                            <select id="Ward_Class" name="selectbasic" class="form-control">
                                <option value="Ward Class" >Ward Class</option>

                                <%
                                    String sql1 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class";
                                    ArrayList<ArrayList<String>> dataClass = conn.getData(sql1);

                                    int size = dataClass.size();

                                    for (int i = 0; i < size; i++) {
                                %>
                                <option value="<%= dataClass.get(i).get(0)%>"><%= dataClass.get(i).get(0)%> ( <%= dataClass.get(i).get(1)%> )</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward ID/Name</label>
                        <div class="col-md-4">
                            <select id="Ward_ID" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Ward ID/Name</option>
                                <%
                                    String sql3 = "SELECT ward_id, ward_name FROM wis_ward_name";
                                    ArrayList<ArrayList<String>> dataID = conn.getData(sql3);

                                    int size3 = dataID.size();

                                    for (int i = 0; i < size3; i++) {
                                %>
                                <option value="<%= dataID.get(i).get(0)%>"><%= dataID.get(i).get(0)%> ( <%= dataID.get(i).get(1)%> ) </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>   

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Bed ID</label>
                        <div class="col-md-8">
                            <textarea id="BedID" class="form-control" rows="3" maxlength="200" placeholder="Generic Name"></textarea>
                        </div>
                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Bed Status</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="0">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MWBED_add">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MWBED_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    w3IncludeHTML();
    $(document).ready(function () {



        $('#MWBED_add').on('click', function () {
            var Discipline = $('#Discipline').val();
            var Ward_Class = $('#Ward_Class').val();
            var Ward_ID = $('#MWID').val();
            var BedID = $('#BedID').val();
            var status = $('input[name="status"]:checked').val();
            //var hfc = $('#hfc').val();
            // var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Discipline === "") {
                alert("Complete The Fields");
            } else if (Ward_Class === "") {
                alert("Complete The Fields");
            } else if (Ward_ID === "") {
                alert("Complete The Fields");
            } else if (BedID === "") {
                alert("Complete The Fields");
            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");
            } else {

                var data = {
                    Discipline:Discipline,
                    Ward_Class: Ward_Class,
                    Ward_ID: Ward_ID,
                    BedID: BedID,
                    status: status
                };
                console.log(data);

                $.ajax({
                    url: "assignBedInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {

                        console.log(data);

                        if (data.trim() === 'Success') {

                            $("#AssignBedTable").load("assign-bed-to-ward-table.jsp");
                            $('#beddetail').modal('hide');
                            bootbox.alert({
                                message: "Successfully added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();



                        } else if (data.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#beddetail').modal('hide');
                            reset();

                        }

                    }, error: function (err) {
                        console.log("Ajax Is Not Success");

                    }

                });

            }

        });


        //function to clear the form when click clear button

        function reset() {
            document.getElementById("Discipline").value = "";
            document.getElementById("Ward_Class").value = "";
            document.getElementById("Ward_ID").value = "";
            document.getElementById("BedID").value = "";
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;
        }

        $('#MW_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });


    });


</script> 
<br>



</body>
</html>