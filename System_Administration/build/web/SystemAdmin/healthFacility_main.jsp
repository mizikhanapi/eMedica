<%-- 
    Document   : healthFacility_main
    Created on : Feb 6, 2017, 4:38:38 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    HEALTH FACILITY MANAGEMENT
    <span class="pull-right">
        <button id="HFM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#HFM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Health Facility</button>
    </span>
</h4>
<!-- Add Button End -->

<% Conn conn = new Conn();%>
<!-- Add Modal Start -->
<div class="modal fade" id="HFM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg" style="color: red"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Health Facility</h3>
            </div>
            <div class="modal-body">
                <form id="HFM_form" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group" >
                                <label class="col-md-2 control-label" for="textinput">Health Facility Name</label>
                                <div class="col-md-8">
                                    <input type="text"  class="form-control" id="HFM_hfcName" placeholder="Name" maxlength="30"> 
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group" >
                                <label class="col-md-2 control-label" for="textinput">Health Facility Code</label>
                                <div class="col-md-8">
                                    <input type="text"  class="form-control" id="HFM_hfcCode" placeholder="Health Facility Code" maxlength="30">   
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group" >
                                <label class="col-md-2 control-label" for="textinput">Address-1</label>
                                <div class="col-md-10">
                                    <input type="text"  class="form-control" id="HFM_address1" placeholder="Address (Optional)" maxlength="40">   
                                </div>
                            </div>
                            
                             <!-- Text input-->
                            <div class="form-group" >
                                <label class="col-md-2 control-label" for="textinput">Address-2</label>
                                <div class="col-md-10">
                                    <input type="text"  class="form-control" id="HFM_address2" placeholder="Address (Optional)" maxlength="40">   
                                </div>
                            </div>
                             
                             <!-- Text input-->
                            <div class="form-group" >
                                <label class="col-md-2 control-label" for="textinput">Address-3</label>
                                <div class="col-md-10">
                                    <input type="text"  class="form-control" id="HFM_address3" placeholder="Address (Optional)" maxlength="40">   
                                </div>
                            </div> 
                           
                        </div>
                        
                         <!--pembahagi form menjadi dua horizontal-->
                        
                        <div class="col-md-6">
                            
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State</label>
                                <div class="col-md-8">
                                    <select class="form-control"  id="HFM_state" >
                                        <option  value="0" >Select the state</option>
                                        <%
                                            String sql = "SELECT detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0002' AND detail_reference_code NOT IN ('00', '98') order by description ";
                                            ArrayList<ArrayList<String>> stateList = conn.getData(sql);
                                            for(int i = 0; i < stateList.size(); i++){
                                        %>
                                        <option  value="<%= stateList.get(i).get(0)%>" ><%= stateList.get(i).get(1)%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                             
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town</label>
                                <div class="col-md-8">
                                    <select class="form-control"  id="HFM_town">
                                        <option  value="0" >-- Select the town --</option>
                                        
                                    </select>
                                </div>
                            </div> 
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No</label>
                                <div class="col-md-8">
                                    <input id="HFM_faxNo" maxlength="30"  type="text" placeholder="Fax no" class="form-control input-md">
                                </div>
                            </div>
                            
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email</label>
                                <div class="col-md-8">
                                    <input id="HFM_email" maxlength="100"  type="text" placeholder="email@example.com" class="form-control input-md">
                                </div>
                            </div>
                             
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IP No</label>
                                <div class="col-md-8">
                                    <input id="HFM_IP" maxlength="30"  type="text" placeholder="Health Facility IP No (Optional)" class="form-control input-md">
                                </div>
                            </div>
                                                        
                                                       
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Category</label>
                                <div class="col-md-8">
                                    <input id="HFM_category" maxlength="30"  type="text" placeholder="Health Facility Category (Optional)" class="form-control input-md">
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Type</label>
                                <div class="col-md-8">
                                    <input id="HFM_type" maxlength="30"  type="text" placeholder="Health Facility Type (Optional)" class="form-control input-md">
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Director Name</label>
                                <div class="col-md-8">
                                    <input id="HFM_director" maxlength="100"  type="text" placeholder="Director Name" class="form-control input-md">
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Established Date</label>
                                <div class="col-md-8">
                                    <input id="HFM_establishedDate" maxlength="30"  type="text" placeholder="Established date (Optional)" class="form-control input-md" readonly="true">
                                </div>
                            </div>
                            
                        </div>
                        
                        <!--pembahagi form menjadi dua vertical-->
                        
                        <div class="col-md-6">
                            
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District</label>
                                <div class="col-md-8" id="selectDistrict">
                                     <select class="form-control"  id="HFM_district">
                                        <option  value="0" >-- Select the district --</option>
                                        
                                    </select>
                                </div>
                            </div>
                             
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode</label>
                                <div class="col-md-8">
                                    <input id="HFM_postcode" maxlength="30"  type="text" placeholder="postcode" class="form-control input-md" autocomplete="off">
                                    <div id="HFM_match">
                                        <!--for list of postcode-->
                                    </div>
                                </div>
                            </div>  
                             
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Tel No</label>
                                <div class="col-md-8">
                                    <input id="HFM_telNo" maxlength="30"  type="text" placeholder="Telephone Number" class="form-control input-md">
                                </div>
                            </div> 
                            
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Contact Person</label>
                                <div class="col-md-8">
                                    <input id="HFM_contactPerson" maxlength="30"  type="text" placeholder="Contact Person (Optional)" class="form-control input-md">
                                </div>
                            </div>
                            
                            
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Server</label>
                                <div class="col-md-8">
                                    <input id="HFM_server" maxlength="30"  type="text" placeholder="Health Facility Server (Optional)" class="form-control input-md">
                                </div>
                            </div>
                                                       
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Report to</label>
                                <div class="col-md-8">
                                    <input id="HFM_reportTo" maxlength="30"  type="text" placeholder="Report to (Optional)" class="form-control input-md">
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Subtype</label>
                                <div class="col-md-8">
                                    <input id="HFM_subtype" maxlength="30"  type="text" placeholder="Health Facility Subtype (Optional)" class="form-control input-md">
                                </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Status</label>
                                <div class="col-md-8">
                                    <select class="form-control"  id="HFM_status">
                                        <option  value="1" >Active</option>
                                        <option  value="0" >Inactive</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                </form>
                <hr/>

                                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="HFM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="HFM_btnReset" class="btn btn-default btn-block btn-lg" role="button" >Reset</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->
<script src="libraries/validator.js" type="text/javascript"></script>

<script>

    w3IncludeHTML();

    $(document).ready(function () {
        
        $('#HFM_establishedDate').datepicker({
            changeYear: true,
            changeMonth: true,
            maxDate: '0',
            dateFormat: 'dd/mm/yy'
        });

                
        function HFM_reset(){
            document.getElementById("HFM_form").reset();
            
        }

       
        $('#HFM_btnReset').on('click', function () {
            
            HFM_reset();
        });

        $('#HFM_btnAddNew').on('click', function () {

            HFM_reset();

        });

        $('#HFM_btnAdd').on('click', function () {
            
            var hfcName = $('#HFM_hfcName').val();
            var hfcCode = $('#HFM_hfcCode').val();
            var address1 = $('#HFM_address1').val();
            var address2 = $('#HFM_address2').val();
            var address3 = $('#HFM_address3').val();
            var state = $('#HFM_state').val();
            var district = $('#HFM_district').val();
            var town = $('#HFM_town').val();
            var postcode = $('#HFM_postcode').val();
            var faxNo = $('#HFM_faxNo').val();
            var telNo = $('#HFM_telNo').val();
            var email = $('#HFM_email').val();
            var contactPerson = $('#HFM_contactPerson').val();
            var IP_NO = $('#HFM_IP').val();
            var server = $('#HFM_server').val();
            var category = $('#HFM_category').val();
            var reportTo = $('#HFM_reportTo').val();
            var type = $('#HFM_type').val();
            var subtype = $('#HFM_subtype').val();
            var director = $('#HFM_director').val();
            var status = $('#HFM_status').val();
            var establishDate = $('#HFM_establishedDate').val();

            $('#HFM_detail').css('overflow', 'auto');

            if (hfcName.trim() === "" || hfcName === null) {
                bootbox.alert("Fill in the health facility name");
                $('#HFM_hfcName').focus();

            } else if (hfcCode.trim() === "") {
                bootbox.alert("Fill in the health facility code");
                $('#HFM_hfcCode').focus();

            } else if (state.trim() === "0") {
                bootbox.alert("Select the state");
                $('#HFM_state').focus();

            }else if (district.trim() === "0") {
                bootbox.alert("Select the district");
                $('#HFM_district').focus();

            }else if (town.trim() === "0") {
                bootbox.alert("Select the town");
                $('#HFM_town').focus();

            }else if (postcode.trim() === "") {
                bootbox.alert("Fill in the postcode");
                $('#HFM_postcode').focus();

            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Select Any Status");

            } else if (isNaN(postcode) === true) {
                bootbox.alert("Invalid postcode. Postcode must contain number only.");
                $('#HFM_postcode').val("");
                $('#HFM_postcode').focus();

            }else if (email !== "" && ValidateEmail(email) === false) {
                bootbox.alert("Invalid email.");
                $('#HFM_email').val("");
                $('#HFM_email').focus();

            }else if (telNo !== "" && validatePhonenumber(telNo) === false) {
                bootbox.alert("Invalid telephone number. It must contain number, + and - sign without space");
                $('#HFM_telNo').val("");
                $('#HFM_telNo').focus();

            }else if (faxNo !== "" && validatePhonenumber(faxNo) === false) {
                bootbox.alert("Invalid fax number. It must contain number, + and - sign without space");
                $('#HFM_faxNo').val("");
                $('#HFM_faxNo').focus();

            }else if (IP_NO !== "" && ValidateIPaddress(IP_NO) === false) {
                bootbox.alert("Invalid IP address. It must contain 4 octets.");
                $('#HFM_IP').val("");
                $('#HFM_IP').focus();

            } else {

                var data = {
                    hfcName : hfcName,
                    hfcCode : hfcCode,
                    address1 : address1,
                    address2 : address2,
                    address3 : address3,
                    state : state,
                    district : district,
                    town : town,
                    postcode : postcode,
                    faxNo : faxNo,
                    telNo : telNo,
                    email : email,
                    contactPerson : contactPerson,
                    IP_NO : IP_NO,
                    server : server,
                    category : category,
                    reportTo : reportTo,
                    type : type,
                    subtype : subtype,
                    director : director,
                    status : status,
                    establishDate : establishDate
                };

                $.ajax({
                    url: "healthFacility_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 5000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#healthFacilityTable').load('healthFacility_table.jsp');
                            $('#HFM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                message: "New health facility is added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Failed') {

                            alert("Insertion failed!");
                            $('#HFM_detail').modal('hide');
                            reset();

                        } else {

                            //alert(datas.trim());
                            bootbox.alert({
                                message: datas.trim(),
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#HFM_hfcCode').val("");
                            $('#HFM_hfcCode').focus();
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success: ");
                    }

                });
            }

        });

        
//        $('#HFM_telNo').on('blur' ,function(){
//           var number = $('#HFM_telNo').val();
//           if(validatePhonenumber(number) === false){
//               bootbox.alert("Invalid phone number");
//               $('#HFM_telNo').val("");
//               
//           }
//        });


        $('#HFM_state').on('change', function(){
            var code =  $('#HFM_state').val();
            $('#HFM_town').html( '<option  value="0" >-- Select the town --</option>');
            if(code !== '0'){
                
                var dataFields = {code: code, process : "district"};
                
                $.ajax({
                    type: "POST",
                    url: "HFM_result.jsp",
                    data: dataFields,
                    timeout: 5000,
                    success: function (data) {
                        $('#HFM_district').html(data);
                    },
                    error: function (err) {
                        console.log("Ajax error");
                    }
                });
            }else{
                $('#HFM_district').html( '<option  value="0" >-- Select the district --</option>');
            }
        });
        
        
        $('#HFM_district').on('change' , function(){
            
            var code = $('#HFM_district').val();
            if(code !== '0'){
                
                if(code === '00'){
                    var front = $('#HFM_state').val();
                    code = front + '00';
                }
                
                var dataFields = {code: code, process : "town"};
                
                $.ajax({
                    type: "POST",
                    url: "HFM_result.jsp",
                    data: dataFields,
                    timeout: 5000,
                    success: function (data) {
                        $('#HFM_town').html(data);
                    },
                    error: function (err) {
                        console.log("Ajax error");
                    }
                });
            }else{
                $('#HFM_town').html( '<option  value="0" >-- Select the town --</option>');
            }
            
        });
        
        
        $('#HFM_postcode').on('keyup', function(){
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#HFM_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {code : input, process : "postcode"}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "HFM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#HFM_match').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchList li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#HFM_postcode').val($(this).text());
                            $('#HFM_match').text(''); // Clear the <div id="match"></div>
                        });
                    },
                    error: function () { // if error
                        $('#HFM_match').text('Problem!');
                    }
                });
            } else {
                $('#HFM_match').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }
        });

                     
       
    });
    
   
</script>

