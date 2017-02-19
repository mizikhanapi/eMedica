<%-- 
    Document   : queueListModal
    Created on : Feb 8, 2017, 11:00:34 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String user_id = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String queueSql = "select queue_type,queue_name from pms_queue_name where hfc_cd = '" + hfc + "' and discipline_code='"+dis+"';";
    ArrayList<ArrayList<String>> dataQueue = conn.getData(queueSql);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR' and health_facility_code = '" + hfc + "'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable = conn.getData(sqlDoctorAvailable);


%>
<!-- Modal Detail -->
<div class="modal fade" id="list" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Maintain Queue List</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="" id="Lform" >
                    <div class="form-group">
                        <div><label>Queue Name *: </label></div>
                        <select class="form-control" id="QLName">
                            <option selected="true" disabled="true">Please select Queue Name</option>
                            <%                                for (int i = 0; i < dataQueue.size(); i++) {%>
                            <option value="<%=dataQueue.get(i).get(0) + "|" + dataQueue.get(i).get(1)%>"><%="("+dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1)%></option>  
                            <%   }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <div><label>Staff *: </label></div>
                        <select class="form-control" id="QLStaff">
                            <option selected="true" disabled="true">Select Staff to be assigned</option>
                            <%
                                for (int i = 0; i < dataDoctorAvailable.size(); i++) {%>
                                <option value="<%=dataDoctorAvailable.get(i).get(0)%>"><%="(" + dataDoctorAvailable.get(i).get(0) + ") " + dataDoctorAvailable.get(i).get(1)%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <!--                    <div class="form-group">
                                            <div><label>Health Facility : </label></div>
                                            <input type="text" class="form-control" placeholder="Health Facility">
                                        </div>
                                        <div class="form-group">
                                            <div><label>Discipline : </label></div>
                                            <input type="text" class="form-control" placeholder="Discipline">
                                        </div>
                                        <div class="form-group">
                                            <div><label>Sub-Discipline : </label></div>
                                            <input type="text" class="form-control" placeholder="Sub-Discipline">
                                        </div>-->
                    <div class="form-group">
                        <div><label>Start date : </label></div>
                        <input type="text" id="startDate" class="form-control" placeholder="YYYY-MM-DD">
                    </div>
                    <div class="form-group">
                        <div><label>End date : </label></div>
                        <input type="text" id="endDate" class="form-control" placeholder="YYYY-MM-DD">
                    </div>
                    <div class="form-group">
                        <div><label>Status : </label></div>
                        <select class="form-control" id="QLStatus">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button  id="saveList" class="btn btn-primary btn-block btn-lg" role="button" data-dismiss="modal">Save</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button  id="delList" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button" >Delete</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<script>
    $(document).ready(function(){
       $(function(){
            $('#startDate').datepicker({dateFormat:'yy-mm-dd',changeMonth:true,changeYear:true});
            $('#endDate').datepicker({dateFormat:'yy-mm-dd',changeMonth:true,changeYear:true});
        }); 
    });
    
    //function to save or update the queue name
    $('#saveList').on('click', function () {
        var staff = $('#QLStaff').val();
        var name = $('#QLName').val();
        var createdBy = "<%=user_id%>";
        var hfc = "<%=hfc%>";
        var stat = $('#QLStatus').val();
        var dis = "<%=dis%>";
        var sub = "<%=sub%>";
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        //console.log(staff);
//        $('#QLStaff option:not(:selected)').prop('disabled', false);
//        $('#QLName option:not(:selected)').prop('disabled', false);
//        $('#Lform')[0].reset();
        if (name === null) {
            bootbox.alert("Please Fill in the name input");
        }else if(startDate === "" || endDate===""){
            bootbox.alert("Please Fill in the date input");
        } else {
            //var B2 = $('#QName').val();
            //
            var array_data2;
            array_data2 = name.split("|");
            //var desc = $('#QnameDes').val();
            var ty = array_data2[0];
            var nm = array_data2[1];
            
            //console.log("userid when updated" + uid);
            //var quota = $('#typeQuota').val();

            var data = {ty : ty,
                nm : nm,
                staff : staff,
                startDate : startDate,
                endDate : endDate,
                hfc : hfc,
                dis : dis,
                sub : sub,
                stat : stat,
                createdBy : createdBy
            };
            //console.log(ty + " -|- " + nm);
            //console.log(data);
            $.ajax({
                type: "post",
                url: "saveQueueList.jsp",
                data: data,
                timeout: 3000,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    bootbox.alert("Queue List successfully been saved",function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('queueTypeModal.jsp');
                        $('#modal2').load('queueNameModal.jsp');
                        $('#modal3').load('queueListModal.jsp');
                    });
                    $.ajax({
                        type: "post",
                        url: "listQueueList.jsp",
                        data: {hfc : hfc},
                        timeout: 3000,
                        success: function (returnHtml) {
                            //console.log(returnHtml);
                            $('#QLdiv').html(returnHtml);

                        }, error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR: " + errorThrown);
                        }
                    });
                }, error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }




    });

    $('#delList').on('click', function () {

        //var code = $('#Qtype').val();
        //var name = $('#QnameCode').val();
        var hfc = "<%=hfc%>";
        var staff = $('#QLStaff').val();
        var name = $('#QLName').val();
        var array_data2;
            array_data2 = name.split("|");
            //var desc = $('#QnameDes').val();
            var ty = array_data2[0];
            var nm = array_data2[1];
        $.ajax({
            type: "post",
            url: "delQueueList.jsp",
            data: {"cd": ty, "name": nm, "hfc": hfc, "staff" : staff},
            timeout: 3000,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                bootbox.alert("Queue List successfully been deleted",function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('queueTypeModal.jsp');
                        $('#modal2').load('queueNameModal.jsp');
                        $('#modal3').load('queueListModal.jsp');
                    });
                $.ajax({
                    type: "post",
                    url: "listQueueList.jsp",
                    timeout: 3000,
                    data: {hfc : hfc},
                    success: function (returnHtml) {
                        //console.log(returnHtml);
                        $('#QLdiv').html(returnHtml);

                    }, error: function (jqXHR, textStatus, errorThrown) {

                        console.log("ERROR: " + errorThrown);
                    }
                });
            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    });
</script>