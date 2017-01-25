/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function passwordValidationNew(password){
    var message = "approve";
    if(password.length <6){
        message = "short";
        return message;
    }
    re = /[0-9]/
    if(!re.test(password)){
        message="nonumber";
        return message;
    }
    re = /[a-z]/;
    if (!re.test(password))
    {
        message="nolower";
        return message;
    }
    re = /[A-Z]/;
    if (!re.test(password))
    {
        message="noupper";
        return message;
    }
    re = /\W/;
    if (!re.test(password))
    {
        message="nospecial";
        return message;
    }
    return message;
}

function AllowAlphabet(username){
   var message;
    if(!username.match(/^[a-zA-Z]+$/)&& username !=""){
        message = "alphabetonly";
        
    }
    else{
        message="approve";
    }
    return message;
}

function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}