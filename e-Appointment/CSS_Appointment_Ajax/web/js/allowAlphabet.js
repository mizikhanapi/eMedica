function AllowAlphabet()
{
    if (!frm.username.value.match(/^[a-zA-Z]+$/) && frm.username.value !="")
    {
        frm.username.value="";
        frm.username.focus();
        alert("Please Enter only alphabets in text with 10 character");
    }
}

