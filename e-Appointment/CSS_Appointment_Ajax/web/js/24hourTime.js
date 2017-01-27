function ConvertTimeformat(format, str) {
    var time = str;
    var hours = Number(time.match(/^(\d+)/)[1]);
    var minutes = Number(time.match(/:(\d+)/)[1]);
    var AMPM = time.match(/\s(.*)$/)[1];
    if (AMPM == "PM" && hours < 12) hours = hours + 12;
    if (AMPM == "AM" && hours == 12) hours = hours - 12;
    var sHours = hours.toString();
    var sMinutes = minutes.toString();
    if (hours < 10) sHours = "0" + sHours;
    if (minutes < 10) sMinutes = "0" + sMinutes;
    var cTime = sHours + ":" + sMinutes;
    return cTime;
}

function ConvertTimeformat12(format, str) {
    var time = str;
    var timeformat;
    var hour;
    
    var time = time.split(':');
    if(time[0]<12){
        timeformat = 'AM';
        hour = time[0];
    } else if(time[0]>=12){
        timeformat = 'PM';
        hour = time[0]-12;
    }
    
    var convertedTime = hour+":"+time[1]+" "+timeformat;
    return convertedTime;

}

function changeDateFormat(date){
    var newDate = date.split('/');
     newDate = newDate[2]+'-'+newDate[1]+'-'+newDate[0];
     return newDate;
}