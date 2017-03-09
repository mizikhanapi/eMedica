<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 9:55:20 AM
    Author     : -D-
--%>

<%
    String sqlPgcs = "SELECT * FROM gcs_response WHERE response_type ='pgcs'";
    ArrayList<ArrayList<String>> dataPgcs = Conn.getData(sqlPgcs);
%>
<!-- Modal -->
<div class="modal fade" id="CIS020002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog"  id="mainModalPGCS">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Pediatric Glasgow Coma Scale</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2">

                    <div class="form-group">
                        <input type="text" name="resultpgcsMain" id="resultpgcsMain" class="form-control input-lg" placeholder="Result" tabindex="4">
                    </div>
                    <div class="form-group">
                        <input type="text" name="pointpgcsMain" id="pointpgcsMain" class="form-control input-lg" placeholder="Point" tabindex="4">
                    </div>
                    <div class="form-group">
                        <table class="table table-striped" align="center" id="gcs_table">
                            <thead>
                            <td style="width: 80%">Response</td>
                            <td>Points</td>
                            </thead>
                            <tbody>
                                <tr id="rowpEO">
                                    <td>-</td>
                                    <td>0 Point</td>
                                </tr>
                                <tr id="rowpMR">
                                    <td>-</td>
                                    <td>0 Point</td>
                                </tr>
                                <tr id="rowpVR">
                                    <td>-</td>
                                    <td>0 Point</td>
                                </tr>      
                            </tbody>
                        </table>
                    </div>

                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group" id="PGCSBtn">
                            <button  class="btn btn-primary btn-block btn-lg " id="PInsertBtn" role="button">Insert Pediatric Glasgow Coma Scale</button>
                        </div>
                    </div>


            </div>
            
            <div class="modal-footer" id="updatePGSC">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg gcsUpdate " id="pgcsUpdate" >Update</a>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
            
            <div class="modal-footer" id="actionPGSC">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg gcsAccept " id="pgcsAccept" >Accept</a>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!--SUB MODAL-->
    <div class="modal-dialog" id="subModalPGCS">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Pediatric Glasgow Coma Scale</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2">

                    <div class="form-group">
                        <input type="text" id="pgcstpoint" class="form-control input-lg" placeholder="Total Point" tabindex="4">
                    </div>
                    <div class="form-group">
                        <input type="text"  id="pgcsresult" class="form-control input-lg" placeholder="Result" tabindex="4">
                        <input type="hidden"  id="pgcsid" class="form-control input-lg" placeholder="pgcsid" tabindex="4">

                    </div>
                    <div class="form-group">
                        <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
                            <br>
                            <% for (int i = 0; i < dataPgcs.size(); i++) {
                            %>
                            <h4><%out.print(dataPgcs.get(i).get(1));%></h4>
                            <table class="table table-striped" align="center" id="gcs_table">
                                <thead>
                                <td>Response</td>
                                <td></td>
                                </thead>
                                <tbody>

                                    <%
                                        String sqlGetMonth = "SELECT gs.month_code,gm.month_desc  FROM gcs_scale gs, gcs_month gm"
                                                + " WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND gs.month_code=gm.month_code "
                                                + "group by month_code asc";
   
                                        ArrayList<ArrayList<String>> dataGetMonth = Conn.getData(sqlGetMonth);
                                    %>
                                    <tr>
                                        <%
                                            for (int im = 0; im < dataGetMonth.size(); im++) {
                                        %>
                                        <td><%out.print(dataGetMonth.get(im).get(1));%></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <tr>
                                    <%
                                        String sqlpGcsScale = "SELECT * FROM gcs_scale WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND month_code='"+dataGetMonth.get(0).get(0)+"'";
                                        ArrayList<ArrayList<String>> datapGcsScale = Conn.getData(sqlpGcsScale);

                                        for (int ii = 0; ii < datapGcsScale.size(); ii++) {
                                            if (datapGcsScale.get(0).get(4).equals("1")) {
                                           String sql2pGcsScale = "SELECT * FROM gcs_scale WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND month_code='"+dataGetMonth.get(1).get(0)+"'";
                                            ArrayList<ArrayList<String>> data2pGcsScale = Conn.getData(sql2pGcsScale);
                                    %>
                                    
                                        <td><%out.print(datapGcsScale.get(ii).get(2));%></td>
                                        <td><%out.print(data2pGcsScale.get(ii).get(2));%></td>

                                        <td><input type="radio" name="<%out.print(datapGcsScale.get(ii).get(0));%>" id="<%out.print(datapGcsScale.get(ii).get(0));%>"value="<%out.print(datapGcsScale.get(ii).get(3));%>"></td>
                                    </tr>
                                    <%
                                    } else if (datapGcsScale.get(0).get(4).equals("3")) {
                                    String sql3pGcsScale = "SELECT * FROM gcs_scale WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND month_code='"+dataGetMonth.get(0).get(0)+"'";
                                    ArrayList<ArrayList<String>> data3pGcsScale = Conn.getData(sql3pGcsScale);

                                    String sql4pGcsScale = "SELECT * FROM gcs_scale WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND month_code='"+dataGetMonth.get(1).get(0)+"'";
                                    ArrayList<ArrayList<String>> data4pGcsScale = Conn.getData(sql4pGcsScale);

                                    String sql5pGcsScale = "SELECT * FROM gcs_scale WHERE response_code='" + dataPgcs.get(i).get(0) + "' AND month_code='"+dataGetMonth.get(2).get(0)+"'";
                                    ArrayList<ArrayList<String>> data5pGcsScale = Conn.getData(sql5pGcsScale);

                                    %>
                                    <tr>
                                        <td><%out.print(data3pGcsScale.get(ii).get(2));%></td>
                                        <td><%out.print(data4pGcsScale.get(ii).get(2));%></td>
                                        <td><%out.print(data5pGcsScale.get(ii).get(2));%></td>

                                        <td><input type="radio" name="<%out.print(datapGcsScale.get(ii).get(0));%>" id="<%out.print(datapGcsScale.get(ii).get(0));%>"value="<%out.print(datapGcsScale.get(ii).get(3));%>"></td>
                                    </tr>
                                    <%
                                        }
                                    }
                                    %>


                                </tbody>
                            </table>
                            <%}%>

                        </div>

                    </div>

            </div>
            <div class="modal-footer"id="subModalActionPgcs" >
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg  " id="pgcsDone" >Done</a>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg"   role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="backPgcs" class="btn btn-danger btn-block btn-lg"  role="button">Back</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>

</div>



<script type='text/javascript'>

    $(document).ready(function () {

        var eor = 0;
        var mr = 0;
        var vr = 0;
        var tPoint = 0;

        console.log('loading...');
        $('#subModalPGCS').hide();
        $('#updatePGSC').hide();

        $('input[type=radio][name=pgcs_eo]').change(function () {
            eor = this.value.split(" ");
            eor = parseInt(eor[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpEO').replaceWith("<tr id='rowpEO'><td>" + response + "</td><td>" + point + "</td></tr>");
            console.log(response);
                           var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('input[type=radio][name=pgcs_mr]').change(function () {
            mr = this.value.split(" ");
            mr = parseInt(mr[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpMR').replaceWith("<tr id='rowpMR'><td>" + response + "</td><td>" + point + "</td></tr>");
                           var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('input[type=radio][name=pgcs_vr]').change(function () {
            vr = this.value.split(" ");
            vr = parseInt(vr[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpVR').replaceWith("<tr id='rowpVR'><td>" + response + "</td><td>" + point + "</td></tr>");
                          var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('#PGCSBtn').on('click', '#PInsertBtn', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').hide();
            $('#subModalPGCS').show();
        });

        $('#subModalActionPgcs').on('click', '#backPgcs', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').show();
            $('#subModalPGCS').hide();
        });

        $('#subModalActionPgcs').on('click', '#pgcsDone', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').show();
            $('#subModalPGCS').hide();
            $('#resultpgcsMain').val($('#pgcsresult').val());
            $('#pointpgcsMain').val($('#pgcstpoint').val());

        });
    });


</script>