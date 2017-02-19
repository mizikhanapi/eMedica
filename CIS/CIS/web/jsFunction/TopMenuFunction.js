/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(e){
//    var processNotes;
//    function convertToNotes(data){
//        for(i=0;i<data.length; i++){
//            if (data[i].Acode === "CCN"){
//                processNotes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
//                CCN|2015-01-06  12:01:55|-^Eye swelling^01^Mild^2 Day^^^00^-^00^-^ ^2015-01-06  12:01:55^Active^2015-01-06  12:01:55^Klinik UTeM Induk^02012^EN. MOHSIN BIN KAMARUZAMAN^ICD10^-^Eye swelling^|<cr>
//            }
//        }
//        return processNotes;
//    }
    
    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {
        //lert("discharge Work");
       // console.log(notes);
       var JSONData = JSON.stringify(_data);
       //console.log(JSONData);
        var msh = "MSH|^~|CIS|hfccode^discipline^subdis|CIS|hfccode^discipline^subdis|" + getDate() + "|||||<cr>\n";
        var pdi = "PDI|1233211233219|umar mukhtar^ic number^|<cr>\n"

        notes = msh + pdi + notes;
        //var data_ = _data;
        //console.log(data_);
        //var dataJson = JSON.stringify(data_);
        console.log(_data);
       var SendNotes= convertToNotes(_data);
       console.log(SendNotes);
//        $.ajax({
//            url: "search/RecieveData.jsp",
//            type: "post",
//            data: {
//                data_: data_,
//                dataJson: dataJson,
//                notes: notes,
//                pmino: "1233211233219",
//                episodedate: getDate(),
//                status: '1',
//                JSONData:JSONData
//            },
//            success: function (data) {
//                console.log(data)
////                console.log(data);
////                $('#consultationNotes').html("");
////                notes = "";
//            },
//            error: function (err) {
//                console.log(err)
//                $('#consultationNotes').html("Error: " + err);
//                notes = "";
//            }
//        });
    });
    
    
        //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        alert("It Works Fine...");
    })
})