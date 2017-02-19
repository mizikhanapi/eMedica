<%-- 
    Document   : queueNameModal
    Created on : Feb 8, 2017, 11:00:01 AM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    Conn conn = new Conn();
    String typeCode = "select queue_type,queue_type_name from pms_queue_type where status = 'Active' and hfc_cd = '"+hfc+"' and discipline_code ='"+dis+"'";
    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_user "
            + "WHERE OCCUPATION_CODE = 'DOCTOR' and health_facility_code = '"+hfc+"'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
    ArrayList<ArrayList<String>> dataDoctorAvailable;
    ArrayList<ArrayList<String>> dataTypeCode;
    dataTypeCode = conn.getData(typeCode);
    dataDoctorAvailable = conn.getData(sqlDoctorAvailable);
    //out.print(dataDoctorAvailable);
//    out.print(sqlDoctorAvailable);
%>
<!-- Modal Name -->
<div class="modal fade" id="names" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Maintain Queue Name</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="" id="Nform">
                    <div>
                        <div><label>Queue Type Code *: </label></div>
                        <div class="form-group">
                            <select class="form-control" id="Qtype">
                                <option selected="" disabled="">Please select Queue Type Code</option>
                                <%
                                    for (int i = 0; i < dataTypeCode.size(); i++) {%>
                                <option value="<%=dataTypeCode.get(i).get(0)%>"><%="(" + dataTypeCode.get(i).get(0) + ") " + dataTypeCode.get(i).get(1)%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div><label>Queue Name Code *: </label></div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Queue Name Code" maxlength="200" id="QnameCode">
                        </div>
                    </div>
                    <div>
                        <div><label>Staff(Optional): </label></div>
                        <div class="form-group">
                            <select class="form-control" id="QName">
                                <option selected="" disabled="">Select staff (Optional)</option>
                                <%
                                    for (int i = 0; i < dataDoctorAvailable.size(); i++) {%>
                                <option value="<%=dataDoctorAvailable.get(i).get(0) + "|" + dataDoctorAvailable.get(i).get(1)%>"><%="(" + dataDoctorAvailable.get(i).get(0) + ") " + dataDoctorAvailable.get(i).get(1)%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>  
                    <div>
                        <div><label>Description: </label></div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Description" maxlength="200" id="QnameDes">
                        </div>
                    </div>
                    <div>
                        <div><label>Quota*: </label></div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Quota" width="50%" id="typeQuota" maxlength="7">
                        </div>
                    </div>


                    <div>
                        <div><label>Status: </label></div>
                        <div class="form-group">
                            <select class="form-control" id="status">
                                <option selected="" disabled="">Please select status</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>  


            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button id="saveName" class="btn btn-primary btn-block btn-lg" role="button"  data-dismiss="modal">Save</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button  id="delName" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button" data-dismiss="modal">Delete</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<script>
    var type;
    var userId;

    //function splitting the array from select box
    $('#QName').change(function () {
        var B = $('#QName').val();
        //console.log(B);
        var array_data;
        array_data = B.split("|");
        if (type === "PN") {
            $('#QnameCode').val(array_data[1]);

        } else {

        }
        userId = array_data[0];
        //console.log(userId);
    });

    //function to filter the character
    $('#typeQuota').on('keypress', function (evt) {
        var txt = String.fromCharCode(evt.which);

        //var iNum = parseInt(charCode);
        //console.log(txt);
        if (txt.match(/^[^0-9]+$/)) {
            return false;
        } else {
            return true;
        }
    });

    //function when the type is changed
    $('#Qtype').on('change', function () {
        $('#QnameCode').val("");
        var A = $('#Qtype').val();
        type = A;
    });

    //function to save or update the queue name
    $('#saveName').on('click', function () {
        var code = $('#Qtype').val();
        var name = $('#QnameCode').val();
        var createdBy = "<%=user_id%>";
        var hfc = "<%=hfc%>";
        var stat = $('#status').val();
         var dis= "<%=dis%>";
        var sub= "<%=sub%>";

        if (code === "" || name === "") {
            bootbox.alert("Please Fill in the Compulsory input");
        } else {
            var B2 = $('#QName').val();
            //
            var array_data2;
            array_data2 = B2.split("|");


            var desc = $('#QnameDes').val();
            var uid = array_data2[0];
            console.log("userid when updated" + uid);
            var quota = $('#typeQuota').val();

            var data = {cd: code,
                desc: desc,
                name: name,
                uid: uid,
                quota: quota,
                createdBy: createdBy,
                hfc : hfc,
                status : stat,
                dis : dis,
                sub : sub
            };
            $.ajax({
                type: "post",
                url: "saveQueueName.jsp",
                data: data,
                timeout: 3000,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    bootbox.alert("Queue Name successfully been saved",function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('queueTypeModal.jsp');
                        $('#modal2').load('queueNameModal.jsp');
                        $('#modal3').load('queueListModal.jsp');
                    });
                    //load new table
                    $.ajax({
                        type: "post",
                        url: "listQueueName.jsp",
                        timeout: 3000,
                        success: function (returnHtml) {
                            //console.log(returnHtml);
                            $('#QNdiv').html(returnHtml);

                        }, error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR: " + errorThrown);
                        }
                    });
                    //refresh new list queue table
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

    $('#delName').on('click', function () {

        var code = $('#Qtype').val();
        var name = $('#QnameCode').val();
        var hfc = "<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>";
        $.ajax({
            type: "post",
            url: "delQueueName.jsp",
            data: {"cd": code, "name": name,"hfc" : hfc},
            timeout: 3000,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                bootbox.alert("Queue Name successfully been deleted",function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('queueTypeModal.jsp');
                        $('#modal2').load('queueNameModal.jsp');
                        $('#modal3').load('queueListModal.jsp');
                    });
                $.ajax({
                    type: "post",
                    url: "listQueueName.jsp",
                    timeout: 3000,
                    success: function (returnHtml) {
                        //console.log(returnHtml);
                        $('#QNdiv').html(returnHtml);

                    }, error: function (jqXHR, textStatus, errorThrown) {

                        console.log("ERROR: " + errorThrown);
                    }
                });
            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    });
</script>