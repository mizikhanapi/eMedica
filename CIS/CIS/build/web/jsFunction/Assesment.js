/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    //js ADD for Diagnosis
    $('#acceptBtn9').click(function () {
        var diacode = "I0221c002";
        var termtype = "Term";
        var icd10code = "25256";
        var icd10desc = "Fever";
        var hfc = "2252145522";
        var doctorname = "Ahmed";
        var doctorid = "B031310504";
        var status = "Active";
        //---------------------------
        var Type = $('#Type').val();
        var date4 = $('#date4').val();
        var Problem8 = $('#Problem8').val();
        var Severity1 = $('#Severity1').val();
        var Site1 = $('#Site1').val();
        var Laterality1 = $('#Laterality1').val();
        var comment8 = $('#comment8').val();
        var code10 = $('#codeDGS').val();
        notes += "DGS|" + getDate() + "^|" + Type + "^" + Problem8 + "^" + "^-^" + "^" + date4 + "^" + "^-^" + "^" + "^-^" + diacode + "^" + Problem8 + "^" + "^-^" + "^" + Severity1 + "^" + "^-^" + "^" + Site1 + "^" + "^-^" + "^" + "^-^" + "^" + Laterality1 + "^" + "^-^" + "^" + "^-^" + comment8 + "^" + getDate() + "^" + status + "^" + getDate + "^" + hfc + "^" + doctorid + "^" + doctorname + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
        var $items = $('#codeDGS,#Type, #date4, #Problem8, #Severity1, #Site1, #Laterality1, #comment8');
        var obj1 = {};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">DGS :<p class="summary" id="sum' + i + '">' + code10 + '| ' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS030001" href="" class="updateBtn9" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn9" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem8").val("");
        $("#comment8").val("");
        $("#CIS030001").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Diagnosis
    $('#consultationNotes').on('click', '.updateBtn9', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#TType').val(updateObj.Type);
        $('#ddate4').val(updateObj.date4);
        $('#PProblem8').val(updateObj.Problem8);
        $('#SSeverity1').val(updateObj.Severity1);
        $('#SSite1').val(updateObj.Site1);
        $('#LLaterality1').val(updateObj.Laterality1);
        $('#Pcomment8').val(updateObj.comment8);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn9').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _TType = $('#TType').val();
        var _ddate4 = $('#ddate4').val();
        var _PProblem8 = $('#PProblem8').val();
        var _SSeverity1 = $('#SSeverity1').val();
        var _SSite1 = $('#SSite1').val();
        var _LLaterality1 = $('#LLaterality1').val();
        var _Pcomment8 = $('#Pcomment8').val();
        upObject.Type = _TType;
        upObject.date4 = _ddate4;
        upObject.Problem8 = _PProblem8;
        upObject.Severity1 = _SSeverity1;
        upObject.Site1 = _SSite1;
        upObject.Laterality1 = _LLaterality1;
        upObject.comment8 = _Pcomment8;
        var sum = _TType + '| ' + _ddate4 + '| ' + _PProblem8 + '| ' + _SSeverity1 + '| ' + _SSite1 + '| ' + _LLaterality1 + '| ' + _Pcomment8

        $('#sum' + rowId).html(sum);
        $("#update_CIS030001").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Diagnosis
    $('#consultationNotes').on("click", ".deleteBtn9", function () {
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

    //js ADD for Progress Notes
    $('#acceptBtn10').click(function () {
        var hfc = "2252145522";
        var doctorname = "Ahmed";
        var doctorid = "B031310504";
        var status = "Active";
        var notes = "Hi Am Here";
        //---------------------------------------------
        var comment9 = $('#comment9').val();
        var code11 = $('#codePNT').val();
        notes += "PNT|" + getDate() + "^|" + notes + "^" + comment9 + "^" + getDate() + "^" + status + "^" + getDate() + "^" + hfc + "^" + doctorid + "^" + doctorname + "|<cr>\n";
        var $items = $('#codePNT,#comment9');
        var obj1 = {};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">PNT :<p class="summary" id="sum' + i + '">' + code11 + '|' + comment9 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS030002" href="" class="updateBtn10" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn10" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;


        $("#comment9").val("");
        $("#CIS030002").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Progress Notes
    $('#consultationNotes').on('click', '.updateBtn10', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#Pcomment9').val(updateObj.comment9);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn10').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _Pcomment9 = $('#Pcomment9').val();
        upObject.comment9 = _Pcomment9;
        var sum = _Pcomment9

        $('#sum' + rowId).html(sum);
        $("#update_CIS030002").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Progress Notes
    $('#consultationNotes').on("click", ".deleteBtn10", function () {
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
})