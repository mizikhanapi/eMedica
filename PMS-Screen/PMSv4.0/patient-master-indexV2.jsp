
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Conn conn = new Conn();

    //for select box items
    String eliCat4 = "select * from adm_lookup_detail where master_reference_code = '0063'";
    String eliType4 = "select * from adm_lookup_detail where master_reference_code = '0034'";
    String gender4 = "select * from adm_lookup_detail where master_reference_code = '0041'";
    String marital4 = "select * from adm_lookup_detail where master_reference_code = '0006'";
    String race4 = "select * from adm_lookup_detail where master_reference_code = '0004'";
    String nationality4 = "select * from adm_lookup_detail where master_reference_code = '0011'";
    String religion4 = "select * from adm_lookup_detail where master_reference_code = '0005'";
    String idType4 = "select * from adm_lookup_detail where master_reference_code = '0012'";
    String title4 = "select * from adm_lookup_detail where master_reference_code = '0026' ";
    String bloodty4 = "select * from adm_lookup_detail where master_reference_code = '0074'   ";
    String rhesus4 = "select * from adm_lookup_detail where master_reference_code = '0017'   ";
    String allergy4 = "select * from adm_lookup_detail where master_reference_code = '0075'   ";
    String chronicDesease4 = "select * from adm_lookup_detail where master_reference_code = '0076'  ";
    String organDonor4 = "select * from adm_lookup_detail where master_reference_code = '0077'";
    String district4 = "select * from adm_lookup_detail where master_reference_code = '0078'   ";
    String postcode4 = "select * from adm_lookup_detail where master_reference_code = '0079'   ";
    String country4 = "select * from adm_lookup_detail where master_reference_code = '0001'   ";
    String town4 = "select * from adm_lookup_detail where master_reference_code = '0003'   ";
    String state4 = "select * from adm_lookup_detail where master_reference_code = '0002'   ";

    ArrayList<ArrayList<String>> dataEliCat4, dataEliType4, dataIdType4, dataGender4, dataMarital4, dataRace4, dataNationality4, dataReligion4, dataTitle4,
            dataBloodty4, dataRhesus4, dataAllergy4, dataChronicDesease4, dataOrganDonor4, dataDistrict4, dataPostcode4, dataCountry4, dataTown4, dataState4;

    dataEliCat4 = conn.getData(eliCat4);
    dataEliType4 = conn.getData(eliType4);
    dataGender4 = conn.getData(gender4);
    dataMarital4 = conn.getData(marital4);
    dataRace4 = conn.getData(race4);
    dataNationality4 = conn.getData(nationality4);
    dataReligion4 = conn.getData(religion4);
    dataIdType4 = conn.getData(idType4);
    dataTitle4 = conn.getData(title4);
    dataBloodty4 = conn.getData(bloodty4);
    dataRhesus4 = conn.getData(rhesus4);
    dataAllergy4 = conn.getData(allergy4);
    dataChronicDesease4 = conn.getData(chronicDesease4);
    dataOrganDonor4 = conn.getData(organDonor4);
    dataDistrict4 = conn.getData(district4);
    dataPostcode4 = conn.getData(postcode4);
    dataCountry4 = conn.getData(country4);
    dataTown4 = conn.getData(town4);
    dataState4 = conn.getData(state4);

    //  ArrayList<String> dataDistrictSingular= new ArrayList<String>(),dataPostcodeSingular = new ArrayList<String>(),dataCountrySingular = new ArrayList<String>(),dataTownSingular = new ArrayList<String>(),dataStateSingular = new ArrayList<String>();
//   for(int i = 0;i<dataDistrict.size();i++){
//       dataDistrictSingular.add(dataDistrict.get(i).get(2));
//   }
//   String newVal = StringUtils.join(dataDistrictSingular,"|");
//   
//   for(int i = 0;i<dataPostcode.size();i++){
//       dataPostcodeSingular.add(dataPostcode.get(i).get(2));
//   }
//   String newVal2 = String.join("|",dataPostcodeSingular);
//   
//   for(int i = 0;i<dataCountry.size();i++){
//       dataCountrySingular.add(dataCountry.get(i).get(2));
//   }
//   String newVal3 = String.join("|",dataCountrySingular);
//   
//for(int i = 0;i<dataTown.size();i++){
//       dataTownSingular.add(dataTown.get(i).get(2));
//   }
//   String newVal4 = String.join("|",dataTownSingular);
//   
//for(int i = 0;i<dataState.size();i++){
//       dataStateSingular.add(dataState.get(i).get(2));
//   }
//   String newVal5 = String.join("|",dataStateSingular);

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
                                <input id="PMIpname" name="PMIpname" type="text" placeholder="" class="form-control input-md" required="require" maxlength="80">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Title</label>
                            <div class="col-md-8">
                                <select id="PMItitle" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Title</option>
                                    <%                                        for (int i = 0; i < dataTitle4.size(); i++) {%>
                                    <option value="<%=dataTitle4.get(i).get(1)%>"><%=dataTitle4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-8">
                                <input id="PMInic" name="PMInic" type="text" placeholder="" class="form-control input-md" maxlength="12">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                            <div class="col-md-8">
                                <input id="PMIoic" name="PMIoic" type="text" placeholder="" class="form-control input-md" maxlength="8">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <select id="PMIidty" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select ID Type</option>
                                    <%
                                        for (int i = 0; i < dataIdType4.size(); i++) {%>
                                    <option value="<%=dataIdType4.get(i).get(1)%>"><%=dataIdType4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-8">
                                <input id="PMIino" name="textinput" type="text" placeholder="" class="form-control input-md" maxlength="10">
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
                                        for (int i = 0;
                                                i < dataEliCat4.size(); i++) {%>
                                    <option value="<%=dataEliCat4.get(i).get(1)%>"><%=dataEliCat4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataEliType4.size();
                                                i++) {%>
                                    <option value="<%=dataEliType4.get(i).get(1)%>"><%=dataEliType4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                            <div class="col-md-8">
                                <input id="PMIbday" name="textinput" type="text" class="form-control input-md" required="">
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
                                        for (int i = 0;
                                                i < dataGender4.size();
                                                i++) {%>
                                    <option value="<%=dataGender4.get(i).get(1)%>"><%=dataGender4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataMarital4.size();
                                                i++) {%>
                                    <option value="<%=dataMarital4.get(i).get(1)%>"><%=dataMarital4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataRace4.size();
                                                i++) {%>
                                    <option value="<%=dataRace4.get(i).get(1)%>"><%=dataRace4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataNationality4.size();
                                                i++) {%>
                                    <option value="<%=dataNationality4.get(i).get(1)%>"><%=dataNationality4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataReligion4.size();
                                                i++) {%>
                                    <option value="<%=dataReligion4.get(i).get(1)%>"><%=dataReligion4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataBloodty4.size();
                                                i++) {%>
                                    <option value="<%=dataBloodty4.get(i).get(1)%>"><%=dataBloodty4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataRhesus4.size();
                                                i++) {%>
                                    <option value="<%=dataRhesus4.get(i).get(1)%>"><%=dataRhesus4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataAllergy4.size();
                                                i++) {%>
                                    <option value="<%=dataAllergy4.get(i).get(1)%>"><%=dataAllergy4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataChronicDesease4.size();
                                                i++) {%>
                                    <option value="<%=dataChronicDesease4.get(i).get(1)%>"><%=dataChronicDesease4.get(i).get(2)%></option>
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
                                        for (int i = 0;
                                                i < dataOrganDonor4.size();
                                                i++) {%>
                                    <option value="<%=dataOrganDonor4.get(i).get(1)%>"><%=dataOrganDonor4.get(i).get(2)%></option>
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

                                <!--                                <input type="text" id="PMIhdis" class="form-control input-md">-->
                                <select id="PMIhdis" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home District</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataDistrict4.size();
                                                i++) {%>
                                    <option value="<%=dataDistrict4.get(i).get(1)%>"><%=dataDistrict4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Town</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIhtown" class="form-control input-md">-->
                                <select id="PMIhtown" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Town</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataTown4.size();
                                                i++) {%>
                                    <option value="<%=dataTown4.get(i).get(1)%>"><%=dataTown4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Postcode</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIhpostcode" class="form-control input-md">
                                -->                                <select id="PMIhpostcode" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Postcode</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataPostcode4.size();
                                                i++) {%>
                                    <option value="<%=dataPostcode4.get(i).get(1)%>"><%=dataPostcode4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home State</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIhstate" class="form-control input-md">-->
                                <select id="PMIhstate" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home State</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataState4.size();
                                                i++) {%>
                                    <option value="<%=dataState4.get(i).get(1)%>"><%=dataState4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Country</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIhcountry" class="form-control input-md">-->
                                <select id="PMIhcountry" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Home Country</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataCountry4.size();
                                                i++) {%>
                                    <option value="<%=dataCountry4.get(i).get(1)%>"><%=dataCountry4.get(i).get(2)%></option>
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
                                <!--                                <input type="text" id="PMIpdis" class="form-control input-md">-->
                                <select id="PMIpdis" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal District</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataDistrict4.size();
                                                i++) {%>
                                    <option value="<%=dataDistrict4.get(i).get(1)%>"><%=dataDistrict4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Town</label>
                            <div class="col-md-7">
                                <!--                                <input type="text" id="PMIptown" class="form-control input-md">-->
                                <select id="PMIptown" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Town</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataTown4.size();
                                                i++) {%>
                                    <option value="<%=dataTown4.get(i).get(1)%>"><%=dataTown4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Postcode</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIppostcode" class="form-control input-md">-->
                                <select id="PMIppostcode" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Postcode</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataPostcode4.size();
                                                i++) {%>
                                    <option value="<%=dataPostcode4.get(i).get(1)%>"><%=dataPostcode4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal State</label>
                            <div class="col-md-7">
                                <!--                                <input type="text" id="PMIpstate" class="form-control input-md">-->
                                <!--
                                -->                                <select id="PMIpstate" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal State</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataState4.size();
                                                i++) {%>
                                    <option value="<%=dataState4.get(i).get(1)%>"><%=dataState4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Country</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIpcountry" class="form-control input-md">-->
                                <select id="PMIpcountry" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Postal Country</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataCountry4.size();
                                                i++) {%>
                                    <option value="<%=dataCountry4.get(i).get(1)%>"><%=dataCountry4.get(i).get(2)%></option>
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
        $(function () {
//            var disData = $('#districtData').val();
//            var postData = $('#postalData').val();
//            var countryData = $('#countryData').val();
//            var townData = $('#townData').val();
//            var stateData = $('#stateData').val();
//            
//            var array_dis = String(disData).split("|");
//            var array_post = String(postData).split("|");
//            var array_country = String(countryData).split("|");
//            var array_town = String(townData).split("|");
//            var array_state = String(stateData).split("|");

            //district autocomplete    
//        $('#PMIhdis').autocomplete({
//           source:array_dis
//        });
//        $(' #PMIpdis').autocomplete({
//           source:array_dis
//        });
//        
//        //postcode autocomplete
//        $('#PMIhpostcode').autocomplete({
//           source:array_post
//        });
//        $('#PMIppostcode').autocomplete({
//           source:array_post
//        });
//        
//        //town autocomplete
//        $('#PMIhtown').autocomplete({
//           source: array_town 
//        });
//        $('#PMIptown').autocomplete({
//           source: array_town 
//        });
//        
//        //state autocomplete
//        $('#PMIhstate').autocomplete({
//           source: array_state 
//        });
//        $('#PMIpstate').autocomplete({
//           source: array_state 
//        });
//        
//        //country autocomplete
//        $('#PMIhcountry').autocomplete({
//           source: array_country 
//        });
//        $('#PMIpcountry').autocomplete({
//           source: array_country 
//        });


            $('#PMIbday').datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});


        });


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
                var convertedBday = splitBday[0] + "/" + splitBday[1] + "/" + splitBday[2];
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

            if (phomedistrict === "") {
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

            if (ppostaldistrict === "") {
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
            $('input[id=PMIpmino]').prop('readonly', false);
            $('#PMInic').prop('readonly', false);
        });
    });


</script>