<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idType = "select * from lookup_detail where master_ref_code = '0012' order by Description";
    String district = "select * from lookup_detail where master_ref_code = '0078' order by Description";
    String postcode = "select * from lookup_detail where master_ref_code = '0079' order by Description";
    String country = "select * from lookup_detail where master_ref_code = '0001' order by Description";
    String town = "select * from lookup_detail where master_ref_code = '0003' order by Description";
    String state = "select * from lookup_detail where master_ref_code = '0002' order by Description";
    String relation = "select * from lookup_detail where master_ref_code = '0054' order by Description";

    ArrayList<ArrayList<String>> dataIdType, dataDistrict, dataPostcode, dataCountry, dataTown, dataState,dataRelation;
    dataIdType = connect.getData(idType);
    dataDistrict = connect.getData(district);
    dataPostcode = connect.getData(postcode);
    dataCountry = connect.getData(country);
    dataTown = connect.getData(town);
    dataState = connect.getData(state);
    dataRelation = connect.getData(relation);
%>

<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <h4>Next of Kin Information</h4>
            <hr/>
            <form class="form-horizontal" id="kinform">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>  
                            <div class="col-md-8">
                                <input id="KINpmino" name="KINpmino" type="text"  class="form-control input-md">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Relationship</label>  
                            <div class="col-md-8">
                                <select id="KINrelationship" name="KINrelationship" class="form-control">
                                    <option value="null" selected="" disabled="">Select Relationship</option>

                                    <%
                                        for (int i = 0; i < dataRelation.size(); i++) {%>
                                    <option value="<%=dataRelation.get(i).get(2)%>"><%=dataRelation.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC</label>  
                            <div class="col-md-8">
                                <input id="KINnewic" name="KINnewic" type="text"  class="form-control input-md">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <select id="KINidtype" name="KINidtype" class="form-control">
                                    <option value="null" selected="" disabled="">Select ID Type</option>

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
                            <div class="col-md-8">
                                <input id="KINdob" name="KINdob" type="date" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Handphone Number</label>
                            <div class="col-md-8">
                                <input id="KINphone" name="KINphone" type="text" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Email</label>
                            <div class="col-md-8">
                                <input id="KINemail" name="KINemail" type="text" class="form-control input-md">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput"></label>  
                            <div class="col-md-4">
                                <input id="KINseq" name="KINseq" type="hidden"  class="form-control input-md">

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Next Of Kin Name</label>  
                            <div class="col-md-8">
                                <input id="KINname" name="KINname" type="text"  class="form-control input-md">

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC</label>  
                            <div class="col-md-8">
                                <input id="KINoldic" name="KINoldic" type="text" class="form-control input-md">

                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID number</label>
                            <div class="col-md-8">
                                <input id="KINidnumber" name="KINidnumber" type="text" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Occupation</label>
                            <div class="col-md-8">
                                <input id="KINoccu" name="KINoccu" type="text" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Homephone Number</label>
                            <div class="col-md-8">
                                <input id="KINhomephone" name="KINhomephone" type="text" class="form-control input-md">
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
                            <div class="col-md-8">
                                <input id="KINaddress" name="KINaddress" type="text" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">District</label>
                            <div class="col-md-8">
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
                            <div class="col-md-8">
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
                            <div class="col-md-8">
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
                            <div class="col-md-8">
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
                            <div class="col-md-8">
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
                    <button id="KINsave" name="KINsave" class="btn btn-primary"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                    <button id="KINclear" name="KINclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Cancel</button>
                </div>
            </form>
        </div>

        <div class="thumbnail">
            <h4>List of Next of Kin</h4>

            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listKin">
                <thead>
                <th>Name</th>
                <th>IC. No.</th>
                <th>Update</th>
                <th>Delete</th>
                </thead>
                
            </table>

        </div>
    </div>
</div>
<script>
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

        var splitKINdob = String(KINdob).split("-");
        var convertedKINdob = splitKINdob[2] + "/" + splitKINdob[1] + "/" + splitKINdob[0];

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
            KINaddress : KINaddress,
            KINdistrict:KINdistrict,
            KINpostcode:KINpostcode,
            KINcountry:KINcountry,
            KINtown:KINtown,
            KINstate:KINstate,
            KINseq:KINseq,
            KINrelationship: KINrelationship,
            KINnewic : KINnewic
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
                                $('input[id=KINpmino]').val($.trim(EMPpmino));

                                $.ajax({
                                    url: "listKin.jsp",
                                    type: "post",
                                    data: {'KINpmino': EMPpmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#listKin').html(returnhtml);
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
    $('#KINclear').on('click', function () {
        var pmino = $('input[id=EMPpmino]').val();
        $('#kinform')[0].reset();
        $('input[id=KINpmino]').val(pmino);
        
    });
</script>