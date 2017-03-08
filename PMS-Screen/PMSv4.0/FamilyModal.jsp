<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String relation71 = "select * from adm_lookup_detail where master_reference_code = '0007'   ";
    String occupation71 = "select * from adm_lookup_detail where master_reference_code = '0050'";
    ArrayList<ArrayList<String>> dataRelation71,dataOccu71;
    dataRelation71 = conn.getData(relation71);
    dataOccu71 = conn.getData(occupation71);

%>
<!-- Modal -->
<div class="modal fade" id="FamilyModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body" >

                <div class="thumbnail" id="maintainFam">
            <h4>Family Information</h4>
            <form class="form-horizontal" id="famForm">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="FAMpmi" name="FAMpmi" type="text"  class="form-control input-md">
                        <input id="FAMseq" name="FAMseq" type="hidden"  class="form-control input-md">
                    </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="selectbasic">Family Relationship</label>
                    <div class="col-md-8">
                        <select id="FAMrelay" name="FAMrelay" class="form-control">
                            <option value="null" disabled="" selected="">Select Family Relationship</option>
                            <option value="-">-</option>

                            <%                                        for (int i = 0; i < dataRelation71.size(); i++) {%>
                            <option value="<%=dataRelation71.get(i).get(1)%>"><%=dataRelation71.get(i).get(2)%></option>
                            <%  }
                            %>
                        </select>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">IC no./ID no.</label>  
                    <div class="col-md-8">
                        <input id="FAMpmifam" name="FAMpmifam" type="text"  class="form-control input-md" maxlength="15">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>  
                    <div class="col-md-8">
                        <input id="FAMname" name="FAMname" type="text"  class="form-control input-md" maxlength="80">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Occupation</label>
                    <div class="col-md-8">
<!--                        <input id="FAMocc" name="FAMocc" type="text"  class="form-control input-md">-->
                        <select id="FAMocc" name="FAMocc" class="form-control">
                            <option selected="" disabled="">Please select Occupation</option>
                            <option value="-">-</option>
                            <% for (int i = 0; i < dataOccu71.size(); i++) {%>
                            <option value="<%=dataOccu71.get(i).get(1)%>"><%=dataOccu71.get(i).get(2)%></option>
                            <%  }
                            %>
                        </select>
                    </div>
                </div>

            </form>
            <div class="text-center">
                <button id="FAMsave" name="FAMsave" class="btn btn-primary" data-dismiss="modal" role="button"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                <button id="FAMclear" name="FAMclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
            </div>
        </div>

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
       $('#FAMsave').on('click', function (e) {
        e.preventDefault();
        var pmino = $('#FAMpmi').val(),
                seq = $('#FAMseq').val(),
                relay = $('#FAMrelay').val(),
                fampnimo = $('#FAMpmifam').val(),
                name = $('#FAMname').val(),
                occu = $('#FAMocc').val();

        if (relay === null) {
            relay = "-";
        }
        if (fampnimo === "") {
            fampnimo = "-";
        }
        if (name === "") {
            name = "-";
        }
        if (occu === "") {
            occu = "-";
        }

        var datas = {
            pmino: pmino,
            seq: seq,
            relay: relay,
            fampnimo: fampnimo,
            name: name,
            occu: occu
        };

        bootbox.confirm({
            message: "Are you sure want to save patient's Family Information?",
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
//if true go to PMI page
                if (result === true) {
                    $.ajax({
                        type: "post",
                        url: "saveFamily.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);
                            if (data.trim() === "true") {
                                bootbox.alert("Patient's Family Information saved successfully");
                                $('#famForm')[0].reset();
                                $('input[id=FAMpmi]').val(pmino);

                                $.ajax({
                                    url: "listFamily.jsp",
                                    type: "post",
                                    data: {'PMINO': pmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#tableListFamily').html(returnhtml);
                                        $('#FAMpmi').prop('readonly', false);

                                        $('#FAMpmifam').prop('readonly', false);
                                    }
                                });
                            } else {
                                bootbox.alert("Patient's Family Information  fail to save");
                            }

                        }, error: function () {

                        }

                    });
                }
            }
        });

    });

    //function to clear the form when click clear button
    $('#FAMclear').on('click', function (e) {
        e.preventDefault();
        var pmino = $('input[id=FAMpmi]').val();
        $('#famForm')[0].reset();
        $('input[id=FAMpmi]').val(pmino);
        $('#FAMseq').val("");
        $('#FAMpmi').prop('readonly', false);

        $('#FAMpmifam').prop('readonly', false);

    });

</script>

