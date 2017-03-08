<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();

    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String sql = "";
    if (idType.isEmpty() && idInput.isEmpty()) {
        sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where appointment_date like '%" + dateFormat.format(date) + "%' and status ='active' and hfc_cd='" + hfc + "'";

    } else if (idType.equals("pmino")) {
        sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = '" + idInput + "' and status ='active' and hfc_cd='" + hfc + "'";

    } else if (idType.equals("icnew")) {
        sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where new_ic_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";

    } else if (idType.equals("icold")) {
        sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where old_ic_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";

    }else{
        sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where id_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";

    }
    ArrayList<ArrayList<String>> dataAppointment;
    dataAppointment = conn.getData(sql);
    //out.print(hfc);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listAppointment">
    <thead>
    <th>PMI No.</th>
    <th>Name</th>
    <th>Appointment Date</th>
    <th>Appointment Time</th>
    <th>Appointment Type</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < dataAppointment.size(); i++) {
            String dateApp = dataAppointment.get(i).get(1);
            String timeApp = dataAppointment.get(i).get(2);
            String splittedDate = StringUtils.substring(dateApp, 0, 10);
            String splittedTime = StringUtils.substring(dateApp, 10, 21);
    %>
    <tr>
        <td><%=dataAppointment.get(i).get(0)%> 
            <input id="appval" type="hidden" value="<%=StringUtils.join(dataAppointment.get(i), "|")%>"></td>
        <td><%=dataAppointment.get(i).get(4)%></td>
        <td><%=splittedDate %></td>
        <td><%=splittedTime%></td>
        <td><%=dataAppointment.get(i).get(3)%></td>
        <td><button id="APPedit" name="APPedit" class="btn btn-default" type="button" data-dismiss="modal" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>                                
    </tr>
    <% }
    %>

</tbody>
</table>
