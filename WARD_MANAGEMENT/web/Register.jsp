<h4>In-Patient Information</h4>
<hr/>
<form class="form-horizontal" name="myForm2" id="myForm2">
    <div class="row">



        <div class="col-md-6">


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                <div class="col-md-4">
                    <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
            </div>



            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">IC NO</label>
                <div class="col-md-4">
                    <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                <div class="col-md-4">
                    <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                <div class="col-md-4">
                    <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>



        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Name</label>
                <div class="col-md-4">
                    <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                <div class="col-md-4">
                    <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>



            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">ID No</label>
                <div class="col-md-4">
                    <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>


    <h4>Registration Information</h4>
    <hr/>

    <div class="row">
        <div class="col-md-6">
            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Eligibility Source</label>
                <div class="col-md-4">
                    <select id="EligibilitySource" name="selectbasic" class="form-control">
                        <option value="-">-</option>
                        <option value="null" selected="" disabled="">Select Eligibility Source</option>
                        <%--
                        
                        <%                                        for (int i = 0; i < dataTitle.size(); i++) {%>
                        <option value="<%=dataTitle.get(i).get(2)%>"><%=dataTitle.get(i).get(2)%></option>
                        <%  }
                        %>
                        
                        --%>
                    </select>
                </div> 
            </div>


            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Admission type</label>
                <div class="col-md-4">
                    <select id="AdmissionType" name="selectbasic" class="form-control">
                        <option value="-">-</option>
                        <option value="null" selected="" disabled="">Select Admission Type</option>
                        <%--
                        
                        <%                                        for (int i = 0; i < dataTitle.size(); i++) {%>
                        <option value="<%=dataTitle.get(i).get(2)%>"><%=dataTitle.get(i).get(2)%></option>
                        <%  }
                        %>
                        
                        --%>
                    </select>
                </div> 
            </div>



            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Referring from</label>
                <div class="col-md-4">
                    <select id="Refer" name="Refer" class="form-control">
                        <option value="" selected="" disabled="">Select </option>
                        <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                        <option value="2">2. LAIN HOSP. KERAJAAN</option>
                        <option value="3">3. KLINIK KESIHATAN/JPL</option>
                        <option value="4">4. PENGAMAL PERUBATAN</option>
                        <option value="5">5. BERSALIN</option>
                        <option value="6">6. JABATAN KECEMASAN</option>
                        <option value="7">9. LAIN-LAIN</option>

                        <%--
                        <%
                            for (int i = 0; i < dataDiscip.size(); i++) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Document type</label>
                <div class="col-md-4">
                    <select id="DocType" name="DocType" class="form-control">
                        <option value="" selected="" disabled="">Select </option>
                        <%--
                        <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                        <option value="2">2. LAIN HOSP. KERAJAAN</option>
                      
                        
                        <%
                            for (int i = 0; i < dataDiscip.size(); i++) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">GL expiry date</label>
                <div class="col-md-4">
                    <input id="GL" name="textinput" type="text" placeholder="Pop-up Calendar" class="form-control input-md">
                </div>
            </div>


        </div>



        <div class="col-md-6">  
            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                <div class="col-md-4">
                    <select id="EliTy" name="EliTy" class="form-control">
                        <option value="1" selected="" disabled="">Select Eligibility Type</option>

                        <%--

                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(2)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                    
                        --%>
                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Admission reason</label>
                <div class="col-md-4">
                    <input id="AdmissionReason" name="textinput" type="text" placeholder="" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Police case</label>
                <div class="col-md-4">
                    <input id="PoliceCase" name="textinput" type="text" placeholder="Yes or No" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Document no</label>
                <div class="col-md-4">
                    <input id="DocNo" name="textinput" type="text" placeholder="" class="form-control input-md">
                </div>
            </div>


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Payer Group</label>
                <div class="col-md-4">
                    <input id="PayerGroup" name="textinput" type="text" placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>
    </div>

    <h4>Assign Ward</h4>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                <div class="col-md-4">
                    <select id="Dis" name="Dis" class="form-control">
                        <option value="" selected="" disabled="">List of Discipline</option>
                        <%--
                        <option value="2">Inpatient Discipline</option>
                        <option value="2">Outpatient Discipline</option>
                        <%
                            for (int i = 0; i < dataDis p.size();
                            i++
                           
                                ) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                <div class="col-md-4">
                    <select id="Dis" name="Dis" class="form-control">
                        <option value="" selected="" disabled="">List of ward name</option>
                        <%--
                        <option value="2">Inpatient Discipline</option>
                        <option value="2">Outpatient Discipline</option>
                        <%
                            for (int i = 0; i < dataDis p.size();
                            i++
                           
                                ) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                <div class="col-md-4">
                    <input id="Deposit" name="textinput" type="text" placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>

        <div class="col-md-6">

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                <div class="col-md-4">
                    <select id="WardType" name="Dis" class="form-control">
                        <option value="" selected="" disabled="">List of ward type</option>
                        <%--
                        <option value="2">Inpatient Discipline</option>
                        <option value="2">Outpatient Discipline</option>
                        <%
                            for (int i = 0; i < dataDis p.size();
                            i++
                           
                                ) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
            </div>   


            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                <div class="col-md-4">
                    <select id="BedID" name="Dis" class="form-control">
                        <option value="" selected="" disabled="">Locate selected bed here..</option>
                        <%--
                        <option value="2">Inpatient Discipline</option>
                        <option value="2">Outpatient Discipline</option>
                        <%
                            for (int i = 0; i < dataDis p.size();
                            i++
                           
                                ) {%>
                        <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                        <%  }
                        %>
                        --%>
                    </select>
                </div>
                <button id="buttonlist" class="btn btn-default" type="button"> List Bed</button>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <form>
                <div class="container">
                    <div class="btn-group btn-group-lg">

                        <%
                            int bed;

                            for (bed = 1; bed <= 10; bed++) {
                                //                              

                        %>

                        <%-- <button class="fa fa-hotel fa-lg" class="btn btn-default" id="bed_<%= bed%>">&nbsp; Bed<%= bed%> </button> --%>
                        <button style="background-color: #4CAF50"  type="button" onclick="myFunction()" class="fa fa-hotel fa-lg" class="btn btn-default" id="bed_<%= bed%>">&nbsp; <%= bed%> </button>
                        <script>

                            function myFunction() {
                                document.getElementById("bed_<%= bed%>").style.backgroundColor = "red";
                            }

                        </script>

                        <%

                            }
                        %>


                        </head>
                        <body>

                    </div>
                </div>
            </form>
        </div>
    </div>


    <div class="text-center">
        <button id="button2id" name="button2id" class="btn btn-default"><i class="fa fa-check fa-lg"></i>&nbsp; Update</button>
        <button id="button3id" name="button2id" class="btn btn-default"><i class="fa fa-close fa-lg"></i>&nbsp; Clear</button>
    </div>
</form>