
function getDate() {
    var d = new Date();
    var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
    return dates;
}
// Declare Array Variable To Store The User Inputs...
var _data = [];
var notes = "";

var i = 0;
$(document).ready(function () {
    function deleteRow(id) {
    }
    //js ADD Complaint 
    
    $('#match50').on('click',function(){
        $.ajax({
            url:'search/SearchCCN_cd.jsp',
            method:'POST',
            timeout:10000,
            data:{
                id:$('#problem').val()
            },
            success:function(result){
                console.log(result);
                $('#ccnCode').val(result.trim())
            }
        });
    });
    
    $('#acceptBtn').click(function (e) {
        e.preventDefault();
        var problem = $('#problem').val();
        var Mild = $('#Mild').val();
        var Site = $('#Site').val();
        var duration = $('#duration').val();
        var sdur = $('#sdur').val();
        var Laterality = $('#Laterality').val();
        var Comment = $('#Comment').val();
        var ccnCode = $('#ccnCode').val();
        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
        var $items = $('#codeCCN,#problem, #Mild, #Site, #duration, #sdur, #Laterality, #Comment,#ccnCode');
        var obj1 = {Acode:"CCN"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint (CCN) :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBtn" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#problem").val("");
        $("#duration").val("");
        $("#Comment").val("");
        $("#ccnCode").val("");
        $("#squarespaceModal").modal('toggle');
        //$("#squarespaceModal").hide();
       // $(".modal-backdrop").hide();

    });

    //js UPDATE Complaint 
    $('#consultationNotes').on('click', '.updateBtn', function (e) {
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#uproblem').val(updateObj.problem);
        $('#uMild').val(updateObj.Mild);
        $('#uSite').val(updateObj.Site);
        $('#uduration').val(updateObj.duration);
        $('#ssdur').val(updateObj.sdur);
        $('#uLaterality').val(updateObj.Laterality);
        $('#uComment').val(updateObj.Comment);
        $('#uccnCode').val(updateObj.ccnCode);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _uproblem = $('#uproblem').val();
        var _uMild = $('#uMild').val();
        var _uSite = $('#uSite').val();
        var _uduration = $('#uduration').val();
        var _ssdur = $('#ssdur').val();
        var _uLaterality = $('#uLaterality').val();
        var _uComment = $('#uComment').val();
        var _uccnCode = $('#uccnCode').val();
        upObject.problem = _uproblem;
        upObject.Mild = _uMild;
        upObject.Site = _uSite;
        upObject.duration = _uduration;
        upObject.sdur = _ssdur;
        upObject.Laterality = _uLaterality;
        upObject.Comment = _uComment;
        upObject.ccnCode = _uccnCode;
        var sum = _uproblem + '| ' + _uMild + '| ' + _uSite + '| ' + _uduration + '| ' + _ssdur + '| ' + _uLaterality + '| ' + _uComment
        $('#sum' + rowId).html(sum);
        $("#updateModal").modal('toggle');
        //$(".modal-backdrop").hide();
    });


    //js DELETE Complaint 
    $('#consultationNotes').on("click", ".deleteBtn", function (e) {
        e.preventDefault();
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD HPI 
    $('#acceptBtn1').click(function (e) {
        e.preventDefault();

        var details = $('#details').val();
        var code1 = $('#codeHPI').val();
        var $items = $('#codeHPI,#details');
        var obj1 = {Acode:"HPI"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        notes += "HPI|" + getDate() + "|" + details + "^" + getDate() + "|<cr>\n";

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">History of Present Illness (HPI) :<p class="summary" id="sum' + i + '">' + code1 + '|' + details + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal1" href="" class="updateBtn1" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn1" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#details").val("");
        $("#squarespaceModal2").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js UPDATE HPI
    $('#consultationNotes').on('click', '.updateBtn1', function (e) {
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#udetails').val(updateObj.details);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn1').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _udetails = $('#udetails').val();
        upObject.details = _udetails;
        var sum = _udetails

        $('#sum' + rowId).html(sum);
        $("#updateModal1").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE HPI
    $('#consultationNotes').on("click", ".deleteBtn1", function (e) {
        e.preventDefault();
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD PMH 
    $('#acceptBtn2').click(function (e) {
        e.preventDefault();

        var Problem1 = $('#Problem1').val();
        var Status = $('#Status').val();
        var comment1 = $('#comment1').val();
        var pmhCode = $('#pmhCode').val();
        var $items = $('#Problem1, #Status, #comment1,#pmhCode');
        notes += "PMH|" + getDate() + "|se001^" + Problem1 + "^" + getDate() + "|<cr>\n";
        var obj1 = {Acode:"PMH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Past Medical History (PMH) :<p class="summary" id="sum' + i + '">' + Problem1 + '| ' + Status + '| ' + comment1 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal2" href="" class="updateBtn2" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn2" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem1").val("");
        $("#Status").val("Status");
        $("#comment1").val("");
        $("#squarespaceModal3").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE PMH
    $('#consultationNotes').on('click', '.updateBtn2', function (e) {
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem2').val(updateObj.Problem1);
        $('#PStatus').val(updateObj.Status);
        $('#Pcomment1').val(updateObj.comment1);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn2').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem2 = $('#PProblem2').val();
        var _PStatus = $('#PStatus').val();
        var _Pcomment1 = $('#Pcomment1').val();
        upObject.Problem1 = _PProblem2;
        upObject.Status = _PStatus;
        upObject.comment1 = _Pcomment1;
        var sum = _PProblem2 + '| ' + _PStatus + '| ' + _Pcomment1

        $('#sum' + rowId).html(sum);
        $("#updateModal2").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE PMH
    $('#consultationNotes').on("click", ".deleteBtn2", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD for FMH
    $('#acceptBtn3').click(function () {

        var Problem3 = $('#Problem3').val();
        var f_relationship = $('#f_relationship').val();
        var comment2 = $('#comment2').val();
        var code4 = $('#codeFMH').val();
        notes += "FMH|" + getDate() + "|^" + f_relationship + "^" + Problem3 + "^" + getDate() + "^" + comment2 + "|<cr>\n";
        var $items = $('#codeFMH,#Problem3, #f_relationship, #comment2');
        var obj1 = {Acode:"FMH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Familiy Medical History (FMH) :<p class="summary" id="sum' + i + '">' + code4 + '| ' + Problem3 + '| ' + f_relationship + '| ' + comment2 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal3" href="" class="updateBtn3" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn3" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem3").val("");
        $("#f_relationship").val("Select Family Relationship");
        $("#comment2").val("");
        $("#squarespaceModal4").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for FMH
    $('#consultationNotes').on('click', '.updateBtn3', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem3').val(updateObj.Problem3);
        $('#ff_relationship').val(updateObj.f_relationship);
        $('#Pcomment2').val(updateObj.comment2);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn3').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem3 = $('#PProblem3').val();
        var _ff_relationship = $('#ff_relationship').val();
        var _Pcomment2 = $('#Pcomment2').val();
        upObject.Problem3 = _PProblem3;
        upObject.f_relationship = _ff_relationship;
        upObject.comment2 = _Pcomment2;
        var sum = _PProblem3 + '| ' + _ff_relationship + '| ' + _Pcomment2;
        $('#sum' + rowId).html(sum);
        $("#updateModal3").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for FMH
    $('#consultationNotes').on("click", ".deleteBtn3", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD for Social History
    $('#acceptBtn4').click(function () {

        var Problem4 = $('#Problem4').val();
        var date = $('#date').val();
        var comment3 = $('#comment3').val();
        var code5 = $('#codeSOH').val();
        notes += "SOH|" + getDate() + "|^" + "C001|" + "^" + Problem4 + "^" + "123|" + "^" + "223|" + "^" + "555|" + "^" + "666|" + "^" + "777|" + "^" + date + "^" + getDate() + "^" + "1|" + "^" + "52" + "^" + comment3 + "^" + getDate() + "^" + "2|" + "^" + getDate() + "^-^" + "^" + "1252254" + "^" + "B031310504" + "^" + "Ahmed" + "|<cr>\n";
        var $items = $('#codeSOH,#Problem4, #date, #comment3');
        var obj1 = {Acode:"SOH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Social History (SOH):<p class="summary" id="sum' + i + '">' + code5 + '| ' + Problem4 + '| ' + date + '| ' + comment3 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal4" href="" class="updateBtn4" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn4" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem4").val("");
        $("#date").val("");
        $("#comment3").val("");
        $("#squarespaceModal5").modal('toggle');
       // $(".modal-backdrop").hide();

    });

    //js UPDATE for Social History
    $('#consultationNotes').on('click', '.updateBtn4', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem4').val(updateObj.Problem4);
        $('#ddate').val(updateObj.date);
        $('#Pcomment3').val(updateObj.comment3);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn4').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem4 = $('#PProblem4').val();
        var _ddate = $('#ddate').val();
        var _Pcomment3 = $('#Pcomment3').val();
        upObject.Problem4 = _PProblem4;
        upObject.date = _ddate;
        upObject.comment3 = _Pcomment3;
        var sum = _PProblem4 + '| ' + _ddate + '| ' + _Pcomment3

        $('#sum' + rowId).html(sum);
        $("#updateModal4").modal('toggle');
       // $(".modal-backdrop").hide();
    });

    //js DELETE for Social History
    $('#consultationNotes').on("click", ".deleteBtn4", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD for Blood Group/G6PD 

    $('#acceptBtn5').click(function () {

        var blood = $('#blood').val();
        var Rhesus_Type = $('#Rhesus_Type').val();
        var G6PD_Status = $('#G6PD_Status').val();
        var comment4 = $('#comment4').val();
        var code6 = $('#codeBLD').val();
        notes += "BLD|" + getDate() + "^|" + blood + "^" + Rhesus_Type + "^" + G6PD_Status + "|<cr>\n";
        var $items = $('#codeBLD,#blood, #Rhesus_Type, #G6PD_Status, #comment4');
        var obj1 = {Acode:"BLD"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Blood Group (BLD) :<p class="summary" id="sum' + i + '">' + code6 + '| ' + blood + '| ' + Rhesus_Type + '| ' + G6PD_Status + '|' + comment4 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal5" href="" class="updateBtn5" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn5" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;



        $("#comment4").val("");
        $("#squarespaceModal6").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //

    //js UPDATE for Blood Group/G6PD 
    $('#consultationNotes').on('click', '.updateBtn5', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#b_blood').val(updateObj.blood);
        $('#RRhesus_Type').val(updateObj.Rhesus_Type);
        $('#GG6PD_Status').val(updateObj.G6PD_Status);
        $('#Pcomment4').val(updateObj.comment4);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn5').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _b_blood = $('#b_blood').val();
        var _RRhesus_Type = $('#RRhesus_Type').val();
        var _GG6PD_Status = $('#GG6PD_Status').val();
        var _Pcomment4 = $('#Pcomment4').val();
        upObject.blood = _b_blood;
        upObject.Rhesus_Type = _RRhesus_Type;
        upObject.G6PD_Status = _GG6PD_Status;
        upObject.comment4 = _Pcomment4;
        var sum = _b_blood + '| ' + _RRhesus_Type + '| ' + _GG6PD_Status + '| ' + _Pcomment4
        $('#sum' + rowId).html(sum);
        $("#updateModal5").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Blood Group/G6PD
    $('#consultationNotes').on("click", ".deleteBtn5", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD for Allergy
    $('#acceptBtn6').click(function () {

        var Problem5 = $('#Problem5').val();
        var date1 = $('#date1').val();
        var comment5 = $('#comment5').val();
        var code7 = $('#codeALG').val();
        notes += "ALG|" + getDate() + "^|" + "^-^" + "^" + Problem5 + "^" + date1 + "^" + comment5 + "|<cr>\n";
        var $items = $('#codeALG,#Problem5, #date1, #comment5');
        var obj1 = {Acode:"ALG"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Allergy (ALG) :<p class="summary" id="sum' + i + '">' + code7 + '| ' + Problem5 + '| ' + date1 + '| ' + comment5 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal6" href="" class="updateBtn6" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn6" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem5").val("");
        $("#date1").val("");
        $("#comment5").val("");
        $("#squarespaceModal7").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Allergy
    $('#consultationNotes').on('click', '.updateBtn6', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem5').val(updateObj.Problem5);
        $('#ddate1').val(updateObj.date1);
        $('#Pcomment5').val(updateObj.comment5);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn6').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem5 = $('#PProblem5').val();
        var _ddate1 = $('#ddate1').val();
        var _Pcomment5 = $('#Pcomment5').val();
        upObject.Problem5 = _PProblem5;
        upObject.date1 = _ddate1;
        upObject.comment5 = _Pcomment5;
        var sum = _PProblem5 + '| ' + _ddate1 + '| ' + _Pcomment5

        $('#sum' + rowId).html(sum);
        $("#updateModal6").modal('toggle');
       // $(".modal-backdrop").hide();
    });

    //js DELETE for Allergy
    $('#consultationNotes').on("click", ".deleteBtn6", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });

    //js ADD for Immunization
    $('#acceptBtn7').click(function () {
        var probcode = "";
        var Problem6 = $('#Problem6').val();
        var date2 = $('#date2').val();
        var comment6 = $('#comment6').val();
        var code8 = $('#codeIMU').val();
        notes += "IMU|" + getDate() + "^|" + probcode + "^" + Problem6 + "^" + date2 + "^" + comment6 + "|<cr>\n";
        var $items = $('#codeIMU,#Problem6, #date2, #comment6');
        var obj1 = {Acode:"IMU"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Immunization (IMU) :<p class="summary" id="sum' + i + '">' + code8 + '| ' + Problem6 + '| ' + date2 + '| ' + comment6 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal7" href="" class="updateBtn7" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn7" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem6").val("");
        $("#date2").val("");
        $("#comment6").val("");
        $("#squarespaceModal8").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Immunization
    $('#consultationNotes').on('click', '.updateBtn7', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem6').val(updateObj.Problem6);
        $('#ddate2').val(updateObj.date2);
        $('#Pcomment6').val(updateObj.comment6);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn7').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem6 = $('#PProblem6').val();
        var _ddate2 = $('#ddate2').val();
        var _Pcomment6 = $('#Pcomment6').val();
        upObject.Problem6 = _PProblem6;
        upObject.date2 = _ddate2;
        upObject.comment6 = _Pcomment6;
        var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6

        $('#sum' + rowId).html(sum);
        $("#updateModal7").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Immunization
    $('#consultationNotes').on("click", ".deleteBtn7", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }//from here
    });

    //js ADD for Disability
    $('#acceptBtn8').click(function () {
        var dabcode = "525225";
        var termtype = "Term";
        var icd10code = "25256";
        var icd10desc = "Fever";
        var Problem32 = $('#Problem32').val();
        var date3 = $('#date3').val();
        var comment7 = $('#comment7').val();
        var code9 = $('#codeDAB').val();
        notes += "DAB|" + getDate() + "^|" + dabcode + "^" + Problem32 + "^" + date3 + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
        var $items = $('#codeDAB,#Problem7, #date3, #comment7');
        var obj1 = {Acode:"DAB"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Disablility (DAB) :<p class="summary" id="sum' + i + '">' + code9 + '| ' + Problem32 + '| ' + date3 + '| ' + comment7 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal8" href="" class="updateBtn8" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn8" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem7").val("");
        $("#date3").val("");
        $("#comment7").val("");
        $("#squarespaceModal9").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Disability
    $('#consultationNotes').on('click', '.updateBtn8', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem32').val(updateObj.Problem7);
        $('#ddate3').val(updateObj.date3);
        $('#Pcomment7').val(updateObj.comment7);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn8').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem7 = $('#PProblem32').val();
        var _ddate3 = $('#ddate3').val();
        var _Pcomment7 = $('#Pcomment7').val();
        upObject.Problem7 = _PProblem7;
        upObject.date3 = _ddate3;
        upObject.comment7 = _Pcomment7;
        var sum = _PProblem7 + '| ' + _ddate3 + '| ' + _Pcomment7

        $('#sum' + rowId).html(sum);
        $("#updateModal8").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Disability
    $('#consultationNotes').on("click", ".deleteBtn8", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });



    //
   




});
