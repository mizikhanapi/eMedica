<%-- 
    Document   : sendReminder
    Created on : May 30, 2016, 10:45:03 AM
    Author     : Asyraf
--%>

<%@page import="org.joda.time.DateTime"%>
<%@page import="main.SMSService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<html>
<%@include file="header.jsp"%>

<%
    Conn Conn = new Conn();
//    response.addHeader("Access-Control-Allow-Origin", "*");
//    if ("OPTIONS".equalsIgnoreCase(request.getMethod())) 
//    {
//        response.addHeader("Access-Control-Allow-Credentials", "true");
//    }
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    
    String hfcCode = "SELECT Detail_Ref_code "
            + "FROM lookup_detail "
            + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataHFC = Conn.getData(hfcCode);  

    String hfcCD;
    if(dataHFC.size() > 0)
    {
        hfcCD = dataHFC.get(0).get(0);
    }
    else
    {
        hfcCD = null;
    }
    
    String pmi_no = null;
    String hfc_cd = null;
    String patientName = null;
    String phone_no = null;
    String email = null;
    String messageSMS = null;
    String messageEmail = null;
    String appDate = null;
    String startTime = null;
    
    String sql = "SELECT w.*,ld.Description AS state_name "
            + "FROM lookup_detail ld, "
            + "(SELECT t.* "
            + "FROM "
            + "(SELECT pa.pmi_no, pa.hfc_cd, DATE(pa.appointment_date) AS appDate, TIME(pa.start_time) AS start_time, "
            + "pb.MOBILE_PHONE, DATEDIFF(pa.appointment_date, NOW()) as DiffDate, pb.PATIENT_NAME, pb.EMAIL_ADDRESS "
            + "FROM pms_appointment pa, pms_patient_biodata pb "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.status = 'active' AND remarks = 'pending' AND (DATEDIFF(pa.appointment_date, NOW())>1 ))t "
            + "WHERE t.DiffDate<3)w "
            + "WHERE w.hfc_cd = ld.Detail_Ref_code AND ld.Master_Ref_code = '0081'  AND w.hfc_cd= '"+hfcCD+"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql); 
//    out.print(data.size());
    
    if(data.size() > 0)
    {
        boolean status=false;
        
        for(int i = 0; i < data.size(); i++)
        {
            pmi_no = data.get(i).get(0);
            email = data.get(i).get(7);
            patientName = data.get(i).get(6);
            appDate = data.get(i).get(2);
            startTime = data.get(i).get(3);
            phone_no = data.get(i).get(4);
            hfc_cd = data.get(i).get(8);
            String phone = "+6" + phone_no;
            
            
            Date today = new Date();
            String expectedPattern = "yyyy-MM-dd";
            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
            String appDateFromDB = data.get(i).get(2);
            Date dateFromDB = formatter.parse(appDateFromDB);
                                    
            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
            String appointmentDate = DATE_FORMAT.format(dateFromDB);
            

            
            messageEmail = "Hello "+patientName+"\\nThis is MOH customer service. \\nYou will have an appointment on below details : \\nYour Clinic/Hospital : "+ hfc_cd +" "
                    + "\\nYour Appointment Date : "+ appointmentDate +" \\nYour Appointment Time : "+ startTime;
            
            messageSMS = "Hello "+patientName+"\nThis is MOH customer service. \nYou will have an appointment on below details : \nYour Clinic/Hospital : "+ hfc_cd +" "
                    + "\nYour Appointment Date : "+ appointmentDate +" \nYour Appointment Time : "+ startTime;
            
//            SMSService smss = new SMSService(phone, messageSMS, Conn.HOST);


            %><script language='javascript'>
                var json = "{\"email\":\"<%=email%>\", \"subject\":\"Appointment Reminder\", \"message\":\"<%=messageEmail%>\"}";
                $(document).ready(function () 
                {
                    $.get("http://tuffah.info/biocore/", {
//                        $.get("http://10.73.32.200/Testing/Servlet", {
                        password: "B10core",
                        to: "<%=email%>",
                        subject: "Appointment Reminder",
                        message: "<%=messageEmail%>"
                    }).done(function (data) {
//                        $("#papar1").html("Reminder has been sent:- <br />"+data);
                        
                        <%
                        RMIConnector rmic = new RMIConnector();
                        String sqlInsert = "UPDATE pms_appointment "
                                + "SET remarks='delivered' "
                                + "WHERE pmi_no='" + pmi_no + "' AND hfc_cd='" + hfcCD + "' AND DATE(appointment_date) = '"+appDate+"'";

                         status = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                        %>////
//////                
//                        alert('Reminder has been sent'); 
//                        window.location= 'adminAppointment.jsp';
                    });
//                    $("#papar1").html("Sending ...");
                });
//                var arr = "{\"email\":\"<%=email%>\", \"subject\":\"Appointment Reminder\", \"message\":\"<%=messageEmail%>\"}";
//                $.ajax({
////                   url: 'http://10.73.32.200/Testing/Servlet', 
//                   url: 'updateDeliveredReminder.jsp', 
//                   type: 'POST',
//                   data:{email:<%=email%>,
//                         subject:"Appointment Reminder",
//                         message:<%=messageEmail%>},
//                   contentType: 'application/json charset=utf-8',
//                   dataType: 'json',
//                   async: false,
//                   success: function(msg)
//                   {
//                       alert(msg);
//                   }
//                });
            </script> <%
        }

        %>
        
        <script>
            alert("The reminder has been sent");
//            window.location='adminAppointment.jsp';
        </script>    
        <%

    }
    else
    {
        %><script language='javascript'>
//            alert('There is no reminder to be delivered'); 
//             window.location= 'adminAppointment.jsp';
        </script> <%
    }
    
%>

<body>
    <div class="container-fluid">
        <div class="row">
<!--            <div class="col-md-12 col-sm-12 col-xs-12 col_image" >
                <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" id="UTeMImage">
            </div>
            <div class="col-md-12 col-sm-6 col-xs-6" style="background-color: #595959" id="left_column"  >
            <h3><em>e-Appointment</em></h3>
            </div>
        </div> -->

        <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 bodyContentReminder" style="background-color: #e6ffe6">

        <%
            String sqlReminder = "SELECT w.*,ld.Description AS state_name "
                + "FROM lookup_detail ld, "
                + "(SELECT t.* "
                + "FROM "
                + "(SELECT pa.pmi_no, pa.hfc_cd, DATE(pa.appointment_date) AS appDate, TIME(pa.start_time) AS start_time, "
                + "pb.MOBILE_PHONE, DATEDIFF(pa.appointment_date, NOW()) as DiffDate, LCASE(pb.PATIENT_NAME), pb.EMAIL_ADDRESS "
                + "FROM pms_appointment pa, pms_patient_biodata pb "
                + "WHERE pa.pmi_no = pb.PMI_NO AND pa.status = 'active' AND remarks = 'delivered' AND (DATEDIFF(pa.appointment_date, NOW())>1 ))t "
                + "WHERE t.DiffDate<3)w "
                + "WHERE w.hfc_cd = ld.Detail_Ref_code AND ld.Master_Ref_code = '0081'  AND w.hfc_cd= '"+hfcCD+"'";
            ArrayList<ArrayList<String>> dataReminder = Conn.getData(sqlReminder);
            

DateTime dt = DateTime.now();
String todaysDate =(String) dt.toString("dd/MM/yyyy");



%>

        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-9">
                <span style="font-size: 16"><b>List of patient appointment that has been sent a reminder</b></span> <br><br>
                <span style="color: red">**The reminder was sent 3 days before the appointment day</span><br><br>
            </div>
            <div class="col-md-2 col-md-offset-4 col-sm-2 col-sm-offset-4 col-xs-3">
                <button class="btn btn-xs" onclick="window.location.href = 'adminAppointment.jsp'">Main Page</button>
            </div>
        </div> 
            Today's Date : <%out.print(todaysDate);%>
            <div class="table-responsive" style="margin-top: 2%">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>PMI No</center></th>
                            <th><center>Patient Name</center></th>
                            <th><center>Appointment Date</center></th>
                            <th><center>Start Time</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataReminder.size() > 0) 
                            {
                                for (int i = 0; i < dataReminder.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String dateFromDB = dataReminder.get(i).get(2);
                                    Date dateDB = formatter.parse(dateFromDB);

                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = DATE_FORMAT.format(dateDB);

                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDB);
                                    //out.print(newDate);

                                        %>
                                        <tr><td><center><%out.print(i+1);%></center></td>
                                            <td><center><%=dataReminder.get(i).get(0)%></center></td>
                                            <td><center><%=dataReminder.get(i).get(6)%></center></td>
                                            <td><center><%=date%></center></td>
                                            <td><center><%=dataReminder.get(i).get(3)%></center></td>
                                        </tr>
                                    <%
    //                            
                                }
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
     </div>
    </div>
</body>
</html>