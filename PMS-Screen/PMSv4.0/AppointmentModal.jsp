
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
    //Conn conn = new Conn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    //out.println(dateFormat.format(date));
    //String sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where appointment_date like '%" + dateFormat.format(date) + "%' and status ='active' and hfc_cd='" + session.getAttribute("HFC") + "'";
    //out.println(sql);
    String idTYpe3 = "select * from adm_lookup_detail where master_reference_code = '0012'   ";

    ArrayList<ArrayList<String>> dataAppointment, dataIdType3;
    //dataAppointment = conn.getData(sql);
    String dataSystemStatus3 = session.getAttribute("SYSTEMSTAT").toString();
    dataIdType3 = conn.getData(idTYpe3);

    //out.println(dataAppointment);
%>

<!-- Modal -->
<div class="modal fade" id="appointmentModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Appointment List</h3>
            </div>
            <div class="modal-body" >
                <div class="thumbnail"><div class="row" id="searchAppointment">
                        <form class="form-horizontal" name="myFormApp" id="myFormApp">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                <div class="col-md-4">
                                    <select id="idTypeApp" name="idTypeApp" class="form-control" required="">
                                        <option selected="" disabled="" value="-"> Please select ID type</option>
                                        <option value="pmino">PMI No</option>
                                        <option value="icnew">IC No (NEW)</option>
                                        <option value="icold">IC No (OLD)</option>
                                        <!--<option value="matricno">Matric No</option>
                                        <option value="staffno">Staff No</option>-->
                                        <%                                if (dataSystemStatus3.equals("0")) {

                                            } else if (dataSystemStatus3.equals("1")) {
                                                for (int i = 0; i < dataIdType3.size(); i++) {%>
                                        <option value="<%=dataIdType3.get(i).get(1)%>"><%=dataIdType3.get(i).get(2)%></option>
                                        <%  }
                                            }

                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control input-md" id="idInputApp" name="idInputApp" placeholder="ID" maxlength="0"/>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary" type="button" id="searchApp" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                                <button id="clearApp" name="clearApp" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                            </div>
                        </form>
                    </div></div>
                <div class="thumbnail"><div class="row"id="modalBodyAppointment" >
                        <!-- content goes here -->
                        <form role="form" id="formAppointmentSaya" method="post">
                            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listAppointment">
                                <thead>
                                <th>PMI No.</th>
                                <th>Name</th>
                                <th>Appointment Date</th>
                                <th>Appointment Time</th>
                                <th>Appointment Type</th>
                                <th>Action</th>
                                </thead>

                            </table>
                        </form>
                    </div></div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    //validate max length of input
    $('#idTypeApp').on('change', function () {
        var id = $('#idTypeApp').val();
        if (id === "pmino") {
            $('#idInputApp').attr('maxlength', '13');
        } else if (id === "icnew") {
            $('#idInputApp').attr('maxlength', '12');
        } else if (id === "icold") {
            $('#idInputApp').attr('maxlength', '8');
        } else if (id === "004") {
            $('#idInputApp').attr('maxlength', '10');
        } else if (id === "005") {
            $('#idInputApp').attr('maxlength', '10');
        }
    });

    function searchApp() {
        var inputApp = $('#idInputApp').val();
        var typeApp = $('#idTypeApp').val();
        $.ajax({
            type: "POST",
            data: {idType: typeApp, idInput: inputApp},
            url: "listApp.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                console.log(list);
                $('#modalBodyAppointment').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
        $('#myFormApp')[0].reset();
    }
    ;

    $('#searchApp').on('click', function () {
        searchApp();
    });
    
    //event when press ENTER after inserting the ID
    $("#idInputApp").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchApp();

        }
    });
    
    $('#clearApp').click( function(){
        $('#myFormApp')[0].reset();
    });
</script>