<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String incomeRange = "select * from adm_lookup_detail where master_reference_code = '0028' ";
    String hcf = "select * from adm_lookup_detail where master_reference_code = '0081'   ";
    String status = "select * from adm_lookup_detail where master_reference_code = '0014'   ";
    String occupation = "select * from adm_lookup_detail where master_reference_code = '0050'";

    //String empList = "select * from pms_employment where pmi_no = ''";
    ArrayList<ArrayList<String>> dataIncomeRange, dataHfc, dataStatus, dataOccu;

    dataIncomeRange = conn.getData(incomeRange);
    dataHfc = conn.getData(hcf);
    dataStatus = conn.getData(status);
    dataOccu = conn.getData(occupation);


%>
<!-- Modal -->
<div class="modal fade" id="EMPModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Employment Information</h3>
            </div>
            <div class="modal-body" >

                <div class="thumbnail" id="maintainEMP">
                    <!--            <h4>Employment Information</h4>-->
                    <form class="form-horizontal" id="empform">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>  
                            <div class="col-md-8">
                                <input id="EMPpmino" name="EMPpmino" type="text"  class="form-control input-md">
                                <input id="EMPseq" name="EMPseq" type="hidden"  class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Employer Code</label>  
                            <div class="col-md-8">
                                <input id="EMPempcode" name="EMPempcode" type="text"  class="form-control input-md">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Employer Name</label>  
                            <div class="col-md-8">
                                <input id="EMPempname" name="EMPempname" type="text"  class="form-control input-md" maxlength="80">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Occupation</label>  
                            <div class="col-md-8">
                                <!--                        <input id="EMPoccu" name="EMPoccu" type="text"  class="form-control input-md">-->
                                <select id="EMPoccu" name="EMPoccu" class="form-control">
                                    <option selected="" disabled="">Please select Occupation</option>
                                    <option value="-">-</option>
                                    <% for (int i = 0; i < dataOccu.size(); i++) {%>
                                    <option value="<%=dataOccu.get(i).get(1)%>"><%=dataOccu.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Joined Date</label>  
                            <div class="col-md-8">
                                <input id="EMPjdate" name="EMPjdate" type="text"  class="form-control input-md">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Income Range</label>
                            <div class="col-md-8">
                                <select id="EMPinrange" name="EMPinrange" class="form-control">
                                    <option selected="" disabled="">Please select Income Range</option>
                                    <option value="-">-</option>
                                    <% for (int i = 0; i < dataIncomeRange.size(); i++) {%>
                                    <option value="<%=dataIncomeRange.get(i).get(1)%>"><%=dataIncomeRange.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Health Facility</label>
                            <div class="col-md-8">
                                <select id="EMPhfc" name="EMPhfc" class="form-control">
                                    <option selected="" disabled="">Please select health facility</option>
                                    <option value="-">-</option>
                                    <% for (int i = 0; i < dataHfc.size(); i++) {%>
                                    <option value="<%=dataHfc.get(i).get(1)%>"><%=dataHfc.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Created Date</label>  
                            <div class="col-md-8">
                                <input id="EMPcredate" name="EMPcredate" type="text"  class="form-control input-md" readonly>

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Status</label>
                            <div class="col-md-8">
                                <select id="EMPstatus" name="EMPstatus" class="form-control">
                                    <option selected="" disabled="">Please select status</option>
                                    <option value="-">-</option>
                                    <% for (int i = 0; i < dataStatus.size(); i++) {%>
                                    <option value="<%=dataStatus.get(i).get(1)%>"><%=dataStatus.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                    </form>
                    <div class="text-center">
                        <button id="EMPsave" name="EMPsave" class="btn btn-primary" data-dismiss="modal" role="button"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                        <!--                <button id="EMPupdate" name="EMPupdate" class="btn btn-default" disabled=""><i class="fa fa-edit fa-lg"></i>&nbsp; Update</button>-->
                        <button id="EMPclear" name="EMPclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
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
    $(document).ready(function(){
  
        
        $(function(){
            $('#EMPcredate').datepicker({dateFormat:'dd-mm-yy',changeMonth:true,changeYear:true});
        });
        
        $(function(){
            $('#EMPjdate').datepicker({dateFormat:'dd-mm-yy',changeMonth:true,changeYear:true});
        });
        
    });
    //yyyy-MM-dd HH:mm:ss
    var nowDate = new Date();
    var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;

    //months
    var month = (nowDate.getMonth() + 1);
    if (month < 10) {
        ZeroMonth = "0" + month;
    } else {
        ZeroMonth = month;
    }

    //days
    var day = (nowDate.getDate());
    if (day < 10) {
        ZeroDay = "0" + day;
    } else {
        ZeroDay = day;
    }

    //years
    var year = (nowDate.getFullYear());

    //hours
    var hours = nowDate.getHours();
    //minutes
    var minutes = nowDate.getMinutes();
    if (minutes < 10) {
        ZeroMinutes = "0" + minutes;
    } else {
        ZeroMinutes = minutes;
    }
    //seconds
    var seconds = nowDate.getSeconds();
    if (seconds < 10) {
        ZeroSeconds = "0" + seconds;
    } else {
        ZeroSeconds = seconds;
    }
    //complete day
    var yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
    var HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
    var yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
    var ddMMyyyy= ZeroDay+ "-" + ZeroMonth + "-" +year;
    $('#EMPcredate').val(ddMMyyyy);
    

    
    //function to save employment when click save button
        $('#EMPsave').on('click', function () {

            var EMPpmino = $('#EMPpmino').val(),
                    EMPseq = $('#EMPseq').val(),
                    EMPcd = $('#EMPempcode').val(),
                    EMPname = $('#EMPempname').val(),
                    EMPoccu = $('#EMPoccu').val(),
                    EMPjdate = $('#EMPjdate').val(),
                    EMPinrange = $('#EMPinrange').val(),
                    EMPhfc = $('#EMPhfc').val(),
                    EMPcredate = $('#EMPcredate').val(),
                    EMPstatus = $('#EMPstatus').val();

            var splitCreDate = String(EMPcredate).split("-");
            var convertedCreDate = splitCreDate[0] + "/" + splitCreDate[1] + "/" + splitCreDate[2];

            var splitJDate = String(EMPjdate).split("-");
            var convertedJDate = splitJDate[0] + "/" + splitJDate[1] + "/" + splitJDate[2];

            var datas = {
                EMPpmino: EMPpmino,
                EMPseq: EMPseq,
                EMPcd: EMPcd,
                EMPname: EMPname,
                EMPoccu: EMPoccu,
                EMPjdate: convertedJDate,
                EMPinrange: EMPinrange,
                EMPhfc: EMPhfc,
                EMPcredate: convertedCreDate,
                EMPstatus: EMPstatus
            };
            //console.log(datas);
            bootbox.confirm({
                message: "Are you sure want to save patient's Employment Information?",
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
                            url: "saveEmp.jsp",
                            data: datas,
                            timeout: 3000,
                            success: function (data) {
                                console.log(data);
                                if (data.trim() === "true") {
                                    bootbox.alert('Patient Employment Information  saved successfully');
                                    $('#empform')[0].reset();
                                    $('input[id=EMPpmino]').val($.trim(EMPpmino));
                                    //$('#empform').find('input, select, textarea').not("#EMPpmino").val('');
                                    //$('select').find('option').prop("selected", false);
                                    $.ajax({
                                        url: "listEmp.jsp",
                                        type: "post",
                                        data: {'PMINO': EMPpmino},
                                        timeout: 3000,
                                        success: function (returnhtml) {
                                            console.log(returnhtml);
                                            $('#tableListEmp').html(returnhtml);
                                            $('#EMPpmino').prop('readonly', false);
                                        }
                                    });
                                } else {
                                    bootbox.alert('Patient Employment Information  fail to save');
                                }

                            }, error: function () {

                            }

                        });
                    }
                }
            });


        });
    //function to clear the form when click clear button
    $('#EMPclear').on('click', function () {
        var pmino = $('input[id=EMPpmino]').val();
        $('#empform')[0].reset();
        $('input[id=EMPpmino]').val(pmino);
        $('#EMPseq').val("");
        $('#EMPpmino').prop('readonly', false);
    });

</script>

