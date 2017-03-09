/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function calcPoint(eor, mr, vr) {
    var tPoint = eor + mr;
    var result;
    tPoint = tPoint + vr;
    if (tPoint <= 8) {
        result = "Severe Brain Injury";
    } else if (tPoint > 8 && tPoint <= 12) {
        result = "Moderate Brain Injury";
    } else if (tPoint > 12 && tPoint <= 14) {
        result = "Minor Brain Injury";
    } else {
        result = "Normal";
    }
    return [result, tPoint];
}

function calcBMI(h, w) {
    var bmi;
    var status;
    bmi = w / h;
    bmi = bmi.toFixed(1);

    if (bmi < 18.5) {
        status = "Underweight";
    } else if (bmi <= 23.9) {
        status = "Healthy Weight";
    } else if (bmi <= 26.9) {
        status = "Overweight";
    } else {
        status = "Obese";
    }
    return [bmi, status];
}

function convertToJSArray(data) {
    data = data.split('|');
    for (i = 0; i < data.length; i++) {

        data[i] = data[i].slice(1, -1);

    }
    return data;

}

function convertArrayToObject(data) {
    var dataArry = data.split(',');
    return dataArry;
}

function populateList() {
    alert("Populate function");
}

function clearID(){
     pitemIDpe0 = "";
 pitemIDpe1 = "";
 pitemIDpe2 = "";
 pitemIDpe3 = "";
 pitemIDpe4 = "";
 pitemIDpe5 = "";
 pitemIDpe6 = "";
 pitemIDpe7 = "";
 pitemIDpe8 = "";
}

//var _data = [];

var notes = "";
var i = 0;
var pitemIDpe0 = "";
var pitemIDpe1 = "";
var pitemIDpe2 = "";
var pitemIDpe3 = "";
var pitemIDpe4 = "";
var pitemIDpe5 = "";
var pitemIDpe6 = "";
var pitemIDpe7 = "";
var pitemIDpe8 = "";
var updateObjCd;

 var NotesPE;

$(document).ready(function () {

//-------------------------------QUEUE MODAL

$('#queueBtn').click(function(e){
    e.preventDefault();
    $('#listQueue').load('queue/QueueModal.jsp');
    $('#queueModal').modal('toggle');
//    $.ajax({
//        url:'queue/listQueue.jsp',
//        timeout:10000,
//        method:'POST',
//        success:function(result){
//            $('#formQueueSaya').html(result);
//        }
//    });
});



    //GCS MODUL
    $('#gcsAccept').click(function (e) {
        //alert("gcsAccept");
        var gcsResult = $('#resultMain').val();
        var gcsPoint = $('#pointMain').val();

        var items = $('#resultMain,#pointMain');
        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        //console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Glasgow Coma Scale :<p class="summary" id="sum' + i + '">GCS Result:' + gcsResult + '| GCS Point:' + gcsPoint + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateGcs" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;
//        $('#resultMain').val('');
//        $('#pointMain').val('');
        $("#CIS020001").modal('toggle');
    });
    $('#consultationNotes').on('click', '.updateGcs', function () {
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        //console.log(updateObj);
        $("#CIS020001").modal('toggle');
        $('#actionGSC').hide();
        $('#updateGSC').show();
        //$('#actionGSC #updateBtn').show();
        $('#resultMain').val(updateObj.resultMain);
        $('#pointMain').val(updateObj.pointMain);
        $('#Jsonid').val(id[1]);
    });
    $('#gcsUpdate').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#Jsonid').val()];
        var rowId = $('#Jsonid').val();
        upObject.resultMain = $('#resultMain').val();
        upObject.pointMain = $('#pointMain').val();
        //console.log(upObject);

        var sum = 'GCS Result:' + upObject.resultMain + '| GCS Point:' + upObject.pointMain;
        $('#sum' + rowId).html(sum);
        $("#CIS020001").modal('toggle');
    });

    //------------------------------------------------------------------------------------------------------------------------PGCS MODUL

    $('#pgcsAccept').click(function (e) {
        //alert("gcsAccept");
        var pgcsResult = $('#resultpgcsMain').val();
        var pgcsPoint = $('#pointpgcsMain').val();

        var items = $('#resultpgcsMain,#pointpgcsMain');
        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        //console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Pediatric Glasgow Coma Scale :<p class="summary" id="sum' + i + '">PGCS Result:' + pgcsResult + '| PGCS Point:' + pgcsPoint + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePgcs" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;
//        $('#resultMain').val('');
//        $('#pointMain').val('');
        $("#CIS020002").modal('toggle');
    });

    $('#consultationNotes').on('click', '.updatePgcs', function () {
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        //console.log(updateObj);
        $("#CIS020002").modal('toggle');
        $('#actionPGSC').hide();
        $('#updatePGSC').show();
        //$('#actionGSC #updateBtn').show();
        $('#resultpgcsMain').val(updateObj.resultpgcsMain);
        $('#pointpgcsMain').val(updateObj.pointpgcsMain);
        $('#pgcsid').val(id[1]);
    });

    $('#pgcsUpdate').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#pgcsid').val()];
        var rowId = $('#pgcsid').val();
        upObject.resultpgcsMain = $('#resultpgcsMain').val();
        upObject.pointpgcsMain = $('#pointpgcsMain').val();
        //console.log(upObject);

        var sum = 'PGCS Result:' + upObject.resultpgcsMain + '| PGCS Point:' + upObject.pointpgcsMain;
        $('#sum' + rowId).html(sum);
        $("#CIS020002").modal('toggle');
    });

//----------------------------------------------------------------------------------BLOOD PRESSURE MODEL
    $('#acceptBloodPBtn').click(function (e) {
        e.preventDefault();

        var _sitBPS = $('#sitS').val();
        var _sitBPD = $('#sitD').val();
        var _sitBPP = $('#sitP').val();

        var _standBPS = $('#standS').val();
        var _standBPD = $('#standD').val();
        var _standBPP = $('#standP').val();

        var _lyingBPS = $('#lyingS').val();
        var _lyingBPD = $('#lyingD').val();
        var _lyingBPP = $('#lyingP').val();

        var items = $('#sitS,#sitD,#sitP,#standS,#standD,#standP,#lyingS,#lyingD,#lyingP');
        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Blood Pressure :<p class="summary" id="sum' + i + '">BP Sitting: S=' + _sitBPS + 'mmHg | D=' + _sitBPD + 'mmHg | P=' + _sitBPP + 'mmHg BP Standing: S=' + _standBPS + 'mmHg | D=' + _standBPD + 'mmHg | P=' + _standBPP + 'mmHg BP Lying: S=' + _lyingBPS + 'mmHg | D=' + _lyingBPD + 'mmHg | P=' + _lyingBPP + 'mmHg</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBP" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(i);
        i = i + 1;
//        $('#resultMain').val('');
//        $('#pointMain').val('');
        $("#CIS020003").modal('toggle');

    });

    $('#consultationNotes').on('click', '.updateBP', function (e) {
        $("#CIS020003").modal('toggle');
        $('#actionBloodP').hide();
        $('#updateBloodP').show();
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#BPid').val(id[1]);
        $('#sitS').val(updateObj.sitS);
        $('#sitD').val(updateObj.sitD);
        $('#sitP').val(updateObj.sitP);

        $('#standS').val(updateObj.standS);
        $('#standD').val(updateObj.standD);
        $('#standP').val(updateObj.standP);

        $('#lyingS').val(updateObj.lyingS);
        $('#lyingD').val(updateObj.lyingD);
        $('#lyingP').val(updateObj.lyingP);

    });

    $('#updateBloodPBtn').click(function (e) {
        var upObject = _data[$('#BPid').val()];
        var rowId = $('#BPid').val();

        upObject.sitS = $('#sitS').val();
        upObject.sitD = $('#sitD').val();
        upObject.sitP = $('#sitP').val();

        upObject.standS = $('#standS').val();
        upObject.standD = $('#standD').val();
        upObject.standP = $('#standP').val();

        upObject.lyingS = $('#lyingS').val();
        upObject.lyingD = $('#lyingD').val();
        upObject.lyingP = $('#lyingP').val();


        var sum = 'BP Sitting: S=' + upObject.sitS + 'mmHg | D=' + upObject.sitD + 'mmHg | P=' + upObject.sitP + 'mmHg BP Standing: S=' + upObject.standS + 'mmHg | D=' + upObject.standD + 'mmHg | P=' + upObject.standP + 'mmHg BP Lying: S=' + upObject.lyingS + 'mmHg | D=' + upObject.lyingD + 'mmHg | P=' + upObject.lyingP + 'mmHg';
        $('#sum' + rowId).html(sum);
        $("#CIS020003").modal('toggle');
    });


    //--------------------------------------------------------------------------RESPIRATORY RATE MODEL


    $('#acceptRRBtn').click(function (e) {
        e.preventDefault();
        var _rrRate = $('#rrRate').val();

        var items = $('#rrRate');
        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Respiratory Rate :<p class="summary" id="sum' + i + '">Respiratory Rate:' + _rrRate + ' breath/min</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateRR" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020004").modal('toggle');

    });

    $('#consultationNotes').on('click', '.updateRR', function (e) {

        $("#CIS020004").modal('toggle');
        $('#updateRR').show();
        $('#actionRR').hide();


        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#RRid').val(id[1]);
        //console.log(updateObj);
        $('#rrRate').val(updateObj.rrRate);

    });

    $('#updateRRBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#RRid').val()];
        var rowId = $('#RRid').val();

        upObject.rrRate = $('#rrRate').val();

        var sum = 'Respiratory Rate:' + upObject.rrRate + ' breath/min';
        $('#sum' + rowId).html(sum);
        $("#CIS020004").modal('toggle');
    });

    //-------------------------------------------------------------OXYGEN SATURATION MODEL

    $('#acceptOSBtn').click(function (e) {
        var _OSat = $('#OSat').val();

        var items = $('#OSat');
        var obj1 ={Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Oxygen Saturation :<p class="summary" id="sum' + i + '">Oxygen Saturation:' + _OSat + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020005").modal('toggle');
    });

    $('#consultationNotes').on('click', '.updateOS', function () {
        $('#CIS020005').modal('toggle');
        $('#actionOS').hide();
        $('#updateOS').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#idOS').val(id[1]);
        console.log(updateObj);

    });

    $('#updateOSBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#idOS').val()];
        var rowId = $('#idOS').val();

        upObject.OSat = $('#OSat').val();

        var sum = 'Oxygen Saturation:' + upObject.OSat;
        $('#sum' + rowId).html(sum);
        $("#CIS020005").modal('toggle');
    });

    //-----------------------------------------------------------------------------------Body Temperature modal

    $('#acceptBTBtn').click(function (e) {
        var title = "Body Temperature";
        var _BTemp = $('#BTemp').val();

        var items = $('#BTemp');
        var obj1 ={Acode:"VTS"};
        items.each(function () {
            var value = $(this).val().split(" ");
            obj1[this.id] = value[0];
        });
        _data.push(obj1);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">' + title + ' :<p class="summary" id="sum' + i + '">Body Temperature:' + _BTemp + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBT" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020006").modal('toggle');
    });

    $('#consultationNotes').on('click', '.updateBT', function () {
        $('#CIS020006').modal('toggle');
        $('#actionBT').hide();
        $('#updateBT').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#BTid').val(id[1]);
        $("#BTemp").val(updateObj.BTemp + " " + ascii(176) + "C");
        $("#slider").slider("value", parseInt(updateObj.BTemp));

    });

    $('#updateBTBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#BTid').val()];
        var rowId = $('#BTid').val();

        var value = $('#BTemp').val().split(" ");
        upObject.BTemp = value[0];

        var sum = 'Body Temperature:' + upObject.BTemp + ascii(176) + "C";
        $('#sum' + rowId).html(sum);
        $("#CIS020006").modal('toggle');
    });

    //-----------------------------------------------------------------------------------Pan Scale modal

    $('#acceptPSBtn').click(function (e) {
        var title = "Pan Scale";
        var painScale = $('#painScale').val();
        var resultpainScale = $('#resultPanScale').val();

        var items = $('#painScale,#resultPanScale');
        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">' + title + '<p class="summary" id="sum' + i + '">Pan Scale:' + painScale + '| Result:' + resultpainScale + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020007").modal('toggle');
    });

    $('#consultationNotes').on('click', '.updatePS', function () {
        $('#CIS020007').modal('toggle');
        $('#actionPS').hide();
        $('#updatePS').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        console.log(updateObj);

        $('#resultPanScale').val(updateObj.resultPanScale);
        $('#painScale').val(updateObj.painScale);
        $('#PSid').val(id[1]);
    });

    $('#updatePSBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#PSid').val()];
        var rowId = $('#PSid').val();
        upObject.resultPanScale = $('#resultPanScale').val();
        upObject.painScale = $('#painScale').val();

        var sum = 'Pan Scale:' + upObject.painScale + '| Result:' + upObject.resultPanScale;
        $('#sum' + rowId).html(sum);
        $("#CIS020007").modal('toggle');
    });

    //-------------------------------------------------------------------------OTHER MODAL

    $('#acceptOtherBtn').click(function (e) {
        var title = "Other";
        var Oheight = $('#bmiHeight').val();
        var Oweight = $('#bmiWeight').val();
        var Obmi = $('#bmi').val();
        var OWeightStatus = $('#bmiStatus').val();
        var OheadCir = $('#headCir').val();
        var OBloodGlucose = $('#bloodGlucose').val();   

        var items = $('#bmiHeight,#bmiWeight,#bmi,#bmiStatus,#headCir,#bloodGlucose');

        var obj1 = {Acode:"VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">' + title + ' :<p class="summary" id="sum' + i + '">Height:' + Oheight + 'cm | Weight:' + Oweight + 'kg | BMI:' + Obmi + 'kg/m2 | Weight Status:' + OWeightStatus + ' | Head Circumference:' + OheadCir + 'cm | Blood Glucose:' + OBloodGlucose + 'mmol/L</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOther" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020008").modal('toggle');
    });


    $('#consultationNotes').on('click', '.updateOther', function () {

        $('#CIS020008').modal('toggle');
        $('#actionOther').hide();
        $('#updateOther').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        console.log(updateObj);
        $('#otherId').val(id[1]);

        $('#bmiHeight').val(updateObj.bmiHeight);
        $('#bmiWeight').val(updateObj.bmiWeight);
        $('#bmi').val(updateObj.bmi);
        $('#bmiStatus').val(updateObj.bmiStatus);
        $('#headCir').val(updateObj.headCir);
        $('#bloodGlucose').val(updateObj.bloodGlucose);

    });

    $('#updateOtherBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#otherId').val()];
        var rowId = $('#otherId').val();
        upObject.bmiHeight = $('#bmiHeight').val();
        upObject.bmiWeight = $('#bmiWeight').val();
        upObject.bmi = $('#bmi').val();
        upObject.bmiStatus = $('#bmiStatus').val();
        upObject.headCir = $('#headCir').val();
        upObject.bloodGlucose = $('#bloodGlucose').val();

        var sum = 'Height:' + upObject.bmiHeight + 'cm | Weight:' + upObject.bmiWeight + 'kg | BMI:' + upObject.bmi + 'kg/m2 | Weight Status:' + upObject.bmiStatus + ' | Head Circumference:' + upObject.headCir + 'cm | Blood Glucose:' + upObject.bloodGlucose + 'mmol/L';
        $('#sum' + rowId).html(sum);
        $("#CIS020008").modal('toggle');
    });

//--------------------------------------------------------------------------------------------------------PHYSICAL EXAM MODAL

    $('#accpetPEBtn').click(function (e) {
        var title = "Physical Examination";
        e.preventDefault();
        var pe0 = $('#pe0 option:selected').text();
        var pe1 = $('#pe1').val();
        var pe2 = $('#pe2').val();
        var pe3 = $('#pe3').val();
        var pe4 = $('#pe4').val();
        var pe5 = $('#pe5').val();
        var pe6 = $('#pe6').val();
        var pe7 = $('#pe7').val();
        var pe8 = $('#pe8').val();
        var PEComment = $('#PEComment').val();

        //var NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6 + ', ' + pe7 + ', ' + pe8;
       
        if (pe1.length < 1) {
            NotesPE = pe0;
        } else if (pe2.length < 1) {
            NotesPE = pe0 + ', ' + pe1;
        } else if (pe3.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2;
        } else if (pe4.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3;
        } else if (pe5.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4;
        } else if (pe6.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5;
        } else if (pe7.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6;
        } else if (pe8.length < 1) {
            NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6 + ', ' + pe7;
        }

        var itemIDpe = [];
        itemIDpe.push(pitemIDpe0);
        itemIDpe.push(pitemIDpe1);
        itemIDpe.push(pitemIDpe2);
        itemIDpe.push(pitemIDpe3);
        itemIDpe.push(pitemIDpe4);
        itemIDpe.push(pitemIDpe5);
        itemIDpe.push(pitemIDpe6);
        itemIDpe.push(pitemIDpe7);
        itemIDpe.push(pitemIDpe8);
        console.log(pe8.length);
        console.log(itemIDpe);

        var items = $('#pe1,#pe2,#pe3,#pe4,#pe5,#pe6,#pe7,#pe8,#PEComment');

        var obj1 = {Acode:"PEM",pe0: pe0, id: itemIDpe};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        console.log(_data);

        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">' + title + ' :<p class="summary" id="sum' + i + '">Physical Examination:' + NotesPE + ' | Comment:' + PEComment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePE" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#consultationNotes').append(_tr);
        console.log(obj1);
        i = i + 1;
        $("#CIS020009").modal('toggle');
    });

    $('#consultationNotes').on('click', '.updatePE', function () {
        $("#CIS020009").modal('toggle');
        $('#actionPE').hide();
        $('#updatePE').show();


        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        console.log(updateObj);

        updateObjCd = updateObj.id;

        if (updateObj.pe2 === "") {
            $('#pe2').hide();
            $('#pe3').hide();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe3 === "") {
            $('#pe2').show();
            $('#pe3').hide();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe4 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe5 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe6 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe7 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').show();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe8 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').show();
            $('#pe7').show();
            $('#pe8').hide();
        }

        $('#idPE').val(id[1]);
        $('#PEComment').val(updateObj.PEComment);

        $('#pe0').val(updateObjCd[0]);
        $('#pe1').val(updateObj.pe1);
        $('#pe2').val(updateObj.pe2);
        $('#pe3').val(updateObj.pe3);
        $('#pe4').val(updateObj.pe4);
        $('#pe5').val(updateObj.pe5);
        $('#pe6').val(updateObj.pe6);
        $('#pe7').val(updateObj.pe7);
        $('#pe8').val(updateObj.pe8);
        

    });

    $('#modalPE').click(function () {

        $('#actionPE').show();
        $('#updatePE').hide();
        $('#pe1').val('');
        $('#pe0').val('');
        $('#PEComment').val('');
        $('#pe2').hide();
        $('#pe3').hide();
        $('#pe4').hide();
        $('#pe5').hide();
        $('#pe6').hide();
        $('#pe7').hide();
        $('#pe8').hide();

    });
    
    $('#updatePEBtn').click(function (e) {
        e.preventDefault();
        
        var upObject = _data[$('#idPE').val()];
        var rowId = $('#idPE').val();
        console.log(upObject);
        upObject.pe0 = $('#pe0').val();
        upObject.pe1 = $('#pe1').val();
        upObject.pe2 = $('#pe2').val();
        upObject.pe3 = $('#pe3').val();
        upObject.pe4 = $('#pe4').val();
        upObject.pe5 = $('#pe5').val();
        upObject.pe6 = $('#pe6').val();
        upObject.pe7 = $('#pe7').val();
        upObject.pe8 = $('#pe8').val();
        upObject.PEComment = $('#PEComment').val();
        
        var itemIDpe = [];
        
        console.log(upObject);
        
        var NotesPE;
        if (upObject.pe1.length < 1) {
            NotesPE = upObject.pe0;
        } else if (upObject.pe2.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1;
   
            pitemIDpe2="";
            pitemIDpe3="";
            pitemIDpe4="";
            pitemIDpe5="";
            pitemIDpe6="";
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe3.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2;
       
            pitemIDpe3="";
            pitemIDpe4="";
            pitemIDpe5="";
            pitemIDpe6="";
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe4.length < 1) {
            NotesPE = upObject.pe0 + ', ' +upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3;
            
            pitemIDpe4="";
            pitemIDpe5="";
            pitemIDpe6="";
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe5.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4;

            pitemIDpe5="";
            pitemIDpe6="";
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe6.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' +upObject.pe4 + ', ' + upObject.pe5;
                      
            pitemIDpe6="";
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe7.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4 + ', ' + upObject.pe5 + ', ' + upObject.pe6;
               
            pitemIDpe7="";
            pitemIDpe8="";
        } else if (upObject.pe8.length < 1) {
            NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4 + ', ' + upObject.pe5 + ', ' + upObject.pe6 + ', ' + upObject.pe7;

            pitemIDpe8="";
        }
        
        itemIDpe.push(pitemIDpe0);
        itemIDpe.push(pitemIDpe1);
        itemIDpe.push(pitemIDpe2);
        itemIDpe.push(pitemIDpe3);
        itemIDpe.push(pitemIDpe4);
        itemIDpe.push(pitemIDpe5);
        itemIDpe.push(pitemIDpe6);
        itemIDpe.push(pitemIDpe7);
        itemIDpe.push(pitemIDpe8);
        
        upObject.id = itemIDpe;

        var sum = 'PE:'+ NotesPE + ' | Comment:' + upObject.PEComment;  
        $('#sum' + rowId).html(sum);
        $("#CIS020009").modal('toggle');
    });
    
    

    
    $('#RISResult').on('click',function(){

        $.get("CIS02/CIS020010_1.jsp", function (data) {
            //console.log(data);
               $('#risTable').html(data);

        });
    });
    
    $('#LISResult').on('click', function () {

        $.get("CIS02/CIS020011_1.jsp", function (data) {
            //console.log(data);
            $('#lisTable').html(data);

        });
    });
    
      $('#OPResult').on('click', function () {

        $.get("CIS02/CIS020012_1.jsp", function (data) {
            //console.log(data);
            $('#opTable').html(data);

        });
    });




});
   