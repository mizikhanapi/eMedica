<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //for select box items
    String eliCat = "select * from lookup_detail where master_ref_code = '0063' order by Description";
    String eliType = "select * from lookup_detail where master_ref_code = '0034' order by Description";
    String gender = "select * from lookup_detail where master_ref_code = '0041' order by Description";
    String marital = "select * from lookup_detail where master_ref_code = '0006' order by Description";
    String race = "select * from lookup_detail where master_ref_code = '0004' order by Description";
    String nationality = "select * from lookup_detail where master_ref_code = '0011' order by Description";
    String religion = "select * from lookup_detail where master_ref_code = '0005' order by Description";
    String idType = "select * from lookup_detail where master_ref_code = '0012' order by Description";
    String title = "select * from lookup_detail where master_ref_code = '0026' order by Description";
    String bloodty = "select * from lookup_detail where master_ref_code = '0074' order by Description";
    String rhesus = "select * from lookup_detail where master_ref_code = '0017' order by Description";
    String allergy = "select * from lookup_detail where master_ref_code = '0075' order by Description";
    String chronicDesease = "select * from lookup_detail where master_ref_code = '0076' order by Description";
    String organDonor = "select * from lookup_detail where master_ref_code = '0077'";
    String district = "select * from lookup_detail where master_ref_code = '0078' order by Description";
    String postcode = "select * from lookup_detail where master_ref_code = '0079' order by Description";
    String country = "select * from lookup_detail where master_ref_code = '0001' order by Description";
    String town = "select * from lookup_detail where master_ref_code = '0003' order by Description";
    String state = "select * from lookup_detail where master_ref_code = '0002' order by Description";

    ArrayList<ArrayList<String>> dataEliCat, dataEliType, dataIdType, dataGender, dataMarital, dataRace, dataNationality, dataReligion, dataTitle,
            dataBloodty, dataRhesus, dataAllergy, dataChronicDesease, dataOrganDonor, dataDistrict, dataPostcode, dataCountry, dataTown, dataState;

    dataEliCat = connect.getData(eliCat);
    dataEliType = connect.getData(eliType);
    dataGender = connect.getData(gender);
    dataMarital = connect.getData(marital);
    dataRace = connect.getData(race);
    dataNationality = connect.getData(nationality);
    dataReligion = connect.getData(religion);
    dataIdType = connect.getData(idType);
    dataTitle = connect.getData(title);
    dataBloodty = connect.getData(bloodty);
    dataRhesus = connect.getData(rhesus);
    dataAllergy = connect.getData(allergy);
    dataChronicDesease = connect.getData(chronicDesease);
    dataOrganDonor = connect.getData(organDonor);
    dataDistrict = connect.getData(district);
    dataPostcode = connect.getData(postcode);
    dataCountry = connect.getData(country);
    dataTown = connect.getData(town);
    dataState = connect.getData(state);


%>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <h4>Patient Information</h4>
            <hr/>
            <form style=" margin: 0 auto;" class="form-horizontal" id="formPMI">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="PMIpmino" name="PMIpmino" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Temporary PMI No.</label>
                            <div class="col-md-8">
                                <input id="PMIpminotemp" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-8">
                                <input id="PMIpname" name="PMIpname" type="text" placeholder="" class="form-control input-md" required="">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Title</label>
                            <div class="col-md-8">
                                <select id="PMItitle" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Title</option>
                                    <%                                        for (int i = 0; i < dataTitle.size(); i++) {%>
                                    <option value="<%=dataTitle.get(i).get(2)%>"><%=dataTitle.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-8">
                                <input id="PMInic" name="PMInic" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                            <div class="col-md-8">
                                <input id="PMIoic" name="PMIoic" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <select id="PMIidty" name="selectbasic" class="form-control">
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
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-8">
                                <input id="PMIino" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Category</label>
                            <div class="col-md-8">
                                <select id="PMIelicat" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Eligibility Category</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(2)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-8">
                                <select id="PMIelity" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Eligibility Type</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(2)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                            <div class="col-md-8">
                                <input id="PMIbday" name="textinput" type="date" placeholder="" class="form-control input-md" required="">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Gender</label>
                            <div class="col-md-8">
                                <select id="PMIsex" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Gender</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataGender.size(); i++) {%>
                                    <option value="<%=dataGender.get(i).get(2)%>"><%=dataGender.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Martial Status</label>
                            <div class="col-md-8">
                                <select id="PMImarital" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Martial Status</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataMarital.size(); i++) {%>
                                    <option value="<%=dataMarital.get(i).get(2)%>"><%=dataMarital.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Race</label>
                            <div class="col-md-8">
                                <select id="PMIrace" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Race</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataRace.size(); i++) {%>
                                    <option value="<%=dataRace.get(i).get(2)%>"><%=dataRace.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Nationality</label>
                            <div class="col-md-8">
                                <select id="PMInational" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Nationality</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataNationality.size(); i++) {%>
                                    <option value="<%=dataNationality.get(i).get(2)%>"><%=dataNationality.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Religion</label>
                            <div class="col-md-8">
                                <select id="PMIreligion" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Religion</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataReligion.size(); i++) {%>
                                    <option value="<%=dataReligion.get(i).get(2)%>"><%=dataReligion.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Medical Information</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Blood Type</label>
                            <div class="col-md-6">
                                <select id="PMIblood" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Blood Type</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataBloodty.size(); i++) {%>
                                    <option value="<%=dataBloodty.get(i).get(2)%>"><%=dataBloodty.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Blood Rhesus</label>
                            <div class="col-md-6">
                                <select id="PMIrhesus" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Blood Rhesus</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataRhesus.size(); i++) {%>
                                    <option value="<%=dataRhesus.get(i).get(2)%>"><%=dataRhesus.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Allergy</label>
                            <div class="col-md-6">
                                <select id="PMIallergy" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Allergy</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataAllergy.size(); i++) {%>
                                    <option value="<%=dataAllergy.get(i).get(2)%>"><%=dataAllergy.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Chronic Disease</label>
                            <div class="col-md-6">
                                <select id="PMIchronic" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Chronic Disease</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataChronicDesease.size(); i++) {%>
                                    <option value="<%=dataChronicDesease.get(i).get(2)%>"><%=dataChronicDesease.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Organ Donor</label>
                            <div class="col-md-6">
                                <select id="PMIorgan" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Organ Donor Status</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataOrganDonor.size(); i++) {%>
                                    <option value="<%=dataOrganDonor.get(i).get(2)%>"><%=dataOrganDonor.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Patient Contact</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Home Address</label>
                            <div class="col-md-8">
                                <input id="PMIhadd" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home District</label>
                            <div class="col-md-7">
                                <select id="PMIhdis" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home District</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Home Town</label>
                            <div class="col-md-7">
                                <select id="PMIhtown" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Town</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Home Postcode</label>
                            <div class="col-md-7">
                                <select id="PMIhpostcode" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Postcode</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Home State</label>
                            <div class="col-md-7">
                                <select id="PMIhstate" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home State</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataState.size(); i++) {%>
                                    <option value="<%=dataState.get(i).get(2)%>"><%=dataState.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Country</label>
                            <div class="col-md-7">
                                <select id="PMIhcountry" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Country</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataCountry.size(); i++) {%>
                                    <option value="<%=dataCountry.get(i).get(2)%>"><%=dataCountry.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Phone No.(Home)</label>
                            <div class="col-md-7">
                                <input id="PMIhphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Postal Address</label>
                            <div class="col-md-8">
                                <input id="PMIpadd" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal District</label>
                            <div class="col-md-7">
                                <select id="PMIpdis" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal District</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Postal Town</label>
                            <div class="col-md-7">
                                <select id="PMIptown" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Town</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Postal Postcode</label>
                            <div class="col-md-7">
                                <select id="PMIppostcode" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Postcode</option>
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
                            <label class="col-md-4 control-label" for="selectbasic">Postal State</label>
                            <div class="col-md-7">
                                <select id="PMIpstate" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal State</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataState.size(); i++) {%>
                                    <option value="<%=dataState.get(i).get(2)%>"><%=dataState.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Country</label>
                            <div class="col-md-7">
                                <select id="PMIpcountry" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Country</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0; i < dataCountry.size(); i++) {%>
                                    <option value="<%=dataCountry.get(i).get(2)%>"><%=dataCountry.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Handphone No.</label>
                            <div class="col-md-7">
                                <input id="PMIhandphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="text-center">
                    <!--                    <button class="btn btn-primary " type="button" disabled="">Save</button>-->
                    <button class="btn btn-primary " type="button" id="updatePatient"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
<!--                    <button class="btn btn-default " type="button"> Appointment List</button>-->
                    <button class="btn btn-default " type="button" id="clearPMI"> <i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

        function update() {

            var pmino = $("#PMIpmino").val(),
                    pminotemp = $("#PMIpminotemp").val(),
                    pname = $("#PMIpname").val(),
                    ptitle = $("#PMItitle").val(),
                    pnic = $("#PMInic").val(),
                    poic = $("#PMIoic").val(),
                    pit = $("#PMIidty").val(),
                    pino = $("#PMIino").val(),
                    pelicat = $("#PMIelicat").val(),
                    pelity = $("#PMIelity").val(),
                    pbday = $("#PMIbday").val(),
                    psex = $("#PMIsex").val(),
                    pmarital = $("#PMImarital").val(),
                    prace = $("#PMIrace").val(),
                    pnational = $("#PMInational").val(),
                    preligional = $("#PMIreligion").val(),
                    pbloodty = $("#PMIblood").val(),
                    prhesus = $("#PMIrhesus").val(),
                    pallergy = $("#PMIallergy").val(),
                    pchronic = $("#PMIchronic").val(),
                    porgandonor = $("#PMIorgan").val(),
                    phomeadd = $("#PMIhadd").val(),
                    phomedistrict = $("#PMIhdis").val(),
                    phometowncd = $("#PMIhtown").val(),
                    ppostcode = $("#PMIhpostcode").val(),
                    pstate = $("#PMIhstate").val(),
                    pcountry = $("#PMIhcountry").val(),
                    phomephone = $("#PMIhphone").val(),
                    ppostaladd = $("#PMIpadd").val(),
                    ppostaldistrict = $("#PMIpdis").val(),
                    ppostaltown = $("#PMIptown").val(),
                    ppostalpostcode = $("#PMIppostcode").val(),
                    ppostalstate = $("#PMIpstate").val(),
                    ppostalcountry = $("#PMIpcountry").val(),
                    pmobilephone = $("#PMIhandphone").val();
            if (pname === "") {
                pname = "-";
            } else {
                pname = $("#PMIpname").val();
            }

            if (pminotemp === "") {
                pminotemp = "-";
            } else {
                pminotemp = $("#PMIpminotemp").val();
            }

            if (ptitle === null) {
                ptitle = "-";
            } else {
                ptitle = $("#PMItitle").val();
            }

            if (pnic === "") {
                pnic = "-";
            } else {
                pnic = $("#PMInic").val();
            }

            if (poic === "") {
                poic = "-";
            } else {
                poic = $("#PMIoic").val();
            }

            if (pit === null) {
                pit = "-";
            } else {
                pit = $("#PMIidty").val();
            }

            if (pino === "") {
                pino = "-";
            } else {
                pino = $("#PMIino").val();
            }

            if (pelicat === null) {
                pelicat = "-";
            } else {
                pelicat = $("#PMIelicat").val();
            }

            if (pelity === null) {
                pelity = "-";
            } else {
                pelity = $("#PMIelity").val();
            }

            if (pbday === null) {
                convertedBday = "-";

            } else {
                pbday = $("#PMIbday").val();
                var splitBday = String(pbday).split("-");
                var convertedBday = splitBday[2] + "/" + splitBday[1] + "/" + splitBday[0];
            }

            if (psex === null) {
                psex = "-";
            } else {
                psex = $("#PMIsex").val();
            }

            if (pmarital === null) {
                pmarital = "-";
            } else {
                pmarital = $("#PMImarital").val();
            }

            if (prace === null) {
                prace = "-";
            } else {
                prace = $("#PMIrace").val();
            }

            if (pnational === null) {
                pnational = "-";
            } else {
                pnational = $("#PMInational").val();
            }

            if (preligional === null) {
                preligional = "-";
            } else {
                preligional = $("#PMIreligion").val();
            }

            if (pbloodty === null) {
                pbloodty = "-";
            } else {
                pbloodty = $("#PMIblood").val();
            }

            if (prhesus === null) {
                prhesus = "-";
            } else {
                prhesus = $("#PMIrhesus").val();
            }

            if (pallergy === null) {
                pallergy = "-";
            } else {
                pallergy = $("#PMIallergy").val();
            }

            if (pchronic === null) {
                pchronic = "-";
            } else {
                pchronic = $("#PMIchronic").val();
            }

            if (porgandonor === null) {
                porgandonor = "-";
            } else {
                porgandonor = $("#PMIorgan").val();
            }

            if (phomeadd === "") {
                phomeadd = "-";
            } else {
                phomeadd = $("#PMIhadd").val();
            }

            if (phomedistrict === null) {
                phomedistrict = "-";
            } else {
                phomedistrict = $("#PMIhdis").val();
            }

            if (phometowncd === null) {
                phometowncd = "-";
            } else {
                phometowncd = $("#PMIhtown").val();
            }

            if (ppostcode === null) {
                ppostcode = "-";
            } else {
                ppostcode = $("#PMIhpostcode").val();
            }

            if (pstate === null) {
                pstate = "-";
            } else {
                pstate = $("#PMIhstate").val();
            }

            if (pcountry === null) {
                pcountry = "-";
            } else {
                pcountry = $("#PMIhcountry").val();
            }

            if (phomephone === "") {
                phomephone = "-";
            } else {
                phomephone = $("#PMIhphone").val();
            }

            if (ppostaladd === "") {
                ppostaladd = "-";
            } else {
                ppostaladd = $("#PMIpadd").val();
            }

            if (ppostaldistrict === null) {
                ppostaldistrict = "-";
            } else {
                ppostaldistrict = $("#PMIpdis").val();
            }

            if (ppostaltown === null) {
                ppostaltown = "-";
            } else {
                ppostaltown = $("#PMIptown").val();
            }

            if (ppostalpostcode === null) {
                ppostalpostcode = "-";
            } else {
                ppostalpostcode = $("#PMIppostcode").val();
            }

            if (ppostalstate === null) {
                ppostalstate = "-";
            } else {
                ppostalstate = $("#PMIpstate").val();
            }

            if (ppostalcountry === null) {
                ppostalcountry = "-";
            } else {
                ppostalcountry = $("#PMIpcountry").val();
            }

            if (pmobilephone === "") {
                pmobilephone = "-";
            } else {
                pmobilephone = $("#PMIhandphone").val();
            }



            var data = {'pmino': pmino,
                'pminotemp': pminotemp,
                'pname': pname,
                'ptitle': ptitle,
                'pnic': pnic,
                'poic': poic,
                'pit': pit,
                'pino': pino,
                'pelicat': pelicat,
                'pelity': pelity,
                'pbday': convertedBday,
                'psex': psex,
                'pmarital': pmarital,
                'prace': prace,
                'pnational': pnational,
                'preligional': preligional,
                'pbloodty': pbloodty,
                'prhesus': prhesus,
                'pallergy': pallergy,
                'pchronic': pchronic,
                'porgandonor': porgandonor,
                'phomeadd': phomeadd,
                'phomedistrict': phomedistrict,
                'phometowncd': phometowncd,
                'ppostcode': ppostcode,
                'pstate': pstate,
                'pcountry': pcountry,
                'phomephone': phomephone,
                'ppostaladd': ppostaladd,
                'ppostaldistrict': ppostaldistrict,
                'ppostaltown': ppostaltown,
                'ppostalpostcode': ppostalpostcode,
                'ppostalstate': ppostalstate,
                'ppostalcountry': ppostalcountry,
                'pmobilephone': pmobilephone};
            console.log(data);
            //console.log(convertedBday);
            //convertedBday
            $.ajax({
                type: "POST",
                url: "updatePatient.jsp",
                data: data, // Send input
                timeout: 3000,
                success: function (list) {
                    console.log($.trim(list));
                    var array = list.split("|");
                    //$('.nav-tabs a[href="#tab_default_1"]').tab('show');
                    if ($.trim(array[0]) === "true") {
                        //alert("Patient Biodata saved Successfully");
                        bootbox.alert("Patient Biodata saved Successfully");
                        //set value to registration page
                        $('input[id=pmino]').val($.trim(pmino));
                        $('input[id=pname]').val($.trim(pname));
                        $('input[id=pnic]').val($.trim(pnic));
                        $('input[id=poic]').val($.trim(poic));
                        $('input[id=pit]').val($.trim(pit));
                        $('input[id=pino]').val($.trim(pino));
                        
                        $('#radios-1').prop('checked', true);
                        $('#select-1').show();
                        $('#patCat').val('General Outpatient');
                        $('#visTy').val('Walk-in');
                        $('#EmTy').val('-');
                        $('#EliCat').val('Government');
                        if ($('input[id=pit]').val() === "Matric No.") {
                            $('#EliTy').val('Student');
                        } else if ($('input[id=pit]').val() === "Staff No.") {
                            $('#EliTy').val('Staff');
                        }

                        $('#Dis').val('Outpatient Discipline');
                        $('#prioGru').val('Normal');
                        $('#select-1').val('Normal Queue');
                        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                    } else if ($.trim(array[0]) === "false") {
                        alert("Saving Patient Biodata Failed");
                        bootbox.alert("Saving Patient Biodata Failed");
                    }

                }, error: function (xhr) {
                    //alert("There is an error!");
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
        }
        ;

        $("#updatePatient").on("click", function () {
            //var r = confirm("Are you sure want to Save patient's biodata?");
            bootbox.confirm({
                message: "Are you sure want to Save patient's biodata?",
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
                        update();
                    }
                }
            });


        });

        $('#clearPMI').on('click', function () {
            $('#formPMI')[0].reset();
        });
    });


</script>