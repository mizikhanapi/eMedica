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

<div class="row">
    <div class="col-md-12">
        <!--        <div class="thumbnail" id="maintainKIN">
                    <h4>Next of Kin Information</h4>
                    <hr/>
                    <form class="form-horizontal" id="kinform">
                        <div class="row">
                            <div class="col-md-6">
                                 Text input
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>  
                                    <div class="col-md-7">
                                        <input id="KINpmino" name="KINpmino" type="text"  class="form-control input-md">
                                        <input id="KINseq" name="KINseq" type="hidden"  class="form-control input-md">
        
                                    </div>
                                </div>
        
                                 Text input
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Relationship</label>  
                                    <div class="col-md-7">
                                        <select id="KINrelationship" name="KINrelationship" class="form-control">
                                            <option value="null" selected="" disabled="">Select Relationship</option>
                                            <option value="-">-</option>
        
        <%
            for (int i = 0; i < dataRelation.size(); i++) {%>
        <option value="<%=dataRelation.get(i).get(1)%>"><%=dataRelation.get(i).get(2)%></option>
        <%  }
        %>
    </select>
</div>
</div>

Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">New IC</label>  
<div class="col-md-7">
    <input id="KINnewic" name="KINnewic" type="text"  class="form-control input-md" maxlength="12">

</div>
</div>

Select Basic 
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

Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">Date Of Birth</label>  
<div class="col-md-7">
    <input id="KINdob" name="KINdob" type="text" class="form-control input-md">

</div>
</div>

Select Basic 
<div class="form-group">
<label class="col-md-4 control-label" for="selectbasic">Handphone Number</label>
<div class="col-md-7">
    <input id="KINphone" name="KINphone" type="text" class="form-control input-md"maxlength="12" >
</div>
</div>


</div>

<div class="col-md-6">

Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">Name</label>  
<div class="col-md-7">
    <input id="KINname" name="KINname" type="text"  class="form-control input-md" maxlength="80">

</div>
</div>
Select Basic 
<div class="form-group">
<label class="col-md-4 control-label" for="selectbasic">Email</label>
<div class="col-md-7">
    <input id="KINemail" name="KINemail" type="text" class="form-control input-md">
</div>
</div>
Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">Old IC</label>  
<div class="col-md-7">
    <input id="KINoldic" name="KINoldic" type="text" class="form-control input-md" maxlength="8">

</div>
</div>
Select Basic 
<div class="form-group">
<label class="col-md-4 control-label" for="selectbasic">ID number</label>
<div class="col-md-7">
    <input id="KINidnumber" name="KINidnumber" type="text" class="form-control input-md">
</div>
</div>
Select Basic 
<div class="form-group">
<label class="col-md-4 control-label" for="selectbasic">Occupation</label>
<div class="col-md-7">
    <input id="KINoccu" name="KINoccu" type="text" class="form-control input-md">
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
     Select Basic 
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
     Select Basic 
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">Address</label>
        <div class="col-md-7">
            <input id="KINaddress" name="KINaddress" type="text" class="form-control input-md">
        </div>
    </div>

     Select Basic 
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
Select Basic 
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

Select Basic 
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
Select Basic 
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

Select Basic 
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
<button id="KINsave" name="KINsave" class="btn btn-primary"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
<button id="KINclear" name="KINclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
</div>
</form>
</div>-->
        <div id="ModalKin"></div>
        <div class="thumbnail">
            <h4>List of Next of Kin
                <button id="addKINmodal" name="addKINmodal" class="btn btn-success pull-right" data-toggle="modal" data-target="#KINModal"><i class="fa fa-plus"></i>&nbsp; Add Next Of Kin Information</button></h4>
            </h4>
            <br/>
            <div id="tableListKin" class="form-group">
                <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listKIN">
                    <thead>
                    <th>Name</th>
                    <th>IC/ID No.</th>
                    <th>Date Of Birth</th>
                    <th>Relationship</th>
                    <th>Occupation</th>                    
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>

                </table>
            </div>


        </div>
    </div>
</div>
<script>
    $('#ModalKin').load('KinModal.jsp');

    $('#ModalKin').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '85%',
            height: 'auto',
            'max-height': '100%'});
    });


    //function to edit next of kin data from table
    $('#tableListKin').on('click', '#listKIN #KINedit', function (e) {
        e.preventDefault();
        $('#KINpmino').prop('readonly', true);
        $('#KINnewic').prop('readonly', true);
        $('#KINoldic').prop('readonly', true);

        //go to the top
        $('html,body').animate({
            scrollTop: $("#maintainKIN").offset().top
        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#kinval").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var pmino = arrayData[0], seqno = arrayData[1], relationship = arrayData[2], kinname = arrayData[3], newic = arrayData[4], oldic = arrayData[5], idtype = arrayData[6], idno = arrayData[7], birthdate = arrayData[8], occu = arrayData[9], address = arrayData[10], district = arrayData[11], town = arrayData[12], postcode = arrayData[13], state = arrayData[14], country = arrayData[15], mobilephone = arrayData[16], homephone = arrayData[17], email = arrayData[18];
        //convert date
        var splitbirthdate = String(birthdate).split("/");
        var convertedbirthdate = splitbirthdate[0] + "-" + splitbirthdate[1] + "-" + splitbirthdate[2];

        $('#KINpmino').val(pmino);
        $('#KINidtype').val(idtype);
        $('#KINdob').val(convertedbirthdate);
        $('#KINphone').val(mobilephone);
        $('#KINemail').val(email);
        $('#KINname').val(kinname);
        $('#KINoldic').val(oldic);
        $('#KINidnumber').val(idno);
        $('#KINoccu').val(occu);
        $('#KINhomephone').val(homephone);
        $('#KINaddress').val(address);
        $('#KINdistrict').val(district);
        $('#KINpostcode').val(postcode);
        $('#KINcountry').val(country);
        $('#KINtown').val(town);
        $('#KINstate').val(state);
        $('#KINseq').val(seqno);
        $('#KINrelationship').val(relationship);
        $('#KINnewic').val(newic);
        console.log(convertedbirthdate);
        console.log(seqno);
    });

    //delete function when click delete on next of kin
    $('#tableListKin').on('click', '#listKIN #KINdel', function (e) {
        e.preventDefault();
        var row2 = $(this).closest("tr");
        var rowData2 = row2.find("#kinval").val();

        console.log(rowData2);
        bootbox.confirm({
            message: "Are you sure want to delete patient's Next of Kin Information?",
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

                if (result === true) {
                    //get the row value
                    row2.remove();
                    var arrayData2 = rowData2.split("|");
                    //assign into seprated val
                    var pmino = arrayData2[0], seqno = arrayData2[1];
                    var datas = {pmino: pmino, seqno: seqno};
                    console.log(datas);
                    $.ajax({
                        type: "post",
                        url: "delKin.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log("delete " + data);


                        }, error: function () {

                        }

                    });
                }
            }
        });
    });
</script>