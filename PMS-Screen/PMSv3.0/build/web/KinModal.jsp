<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String idType = "select * from adm_lookup_detail where master_reference_code = '0012'   ";
    String district = "select * from adm_lookup_detail where master_reference_code = '0078'   ";
    String postcode = "select * from adm_lookup_detail where master_reference_code = '0079'   ";
    String country = "select * from adm_lookup_detail where master_reference_code = '0001'   ";
    String town = "select * from adm_lookup_detail where master_reference_code = '0003'   ";
    String state = "select * from adm_lookup_detail where master_reference_code = '0002'   ";
    String relation = "select * from adm_lookup_detail where master_reference_code = '0007'  ";
    String occupation = "select * from adm_lookup_detail where master_reference_code = '0050'";

    ArrayList<ArrayList<String>> dataIdType, dataDistrict, dataPostcode, dataCountry, dataTown, dataState, dataRelation, dataOccu;
    dataIdType = conn.getData(idType);
    dataDistrict = conn.getData(district);
    dataPostcode = conn.getData(postcode);
    dataCountry = conn.getData(country);
    dataTown = conn.getData(town);
    dataState = conn.getData(state);
    dataRelation = conn.getData(relation);
    dataOccu = conn.getData(occupation);
%>
<!-- Modal -->
<div class="modal fade" id="KINModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Next Of Kin Information</h3>
            </div>
            <div class="modal-body" >

                <div class="thumbnail" id="maintainKIN">
<!--                    <h4>Next of Kin Information</h4>-->
                    <hr/>
                    <form class="form-horizontal" id="kinform">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>  
                                    <div class="col-md-7">
                                        <input id="KINpmino" name="KINpmino" type="text"  class="form-control input-md">
                                        <input id="KINseq" name="KINseq" type="hidden"  class="form-control input-md">

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Relationship</label>  
                                    <div class="col-md-7">
                                        <select id="KINrelationship" name="KINrelationship" class="form-control">
                                            <option value="null" selected="" disabled="">Select Relationship</option>
                                            <option value="-">-</option>

                                            <%                                        for (int i = 0; i < dataRelation.size(); i++) {%>
                                            <option value="<%=dataRelation.get(i).get(1)%>"><%=dataRelation.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">New IC</label>  
                                    <div class="col-md-7">
                                        <input id="KINnewic" name="KINnewic" type="text"  class="form-control input-md" maxlength="12">

                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                    <div class="col-md-7">
                                        <select id="KINidtype" name="KINidtype" class="form-control">
                                            <option value="null" selected="" disabled="">Select ID Type</option>
                                            <option value="-">-</option>

                                            <%
                                                for (int i = 0; i < dataIdType.size(); i++) {%>
                                            <option value="<%=dataIdType.get(i).get(2)%>"><%=dataIdType.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Date Of Birth</label>  
                                    <div class="col-md-7">
                                        <input id="KINdob" name="KINdob" type="text" class="form-control input-md">

                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Handphone Number</label>
                                    <div class="col-md-7">
                                        <input id="KINphone" name="KINphone" type="text" class="form-control input-md"maxlength="12" >
                                    </div>
                                </div>


                            </div>

                            <div class="col-md-6">

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Name</label>  
                                    <div class="col-md-7">
                                        <input id="KINname" name="KINname" type="text"  class="form-control input-md" maxlength="80">

                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Email</label>
                                    <div class="col-md-7">
                                        <input id="KINemail" name="KINemail" type="text" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Old IC</label>  
                                    <div class="col-md-7">
                                        <input id="KINoldic" name="KINoldic" type="text" class="form-control input-md" maxlength="8">

                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">ID number</label>
                                    <div class="col-md-7">
                                        <input id="KINidnumber" name="KINidnumber" type="text" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Occupation</label>
                                    <div class="col-md-7">
                                        <!--                                <input id="KINoccu" name="KINoccu" type="text" class="form-control input-md">-->
                                        <select id="KINoccu" name="KINoccu" class="form-control">
                                            <option selected="" disabled="">Please select Occupation</option>
                                            <option value="-">-</option>
                                            <% for (int i = 0; i < dataOccu.size(); i++) {%>
                                            <option value="<%=dataOccu.get(i).get(1)%>"><%=dataOccu.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Homephone Number</label>
                                    <div class="col-md-7">
                                        <input id="KINhomephone" name="KINhomephone" type="text" class="form-control input-md" maxlength="12">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h4>Address</h4>
                        <hr/>
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Address</label>
                                    <div class="col-md-7">
                                        <input id="KINaddress" name="KINaddress" type="text" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">District</label>
                                    <div class="col-md-7">
                                        <select id="KINdistrict" name="KINdistrict" class="form-control">
                                            <option value="null" selected="" disabled="">Select District</option>
                                            <option value="-">-</option>
                                            <%
                                                for (int i = 0; i < dataDistrict.size(); i++) {%>
                                            <option value="<%=dataDistrict.get(i).get(2)%>"><%=dataDistrict.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Postcode</label>
                                    <div class="col-md-7">
                                        <select id="KINpostcode" name="KINpostcode" class="form-control">
                                            <option value="null" selected="" disabled="">Select Postcode</option>
                                            <option value="-">-</option>
                                            <%
                                                for (int i = 0; i < dataPostcode.size(); i++) {%>
                                            <option value="<%=dataPostcode.get(i).get(2)%>"><%=dataPostcode.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Country</label>
                                    <div class="col-md-7">
                                        <select id="KINcountry" name="KINcountry" class="form-control">
                                            <option value="null" selected="" disabled="">Select Country</option>
                                            <option value="-">-</option>
                                            <%
                                                for (int i = 0; i < dataCountry.size(); i++) {%>
                                            <option value="<%=dataCountry.get(i).get(2)%>"><%=dataCountry.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Town</label>
                                    <div class="col-md-7">
                                        <select id="KINtown" name="KINtown" class="form-control">
                                            <option value="null" selected="" disabled="">Select Town</option>
                                            <option value="-">-</option>
                                            <%
                                                for (int i = 0; i < dataTown.size(); i++) {%>
                                            <option value="<%=dataTown.get(i).get(2)%>"><%=dataTown.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">State</label>
                                    <div class="col-md-7">
                                        <select id="KINstate" name="KINstate" class="form-control">
                                            <option value="null" selected="" disabled="">Select State</option>
                                            <option value="-">-</option>
                                            <%
                                                for (int i = 0; i < dataState.size(); i++) {%>
                                            <option value="<%=dataState.get(i).get(2)%>"><%=dataState.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button id="KINsave" name="KINsave" class="btn btn-primary" data-dismiss="modal" role="button"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                            <button id="KINclear" name="KINclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>
                    </form>
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
       $(document).ready(function () {
        $(function () {
            $('#KINdob').datepicker({dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true});
        });
    });
        //function get birth date
    function getBdayw() {
        var bdate = $('#KINnewic').val();
        if (bdate.length === 12) {
            var ICbdayw;

            var tahun = bdate.substr(0, 2);
            var bulan = bdate.substr(2, 2);
            var hari = bdate.substr(4, 2);

            if (tahun >= 00 && tahun < 50)
            {

                //ICbdayw = "20" + tahun + "-" + bulan + "-" + hari;
                ICbdayw = hari + "-" + bulan + "-" + "20" + tahun;
            } else
            {
                //ICbdayw = "19" + tahun + "-" + bulan + "-" + hari;
                ICbdayw = hari + "-" + bulan + "-" + "19" + tahun;
            }
        }
        //console.log(ICbdayw);
        $('#KINdob').val(ICbdayw);

    }

    $('#KINnewic').bind('keyup paste keydown change', function () {
        getBdayw();
    });
    //function to save employment when click save button
    $('#KINsave').on('click', function (e) {
        e.preventDefault();
        var KINpmino = $('#KINpmino').val(),
                KINidtype = $('#KINidtype').val(),
                KINdob = $('#KINdob').val(),
                KINphone = $('#KINphone').val(),
                KINemail = $('#KINemail').val(),
                KINname = $('#KINname').val(),
                KINoldic = $('#KINoldic').val(),
                KINidnumber = $('#KINidnumber').val(),
                KINoccu = $('#KINoccu').val(),
                KINhomephone = $('#KINhomephone').val(),
                KINaddress = $('#KINaddress').val(),
                KINdistrict = $('#KINdistrict').val(),
                KINpostcode = $('#KINpostcode').val(),
                KINcountry = $('#KINcountry').val(),
                KINtown = $('#KINtown').val(),
                KINstate = $('#KINstate').val(),
                KINseq = $('#KINseq').val(),
                KINrelationship = $('#KINrelationship').val(),
                KINnewic = $('#KINnewic').val();

        if (KINidtype === null) {
            KINidtype = "-";
        }
        if (KINphone === "") {
            KINphone = "-";
        }
        if (KINemail === "") {
            KINemail = "-";
        }
        if (KINname === "") {
            KINname = "-";
        }
        if (KINoldic === "") {
            KINoldic = "-";
        }
        if (KINidnumber === "") {
            KINidnumber = "-";
        }
        if (KINoccu === null) {
            KINoccu = "-";
        }
        if (KINhomephone === "") {
            KINhomephone = "-";
        }
        if (KINaddress === "") {
            KINaddress = "-";
        }
        if (KINdistrict === null) {
            KINdistrict = "-";
        }
        if (KINpostcode === null) {
            KINpostcode = "-";
        }
        if (KINcountry === null) {
            KINcountry = "-";
        }
        if (KINtown === null) {
            KINtown = "-";
        }
        if (KINstate === null) {
            KINstate = "-";
        }
        if (KINrelationship === null) {
            KINrelationship = "-";
        }
        if (KINnewic === "") {
            KINnewic = "-";
        }




        var splitKINdob = String(KINdob).split("-");
        var convertedKINdob = splitKINdob[0] + "/" + splitKINdob[1] + "/" + splitKINdob[2];
        console.log(convertedKINdob);
        var datas = {
            KINpmino: KINpmino,
            KINidtype: KINidtype,
            KINdob: convertedKINdob,
            KINphone: KINphone,
            KINemail: KINemail,
            KINname: KINname,
            KINoldic: KINoldic,
            KINidnumber: KINidnumber,
            KINoccu: KINoccu,
            KINhomephone: KINhomephone,
            KINaddress: KINaddress,
            KINdistrict: KINdistrict,
            KINpostcode: KINpostcode,
            KINcountry: KINcountry,
            KINtown: KINtown,
            KINstate: KINstate,
            KINseq: KINseq,
            KINrelationship: KINrelationship,
            KINnewic: KINnewic
        };
        console.log(datas);
//console.log(datas);
        bootbox.confirm({
            message: "Are you sure want to save patient's Next Of Kin Information?",
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
                        url: "saveKin.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);
                            if (data.trim() === "true") {
                                bootbox.alert('Patient Next Of Kin Information saved successfully');
                                $('#kinform')[0].reset();
                                $('input[id=KINpmino]').val($.trim(KINpmino));

                                $.ajax({
                                    url: "listKin.jsp",
                                    type: "post",
                                    data: {'PMINO': KINpmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#tableListKin').html(returnhtml);
                                        $('#KINpmino').prop('readonly', false);
                                        $('#KINnewic').prop('readonly', false);
                                        $('#KINoldic').prop('readonly', false);
                                    }
                                });
                            } else {
                                bootbox.alert("Patient's Next of kin Information  fail to save");
                            }

                        }, error: function () {

                        }

                    });
                }
            }
        });


    });

    //function to clear the form when click clear button
    $('#KINclear').on('click', function (e) {
        e.preventDefault();
        var pmino = $('input[id=EMPpmino]').val();
        $('#kinform')[0].reset();
        $('input[id=KINpmino]').val(pmino);
        $('#KINseq').val("");
        $('#KINpmino').prop('readonly', false);
        $('#KINnewic').prop('readonly', false);
        $('#KINoldic').prop('readonly', false);


    });
</script>

