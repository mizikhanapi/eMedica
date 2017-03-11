/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  var processNotes="";
$(document).ready(function(e){
    
    var VTSObj= {};
    var vtsCounter = 0;
    
    function convertVTS(VTSData){
        var d = VTSData;
        var vtsNotes;
        vtsNotes +="VTS|"+ getDate()+"|^"+d.BTemp+"^"+d.sitS+"^"+d.sitD+"^"+d.lyingS+"^"+d.lyingD+"^"+d.standS+"^"+d.standD+"^"+d.bmiWeight+"^"+d.bmiHeight+"^"+d.headCir+"^"+d.rrate+"^"+d.pointMain+"^"+"^^^^^^^^^^"+"hfc_code^doctor_id^doctor_name^"+d.pointMain+"^"+d.resultMain+"^"+d.pointpgcsMain+"^"+d.resultpgcsMain+"^"+d.OSat+"^"+d.painScale+"^"+d.bloodGlucose+"^"+ "|<cr>\n";
        return vtsNotes;
    }
    function countVTS(data){
       // var key = Object.keys(data);
       
       $.each(data, function(index, value ) {
            //console.log( index + ": " + value );
            if(value === undefined){
                console.log("no object");
            } else {
                //console.log("index : "+ index);
                if(data[index].Acode === "VTS"){
                    vtsCounter+=1;
                  }
            }
        });
//         for(var key in data){
//            console.log(data.key);
//                  if(data.key.Acode === "VTS"){
//                    vtsCounter+=1;
//                  }
             
//         }
    }
 
   function convertToNotes(data){
        for(i=0;i<data.length; i++){
           if (data[i].Acode === "CCN"){
                processNotes += "CCN|" + getDate() + "|^" + data[i].ccnCode + "^" + data[i].problem + "^^" + data[i].Mild + "^"+data[i].duration+"^^"+data[i].sdur+"^^^^^"+data[i].Comment+"|<cr>\n";
            } else if(data[i].Acode === "HPI"){
                processNotes +=  "HPI|" + getDate() + "|" +  data[i].details + "^" + getDate() + "^hfc_cd^doctor_id^doctor_name|<cr>\n";
            }  else if(data[i].Acode === "PMH"){
                processNotes +=   "PMH|" + getDate() + "|se001^" + data[i].Problem1 + "^" + getDate() + "|<cr>\n";
            } else if(data[i].Acode === "FMH"){
                processNotes +=   "FMH|" + getDate() + "|^" + data[i].f_relationship + "^" + data[i].Problem3 + "^" + getDate() + "^" + data[i].comment2 + "|<cr>\n";
            } else if(data[i].Acode === "SOH"){
                processNotes += "SOH|" + getDate() + "|^" + "C001|" + "^" + data[i].Problem4 + "^" + "123|" + "^" + "223|" + "^" + "555|" + "^" + "666|" + "^" + "777|" + "^" + data[i].date + "^" + getDate() + "^" + "1|" + "^" + "52" + "^" + data[i].comment3 + "^" + getDate() + "^" + "2|" + "^" + getDate() + "^-^" + "^" + "1252254" + "^" + "B031310504" + "^" + "Ahmed" + "|<cr>\n";
            } else if(data[i].Acode === "BLD"){
                processNotes +=  "BLD|" + getDate() + "^|" +data[i].blood + "^" + data[i].Rhesus_Type + "^" + data[i].G6PD_Status + "|<cr>\n";
            } else if(data[i].Acode === "ALG"){
                processNotes +=   "ALG|" + getDate() + "^|" + "^-^" + "^" + data[i].Problem5 + "^" + data[i].date1 + "^" + data[i].comment5 + "|<cr>\n";
            }  else if(data[i].Acode === "IMU"){
                processNotes +=     "IMU|" + getDate() + "^|" + data[i].probcode + "^" + data[i].Problem6 + "^" +data[i].date2 + "^" + data[i].comment6 + "|<cr>\n";
            } else if(data[i].Acode === "DAB"){
                processNotes +=    "DAB|" + getDate() + "^|" + data[i].dabcode + "^" + data[i].Problem32 + "^" + data[i].date3 + "^" + data[i].termtype + "^" +data[i].icd10code + "^" +data[i].icd10desc + "|<cr>\n";
            } else if(data[i].Acode === "VTS"){
                
                $.extend(VTSObj,data[i]);

            } else  if(data[i] === {}){
                alert('lol');
             } 
            
          
            
            
        }
           processNotes += convertVTS(VTSObj);
        return processNotes;
    }
  
    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {
        //lert("discharge Work");
       // console.log(notes);
       var JSONData = JSON.stringify(_data);
       //console.log(JSONData);
        var msh = "MSH|^~|CIS|hfccode^discipline^subdis|CIS|hfccode^discipline^subdis|" + getDate() + "|||||<cr>\n";
        var pdi = "PDI|1233211233219|umar mukhtar^ic number^|<cr>\n";

        notes = msh + pdi + notes;
        countVTS(_data);
        //var data_ = _data;
        console.log(vtsCounter);
        //var dataJson = JSON.stringify(data_);
        console.log(_data);
       var SendNotes= convertToNotes(_data);
//       console.log(SendNotes);
       console.log(VTSObj);
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
    vtsCounter = 0;
    });
    
    
        //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        alert("It Works Fine...");
    })
})