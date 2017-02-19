function isNumberKey(evt)
{
   var txt = String.fromCharCode(evt.which);
   
    if (txt.match(/^[^0-9]+$/)) {
            return false;
        } else {
            return true;
        }
   
}