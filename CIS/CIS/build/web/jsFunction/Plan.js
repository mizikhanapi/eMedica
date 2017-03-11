$(document).ready(function(){
    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//---------------------------------------------------------------------------------------------Drug Order Modal.
 //js ADD for Drug Order
    $('#acceptDrugOrder').click(function () {

        var problem11 = $('#problem11').val();
        var qty = $('#qty').val();
        var pack = $('#pack').val();
        var pro = $('#pro').val();
        var d_strength = $('#d_strength').val();
        var d_strength1 = $('#d_strength1').val();
        var dose = $('#dose').val();
        var freq = $('#freq').val();s
        var dur1 = $('#dur1').val();
        var ddwwmm = $('#ddwwmm').val();
        var inst = $('#inst').val();
        var comment11 = $('#comment11').val();
//                    notes+= "DTO|" + getDate() + "^" +  

        var $items = $('#problem11, #qty, #pack, #pro, #d_strength, #d_strength1, #dose, #freq, #dur1, #ddwwmm, #inst, #comment11');
        var obj1 = {};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Drug To Order :<p class="summary" id="sum' + i + '">' + problem11 + '| ' + qty + '| ' + pack + '| ' + pro + '| ' + d_strength + '| ' + d_strength1 + '| ' + dose + '| ' + freq + '| ' + dur1 + '| ' + ddwwmm + '| ' + inst + '| ' + comment11 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040002" href="" class="updateDrugOrder" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn12" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#problem11").val("");
        $("#qty").val("");
        $("#pack").val("");
        $("#pro").val("");
        $("#d_strength").val("");
        $("#d_strength1").val("");
        $("#dose").val("");
        $("#freq").val("");
        $("#dur1").val("");
        $("#ddwwmm").val("");
        $("#inst").val("");
        $("#comment11").val("");
        $("#CIS040002").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Drug Order
    $('#consultationNotes').on('click', '.updateDrugOrder', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#pproblem11').val(updateObj.problem11);
        $('#qqty').val(updateObj.qty);
        $('#ppack').val(updateObj.pack);
        $('#ppro').val(updateObj.pro);
        $('#dd_strength').val(updateObj.d_strength);
        $('#dd_strength1').val(updateObj.d_strength1);
        $('#ddose').val(updateObj.dose);
        $('#ffreq').val(updateObj.freq);
        $('#ddur1').val(updateObj.dur1);
        $('#dddwwmm').val(updateObj.ddwwmm);
        $('#iinst').val(updateObj.inst);
        $('#pcomment11').val(updateObj.comment11);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateDrugOrder').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _pproblem11 = $('#pproblem11').val();
        var _qqty = $('#qqty').val();
        var _ppack = $('#ppack').val();
        var _ppro = $('#ppro').val();
        var _dd_strength = $('#dd_strength').val();
        var _dd_strength1 = $('#dd_strength1').val();
        var _ddose = $('#ddose').val();
        var _ffreq = $('#ffreq').val();
        var _ddur1 = $('#ddur1').val();
        var _dddwwmm = $('#dddwwmm').val();
        var _inst = $('#iinst').val();
        var _pcomment11 = $('#pcomment11').val();
        upObject.problem11 = _pproblem11;
        upObject.qty = _qqty;
        upObject.pack = _ppack;
        upObject.pro = _ppro;
        upObject.d_strength = _dd_strength;
        upObject.d_strength1 = _dd_strength1;
        upObject.dose = _ddose;
        upObject.freq = _ffreq;
        upObject.dur1 = _ddur1;
        upObject.ddwwmm = _dddwwmm;
        upObject.inst = _inst;
        upObject.comment11 = _pcomment11;
        var sum = _pproblem11 + '| ' + _qqty + '| ' + _ppack + '| ' + _ppro + '| ' + _dd_strength + '| ' + _dd_strength1 + '| ' + _ddose + '| ' + _ffreq + '| ' + _ddur1 + '| ' + _dddwwmm + '| ' + _inst + '| ' + _pcomment11

        $('#sum' + rowId).html(sum);
        $("#update_CIS040002").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Drug Order
    $('#consultationNotes').on("click", ".deleteBtn12", function () {
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
    
    //---------------------------------------------------------------------------------------------Second Opinion 
    
    //js ADD for Second opinion
    $('#acceptBtnSOF').click(function (e) {
        e.preventDefault();

        var Problem10 = $('#Problem10').val();
        var comment10 = $('#comment10').val();
        var $items = $('#Problem10, #comment10');
        var obj1 = {};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Second Opinion :<p class="summary" id="sum' + i + '">' + Problem10 + '| ' + comment10 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040005" href="" class="updateSOF" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn11" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem10").val("");
        $("#comment10").val("");

        $("#CIS040005").modal('toggle');
       // $(".modal-backdrop").hide();

    });

    //js UPDATE for Second opinion
    $('#consultationNotes').on('click', '.updateSOF', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem10').val(updateObj.Problem10);
        $('#Pcomment10').val(updateObj.comment10);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateSOF').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem10 = $('#PProblem10').val();
        var _Pcomment10 = $('#Pcomment10').val();
        upObject.Problem10 = _PProblem10;
        upObject.comment10 = _Pcomment10;
        var sum = _PProblem10 + '| ' + _Pcomment10

        $('#sum' + rowId).html(sum);
        $("#update_CIS040005").modal('toggle');
 
    });

    //js DELETE for Second opinion
    $('#consultationNotes').on("click", ".deleteBtn11", function () {
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
    
    
     //---------------------------------------------------------------------------------------------Procedure
    //js for add Procedure
    $('#acceptProcedure').click(function () {
        //var procedure_cd = "P0125245";
        var Problem18 = $('#Problem18').val();
        var proType = $('#proType').val();
        var procedure_cd = $('#procedure_cd').val();
//                    $.ajax({
//                        type: 'post',
//                        url: 'getProcedureCode.jsp',
//                        data: {'ProType': proType},
//                        success: function(data){
//                            console.log(data);
//                            var array_data = String(data).split("|");
//                            
//                             procedure_cd = array_data[0];
//                            alert(procedure_cd);
//                            // notes+= "POS|" + procedure_cd + "^" + proType + "|<cr>\n";
//                        },
//                        error: function(e){
//                            alert("Eroor" + e)
//                        }
//                    })
        notes += "POS|" + procedure_cd + "^" + proType + "|<cr>\n";
        var $items = $('#Problem18,#proType,#procedure_cd');
        var obj1 = {};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Procedure Order Segment :<p class="summary" id="sum' + i + '">' + Problem18 + '|' + proType + '|' + procedure_cd + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040006" href="" class="updateBtn13" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn13" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#Problem18").val("");
        $("#proType").val("");
        $("#procedure_cd").val("");
        $("#CIS040006").modal('toggle');
        //$(".modal-backdrop").hide();

    });

//               //js UPDATE for Procedure
    $('#consultationNotes').on('click', '.updateBtn13', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem19').val(updateObj.Problem18);
        $('#pproType').val(updateObj.proType);
        $('#pprocedure_cd').val(updateObj.procedure_cd);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateProcedure').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem19 = $('#PProblem19').val();
        var _pproType = $('#pproType').val();
        var _pprocedure_cd = $('#pprocedure_cd').val();
        upObject.Problem18 = _PProblem19;
        upObject.proType = _pproType;
        upObject.procedure_cd = _pprocedure_cd;
        var sum = _PProblem19 + '|' + _pproType + '|' + _pprocedure_cd

        $('#sum' + rowId).html(sum);
        $("#update_CIS040006").modal('toggle');
       // $(".modal-backdrop").hide();
    });

    //js DELETE for Procedure
    $('#consultationNotes').on("click", ".deleteBtn13", function () {
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
    
    //---------------------------------------------------------------------------------------------MC and Time Slip
    //js add for MC & Time Slip
    $('#acceptMCTS').click(function (e) {
        e.preventDefault();
        var DateFrom = $('#DateFrom').val();
        var DateTo = $('#DateTo').val();
        var num1 = $('#num1').val();
        var num2 = $('#num2').val();
        var num3 = $('#num3').val();
        notes += "MEC|"
        var $items = $('#DateFrom,#DateTo,#num1,#num2,#num3');
        var obj1 = {};

        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">MC & Time Slip :<p class="summary" id="sum' + i + '">' + DateFrom + '|' + DateTo + '|' + num1 + '|' + num2 + '|' + num3 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040008" href="" class="updateBtn14" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn14" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;

        $("#DateFrom").val("");
        $("#DateTo").val("");
        $("#num1").val("");
        $("#num2").val("");
        $("#num3").val("");
        $("#CIS040008").modal('toggle');
       // $(".modal-backdrop").hide();

    });

    //js update for MC & Time Slip
    $('#consultationNotes').on('click', '.updateBtn14', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#DDateFrom').val(updateObj.DateFrom);
        $('#DDateTo').val(updateObj.DateTo);
        $('#nnum1').val(updateObj.num1);
        $('#nnum2').val(updateObj.num2);
        $('#nnum3').val(updateObj.num3);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateMCTS').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _DDateFrom = $('#DDateFrom').val();
        var _DDateTo = $('#DDateTo').val();
        var _nnum1 = $('#nnum1').val();
        var _nnum2 = $('#nnum2').val();
        var _nnum3 = $('#nnum3').val();
        upObject.DateFrom = _DDateFrom;
        upObject.DateTo = _DDateTo;
        upObject.num1 = _nnum1;
        upObject.num2 = _nnum2;
        upObject.num3 = _nnum3;
        var sum = _DDateFrom + '| ' + _DDateTo + '| ' + _nnum1 + '| ' + _nnum2 + '| ' + _nnum3

        $('#sum' + rowId).html(sum);
        $("#update_CIS040008").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Procedure
    $('#consultationNotes').on("click", ".deleteBtn14", function () {
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
    

});