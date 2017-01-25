function passwordValidation()
  {
        if(frm.password.value.length < 6) 
        {
          alert("Error: Password must contain at least six characters and at most ten character!");
          frm.password.focus();
          return false;
        }
        re = /[0-9]/;
        if(!re.test(frm.password.value)) 
        {
          alert("Error: password must contain at least one number (0-9)!");
          frm.password.focus();
          return false;
        }
        re = /[a-z]/;
        if(!re.test(frm.password.value)) 
        {
          alert("Error: password must contain at least one lowercase letter (a-z)!");
          frm.password.focus();
          return false;
        }
        re = /[A-Z]/;
        if(!re.test(frm.password.value)) 
        {
          alert("Error: password must contain at least one uppercase letter (A-Z)!");
          frm.password.focus();
          return false;
        }
        re = /\W/;
        if(!re.test(frm.password.value)) 
        {
          alert("Error: password must contain at least one special character!");
          frm.password.focus();
          return false;
        }
  }  

//
//function passwordValidation()
//{
//    if (frm.password.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}$/) && frm.password.value !="")
//    {
//        frm.password.value="";
//        frm.password.focus();
//        alert("Please Enter only alphabets in text with 10 character");
//    }
//}

