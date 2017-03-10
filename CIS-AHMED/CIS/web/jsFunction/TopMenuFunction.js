/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var processNotes = "";

$(document).ready(function (e) {

    var VTSObj = {};
    var vtsCounter = 0;

    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {

       var pmiNo = $('#pmiNumber').text();
       var c = confirm("Are you sure you want discharge this patient?");       
       
       if(c === true){
           storeData(1);
       } else {
           alert('Discharge Cancel');
       }
    });

    //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        var c = confirm("Are you sure you want ON HOLD this patient?");
        var pmiNo = $('#pmiNumber').text();
        if (c === true) {
            getPDI(pmiNo);
            storeData(2);
        } else {
            alert('ON HOLD Cancel');
        }
  
    
});



   function convertVTS(VTSData) {

        var d = VTSData;

        if (d.BTemp === undefined) {
            d.BTemp = "";
        }
        if (d.sitS === undefined) {
            d.sitS = "";
        }
        if (d.sitD === undefined) {
            d.sitD = "";
        }
        if (d.lyingS === undefined) {
            d.lyingS = "";
        }
        if (d.lyingD === undefined) {
            d.lyingD = "";
        }
        if (d.standS === undefined) {
            d.standS = "";
        }
        if (d.standD === undefined) {
            d.standD = "";
        }
        if (d.bmiWeight === undefined) {
            d.bmiWeight = "";
        }
        if (d.bmiHeight === undefined) {
            d.bmiHeight = "";
        }
        if (d.headCir === undefined) {
            d.headCir = "";
        }
        if (d.rrate === undefined) {
            d.rrate = "";
        }
        if (d.headCir === undefined) {
            d.headCir = "";
        }
        if (d.pointMain === undefined) {
            d.pointMain = "";
        }
        if (d.resultMain === undefined) {
            d.resultMain = "";
        }
        if (d.pointpgcsMain === undefined) {
            d.pointpgcsMain = "";
        }
        if (d.resultpgcsMain === undefined) {
            d.resultpgcsMain = "";
        }
        if (d.OSat === undefined) {
            d.OSat = "";
        }
        if (d.painScale === undefined) {
            d.painScale = "";
        }
        if (d.bloodGlucose === undefined) {
            d.bloodGlucose = "";
        }

        var vtsNotes = "";
        vtsNotes += "VTS|" + getDate() + "|^" + d.BTemp + "^" + d.sitS + "^" + d.sitD + "^" + d.lyingS + "^" + d.lyingD + "^" + d.standS + "^" + d.standD + "^" + d.bmiWeight + "^" + d.bmiHeight + "^" + d.headCir + "^" + d.rrate + "^" + d.pointMain + "^" + "^^^^^^^^^^" + "hfc_code^doctor_id^doctor_name^" + d.pointMain + "^" + d.resultMain + "^" + d.pointpgcsMain + "^" + d.resultpgcsMain + "^" + d.OSat + "^" + d.painScale + "^" + d.bloodGlucose + "^" + "|<cr>\n";
        return vtsNotes;
    }
    
    function countVTS(data) {
        $.each(data, function (index, value) {
            if (value === undefined) {
                console.log("no object");
            } else {

                if (data[index].Acode === "VTS") {
                    vtsCounter += 1;
                }
            }
        });
    }
    
    function convertPEM(PEMData) {

        var PECodes = PEMData.id;
        var PECounter = 0;
        var PECd = "";

        for (var i = 0; i < PECodes.length; i++) {
            if (PECodes[i] !== "") {
                PECd = PECodes[i];
            } else if (PECodes[i] === "") {
                console.log(PECd);
            }
        }

        var Comment = PEMData.PEComment;
        PEMNotes = "PEM|2015-01-16  16:27:58|^^" + PECd + "^" + NotesPE + "^^" + Comment + "^^^2015-01-16  16:27:58^^2015-01-16  16:27:58^Klinik UTeM Induk^02278^DR SHAHANEEN BINTI JOHARI^|<cr>\n";

        return PEMNotes;
    }

    function convertToNotes(data) {
        for (var key in data) {
            if (data[key].Acode === "CCN") {
                processNotes += "CCN|" + getDate() + "|^" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration + "^^" + data[key].sdur + "^^^^^" + data[key].Comment + "|<cr>\n";          
            } else if (data[key].Acode === "HPI") {
                processNotes += "HPI|" + getDate() + "|" + data[key].details + "^" + getDate() + "^hfc_cd^doctor_id^doctor_name|<cr>\n";
            } else if (data[key].Acode === "PMH") {
                processNotes += "PMH|" + getDate() + "|se001^" + data[key].Problem1 + "^" + getDate() + "|<cr>\n";
            } else if (data[key].Acode === "FMH") {
                processNotes += "FMH|" + getDate() + "|^" + data[key].f_relationship + "^" + data[key].Problem3 + "^" + getDate() + "^" + data[key].comment2 + "|<cr>\n";
            } else if (data[key].Acode === "SOH") {
                processNotes += "SOH|" + getDate() + "|^" + "C001|" + "^" + data[key].Problem4 + "^" + "123|" + "^" + "223|" + "^" + "555|" + "^" + "666|" + "^" + "777|" + "^" + data[key].date + "^" + getDate() + "^" + "1|" + "^" + "52" + "^" + data[key].comment3 + "^" + getDate() + "^" + "2|" + "^" + getDate() + "^-^" + "^" + "1252254" + "^" + "B031310504" + "^" + "Ahmed" + "|<cr>\n";
            } else if (data[key].Acode === "BLD") {
                processNotes += "BLD|" + getDate() + "^|" + data[key].blood + "^" + data[key].Rhesus_Type + "^" + data[key].G6PD_Status + "|<cr>\n";
            } else if (data[key].Acode === "ALG") {
                processNotes += "ALG|" + getDate() + "^|" + "^-^" + "^" + data[key].Problem5 + "^" + data[key].date1 + "^" + data[key].comment5 + "|<cr>\n";
            } else if (data[key].Acode === "IMU") {
                processNotes += "IMU|" + getDate() + "^|" + data[key].probcode + "^" + data[key].Problem6 + "^" + data[key].date2 + "^" + data[key].comment6 + "|<cr>\n";
            } else if (data[key].Acode === "DAB") {
                processNotes += "DAB|" + getDate() + "^|" + data[key].dabcode + "^" + data[key].Problem32 + "^" + data[key].date3 + "^" + data[key].termtype + "^" + data[key].icd10code + "^" + data[key].icd10desc + "|<cr>\n";
            } else if (data[key].Acode === "VTS") {
                $.extend(VTSObj, data[key]);
            } else if (data[key].Acode === "PEM") {
                var peFnote = convertPEM(data[key]);
                processNotes += peFnote;
            }

        }
        var VTSNotes = convertVTS(VTSObj);
        processNotes +=VTSNotes;
        console.log(HCSContent);

        return processNotes;
    }

    function clearCIS() {
      location.href = './CIS000000.jsp';
    }
    
    function storeData(status){
        
        var statusDesc = "";
        
        if(status === "2"){
            statusDesc = "Oh Hold";
        } else if(status === "1"){
            statusDesc = "Discharge";
        } else if(status === "0"){
            statusDesc = "Waiting";
        } else if(status === "4"){
            statusDesc = "Missing";
        } 
       
        var msh = "MSH|^~|CIS|hfccode^discipline^subdis|CIS|hfccode^discipline^subdis|" + getDate() + "|||||<cr>\n";
        var pdi = PDIInfo+"|<cr>\n";
        
        countVTS(_data);

        //console.log(vtsCounter);
        vtsCounter = 0;

        //console.log(_data);
        var SendNotes = convertToNotes(_data);
           
           notes = msh + pdi + SendNotes;
           console.log(notes);

        $.ajax({
            url: "topMenuFunction/discharge.jsp",
            type: "post",
            data: {
                notes: notes,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: status,              
            },
            success: function (data) {
               
                var d = data.trim();
                 console.log(data);
                if(d === '|1|'){
                    // $('#consultationNotes').html("");
                    clearCIS();
                    alert('Patient has been '+statusDesc);
                }
            },
            error: function (err) {
                console.log(err)
                $('#consultationNotes').html("Error: " + err);
                notes = "";
            }
        });
    }
    
 });