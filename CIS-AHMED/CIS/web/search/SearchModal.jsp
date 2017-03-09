<%-- 
    Document   : SearchModal
    Created on : 07-Mar-2017, 12:32:15
    Author     : ahmed
--%>

<!-- Modal -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Search</h3>
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
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control input-md" id="idInputApp" name="idInputApp" placeholder="ID"/>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary" type="button" id="searchApp" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                                <button id="clearApp" name="clearApp" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="thumbnail"><div class="row"id="modalSeacrhID" >
                        <!-- content goes here -->
                        <center><h4>PREVIOUS VISIT</h4></center>
                        <form role="form" id="formAppointmentSaya" method="post">
                            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient">
                                <thead>
                                <th>Episode Date</th>
                                <th>Health Care</th>
                                <th>Discipline</th>
                                <th>Action</th>
                                </thead>
                            </table>
                        </form>
                    </div>
                </div>

                <div class="thumbnail" id="episodeDetail">
                    <h4>Detail By Episode</h4>
                    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="detailEpisode">
                        <tbody id="detailbyepisode">
                            <tr data-status="pagado">
                                <td>
                                    <!--                                    <div class="media">
                                                                            <div class="media-body">
                                                                                <p class="summary"  id="summary">Back pain Moderate, Right</p>
                                                                            </div>
                                                                        </div>-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                </div>

            </div>
            <script type="text/javascript">
                function searchApp() {
                    var inputApp = $('#idInputApp').val();
                    var typeApp = $('#idTypeApp').val();
                    $.ajax({
                        type: "POST",
                        data: {idType: typeApp, idInput: inputApp},
                        url: "search/searchID.jsp", // call the jsp file ajax/tuto-autocomplete.php
                        timeout: 10000,
                        success: function (list) {
                            console.log(list);

                            $('#modalSeacrhID').html(list);
                            
                            $('#ViewDetail').click(function () {
                                var row = $(this).closest("tr");
                                var pmi_no = row.find("#pmi").val();
                                var episodeDate = row.find("#episode").val();
                                var disiplineName = row.find("#disipline").val();
                                //alert(pmi_no);
                                // alert(episodeDate);
                                $.ajax({
                                    type: "POST",
                                    data: {pmi_no: pmi_no, episodeDate: episodeDate, disiplineName: disiplineName},
                                    url: "search/episodeDetail.jsp", // call the jsp file ajax/tuto-autocomplete.php
                                    timeout: 10000,
                                    success: function (list) {
                                        console.log(list);
                                        $('#episodeDetail').html(list);
                                    }
                                });
                            });
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

                $('#clearApp').click(function () {
                    $('#myFormApp')[0].reset();
                });


//     $('#episodeDetail').on('click', '#searchPatient1  #ViewDetail', function () {
//        var row = $(this).closest("tr");
//        var pmi_no = row.find("#pmi").val(); 
//        var episodeDate = row.find("#episode").val();
//        console.log(pmi_no);
//        console.log(episodeDate);
//        
//        $.ajax({
//            type: "POST",
//            data: {pmi_no: pmi_no, episodeDate: episodeDate},
//            url: "search/episodeDetail.jsp", // call the jsp file ajax/tuto-autocomplete.php
//            timeout: 10000,
//            success: function (list) {
//                console.log(list);
//                $('#episodeDetail').html(list);
//            } 
//        });        
//     });
            </script>
        </div>
    </div>
</div>
