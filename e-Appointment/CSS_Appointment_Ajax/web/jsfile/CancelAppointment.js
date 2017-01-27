/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function myFunction(pmiNo, hfcCd, date)
{

    var result = prompt("Canceled Reason :", "");
    if (result !== null)
    {
        if (result !== "")
        {
            var dataDelete = {
                pmiNo: pmiNo,
                hfcCd: hfcCd,
                date: date,
                status: "canceled",
                canceled_by: "<%=username%>",
                canceledReason: result
            };
            $.ajax({
                url: 'cancelAppointment.jsp',
                method: 'post',
                data: dataDelete,
                timeout: 10000,
                success: function (result) {
                    //console.log(result);
                    if (result.trim() === 'success') {
                        alert('the appointment has been canceled');
                        $('#viewAppointmentTable').load('adminAppointmentAjax.jsp #viewAppointmentTable');
                    } else {
                        alert('error appointment not found');
                    }
                }

            });
            //console.log(dataDelete)
           
        } else
        {
            return false;
        }
    } else
    {
        return false;
    }
}