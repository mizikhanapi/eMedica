<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Conn conn = new Conn();
    String idType6 = "select * from adm_lookup_detail where master_reference_code = '0012'   ";
    String district6 = "select * from adm_lookup_detail where master_reference_code = '0078'   ";
    String postcode6 = "select * from adm_lookup_detail where master_reference_code = '0079'   ";
    String country6 = "select * from adm_lookup_detail where master_reference_code = '0001'   ";
    String town6 = "select * from adm_lookup_detail where master_reference_code = '0003'   ";
    String state6 = "select * from adm_lookup_detail where master_reference_code = '0002'   ";
    String relation6 = "select * from adm_lookup_detail where master_reference_code = '0007'  ";
    String occupation6 = "select * from adm_lookup_detail where master_reference_code = '0050'";

    ArrayList<ArrayList<String>> dataIdType6, dataDistrict6, dataPostcode6, dataCountry6, dataTown6, dataState6, dataRelation6, dataOccu6;
    dataIdType6 = conn.getData(idType6);
    dataDistrict6 = conn.getData(district6);
    dataPostcode6 = conn.getData(postcode6);
    dataCountry6 = conn.getData(country6);
    dataTown6 = conn.getData(town6);
    dataState6 = conn.getData(state6);
    dataRelation6 = conn.getData(relation6);
    dataOccu6 = conn.getData(occupation6);
%>

<div class="row">
    <div class="col-md-12">

        <div id="ModalKin"><%@include file = "KinModal.jsp" %></div>
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
    //$('#ModalKin').load('KinModal.jsp');

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