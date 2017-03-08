<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    //String relation = "select * from lookup_detail where master_ref_code = '0007' order by Description";
    String hcf8 = "select * from adm_lookup_detail where master_reference_code = '0081'   ";
    String insuranceCompany8 = "select * from adm_lookup_detail where master_reference_code = '0083'   ";
    String insurancePolicy8 = "select * from adm_lookup_detail where master_reference_code = '0058'   ";
    ArrayList<ArrayList<String>> dataHfc8, dataInsurancePolicy8, dataInsuranceCompany8;
    dataHfc8 = conn.getData(hcf8);
    dataInsurancePolicy8 = conn.getData(insurancePolicy8);
    dataInsuranceCompany8 = conn.getData(insuranceCompany8);

%>			
<div class="row">
    <div class="col-md-12">

                            <div id="modalMED"><%@include file = "MedicalModal.jsp" %></div>
        <div class="thumbnail">
            <h4>List of Medical Insurance
                            <button id="addMEDmodal" name="addMEDmodal" class="btn btn-success pull-right" data-toggle="modal" data-target="#MEDModal"><i class="fa fa-plus"></i>&nbsp; Add Medical Insurance Information</button></h4>
</h4>
<br/>
            <div id="tableListMed" class="form-group">
                <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listMED">
                    <thead>
                    <th>Insurance Company</th>
                    <th>Policy No.</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
<script>
 $('#modalMED').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });

    //function to edit next of kin data from table
    $('#tableListMed').on('click', '#listMED #MEDedit', function (e) {
        e.preventDefault();
        $('#MEDpmino').prop('readonly', true);
        $('#MEDpolicy').prop('readonly', true);
        //go to the top
        $('html,body').animate({
            scrollTop: $("#maintainMED").offset().top
        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#medval").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var pmino = arrayData[0], insuran = arrayData[1], policy = arrayData[2], maturitydate = arrayData[3], hfc = arrayData[4], status = arrayData[5];
        //convert date
        var splitmaturitydate = String(maturitydate).split("/");
        var convertedmaturitydate = splitmaturitydate[0] + "-" + splitmaturitydate[1] + "-" + splitmaturitydate[2];

        $('#MEDpmino').val(pmino);
        $('#MEDinscom').val(insuran);
        $('#MEDpolicy').val(policy);
        $('#MEDdate').val(convertedmaturitydate);
        $('#MEDhfc').val(hfc);
        $('#MEDstatus').val(status);

        console.log(convertedmaturitydate);
        console.log(arrayData);
    });
    
    //delete function when click delete on next of kin
    $('#tableListMed').on('click', '#listMED #MEDdel', function (e) {
        e.preventDefault();
        var row2 = $(this).closest("tr");
        var rowData2 = row2.find("#medval").val();

        console.log(rowData2);
        bootbox.confirm({
            message: "Are you sure want to delete patient's Medical Insurance?",
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
                    var pmino = arrayData2[0], policy = arrayData2[2];
                    var datas = {pmino: pmino, policy : policy};
                    console.log(datas);
                    $.ajax({
                        type: "post",
                        url: "delMedical.jsp",
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