
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
    Conn conn = new Conn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    //out.println(dateFormat.format(date));
    String sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where appointment_date like '%" + dateFormat.format(date) + "%' and status ='active' and hfc_cd='"+session.getAttribute("HFC")+"'";
    //out.println(sql);
    
    ArrayList<ArrayList<String>> dataAppointment;
    dataAppointment = conn.getData(sql);
    //out.println(dataAppointment);
%>

<!-- Modal -->
<div class="modal fade" id="appointmentModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Appointment List</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="formAppointmentSaya" method="post">
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
                                    
                            %>
                            <tr>
                                <td><%=dataAppointment.get(i).get(0) %> 
                                <input id="appval" type="hidden" value="<%=StringUtils.join( dataAppointment.get(i),"|")%>"></td>
                                <td><%=dataAppointment.get(i).get(4) %></td>
                                <td><%=dataAppointment.get(i).get(1) %></td>
                                <td><%=dataAppointment.get(i).get(2) %></td>
                                <td><%=dataAppointment.get(i).get(3) %></td>
                                <td><button id="APPedit" name="APPedit" class="btn btn-default" type="button" data-dismiss="modal" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>                                
                            </tr>
                            <% }
                            %>

                        </tbody>
                    </table>





            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
<!--                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>-->
                </div>
                </form>
            </div>
        </div>
    </div>
</div>