<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Conn conn = new Conn();
    String relation7 = "select * from adm_lookup_detail where master_reference_code = '0007'   ";
    String occupation7 = "select * from adm_lookup_detail where master_reference_code = '0050'";
    ArrayList<ArrayList<String>> dataRelation7,dataOccu7;
    dataRelation7 = conn.getData(relation7);
    dataOccu7 = conn.getData(occupation7);

%>

<div class="row">
    <div class="col-md-12">

    </div>
</div>
                        <div id="modalFAM"><%@include file = "FamilyModal.jsp" %></div>
<div class="row">
    <div class="col-md-12">		
        <div class="thumbnail">
            <h4>List of Family
                            <button id="addFAMmodal" name="addFAMmodal" class="btn btn-success pull-right" data-toggle="modal" data-target="#FamilyModal"><i class="fa fa-plus"></i>&nbsp; Add Family Information</button></h4>
</h4>
<br/>
            <div id="tableListFamily" class="form-group">
                <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listFamily">
                    <thead>
                    <th>Family Member's Name</th>
                    <th>Relationship</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    
    $('#modalFAM').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });

    //function to edit next of kin data from table
    $('#tableListFamily').on('click', '#listFamily #FAMedit', function (e) {
        e.preventDefault();
        $('#FAMpmi').prop('readonly', true);

        $('#FAMpmifam').prop('readonly', true);
        //go to the top
        $('html,body').animate({
            scrollTop: $("#maintainFam").offset().top
        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#famval").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var pmino = arrayData[0], seqno = arrayData[1], relationship = arrayData[2], fampmino = arrayData[3], name = arrayData[4], occu = arrayData[5];
        //set value in input on the top
        $('#FAMpmi').val(pmino);
        $('#FAMseq').val(seqno);
        $('#FAMpmifam').val(fampmino);
        $('#FAMrelay').val(relationship);
        $('#FAMocc').val(occu);
        $('#FAMname').val(name);

        console.log(arrayData);
    });

    //delete function when click delete on next of kin
    $('#tableListFamily').on('click', '#listFamily #FAMdel', function (e) {
        e.preventDefault();
        var row2 = $(this).closest("tr");
        var rowData2 = row2.find("#famval").val();

        console.log(rowData2);
        bootbox.confirm({
            message: "Are you sure want to delete patient's Family information?",
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
                        url: "delFam.jsp",
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