<%@page import="dBConn.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
    <div id="header"></div>
    <!-- header -->
</head>

<body>
    <!-- menu top -->
    <div id="topMenus"></div>
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row">
            <%
                Conn conn = new Conn();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String now = sdf.format(new Date());
                String hfc = session.getAttribute("HFC").toString();
                String sql = "SELECT e.PMI_NO,e.NAME,EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE e.EPISODE_DATE LIKE '%" + now + "%' AND e.STATUS NOT LIKE 'Discharge' AND q.PMI_NO=e.PMI_NO";
                String newSql = "SELECT e.PMI_NO,e.name,e.EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE (e.STATUS NOT LIKE 'Discharge') AND ((e.EPISODE_DATE LIKE '%" + now + "%') AND  (q.PMI_NO=e.PMI_NO) AND e.HEALTH_FACILITY_CODE='" + hfc + "' AND e.EPISODE_DATE=q.episode_date)";
                String newnewSql = "select e.pmi_no,e.name,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e,pms_patient_queue q where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.PMI_NO = q.pmi_no and e.EPISODE_DATE = q.episode_date";
                String newnewnewsql ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "'";
                ArrayList<ArrayList<String>> dataQueue;
                dataQueue = conn.getData(newnewnewsql);
                //out.print(dataQueue.toString());
                //out.print(newnewSql);
            %>
            <!-- menu side -->		
            <div id="sideMenus"></div>
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Patient Queue List </a>
                                        </li>
                                        <!--									<li>
                                                                                                                        <a href="#tab_default_2" data-toggle="tab">
                                                                                                                        Maintain Queue Name </a>
                                                                                                                </li>
                                                                                                                <li>
                                                                                                                        <a href="#tab_default_3" data-toggle="tab">
                                                                                                                        Maintain Queue List </a>
                                                                                                                </li>-->
                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">
                                            <h4>Patient Queue List
                                                <!--											<span class="pull-right">
                                                                                                                                                <a href="#" alt="Add Items" data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-plus" style=" padding-right: 5px;"></i></a>
                                                                                                                                        </span>-->
                                            </h4>
                                            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; ">
                                                <thead>
                                                <th>PMI no. </th>
                                                <th>Name </th>
                                                <th>Episode Date </th>
                                                <th>Episode Time </th>
                                                <th>Queue Name </th>
                                                <th>Queue no.</th>
                                                <th>Doctor </th>
                                                <th>Status</th>
                                                <th>Action </th>

                                                </thead>
                                                <tbody>

                                                   
                                                    <%
                                                                                                                            for (int i = 0; i < dataQueue.size(); i++) {%>
                                                    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
                                                        <td id="pmiNumber"><%=dataQueue.get(i).get(0)%></td>
                                                        <td><%=dataQueue.get(i).get(1)%></td>
                                                        <td id="epiDate"><%=dataQueue.get(i).get(2)%></td>
                                                        <td id="epiTime"><%=dataQueue.get(i).get(3)%></td>
                                                        <td ><%=dataQueue.get(i).get(4)%></td>
                                                        <td><%=dataQueue.get(i).get(5)%></td>
                                                        <td><%=dataQueue.get(i).get(6)%></td>
                                                        <td><%=dataQueue.get(i).get(7)%></td>
                                                        <td><button class="btn btn-danger" >Delete</button></td>
                                                    </tr>    
                                                    <%    }
                                                    %>

                                                </tbody>
                                            </table>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu -->

                        </div>
                    </div>
                </div>





            </div>

        </div>
        <!-- main -->		

    </div>
</div>





<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script>
    //w3IncludeHTML();


    $(document).ready(function () {
        //include header and menus
        $("#header").load("libraries/header.html");
        $("#topMenus").load("libraries/topMenus.html");
        $("#sideMenus").load("libraries/sideMenus.jsp");



        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;

        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }

        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }

        //years
        var year = (nowDate.getFullYear());

        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        var yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;

//function delete PMS QUEUE
//         function delPMSQueue(pmino,dateNow){
//             alert(pmino+" "+dateNow);
//         };

        $('table').on('click', 'button', function (e) {
            var item = $(this).closest("tr").find("#pmiNumber").text();
            var epiTime = $(this).closest("tr").find("#epiTime").text();
            var datas = {'pmino': item, 'today': epiTime};
            $.ajax({
                type: "POST",
                url: "deletePMSQueue.jsp",
                data: datas, // Send input
                timeout: 3000,
                success: function (list) {
                    console.log(list);
                    if ($.trim(list) === "success") {
                        alert("Succeed deleting patient in queue.");
                    } else if ($.trim(list) === "fail") {
                        alert("Failed deleting patient in queue.");
                    }
                }, error: function () {
                    alert("There is an error!");
                }
            });
            //alert(item+" "+yyyyMMdd);
            $(this).closest('tr').remove();
        });

    });
</script>

</body></html>